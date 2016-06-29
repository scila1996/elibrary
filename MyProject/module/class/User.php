<?php
include_once $_SERVER["DOCUMENT_ROOT"] . "/module/class/Sql.php";

abstract class Account
{
	protected $user = "";
	protected $pass = "";
	protected $name = "";
	protected $last = "";
	protected $time_login = "";
	protected $fail = TRUE;
	public function get_User()
	{
		return $this->user;
	}
	public function get_Password()
	{
		return $this->pass;
	}
	public function get_Name()
	{
		return $this->name;
	}
	public function get_LastTime()
	{
		static $f = 0;
		if ($f == 0)
		{
			$connect = Sql::open_MySQL();
			$connect->query("UPDATE admins SET admins.last = NOW() WHERE admins.user = '$this->user'");
			$connect->close();
			$f = 1;
		}
		return $this->last;
	}
	public function get_TimeLogin()
	{
		return $this->time_login;
	}
	public function is_Fail()
	{
		return $this->fail;
	}
	abstract function update_Password($oldpass, $pass);
}

class Admin extends Account
{
	public $select_Category = "";
	public function __construct($user, $pass)
	{
		$connect_dummy = Sql::open_MySQL();
		$user = $connect_dummy->real_escape_string($user);
		$connect_dummy->close();
		Sql::select_WithCallBack("SELECT admins.* FROM admins WHERE admins.user = '$user' AND admins.pass = SHA1('$pass')", function($admin) use ($pass) {	
			$this->user = $admin["user"];
			$this->pass = sha1($pass);
			$this->name = $admin["name"];
			$this->last = $admin["last"];
			$this->time_login = new DateTime();
			return $this->fail = FALSE;
		});
	} 
	public function update_Password($oldpass, $pass)
	{
		$connect = Sql::open_MySQL();
		$connect->query("UPDATE admins SET admins.pass = SHA1('$pass') WHERE (admins.user = '$this->user' AND admins.pass = SHA1('$oldpass'))");
		$connect->close();
	}
	public function add_Category($category_name)
	{
		$connect = Sql::open_MySQL();
		$id = hash("md5", uniqid() . rand());
		$connect->query("INSERT INTO categories(id, name) VALUES('$id', '$category_name')");
		$connect->close();
		return $id;
	}
	public function modify_Category($id, $name)
	{
		$connect = Sql::open_MySQL();
		$connect->query("UPDATE categories SET categories.name = '$name' WHERE categories.id = '$id'");
		$connect->close();
	}
	public function delete_Category($category_id)
	{
		$connect = Sql::open_MySQL();
		$connect->query("
		DELETE FROM issuedetails
		WHERE issuedetails.bookid IN
		(
		SELECT books.id FROM books
		JOIN categories ON books.categoryid = categories.id
		WHERE categories.id = '$category_id'
		)
		");
		$connect->query("DELETE FROM books WHERE books.categoryid = '$category_id'");
		$connect->query("DELETE FROM categories WHERE categories.id = '$category_id'");
		$this->delete_IssueEmpty();
		$connect->close();
	}
	public function add_Book($book)
	{
		$connect = Sql::open_MySQL();
		// Info
		$id = hash("md5", uniqid() . rand());
		$categoryid = $book["categoryid"];
		$title = $book["title"];
		$code = $book["code"];
		$author = $book["author"];
		$price = $book["price"];
		$pubhouse = $book["pubhouse"];
		$pubyear = $book["pubyear"];
		$description = $book["description"];
		$amount = $book["amount"];
		$page = $book["page"];
		// Query
		$query = "
		INSERT INTO books(id, categoryid, dateadd, title, code, author, price, pubhouse, pubyear, description, amount, page)
		VALUES ('$id', '$categoryid', CURDATE(), '$title', '$code', '$author', '$price', '$pubhouse', '$pubyear', '$description', '$amount', '$page')
		";
		$connect->query($query);
		$ret_val = array();
		if ($connect->error)
		{
			$ret_val["error"] = true;
			$ret_val["res"] = $connect->error; 
		}
		else
		{
			$ret_val["error"] = false;
			$ret_val["res"] = $id;
		}
		$connect->close();
		return $ret_val;
	}
	function update_Book($book)
	{
		$connect = Sql::open_MySQL();
		// Info
		$book_id = $book["id"];
		$categoryid = $book["categoryid"];
		$title = $book["title"];
		$code = $book["code"];
		$author = $book["author"];
		$price = $book["price"];
		$pubhouse = $book["pubhouse"];
		$pubyear = $book["pubyear"];
		$description = $book["description"];
		$amount = $book["amount"];
		$page = $book["page"];
		// Query
		$connect->query(
		"UPDATE books SET categoryid = '$categoryid', title = '$title', code = '$code', author = '$author', price = '$price', pubhouse = '$pubhouse', pubyear = '$pubyear', description = '$description', amount = '$amount', page = '$page' WHERE books.id = '$book_id'"
		);
		$ret_val = $connect->error;
		$connect->close();
		return !$ret_val;
	}
	public function delete_Book($book_id)
	{
		$connect = Sql::open_MySQL();
		$connect->query("DELETE FROM issuedetails WHERE issuedetails.bookid = '$book_id'");
		$connect->query("DELETE FROM books WHERE books.id = '$book_id'");
		$this->delete_IssueEmpty();
		$connect->close();
	}
	public function add_User($user_info)
	{
		$connect = Sql::open_MySQL();
		$user = $user_info["user"];
		$name = $user_info["name"];
		$pass = "123456"; // Default Password
		$connect->query("INSERT INTO users(user, pass, name) VALUES('$user', SHA1('$pass'), '$name')");
		$connect->close();
	}
	public function update_UserPW($user, $pass)
	{
		$connect = Sql::open_MySQL();
		$connect->query("UPDATE users SET users.pass = SHA1('$pass') WHERE users.user = '$user'");
		$connect->close();
	}
	public function delete_User($user)
	{
		$connect = Sql::open_MySQL();
		$connect->query("
		DELETE issuedetails FROM issuedetails
		JOIN issues ON issuedetails.issueid = issues.id
		WHERE issues.user = '$user'
		");
		$this->delete_IssueEmpty();
		$connect->query("DELETE FROM users WHERE users.user = '$user'");
		$connect->close();
	}
	public function issue_Books($books, $user, $date_submit)
	{
		$isid = hash("md5", uniqid() . rand());
		$connect = Sql::open_MySQL();
		$connect->query("
		INSERT INTO issues(id, user, dateissue, datesubmit)
		VALUES ('$isid', '$user', NOW(), '$date_submit')
		");
		$books = new ArrayObject($books);
		$n = $books->count();
		for ($i = 0; $i < $n; $i++)
		{
			$id = hash("md5", uniqid() . rand() . $i);
			$connect->query("
			INSERT INTO issuedetails(id, issueid, bookid, state)
			VALUES ('$id', '$isid', '$books[$i]', 1)
			");
		}
		$ret = array();
		$ret["id"] = $isid;
		Sql::select_WithCallBack("SELECT CRC32('$isid') AS 'code'", function($res) use (&$ret){
			$ret["code"] = $res["code"];
			return false;
		});
		return $ret;
	}
	public function set_IssueDetailState($issuedetail_id, $state)
	{
		$connect = Sql::open_MySQL();
		$connect->query("UPDATE issuedetails SET state = $state WHERE issuedetails.id = '$issuedetail_id'");
		$connect->close();
	}
	public function submit_AllBooks($isid)
	{
		$connect = Sql::open_MySQL();
		$connect->query("UPDATE issuedetails SET state = 0 WHERE issuedetails.issueid = '$isid'");
		$connect->close();
	}
	public function delete_IssueEmpty()
	{
		$connect = Sql::open_MySQL();
		$connect->query("
		DELETE FROM issues
		WHERE issues.id NOT IN
		(
		SELECT issuedetails.issueid FROM issuedetails
		)
		");
		$connect->close();
	}
}

class User extends Account
{
	public function __construct($user, $pass)
	{
		$connect_dummy = Sql::open_MySQL();
		$user = $connect_dummy->real_escape_string($user);
		$connect_dummy->close();
		if (isset($_SESSION["admin"]))
		{
			$this->user = $user;
			$this->fail = FALSE;
		}
		else
		{
			Sql::select_WithCallBack("SELECT users.* FROM users WHERE users.user = '$user' AND users.pass = SHA1('$pass')", function($user) use ($pass){
				$this->user = $user["user"];
				$this->pass = sha1($pass);
				$this->name = $user["name"];
				$this->fail = FALSE;
			});
		}
	} 
	public function update_Password($oldpass, $pass)
	{
		$connect = Sql::open_MySQL();
		$connect->query("UPDATE users SET users.pass = SHA1('$pass') WHERE users.user = '$this->user' AND users.pass = SHA1('$oldpass')");
		$connect->close();
	}
}

?>
