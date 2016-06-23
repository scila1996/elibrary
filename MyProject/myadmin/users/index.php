<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["admin"]))
{
	Misc::ss_destroy();
	header("Location:/login");
	die("");
}

$admin_man = TRUE;
$admin_manuser = TRUE;

$_SESSION["admin"]->select_User = "";

?>
<!DOCTYPE HTML>
<html>
	<head>
		<title> QLTK Độc giả </title>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/include.php" ?>
	</head>
	<body>
		<?php
		include $_SERVER["DOCUMENT_ROOT"] . "/module/template/header.php";
		?>
		<?php
		if (Misc::has_Alert()) Misc::show_Alert();
		?>
		<div class="text-left">
			<form class="form-inline form-group" id="search-user">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="Tìm độc giả"/>
					<div class="input-group-btn"><button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button></div>
				</div>
			</form>
			<div class="form-inline form-group text-left">
				<button class="btn btn-primary" data-toggle="collapse" data-target="#add-user"><strong> Thêm mới </strong><span class="caret"></span> </button>
			</div>
			<form class="collapse text-left" id="add-user">
				<div style="display: inline-block">
					<div class="panel panel-default">
						<div class="panel-heading">
							<strong class="text-info"> Information </strong>
						</div>
						<div class="panel-body">
							<?php
							Misc::create_Alert("alert-warning alert-hide", "", "new-user-error");
							Misc::show_Alert();
							?>
							<div class="form-inline form-group">
								<div class="input-group">
									<div class="input-group-addon"> <div class="text-120"> Tên tài khoản </div> </div>
									<input type="text" class="form-control" placeholder="Tên tài khoản" name="user"/>
									<div class="input-group-addon"> <span class="glyphicon glyphicon-lock"></span> </div>
								</div>
							</div>
							<div class="form-inline">
								<div class="input-group">
									<div class="input-group-addon"> <div class="text-120"> Tên độc giả </div> </div>
									<input type="text" class="form-control" placeholder="Họ & tên độc giả" name="name"/>
									<div class="input-group-addon"> <span class="glyphicon glyphicon-user"></span> </div>
								</div>
							</div>
						</div>
						<div class="panel-footer text-center">
							<button type="submit" class="btn btn-primary" name="action" value="add-new-user"><strong><span class="glyphicon glyphicon-check"></span> SAVE </strong></button>
						</div>
					</div>
				</div>
				<hr />
			</form>
			<div id="table-users">
			</div>
		</div>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
	</body>
	<script src="/module/js/table.js"></script>
	<script src="index.js"></script>
</html>
