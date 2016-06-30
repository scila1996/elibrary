<?php
include_once $_SERVER["DOCUMENT_ROOT"] . "/module/class/Sql.php";

if (isset($_SESSION["user"], $login_active))
{
	// Reader (User) Control
	?>
	<div class="panel panel-primary">
		<div class="panel-heading"> <strong> <?php echo $_SESSION["user"]->get_Name() ?> </strong></div>
		<div class="panel-body">
			<ul class="nav nav-pills nav-stacked">
				<?php $active = "list-group-item-info" ?>
				<li><a href="/myuser/password.php" class="text-info <?php if (isset($user_password)) echo $active ?>"><span class="glyphicon glyphicon-lock"></span> Đổi mật khẩu </a></li>
				<li><a href="/myuser/mybooks" class="text-info <?php if (isset($user_issuebook)) echo $active ?>"><span class="glyphicon glyphicon-calendar"></span> Lịch sử mượn sách </a></li>
				<li><a href="/module/action.php?action=logout" class="text-info"><span class="glyphicon glyphicon-log-out"></span> Đăng xuất </a></li>
			</ul>
		</div>
	</div>
	<?php
}
