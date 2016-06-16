<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["admin"]))
{
	Misc::ss_destroy();
	header("Location:/login");
	die("");
}

$login_active = TRUE;
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
		<div class="container-fixed">
			<div class="row">
				<div class="col-xs-12 text-left">
					<form class="form-inline form-group" id="search-user">
						<input type="text" class="form-control" placeholder="Nhập tên hoặc tài khoản"/>
						<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
					</form>
					<div id="table-users">
					</div>
					<div class="form-inline form-group text-left">
						<button class="btn btn-primary" data-toggle="collapse" data-target="#add-user"> Thêm mới <span class="caret"></span> </button>
					</div>
					<form class="container-fixed collapse text-left" id="add-user">
						<div class="row">
							<div class="col-xs-8">
								<div class="panel panel-default">
									<div class="panel-heading">
										<strong class="text-info"> Information </strong>
									</div>
									<div class="panel-body">
										<?php
										Misc::create_Alert("alert-warning alert-hide", "", "new-user-error");
										Misc::show_Alert();
										?>
										<div class="input-group form-group">
											<div class="input-group-addon"> <div class="text-120"> Tên tài khoản </div> </div>
											<input type="text" class="form-control" placeholder="Tên tài khoản" name="user"/>
										</div>
										<div class="input-group">
											<div class="input-group-addon"> <div class="text-120"> Tên độc giả </div> </div>
											<input type="text" class="form-control" placeholder="Họ & tên độc giả" name="name"/>
										</div>
									</div>
									<div class="panel-footer text-center">
										<button type="submit" class="btn btn-primary" name="action" value="add-new-user"> SAVE <span class="glyphicon glyphicon-check"></span> </button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
	</body>
	<script src="/module/js/table.js"></script>
	<script src="index.js"></script>
</html>
