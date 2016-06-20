<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (isset($_SESSION["admin"]))
{
	header("Location:/myadmin");
	die("");
}
elseif (isset($_SESSION["user"]))
{
	header("Location:/myuser");
	die("");
}

$login_active = TRUE;

?>

<!DOCTYPE HTML>
<html>
	<head>
		<title> Đăng nhập </title>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/include.php" ?>
	</head>
	<body>
		<?php
		include $_SERVER["DOCUMENT_ROOT"] . "/module/template/header.php";
		?>
		<style>
			.wrapper-login
			{
				padding-top: 25px;
				width: 100vw;
				display: table-cell;
				vertical-align: middle;
				text-align: center;
			}
			.login-body
			{
				display: inline-block;
				padding: 15px;
				box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
			}
		</style>
		<div class="wrapper-login">
			<div class="form-group" style="display: inline-block">
				<?php if (Misc::has_Alert()) Misc::show_Alert() ?>
				<form class="well well-sm login-body" method="post" action="/module/action.php">
					<div class="well well-sm text-left">
						<strong><a href="/" class="btn btn-link"><span class="glyphicon glyphicon-home"></span> Quay về trang chủ </a> </strong>
					</div>
					<div class="form-group form-inline">
						<div class="input-group form-group form-inline">
							<div class="input-group-addon"> <div class="text-80"> <strong> Tài khoản </strong></div> </div>
							<input type="text" class="form-control" placeholder="Tên tài khoản" name="user"/>
						</div>
					</div>
					<div class="form-group form-inline">
						<div class="input-group">
							<div class="input-group-addon"> <div class="text-80"> <strong> Mật khẩu </strong></div> </div>
							<input type="password" class="form-control" placeholder="Mật khẩu tài khoản" name="pass"/>
						</div>
					</div>
					<button type="submit" class="btn btn-primary" style="width: 100%" name="action" value="login"><strong><span class="glyphicon glyphicon-lock"></span> Sign In </strong></button>
				</form>
			</div>
		</div>
		<?php
		include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php";
		?>
	</body>
	<script>
		$(document).ready(function(){
			$('[name="user"]').focus();
		});
	</script>
</html>
