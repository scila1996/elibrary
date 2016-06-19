<?php

include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

Misc::ss_start();

// with POST method

if (isset($_POST["action"]))
{
	switch ($_POST["action"])
	{
		case 'login': // LOGIN ACTION
		{
			$result = new Admin($_POST["user"], $_POST["pass"]);
			if ($result->is_Fail())
			{
				$result = new User($_POST["user"], $_POST["pass"]);
				if ($result->is_Fail())
				{
					Misc::create_Alert("alert-warning", "<strong> ERROR : </strong> Sai mật khẩu hoặc tài khoản");
					header("Location:/login");
				}
				else
				{
					$_SESSION["user"] = $result;
					header("Location:/myuser");
				}
			}
			else
			{
				$_SESSION["admin"] = $result;
				header("Location:/myadmin");
			}
			exit("");
		}
		case 'check-pwd':
		{
			switch ($_POST["type"])
			{
				case 'admin':
				{
					exit(json_encode($_SESSION["admin"]->get_Password() == sha1($_POST["oldpass"])));
				}
			}
		}
		case 'check-user':
		{
			exit(json_encode(Sql::select_WithCallBack("
				SELECT users.user FROM users WHERE users.user = '$_POST[user]'
				UNION
				SELECT admins.user FROM admins WHERE admins.user = '$_POST[user]'
			")));
		}
		case 'admin-chpwd':
		{
			$_SESSION["admin"]->update_Password($_POST["oldpass"], $_POST["pass"]);
			Misc::ss_destroy();
			header("Location:/login");
			exit("");
		}
		case 'modify-category':
		{
			$_SESSION["admin"]->modify_Category($_POST["id"], $_POST["name"]);
			exit("");
		}
		case 'add-category':
		{
			exit(json_encode($_SESSION["admin"]->add_Category($_POST["categoryname"])));
		}
		case 'remove-category':
		{
			$_SESSION["admin"]->delete_Category($_POST["id"]);
			exit("");
		}
		case 'add-book':
		{
			exit($_SESSION["admin"]->add_Book($_POST["book"]));
		}
		case 'get-book-info':
		{
			$bookid = $_POST["id"];
			$book = false;
			Sql::select_WithCallBack("SELECT books.* FROM books WHERE books.id = '$bookid'", function($result) use (&$book){
				$book = $result;
				return false;
			});
			exit(json_encode((object)$book));
		}
		case 'update-book':
		{
			exit($_SESSION["admin"]->update_Book($_POST["book"]));
		}
		case 'delete-books':
		{
			if (isset($_POST["books"]))
			{
				foreach ($_POST["books"] as $book_id)
				{
					$_SESSION["admin"]->delete_Book($book_id);
				}
			}
			exit("");
		}
		case 'add-new-user':
		{
			$_SESSION["admin"]->add_User($_POST["user"]);
			exit("");
		}
		case 'search-users':
		{
			$_SESSION["keyword"] = $_POST["keyword"];
			header("Location:/myadmin/users.php");
			exit("");
		}
		case 'user-chpwd':
		{
			if (isset($_SESSION["user"]))
			{
				$_SESSION["user"]->update_Password($_POST["oldpass"], $_POST["pass"]);
				Misc::ss_destroy();
				header("Location:/login");
			}
			elseif (isset($_SESSION["admin"]))
			{
				$_SESSION["admin"]->update_UserPW($_POST["user"], $_POST["pass"]);
			}
			exit("");
		}
		case 'delete-user':
		{
			$_SESSION["admin"]->delete_User($_POST["user"]);
			exit("");
		}
		case 'user-password':
		{
			exit(json_encode($_SESSION["user"]->get_Password() == sha1($_POST["oldpass"])));
		}
		case 'is-user-login':
		{
			exit(json_encode(isset($_SESSION["user"])));
		}
		case 'find-book-by-id':
		{
			$book = false;
			Sql::select_WithCallBack("SELECT books.* FROM books WHERE books.code = '$_POST[id]'", function($value) use (&$book) {
				$book = $value;
				return false;
			});
			exit(json_encode($book));
		}
		case 'find-user':
		{
			$user_ret = false;
			Sql::select_WithCallBack("SELECT users.* FROM users WHERE users.user = '$_POST[user]'", function ($user) use (&$user_ret) {
				$user_ret = $user;
				return false;
			});
			exit(json_encode($user_ret["user"]));
		}
		case 'total-books-price':
		{
			$vals = implode($_POST["books"], "', '");
			$ret = 0;
			Sql::select_WithCallBack("SELECT SUM(books.price) AS 'price' FROM books WHERE books.id IN ('$vals')", function($res) use (&$ret) {
				$ret = $res["price"];
				return false;
			});
			exit(json_encode($ret));
		}
		case 'issue-books':
		{
			exit(json_encode($_SESSION["admin"]->issue_Books($_POST["books"], $_POST["user"], $_POST["date"])));
		}
		case 'submit-book':
		{
			$_SESSION["admin"]->submit_Book($_POST["id"]);
			exit("");
		}
		case 'get-issue-rule':
		{
			$ret = 0;
			Sql::select_WithCallBack("SELECT * FROM issue_rule", function($r) use (&$ret) {
				$ret = $r;
				return false;
			});
			$d = new DateTime();
			$ret["date_issue"] = $d->format("Y-m-d");
			$d->add(new DateInterval("P" . $ret["month"] . "M"));
			$ret["date_submit"] = $d->format("Y-m-d");
			exit(json_encode($ret));
		} 
		case 'check-info-for-issue':
		{
			$ret = false;
			Sql::select_WithCallBack("
				SELECT
					users.user,
					(issue_rule.total - COUNT(issuedetails.id)) AS 'avai',
					issue_rule.total 'total'
				FROM users
				LEFT JOIN issues ON issues.user = users.user
				LEFT JOIN issuedetails ON issues.id = issuedetails.issueid AND issuedetails.state = 1
				LEFT JOIN issue_rule ON 1
				WHERE users.user = '$_POST[user]'
				GROUP BY users.user
			", function($res) use (&$ret){
				$ret = $res;
				return false;
			});
			exit(json_encode($ret));
		}
	}
}

// with GET method

if (isset($_GET["action"]))
{
	switch ($_GET["action"])
	{
		case 'logout':
		{
			Misc::ss_destroy();
			header("Location:/login");
			exit("");
		}
	}
}

header("Location:/home");
exit("");

?>
