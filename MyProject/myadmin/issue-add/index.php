<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["admin"]))
{
	Misc::ss_destroy();
	header("Location:/login");
	die("");
}

$login_active = TRUE;
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
			<div class="form-inline form-group">
				<form id="check-user-for-issue">
					<div class="input-group">
						<span class="input-group-addon"><span class="text-default"> User</span></span>
						<input class="form-control" type="text" />
					</div>
					<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span></button>
				</form>
				<div></div>
			</div>
			<div id="issue-book-for-user">
				<hr />
				<form class="form-inline form-group" id="search-books">
					<div class="input-group">
						<div class="input-group-addon"><span class="text-default"> Danh mục </span></div>
						<select class="form-control select-category"></select>
					</div>
					<div class="form-group pull-right">
						<input type="text" class="form-control" placeholder="Tìm sách" />
						<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
					</div>
				</form>
				<div id="table-book">
				</div>
				<form id="issue-book">
					<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-check"></span> Issue </button>
				</form>
				<div></div>
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
			</div>
		</div>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
	</body>
	<script src="/module/js/table.js"></script>
	<script src="index.js"></script>
</html>
