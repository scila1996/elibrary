<?php

include_once $_SERVER["DOCUMENT_ROOT"] . "/module/class/Sql.php";

abstract class Account {

    protected $user = "";
    protected $pass = "";
    protected $name = "";
    protected $last = "";
    protected $time_login = "";
    protected $fail = TRUE;

    public function get_User() {
        return $this->user;
    }

    public function get_Password() {
        return $this->pass;
    }

    public function get_Name() {
        return $this->name;
    }

    public function get_LastTime() {
        static $f = 0;
        if ($f == 0) {
            Sql::query("UPDATE admins SET admins.last = NOW() WHERE admins.user = ?", array($this->user));
            $f = 1;
        }
        return $this->last;
    }

    public function get_TimeLogin() {
        return $this->time_login;
    }

    public function is_Fail() {
        return $this->fail;
    }

    abstract function update_Password($oldpass, $pass);
}

class Admin extends Account {

    public $select_Category = "";

    public function __construct($user, $pass) {
        Sql::select_WithCallBack("SELECT admins.* FROM admins WHERE admins.user = ? AND admins.pass = SHA1(?)", array($user, $pass), function($admin) use ($pass) {
            $this->user = $admin["user"];
            $this->pass = sha1($pass);
            $this->name = $admin["name"];
            $this->last = $admin["last"];
            $this->time_login = new DateTime();
            return $this->fail = FALSE;
        });
    }

    public function update_Password($oldpass, $pass) {
        Sql::query("UPDATE admins SET admins.pass = SHA1(?) WHERE (admins.user = ? AND admins.pass = SHA1(?))", array($pass, $this->user, $oldpass));
    }

    public function get_Category($id) {
        return Sql::query("SELECT * FROM categories WHERE id = ?", array($id))->fetch_object();
    }

    public function add_Category($category_name) {
        $id = hash("md5", uniqid() . rand());
        Sql::query("INSERT INTO categories(id, name) VALUES(?, ?)", array($id, $category_name));
        return $id;
    }

    public function modify_Category($id, $name) {
        Sql::query("UPDATE categories SET categories.name = ? WHERE categories.id = ?", array($name, $id));
    }

    public function delete_Category($category_id) {
        Sql::query("
		DELETE FROM issuedetails
		WHERE issuedetails.bookid IN
		(
		SELECT books.id FROM books
		JOIN categories ON books.categoryid = categories.id
		WHERE categories.id = ?
		)
		", array($category_id));
        Sql::query("DELETE FROM books WHERE books.categoryid = ?", array($category_id));
        Sql::query("DELETE FROM categories WHERE categories.id = ?", array($category_id));
        $this->delete_IssueEmpty();
    }

    public function add_Book($book) {
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
        try {
            $ret = Sql::query("
		INSERT INTO books(id, categoryid, dateadd, title, code, author, price, pubhouse, pubyear, description, amount, page)
		VALUES (?, ?, CURDATE(), ?, ?, ?, ?, ?, ?, ?, ?, ?)
		", array($id, $categoryid, $title, $code, $author, $price, $pubhouse, $pubyear, $description, $amount, $page));

            return array('error' => false, 'res' => $id);
        } catch (Exception $e) {
            return array('error' => true, 'res' => $e->getMessage());
        }
    }

    function update_Book($book) {

        // Data
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
        try {
            //return $book;
            Sql::query(
                    "UPDATE books SET "
                    . "categoryid = ?,"
                    . "title = ?,"
                    . "code = ?,"
                    . "author = ?,"
                    . "price = ?,"
                    . "pubhouse = ?,"
                    . "pubyear = ?,"
                    . "description = ?,"
                    . "amount = ?,"
                    . "page = ?"
                    . " WHERE books.id = ?"
                    , array(
                $categoryid, $title, $code, $author, $price, $pubhouse, $pubyear, $description, $amount, $page, $book_id
            ));
            return true;
        } catch (Exception $e) {
            return $e->getMessage();
        }
    }

    public function delete_Book($book_id) {
        Sql::query("DELETE FROM issuedetails WHERE issuedetails.bookid = ?", array($book_id));
        Sql::query("DELETE FROM books WHERE books.id = ?", array($book_id));
        $this->delete_IssueEmpty();
    }

    public function add_User($user_info) {
        $user = $user_info["user"];
        $name = $user_info["name"];
        $pass = "12345678"; // Default Password
        Sql::query("INSERT INTO users(user, pass, name) VALUES(?, SHA1(?), ?)", array($user, $pass, $name));
    }

    public function update_UserPW($user, $pass) {
        Sql::query("UPDATE users SET users.pass = SHA1(?) WHERE users.user = ?", array($pass, $user));
    }

    public function delete_User($user) {
        Sql::query("
		DELETE issuedetails FROM issuedetails
		JOIN issues ON issuedetails.issueid = issues.id
		WHERE issues.user = ?
		", array($user));
        $this->delete_IssueEmpty();
        Sql::query("DELETE FROM users WHERE users.user = ?", array($user));
    }

    public function issue_Books($books, $user, $date_submit) {
        $isid = hash("md5", uniqid() . rand());

        Sql::query("
		INSERT INTO issues(id, user, dateissue, datesubmit)
		VALUES (?, ?, NOW(), ?)
		", array($isid, $user, $date_submit));

        $n = count($books);

        for ($i = 0; $i < $n; $i++) {
            $id = hash("md5", uniqid() . rand() . $i);
            Sql::query("
			INSERT INTO issuedetails(id, issueid, bookid, state)
			VALUES (?, ?, ?, ?)
			", array($id, $isid, $books[$i], 1)
            );
        }

        $ret = array();
        $ret["id"] = $isid;

        Sql::select_WithCallBack("SELECT CRC32(?) AS 'code'", array($isid), function($res) use (&$ret) {
            $ret["code"] = $res["code"];
            return false;
        });

        return $ret;
    }

    public function set_IssueDetailState($issuedetail_id, $state) {
        Sql::query("UPDATE issuedetails SET state = $state WHERE issuedetails.id = ?", array($issuedetail_id));
    }

    public function submit_AllBooks($isid) {
        Sql::query("UPDATE issuedetails SET state = 0 WHERE issuedetails.issueid = ?", array($isid));
    }

    public function delete_IssueEmpty() {
        Sql::query("
		DELETE FROM issues
		WHERE issues.id NOT IN
		(
		SELECT issuedetails.issueid FROM issuedetails
		)
		");
    }

}

class User extends Account {

    public function __construct($user, $pass) {
        if (isset($_SESSION["admin"])) {
            $this->user = $user;
            $this->fail = FALSE;
        } else {
            Sql::select_WithCallBack("SELECT users.* FROM users WHERE users.user = ? AND users.pass = SHA1(?)", array($user, $pass), function($user) use ($pass) {
                $this->user = $user["user"];
                $this->pass = sha1($pass);
                $this->name = $user["name"];
                $this->fail = FALSE;
            });
        }
    }

    public function update_Password($oldpass, $pass) {
        Sql::query("UPDATE users SET users.pass = SHA1(?) WHERE users.user = ? AND users.pass = SHA1(?)",
                array($pass, $this->user, $oldpass)
        );
    }

}

?>
