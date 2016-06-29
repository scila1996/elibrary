<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["admin"]))
{
	Misc::ss_destroy();
	header("Location:/login");
	die("");
}

$admin_man = TRUE;
$admin_issue_add = TRUE;

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
			<?php
			Misc::create_Alert("alert-success alert-hide", "", "issue-success");
			Misc::show_Alert();
			?>
			<form id="check-user-for-issue" class="form-inline form-group">
				<div class="input-group">
					<div class="input-group-addon"><span class="text-default"> Tài khoản độc giả </span></div>
					<input class="form-control" type="text" />
					<div class="input-group-btn"><button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span></button></div>
				</div>
			</form>
			<div></div>
			<div id="issue-book-for-user">
				<hr />
				<form id="issue-book">
					<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-check"></span><strong> Xác nhận </strong></button>
				</form>
				<div class="form-group"></div>
				<div class="modal fade" id="form-issue-book">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3 class="modal-title"> Mượn sách </h3>
							</div>
							<div class="modal-body">
							</div>
							<div class="modal-footer">
								<div style="display: inline">
									<div class="pull-left"></div>
									<form id="issue-book-process" class="pull-right">
										<button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-check"></span> Issue </button>
										<button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Close </button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<form class="container-fixed" id="search-books">
					<div class="row">
						<div class="col-xs-6">
							<div class="pull-left">
								<div class="form-inline form-group">
									<div class="input-group">
										<div class="input-group-addon"><span class="text-default"> Danh mục </span></div>
										<select class="form-control select-category"></select>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-6">
							<div class="pull-right">
								<div class="form-inline form-group">
									<div class="input-group">
										<input type="text" class="form-control" placeholder="Tìm sách" />
										<div class="input-group-btn"><button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
				<div id="table-book">
				</div>
			</div>
		</div>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
	</body>
	<script src="/module/js/table.js"></script>
	<script src="/module/js/print.issue.js"></script>
	<script src="index.js"></script>
</html>
