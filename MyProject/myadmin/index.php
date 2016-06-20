<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["admin"]))
{
	Misc::ss_destroy();
	header("Location:/login");
	die("");
}

$login_active = TRUE;
$admin_info = TRUE;

?>
<!DOCTYPE HTML>
<html>
	<head>
		<title> <?php echo $_SESSION["admin"]->get_User() ?> </title>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/include.php" ?>
	</head>
	<body>
		<?php
		include $_SERVER["DOCUMENT_ROOT"] . "/module/template/header.php";
		?>
		<h4 class="well text-left text-info">
			<p><strong> Thông tin quản trị viên </strong></p>
			<hr />
			<p><strong> Tài khoản </strong> : "<?php echo $_SESSION["admin"]->get_User() ?>"</p>
			<p><strong> Quản trị viên </strong> : "<?php echo $_SESSION["admin"]->get_Name() ?>"</p>
			<?php
			$d = new DateTime($_SESSION["admin"]->get_LastTime());
			?>
			<p><strong> Lần đăng nhập cuối </strong> : "<?php echo $d->format("l / d-m-Y / H:i:s") ?>" </p>
			<?php
			$cur = new DateTime();
			$log = $_SESSION["admin"]->get_TimeLogin();
			$cur = $cur->format("Y-m-d H:i:s");
			$log = $log->format("Y-m-d H:i:s");
			?>
			<p><strong> Thời gian hoạt động </strong> : "<span time-current="<?php echo $cur ?>" time-active="<?php echo $log ?>"> Loading ... </span>" </p>
			<hr />
			<a href="/module/action.php?action=logout" class="btn btn-primary"><strong> Sign Out <span class="glyphicon glyphicon-refresh"></span></strong></a>
		</h4>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
	</body>
	<script src="index.js"></script>
</html>
