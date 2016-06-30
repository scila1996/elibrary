<?php

include_once $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

	?> <option value=""> Tất cả </option> <?php
Sql::select_WithCallBack("SELECT categories.* FROM categories", function($value){
	?>
	<option value="<?php echo $value["id"] ?>"><?php echo $value["name"] ?></option>
	<?php
	return TRUE;
});
?>