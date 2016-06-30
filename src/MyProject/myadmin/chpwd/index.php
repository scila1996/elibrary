<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["admin"]))
{
	Misc::ss_destroy();
	header("Location:/login");
	die("");
}

$admin_man = TRUE;
$admin_password = TRUE;

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
				<form class="well well-sm login-body" method="post" action="/module/action.php">
					<?php
					Misc::create_Alert("alert-warning alert-hide", "", "error-chpwd");
					Misc::show_Alert();
					?>
					<div class="well well-sm text-left login-heading">
						<a class="btn btn-link"><strong> Thay đổi mật khẩu </strong></a>
					</div>	
					<div class="form-group form-inline">
						<div class="input-group">
							<div class="input-group-addon"><div class="text-120"> Mật khẩu hiện tại </div></div>
							<input type="password" class="form-control" placeholder="Nhập mật khẩu hiện tại" name="oldpass"/>
							<div class="input-group-addon"><span class="glyphicon glyphicon-repeat"></span></div>
						</div>
					</div>
					<div class="form-group form-inline">
						<div class="input-group">
							<div class="input-group-addon"><div class="text-120"> Mật khẩu mới </div></div>
							<input type="password" class="form-control" placeholder="Nhập mật khẩu mới" name="pass"/>
							<div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
						</div>
					</div>
					<div class="form-group form-inline">
						<div class="input-group">
							<div class="input-group-addon"><div class="text-120"> Nhập lại mật khẩu </div></div>
							<input type="password" class="form-control" placeholder="Nhập lại mật khẩu mới" name="repass"/>
							<div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
						</div>
					</div>
					<button type="submit" class="btn btn-primary" name="action" value="admin-chpwd"><strong><span class="glyphicon glyphicon-check"></span> Lưu mật khẩu </strong></button>
				</form>
			</div>
		</div>
		<?php
		include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php"
		?>
	</body>
	<script src="index.js"></script>
</html>
