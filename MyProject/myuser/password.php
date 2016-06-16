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
		<div class="container-fixed">
			<div class="row">
				<div class="col-md-8 col-md-push-2 text-center">
					<form class="panel panel-primary" method="post" action="/module/action.php">
						<div class="panel-heading"><strong> Đổi mật khẩu </strong></div>
						<div class="panel-body">
							<?php
							Misc::create_Alert("alert-warning error-chpwd alert-hide", "");
							Misc::show_Alert();
							?>
							<div class="input-group form-group">
								<div class="input-group-addon"><div class="text-120"> <strong> Mật khẩu hiện tại </strong></div></div>
								<input type="password" class="form-control" placeholder="Nhập mật khẩu hiện tại" name="oldpass"/>
							</div>
							<div class="input-group form-group">
								<div class="input-group-addon"><div class="text-120"> <strong> Mật khẩu mới </strong></div></div>
								<input type="password" class="form-control" placeholder="Nhập mật khẩu mới" name="pass"/>
							</div>
							<div class="input-group">
								<div class="input-group-addon"><div class="text-120"> <strong> Nhập lại mật khẩu </strong></div></div>
								<input type="password" class="form-control" placeholder="Nhập lại mật khẩu mới" name="repass"/>
							</div>
						</div>
						<div class="panel-footer">
							<button type="submit" class="btn btn-primary" name="action" value="user-chpwd"> Lưu mật khẩu </button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
	</body>
	<script src="password.js"></script>
</html>
