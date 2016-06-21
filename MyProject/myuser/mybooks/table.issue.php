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
				<td style="font-weight: bold"> <?php echo $order ?> </td>
				<td> <?php echo $issue["code"] ?> </td>
				<td> <?php echo $issue["dateissue"] ?> </td>
				<td> <?php echo $issue["quantity"] ?> </td>
				<td <?php if ($issue["state"] == 2) { ?> style="color: red" <?php } ?>> <?php echo $state[$issue["state"]] ?> </td>
				<td> <?php echo $issue["datesubmit"] ?> </td>
				<td class="text-right"><button type="button" class="btn btn-link issue-detail" value="<?php echo $issue["id"] ?>"><span class="glyphicon glyphicon-ok"></span> Chi tiết</button></td>
			</tr>
			<?php
		}
	}
	$state = "";
	if (isset($_POST["data"]))
	{
		$state = $_POST["data"]["state"];
	}
	$user = $_SESSION["user"]->get_User();
	$table = (object)($_POST["table"]);
	$table->query = "
	SELECT B.* FROM
		(
			SELECT A.*,
			IF (A.issuing = 0, 0,
				IF (DATE(NOW()) < A.datesubmit, 1, 2)) AS 'state' FROM
			(
			SELECT CRC32(issues.id) AS 'code', issues.*, COUNT(issuedetails.bookid) AS 'quantity', COUNT(IF(issuedetails.state = 1, 1, NULL)) AS 'issuing' FROM issues
			JOIN issuedetails ON issuedetails.issueid = issues.id
			GROUP BY issues.id
			) A
		) B
	WHERE 1
	AND (B.user = '$user')
	AND (B.state REGEXP '$state')
	"; 
	$load = new Load($table);
}
?>
