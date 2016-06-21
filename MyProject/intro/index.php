<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

$intro_active = TRUE;

?>
<!DOCTYPE HTML>
<html>
	<head>
		<title> Giới thiệu </title>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/include.php" ?>
	</head>
	<body>
		<?php
		include $_SERVER["DOCUMENT_ROOT"] . "/module/template/header.php";
		?>
		<div class="well well-sm text-left text-muted">
			Language: PHP - Server Side, JavaScript - Client Side <br />
			Library, Framework: Bootstrap - Twitter, jQuery
			<hr />
			Thank you for use !!!
		</div>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
	</body>
</html>
