<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["admin"]))
{
	Misc::ss_destroy();
	header("Location:/login");
	die("");
}

$admin_man = TRUE;
$admin_category = TRUE;

?>
<!DOCTYPE HTML>
<html>
	<head>
		<title> Quản lý danh mục sách </title>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/include.php" ?>
	</head>
	<body>
		<?php
		include $_SERVER["DOCUMENT_ROOT"] . "/module/template/header.php";
		?>
		<div class="text-left">
			<!-- Add Category -->
			<div class="form-group">
				<div class="form-group">
					<button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#add-category"><strong> Thêm danh mục mới </strong></button>
				</div>
				<form id="add-category" class="collapse">
					<div class="form-inline">
						<div class="input-group">
							<div class="input-group-addon"><div class="text-80"> Add - Name </div></div>
							<input type="text" class="form-control" placeholder="Thêm danh mục"/>
						</div>
						<button type="submit" class="btn btn-link" title="Thêm mới danh mục"> <span class="glyphicon glyphicon-plus"></span> Add </button>
					</div>
					<hr />
				</form>
				<div></div>
			</div>
			<!-- Table Category -->
			<div id="table-category">
			</div>
			<!--  Edit Category -->
			<div class="modal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title"> Đổi tên danh mục </h4>
						</div>
						<div class="modal-body">
							<form id="edit-category">
								<div class="form-inline">
									<div class="input-group">
										<div class="input-group-addon"><span class="glyphicon glyphicon-pencil"></span></div>
										<input type="text" class="form-control" placeholder="Nhập tên mới" />
										<div class="input-group-btn"><button type="submit" class="btn btn-primary" value=""><strong><span class="glyphicon glyphicon-check"></span> Save </strong></button></div>
									</div>
								</div>
							</form>
							<div></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
	</body>
	<script src="index.js"></script>
	<script src="/module/js/table.js"></script>
</html>
