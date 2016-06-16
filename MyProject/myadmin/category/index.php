<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["admin"]))
{
	Misc::ss_destroy();
	header("Location:/login");
	die("");
}

$login_active = TRUE;
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
			<?php
			Misc::create_Alert("alert-hide alert-success", "", "success-message");
			Misc::show_Alert();
			?>
			<!-- Show, Modify, Remove -->
			<form id="list-category">
				<div class="form-inline form-group">
					<div class="input-group">
						<div class="input-group-addon"><div class="text-80"> Select </div></div>
						<select class="form-control" name="select-category">
						</select>
					</div>
					<button type="submit" class="btn btn-link" name="remove-category"> Trash <span class="glyphicon glyphicon-trash"></span></button>
				</div>
				<div class="form-group">
					<button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#form-edit-category"> Modify </span> <span class="caret"></span></button>
				</div>
			</form>
			<form id="form-edit-category" class="collapse">
				<div class="form-inline">
					<div class="input-group">
						<div class="input-group-addon"><div class="text-80"> Edit </div></div>
						<input type="text" class="form-control" name="category-name"/>
					</div>
				</div>
				<button type="submit" class="btn btn-link" name="save-modify"> <span class="glyphicon glyphicon-ok"></span> Save </button>
			</form>
			<div></div>
			<!-- Add Category -->
			<form id="add-category">
				<div class="form-inline">
					<div class="input-group">
						<div class="input-group-addon"><div class="text-80"> Add - Name </div></div>
						<input type="text" class="form-control" placeholder="Thêm danh mục"/>
					</div>
				</div>
				<button type="submit" class="btn btn-link" title="Thêm mới danh mục"> <span class="glyphicon glyphicon-plus"></span> Add </button>
			</form>
			<div></div>
		</div>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
	</body>
	<script src="index.js"></script>
</html>
