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
		<div class="form-inline text-left form-group">
			<form class="input-group" id="select-category">
				<div class="input-group-addon"><div class="text-default"> Chọn danh mục </div></div>
				<select class="form-control">
				</select>
			</form>
			<form id="search-with-keyword" class="form-group pull-right">
				<div class="container-fixed"></div>
				<input type="text" class="form-control" placeholder="Nhập từ khóa để tìm kiếm"/>
				<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
			</form>
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
