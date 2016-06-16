<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["admin"]))
{
	Misc::ss_destroy();
	header("Location:/login");
	die("");
}

$login_active = TRUE;
$admin_issue = TRUE;

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
		<div class="text-left">
			<div class="form-inline form-group">
				<form id="search-user" style="display: inline">
					<div class="input-group">
						<span class="input-group-addon"><span class="text-default"> Tên TK - Mã mượn </span></span>
						<input class="form-control" type="text" />
					</div>
					<button type="submit" class="btn btn-primary" title="Tìm kiếm độc giả"><span class="glyphicon glyphicon-search"></span></button>
				</form>
				<select class="form-control pull-right" name="select-state">
					<option value=""> Tất cả </option>
					<option value="0"> Đã trả hết </option>
					<option value="1"> Chưa trả </option>
					<option value="2"> Quá hạn trả </option>
				</select>
			</div>
			<div id="table-issue">
			</div>
			<div class="modal fade" id="form-submit-books">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title"> Chi tiết mượn sách </h3>
						</div>
						<div class="modal-body">
							<div id="table-issue-detail">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
	</body>
	<script src="/module/js/table.js"></script>
	<script src="index.js"></script>
</html>
