<?php

class Sql
{
	public static function open_MySQL()
	{
		include $_SERVER["DOCUMENT_ROOT"] . "\config\config.db.php";
		$connectsql = new mysqli($host, $user, $pass, $dbname);
		if ($connectsql->connect_error)
		{
			header("Location:/module/dberr.php");
			die("");
		}
		$connectsql->set_charset("utf8");
		return $connectsql;
	}
	public static function select_WithCallBack($query_str, $func_callback = NULL, $offset = 0, $num = -1)
	{
		$connect = self::open_MySQL();
		$result = $connect->query($query_str);
		$length = !$result ? 0 : $result->num_rows;
		if ($func_callback && $length)
		{
			$result->data_seek($offset);
			if ($num == -1) $num = $length;
			$i = 1;
			while (($value = $result->fetch_array()) && ($i++ <= $num))
			{
				if (!$func_callback($value)) break;
			}
		}
		$connect->close();
		return $length; // return number record of "SELECT" clause
	}
}

?>