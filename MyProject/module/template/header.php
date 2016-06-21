<!-- Heading Page [Title and Timestamp] -->
<div class="wrapper">
	<div class="heading container-fixed">
		<div class="row">
			<div class="col-xs-6">
				eLibrary : Design by scila1996
			</div>
			<div class="col-xs-6 text-right">
				<?php
				echo date("l - d/m/Y")
				?>
			</div>
		</div>
	</div>
	<!-- Banner Image -->
	<div class="container-fixed">
		<div class="row">
			<div class="col-xs-12">
				<?php
				$banner_img = "headpage.png";
				if (isset($_SESSION["admin"]))
				{
					$banner_img = "McGuireWeb Other Services Banner_v2f.jpg";
				}
				?> <img src="/module/template/images/<?php echo $banner_img ?>" class="img-rounded img-banner"/> <?php
				?>
			</div>
		</div>
	</div>
	<div class="form-group"></div>
	<!-- Navigation Bar -->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<?php
			if (isset($_SESSION["admin"]))
			{
				$active = "list-group-item-info";
				?>
				<ul class="nav navbar-nav" style="margin-left: -15px">
					<li class="<?php if (isset($homepage_active)) echo "active" ?>"><a href="/home"> <span class="glyphicon glyphicon-home"></span> View </a></li>
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)"> <span class="glyphicon glyphicon-cog"></span> Manage <span class="caret"></span></a>
						<ul class="dropdown-menu nav nav-pills nav-stacked" style="margin-top: 5px; padding: 5px">
							<li><a href="/myadmin/chpwd" class="<?php if (isset($admin_password)) echo $active ?>"><span class="text-info"><span class="glyphicon glyphicon-lock"></span> Đổi mật khẩu </span></a></li>
							<li><a href="/myadmin/users" class="<?php if (isset($admin_manuser)) echo $active ?>"><span class="text-info"><span class="glyphicon glyphicon-user"></span> Q.Lý tài khoản độc giả </span></a></li>
							<li><a href="/myadmin/category" class="<?php if (isset($admin_category)) echo $active ?>"><span class="text-info"><span class="glyphicon glyphicon-list"></span> Q.Lý danh mục </span></a></li>
							<li><a href="/myadmin/book" class="<?php if (isset($admin_book)) echo $active ?>"><span class="text-info"><span class="glyphicon glyphicon-book"></span> Q.Lý kho sách </span></a></li>
							<li><a href="/myadmin/issue-add" class="<?php if (isset($admin_issue_add)) echo $active ?>"><span class="text-info"><span class="glyphicon glyphicon-shopping-cart"></span> Độc giả mượn sách </span></a></li>		
							<li><a href="/myadmin/issue" class="<?php if (isset($admin_issue)) echo $active ?>"><span class="text-info"><span class="glyphicon glyphicon-list-alt"></span> Q.Lý mượn sách </span></a></li>
							<li><a href="/myadmin/config" class="<?php if (isset($config)) echo $active ?>"><span class="text-info"><span class="glyphicon glyphicon-cog"></span> Thiết lập </span></a></li>
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
					<li class="<?php if (isset($intro_active)) echo "active"?>"><a href="/intro"> <span class="	glyphicon glyphicon-info-sign"></span> Giới thiệu </a></li>
					<li class="<?php if (isset($lookup_active)) echo "active"?>"><a href="/lookup"> <span class="glyphicon glyphicon-search"></span> Tra cứu </a></li>
					<li class="<?php if (isset($help_active)) echo "active"?>"><a href="/help"> <span class="glyphicon glyphicon-question-sign"></span> Trợ giúp </a></li>
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
						?>
						<li><a class="dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)"> <span class="glyphicon glyphicon-user"></span> <?php echo $_SESSION["user"]->get_User() ?> <span class="caret"></span></a>
							<ul class="dropdown-menu nav nav-pills nav-stacked" style="margin-top: 5px; padding: 5px">
								<?php $active = "list-group-item-info"; ?>
								<li><a><strong class="text-info"> <?php echo $_SESSION["user"]->get_Name() ?> </strong></a></li>
								<li class="divider"></li>
								<li><a href="/myuser/chpwd" class="text-info <?php if (isset($user_password)) echo $active ?>"><div class="text-info"><span class="glyphicon glyphicon-lock"></span> Đổi mật khẩu </div></a></li>
								<li><a href="/myuser/mybooks" class="text-info <?php if (isset($user_issuebook)) echo $active ?>"><div class="text-info"><span class="glyphicon glyphicon-calendar"></span> Lịch sử mượn sách </div></a></li>
								<li><a href="/module/action.php?action=logout" class="text-info"><div class="text-info"><span class="glyphicon glyphicon-log-out"></span> Đăng xuất </div></a></li>
							</ul>
						</li>
						<?php
					}
					else
					{
						?> <a href="/login"><span class="glyphicon glyphicon-log-in"></span> Login </a> <?php
					}
					?>
				</li>
			</ul>
		</div>
	</nav>
	<!-- End Navigation Bar -->
	<!-- Start Content -->
	<div class="container-fixed content">
		<div class="row">
			<div class="col-xs-12 text-center">
			