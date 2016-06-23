<?php

include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

$homepage_active = TRUE;
?>

<!DOCTYPE HTML>
<html>
	<head>
		<title> eLibrary - Bootstrap </title>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/include.php" ?>
	</head>
	<body>
		<?php
		include $_SERVER["DOCUMENT_ROOT"] . "/module/template/header.php";
		?>
		<div class="container-fixed">
			<div class="row">
				<div class="col-sm-6">
					<div class="pull-left">
						<div class="form-inline form-group">
							<form class="input-group" id="select-category">
								<div class="input-group-addon"><div class="text-default"> Chọn danh mục </div></div>
								<select class="form-control">
								</select>
							</form>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="pull-right">
						<div class="form-inline form-group">
							<form id="search-with-keyword" class="input-group">
								<input type="text" class="form-control" placeholder="Nhập từ khóa để tìm kiếm"/>
								<div class="input-group-btn"><button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button></div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="table-book" class="text-left">
		</div>
		<div class="modal fade" id="book-info">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title"> Thông tin sách </h3>
					</div>
					<div class="modal-body">
						<div class="book-record-info">
							<?php
							include $_SERVER["DOCUMENT_ROOT"] . "/module/form/book.info.php";
							?>
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
