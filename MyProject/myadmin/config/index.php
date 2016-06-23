<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["admin"]))
{
	Misc::ss_destroy();
	header("Location:/login");
	die("");
}

$admin_man = TRUE;
$config = TRUE;

$info = (object)array();

Sql::select_WithCallBack("SELECT * FROM issue_rule", function($data) use (&$info){
	$info = $data;
});

?>
<!DOCTYPE HTML>
<html>
	<head>
		<title> Config </title>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/include.php" ?>
	</head>
	<body>
		<?php
		include $_SERVER["DOCUMENT_ROOT"] . "/module/template/header.php";
		?>
		<?php
		if (Misc::has_Alert()) Misc::show_Alert();
		?>
		<form class="form-inline text-left" method="post" action="set.config.php">
			<div class="well well-sm text-info"><strong> Config.eLibrary.PHP </strong></div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon"><span class="text-120"> Thời gian mượn sách (tháng) : </span></div>
					<input type="number" class="form-control" name="month" min="1" max="12" value="<?php echo $info["month"] ?>" />
				</div>
			</div>
			<div class="form-group">
				<div class="input-group">
					<div class="input-group-addon"><span class="text-120"> Số sách tối đa : </span></div>
					<input type="number" class="form-control" name="total" min="1" max="50" value="<?php echo $info["total"] ?>" />
				</div>
			</div>
			<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span><strong> SET </strong></button>
		</form>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
	</body>
</html>
