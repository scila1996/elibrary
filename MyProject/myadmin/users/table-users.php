<?php

include_once $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (isset($_POST["table"]))
{
	class Load extends Table
	{
		public function tr_th()
		{
			?>
			<tr class="active">
				<th> # </th>
				<th> User </th>
				<th> Name </th>
				<th></th>
			</tr>
			<?php
		}
		public function tr_td($i, $user)
		{
			?>
			<tr>
				<td><strong> <?php echo $i ?> </strong></td>
				<td> <?php echo $user["user"] ?> </td>
				<td> <?php echo $user["name"] ?> </td>
				<td class="text-right">
					<button type="button" class="btn btn-link reset-pwd" value="<?php echo $user["user"]?>"><span class="glyphicon glyphicon-cog"></span> Reset Password</button>
					<button type="button" class="btn btn-link remove-user" value="<?php echo $user["user"]?>"><span class="glyphicon glyphicon-remove"></span> Remove</button>
					
				</td>
			</tr>
			<?php
		}
	}
	$table = (object)($_POST["table"]);
	$table->query = "SELECT users.* FROM users WHERE 1";
	if (isset($_POST["data"]))
	{
		$keyword = $_POST["data"]["keyword"];
		$table->query .= "
			AND
			(
			users.user REGEXP '$keyword' OR
			users.name REGEXP '$keyword'
			)
		";
	}
	$Load = new Load($table);
	exit("");
}
?>