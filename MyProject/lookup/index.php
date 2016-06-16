<?php

include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

$lookup_active = TRUE;
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
		<div class="text-left">
			<div class="form-group">
				<button type="button" class="btn btn-link" data-toggle="collapse" data-target="#search-adv" title="Click to show"><span class="glyphicon glyphicon-search"></span><strong> Tra cứu </strong><span class="caret"></span></button>
			</div>
			<form id="search-adv" class="collapse text-center">
				<div class="panel panel-primary">
					<div class="panel-heading"><strong> Tra cứu nâng cao </strong></div>
					<div class="panel-body">
						<div class="input-group form-group">
							<div class="input-group-addon"> <div class="text-120"> Thể loại </div> </div>
							<select class="form-control" name="category">
							</select>
						</div>
						<div class="input-group form-group">
							<div class="input-group-addon"> <div class="text-120"> Tiêu đề </div> </div>
							<input type="text" class="form-control add-book-info" placeholder="Tiêu đề sách" name="title" value=""/>
						</div>
						<div class="input-group form-group">
							<div class="input-group-addon"> <div class="text-120"> Mã sách </div> </div>
							<input type="text" class="form-control add-book-info" placeholder="Mã Barcode trên sách" name="code" value=""/>
						</div>
						<div class="input-group form-group">
							<div class="input-group-addon"> <div class="text-120"> Tác giả </div> </div>
							<input type="text" class="form-control add-book-info" placeholder="Tác giả cuốn sách" name="author" value=""/>
						</div>
						<div class="input-group form-group">
							<div class="input-group-addon"> <div class="text-120"> Nhà xuất bản </div> </div>
							<input type="text" class="form-control add-book-info" placeholder="Tên nhà xuất bản" name="pubhouse" value=""/>
						</div>
						<div class="input-group">
							<div class="input-group-addon"> <div class="text-120"> Năm xuất bản </div> </div>
							<input type="number" min="1900" max="<?php echo date('Y') ?>" class="form-control add-book-info" placeholder="Năm xuất bản sách" name="pubyear" value=""/>
						</div>
					</div>
					<div class="panel-footer">
						<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span><strong> Tìm </strong></button>
					</div>
				</div>
			</form>
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
		</div>
		<?php
		include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php";
		?>
	</body>
	<script src="/module/js/table.js"></script>
	<script src="index.js"></script>
</html>
