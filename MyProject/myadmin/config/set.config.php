<?php

include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

$connect = Sql::open_MySQL();
$connect->query("UPDATE issue_rule SET month = $_POST[month], total = $_POST[total]");
$connect->close();

Misc::create_Alert("alert-success", "<strong> Đã cập nhật thành công </strong>");
header("Location:" . $_SERVER["HTTP_REFERER"]);

?>
