<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["user"]))
{
	header("Location:/login");
	die("");
}

$login_active = TRUE;
$user_issuebook = TRUE;
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
		<div class="form-inline form-group pull-right">
			<select class="form-control" name="select-state">
				<option value=""> Tất cả </option>
				<option value="0"> Đã trả hết </option>
				<option value="1"> Chưa trả </option>
				<option value="2"> Quá hạn trả </option>
			</select>
		</div>
		<div id="issue-table" class="text-left">
		</div>
		<div class="modal fade text-left" id="form-issue-details">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3 class="modal-title"> Issue Details </h3>
					</div>
					<div class="modal-body">
						<div id="issue-details">
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php
		include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php";
		?>
	</body>
	<script src="/module/js/table.js"></script>
	<script src="index.js"></script>
</html>
