<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["user"]))
{
	Misc::ss_destroy();
	header("Location:/login");
	die("");
}

$login_active = TRUE;
$user_password = TRUE;

?>
<!DOCTYPE HTML>
<html>
	<head>
		<title> Đổi mật khẩu </title>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/include.php" ?>
	</head>
	<body>
		<?php
		include $_SERVER["DOCUMENT_ROOT"] . "/module/template/header.php";
		?>
		<div class="wrapper-login">
			<div class="form-group" style="display: inline-block">
				<form class="well well-sm login-body"  method="post" action="/module/action.php">
					<div class="well well-sm text-left login-heading">
						<a class="btn btn-link"><strong> Thay đổi mật khẩu </strong></a>
					</div>
					<?php
					Misc::create_Alert("alert-warning error-chpwd alert-hide", "");
					Misc::show_Alert();
					?>
					<div class="form-inline form-group">
						<div class="input-group">
							<div class="input-group-addon"><div class="text-120"> <strong> Mật khẩu mới </strong></div></div>
							<input type="password" class="form-control" placeholder="Nhập mật khẩu mới" name="pass"/>
							<div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
						</div>
					</div>
					<div class="form-inline form-group">
						<div class="input-group">
							<div class="input-group-addon"><div class="text-120"> <strong> Nhập lại mật khẩu </strong></div></div>
							<input type="password" class="form-control" placeholder="Nhập lại mật khẩu mới" name="repass"/>
							<div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
						</div>
					</div>
					<button type="submit" class="btn btn-primary" name="action" value="user-chpwd"><strong><span class="glyphicon glyphicon-check"></span> Lưu mật khẩu </strong></button>
				</form>
			</div>
		</div>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
	</body>
	<script src="index.js"></script>
</html>
