<?php

include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

Sql::query("UPDATE issue_rule SET month = ?, total = ?", array($_POST['month'], $_POST['total']));

Misc::create_Alert("alert-success", "<strong> Đã cập nhật thành công </strong>");
header("Location:" . $_SERVER["HTTP_REFERER"]);
?>
