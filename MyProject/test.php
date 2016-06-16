<?php

// Tao bang thuhai

$thu = 1;

$db_name = "monday";

$connect = mysqli_connect("localhost", "root", "");
mysqli_query($connect, "CREATE DATABASE IF NOT EXISTS $db_name");
mysqli_select_db($connect, $db_name);
mysqli_query($connect, "
	CREATE TABLE IF NOT EXISTS listday
	(
		day date
	)
");
mysqli_query($connect, "TRUNCATE TABLE listday");


// Thang nay co bao nhieu ngay ?
$so_ngay_trong_thang = cal_days_in_month(CAL_GREGORIAN, date("m"), date("y"));
echo "Tháng này có $so_ngay_trong_thang ngày";

// Tim cac ngay thu 2 trong thang nay

// 1. tạo mảng rỗng chứa ngày
$list = array();

// 2. quét từ ngày thứ 1 -> cuối tháng để kiểm tra ngày nào là thứ 2
?> <br /> <?php
echo "Các ngày thứ 2 trong tháng này là : " . '<br />';
for ($i = 1; $i < $so_ngay_trong_thang; $i++)
{
	$d = sprintf("%s-%s-%s", date("Y"), date("m"), $i);
	$d = new DateTime($d);
	if ($d->format("w") == $thu)
	{
		$d = $d->format("Y-m-d");
		echo $d . '<br />';
		array_push($list, $d);
	}
}

// INSERT VÀO DATABASE danh sách ngày lấy được

// biến mảng thành dãy
$list = implode("'), ('", $list);

mysqli_query($connect, "
INSERT INTO listday(day) VALUES ('$list')
");


?>