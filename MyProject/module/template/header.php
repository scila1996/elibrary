<!-- Heading Page [Title and Timestamp] -->
<div class="heading container-fixed">
	<div class="row">
		<div class="col-xs-6">
			eLibrary : Bootstrap, jQuery, PHP, MySQL
		</div>
		<div class="col-xs-6 text-right">
			<?php
			date_default_timezone_set("Asia/Ho_Chi_Minh");
			echo date("l - d/m/Y")
			?>
		</div>
	</div>
</div>
<!-- Banner Image -->
<img src="/module/template/images/headpage.png" class="img-rounded" />
<!-- Navigation Bar -->
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<?php
		if (isset($_SESSION["admin"]))
		{
			$active = "list-group-item-info";
			?>
			<ul class="nav navbar-nav" style="margin-left: -15px">
				<li class="<?php if ($homepage_active) echo "active" ?>"><a href="/home"> <span class="glyphicon glyphicon-home"></span> View </a></li>
				<li><a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)"> <span class="glyphicon glyphicon-cog"></span> Manage <span class="caret"></span></a>
					<ul class="dropdown-menu nav nav-pills nav-stacked" style="margin-top: 5px; padding: 5px">
						<li><a href="/myadmin/chpwd" class="<?php if ($admin_password) echo $active ?>"><span class="text-info"><span class="glyphicon glyphicon-lock"></span> Đổi mật khẩu </span></a></li>
						<li><a href="/myadmin/users" class="<?php if ($admin_manuser) echo $active ?>"><span class="text-info"><span class="glyphicon glyphicon-user"></span> Q.Lý tài khoản độc giả </span></a></li>
						<li><a href="/myadmin/category" class="<?php if ($admin_category) echo $active ?>"><span class="text-info"><span class="glyphicon glyphicon-list"></span> Q.Lý danh mục </span></a></li>
						<li><a href="/myadmin/book" class="<?php if ($admin_book) echo $active ?>"><span class="text-info"><span class="glyphicon glyphicon-book"></span> Q.Lý kho sách </span></a></li>
						<li><a href="/myadmin/issue-add" class="<?php if ($admin_issue_add) echo $active ?>"><span class="text-info"><span class="glyphicon glyphicon-shopping-cart"></span> Độc giả mượn sách </span></a></li>		
						<li><a href="/myadmin/issue" class="<?php if ($admin_issue) echo $active ?>"><span class="text-info"><span class="glyphicon glyphicon-list-alt"></span> Q.Lý mượn sách </span></a></li>
						<li><a href="/myadmin/config" class="<?php if ($config) echo $active ?>"><span class="text-info"><span class="glyphicon glyphicon-cog"></span> Thiết lập </span></a></li>
					</ul>
				</li>
				<li><a href="/module/action.php?action=logout"> <span class="glyphicon glyphicon-log-out"></span> Logout </a></li>
			</ul>
			<?php
		}
		else
		{
			?>
			<ul class="nav navbar-nav" style="margin-left: -15px">
				<li class="<?php if (isset($homepage_active)) echo "active"?>"><a href="/home"> <span class="glyphicon glyphicon-home"></span> Trang chủ </a></li>
				<li class="<?php if (isset($intro_active)) echo "active"?>"><a href="#"> <span class="	glyphicon glyphicon-info-sign"></span> Giới thiệu </a></li>
				<li class="<?php if (isset($lookup_active)) echo "active"?>"><a href="/lookup"> <span class="glyphicon glyphicon-search"></span> Tra cứu </a></li>
				<li class="<?php if (isset($help_active)) echo "active"?>"><a href="#"> <span class="glyphicon glyphicon-question-sign"></span> Trợ giúp </a></li>
			</ul>
			<?php
		}
		?>
		<ul class="nav navbar-nav navbar-right">
			<li class="<?php if (isset($login_active)) echo "active"?>">
				<?php
				Misc::ss_start();
				if (isset($_SESSION["admin"]))
				{
					?> <a href="/myadmin"><span class="glyphicon glyphicon-user"></span> <?php echo $_SESSION["admin"]->get_User(); ?> </a> <?php
				}
				elseif (isset($_SESSION["user"]))
				{
					?> <a href="/myuser"><span class="glyphicon glyphicon-user"></span> <?php echo $_SESSION["user"]->get_User(); ?> </a> <?php
				}
				else
				{
					?> <a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login</a> <?php
				}
				?>
			</li>
		</ul>
	</div>
</nav>
<!-- End Navigation Bar -->
<!-- Start Content -->
<div class="container-fixed">
	<div class="row">
		<?php
		if (isset($_SESSION["admin"]))
		{
			?>
			<div class="col-xs-12 text-center">
			<?php
		}
		else
		{
			?>
			<div class="col-md-3">
				<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/control.php" ?>
			</div>
			<div class="col-md-9 text-center">
			<?php
		}
		?>
		