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
				<th> Mã độc giả </th>
				<th> Tên độc giả </th>
				<th> Số lần mượn sách </th>
				<th> Số sách đã mượn </th>
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
				<td> <?php echo $user["time"] ?> </td>
				<td> <?php echo $user["quantity"] ?> </td>
				<td class="text-right">
					<div class="dropdown">
						<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"> <span class="glyphicon glyphicon-cog"></span> <span class="caret"></span> </button>
						<ul class="dropdown-menu pull-right">
							<li><a><button type="button" class="btn btn-link reset-pwd" value="<?php echo $user["user"]?>"><span class="glyphicon glyphicon-cog"></span> Reset Password</button></a></li>
							<li><a><button type="button" class="btn btn-link remove-user" value="<?php echo $user["user"]?>"><span class="glyphicon glyphicon-remove"></span> Remove</button></a></li>
						</ul>
					</div>
				</td>
			</tr>
			<?php
		}
	}
	$table = (object)($_POST["table"]);
	$table->query = "
		SELECT A.*, COUNT(issuedetails.id) AS 'quantity' FROM (
			SELECT users.*, COUNT(issues.id) AS 'time' FROM users
			LEFT JOIN issues ON issues.user = users.user
			GROUP BY users.user
			) A
		LEFT JOIN issues ON issues.user = A.user
		LEFT JOIN issuedetails ON issuedetails.issueid = issues.id		
	";
	if (isset($_POST["data"]))
	{
		$keyword = $_POST["data"]["keyword"];
		$table->query .= "
			AND
			(
			A.user REGEXP '$keyword' OR
			A.name REGEXP '$keyword'
			)
		";
	}
	$table->query .= "
		GROUP BY A.user
	";
	$Load = new Load($table);
	exit("");
}
?>