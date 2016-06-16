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
				<th> Mã mượn sách </th>
				<th> Tài khoản </th>
				<th> Tên người dùng </th>
				<th> Ngày mượn </th>
				<th> Số sách </th>
				<th> Trạng thái </th>
				<th> Ngày trả </th>
				<th></th>
			</tr>
			<?php
		}
		public function tr_td($order, $issue)
		{
			$state = array(
				"Đã trả hết",
				"Chưa trả",
				"Quá hạn trả"
			);
			?>
			<tr>
				<td> <?php echo $order ?> </td>
				<td> <?php echo $issue["code"] ?> </td>
				<td> <?php echo $issue["user"] ?> </td>
				<td> <?php echo $issue["name"] ?> </td>
				<td> <?php echo $issue["dateissue"] ?> </td>
				<td> <?php echo $issue["quantity"] ?> </td>
				<td <?php if ($issue["state"] == 2) { ?> style="color: red" <?php } ?>> <?php echo $state[$issue["state"]] ?> </td>
				<td> <?php echo $issue["datesubmit"] ?> </td>
				<td class="text-right"><button type="button" class="btn btn-link select-issue" value="<?php echo $issue["id"] ?>"><span class="glyphicon glyphicon-ok"></span> Chi tiết</button></td>
			</tr>
			<?php
		}
	}
	$table = (object)($_POST["table"]);
	$table->query = "
	SELECT B.* FROM
		(
			SELECT A.*,
			IF (A.issuing = 0, 0,
				IF (DATE(NOW()) < A.datesubmit, 1, 2)) AS 'state' FROM
			(
			SELECT CRC32(issues.id) AS 'code', issues.*, users.name, COUNT(issuedetails.bookid) AS 'quantity', COUNT(IF(issuedetails.state = 1, 1, NULL)) AS 'issuing' FROM issues
			JOIN issuedetails ON issuedetails.issueid = issues.id
			JOIN users ON users.user = issues.user
			GROUP BY issues.id
			) A
		) B
	WHERE 1
	";
	if (isset($_POST["data"]))
	{
		$keyword = $_POST["data"]["keyword"];
		$state = $_POST["data"]["state"];
		$table->query .= "
			AND (B.user REGEXP '$keyword' OR B.code REGEXP '$keyword')
			AND (B.state REGEXP '$state')
		"; 
	}
	$load = new Load($table);
}
?>
