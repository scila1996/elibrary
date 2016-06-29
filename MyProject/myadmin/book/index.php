<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["admin"]))
{
	Misc::ss_destroy();
	header("Location:/login");
	die("");
}

$admin_man = TRUE;
$admin_book = TRUE;

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
		<!-- Content -->
		<div class="text-left">
			<div class="container-fixed">
				<div class="row">
					<!-- Form SELECT Category -->
					<div class="col-xs-6">
						<div class="pull-left">
							<div class="form-inline form-group">
								<div class="input-group">
									<div class="input-group-addon"><span class="text-80"> Chọn </span></div>
									<select class="form-control" id="select-category">
									</select>
								</div>
							</div>
						</div>
					</div>
					<!-- Search Book -->
					<div class="col-xs-6">
						<div class="pull-right">
							<form class="form-inline form-group" id="keyword">
								<div class="input-group">
									<input type="text" class="form-control" placeholder="Tìm kiếm"/>
									<div class="input-group-btn"><button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button></div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- Add book -->
			<div class="form-inline form-group">
				<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#add-book" title="Thêm sách mới"><strong> Thêm sách </strong></button>
			</div>
			<form class="modal fade" id="add-book">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h2 class="modal-title">
								<strong class="text-info"> Nhập thông tin sách </strong>
							</h2>
						</div>
						<div class="modal-body">
							<?php
							Misc::create_Alert("alert-warning alert-hide" , "book-info-error");
							Misc::show_Alert();
							?>
							<div class="book-record-info">
								<?php
								include $_SERVER["DOCUMENT_ROOT"] . "/module/form/book.info.php";
								?>
							</div>
						</div>
						<div class="modal-footer">
							<div class="text-center">
								<button type="submit" class="btn btn-primary"> SAVE <span class="glyphicon glyphicon-check"></span></button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<!-- Show list book -->
			<div id="table-show">
			</div>
			<!-- Edit Book -->
			<form class="modal fade" id="edit-book">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h3 class="modal-title"> Cập nhật thông tin sách </h3>
						</div>
						<div class="modal-body">
							<div class="book-record-info">
								<?php
								include $_SERVER["DOCUMENT_ROOT"] . "/module/form/book.info.php";
								?>
							</div>
						</div>
						<div class="modal-footer">
							<div class="text-center">
								<button type="submit" class="btn btn-primary"><strong> Cập nhật </strong><span class="glyphicon glyphicon-check"></span> </button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<!-- End Content -->
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
	</body>
	<script src="/module/js/table.js"></script>
	<script src="index.js"></script>
</html>
