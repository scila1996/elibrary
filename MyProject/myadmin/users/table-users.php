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
							<li><a><button type="button" class="btn btn-link reset-pwd no-padding" value="<?php echo $user["user"]?>"><span class="glyphicon glyphicon-cog"></span> Mật khẩu mặc định </button></a></li>
							<li><a><button type="button" class="btn btn-link remove-user no-padding" value="<?php echo $user["user"]?>"><span class="glyphicon glyphicon-remove"></span> Xóa tài khoản này </button></a></li>
						</ul>
					</div>
				</td>
			</tr>
			<?php
		}
	}
	$table = (object)($_POST["table"]);
	$table->query = "
		SELECT
			users.user,
			users.name, COUNT(A.isid) AS 'time', IFNULL(SUM(A._count), 0) AS 'quantity'
		FROM users
		LEFT JOIN
		(
			SELECT issues.id AS 'isid', issues.user AS '_user', COUNT(issuedetails.id) AS '_count' FROM issues
			JOIN issuedetails ON issuedetails.issueid = issues.id
			GROUP BY issues.id
  		) A ON A._user = users.user
  		WHERE 1
	";
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
	$table->query .= "
		GROUP BY users.user
	";
	$Load = new Load($table);
	exit("");
}
?>