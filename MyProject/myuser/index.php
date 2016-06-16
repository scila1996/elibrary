<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["user"]))
{
	header("Location:/login");
	die("");
}

$login_active = TRUE;

?>

<!DOCTYPE HTML>
<html>
	<head>
		<title> <?php echo $_SESSION["user"]->get_Name() ?> </title>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/include.php" ?>
	</head>
	<body>
		<?php
		include $_SERVER["DOCUMENT_ROOT"] . "/module/template/header.php";
		?>
		<h1>
			<div class="label label-default">
				Xin chào độc giả "<?php echo $_SESSION["user"]->get_Name() ?>"
			</div>
		</h1>
		<?php
		include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php";
		?>
	</body>
</html>
