<?php

class Misc
{
	public static function ss_start() // Start session safe mode, avoid conflict !
	{
		if (session_status() == PHP_SESSION_NONE)
		{
			session_start();
		}
	}
	public static function ss_destroy() // Destroy session safe mode, avoid conflict !
	{
		if (session_status() == PHP_SESSION_ACTIVE)
		{
			session_destroy();
		}
	}
	public static function create_Alert($prop, $text, $id = "")
	{
		self::ss_start();
		$_SESSION["alert"] = array("prop" => $prop, "text" => $text, "id" => $id);
	}
	public static function show_Alert() // Create HTML with Bootstrap Alert
	{
		self::ss_start();
		if (isset($_SESSION["alert"]))
		{
			$alert = (object)$_SESSION["alert"];
			?>
			<div class="alert <?php echo $alert->prop ?> text-left" <?php echo sprintf('id="%s"', $alert->id) ?>>
				<a href="javascript:void(0)" class="close"> &times; </a>
				<span> <?php echo $alert->text ?> </span>
			</div>
			<?php
			unset($_SESSION["alert"]);
		}
	}
	public static function has_Alert()
	{
		return isset($_SESSION["alert"]);
	}
	public static function unset_Cookie($name)
	{
		setcookie($name, "", 1);
	}
}

?>