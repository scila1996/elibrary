<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["admin"]))
{
	Misc::ss_destroy();
	header("Location:/login");
	die("");
}

$admin_man = TRUE;
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
			<div class="container-fixed">
				<div class="row">
					<div class="col-xs-12">
						<div class="pull-left">
							<div class="form-inline form-group">
								<form id="search-user">
									<div class="input-group">
										<span class="input-group-addon"><span class="text-default"> Tên TK - Mã mượn </span></span>
										<input class="form-control" type="text" />
										<div class="input-group-btn"><button type="submit" class="btn btn-primary" title="Tìm kiếm độc giả"><span class="glyphicon glyphicon-search"></span></button></div>
									</div>
								</form>
							</div>
						</div>
						<div class="pull-right">
							<div class="form-inline form-group">
								<select class="form-control" name="select-state">
									<option value=""> Tất cả </option>
									<option value="1"> Đã trả hết </option>
									<option value="2"> Chưa trả </option>
									<option value="3"> Quá hạn trả </option>
								</select>
							</div>
						</div>
					</div>
				</div>
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
						<div class="modal-footer">
							<div class="text-left">
								<button type="button" class="btn btn-primary print-issue" value=""><span class="glyphicon glyphicon-print"></span> <strong> Print </strong></button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="select-state">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-body">
						dasdas
					</div>
				</div>
			</div>
		</div>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
	</body>
	<script src="/module/js/table.js"></script>
	<script src="/module/js/print.issue.js"></script>
	<script src="index.js"></script>
</html>
