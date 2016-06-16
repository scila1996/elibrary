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
		<div class="col-md-8 col-md-push-2 no-padding">
			<form class="panel panel-primary" method="post" action="/module/action.php">
				<div class="panel-heading"> <strong> Đăng nhập </strong> </div>
				<div class="panel-body">
					<?php if (Misc::has_Alert()) Misc::show_Alert() ?>
					<div class="input-group form-group">
						<div class="input-group-addon"> <div class="text-80"> <strong> Tài khoản </strong></div> </div>
						<input type="text" class="form-control" placeholder="Tên tài khoản" name="user"/>
					</div>
					<div class="input-group">
						<div class="input-group-addon"> <div class="text-80"> <strong> Mật khẩu </strong></div> </div>
						<input type="password" class="form-control" placeholder="Mật khẩu tài khoản" name="pass"/>
					</div>
				</div>
				<div class="panel-footer">
					<button type="submit" class="btn btn-primary" name="action" value="login"> Đăng nhập </button>
				</div>
			</form>
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
