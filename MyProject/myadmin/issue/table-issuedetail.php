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
				<th> Sách </th>
				<th> Trạng thái </th>
				<th></th>
			</tr>
			<?php
		}
		public function tr_td($order, $issue)
		{
			?>
			<tr>
				<td> <?php echo $order ?> </td>
				<td> <?php echo $issue["booktitle"] ?> </td>
				<td> <?php echo $issue["state"] == 1 ? "Đang mượn - chưa trả" : "Đã trả" ?> </td>
				<td class="text-right"><button type="button" class="btn btn-primary select-submit" <?php if (!$issue["state"]) echo "disabled" ?> value="<?php echo $issue["id"] ?>"><span class="glyphicon glyphicon-flag"></span></button></td>
			</tr>
			<?php
		}
	}
	$table = (object)($_POST["table"]);
	$table->query = "
	SELECT issuedetails.*, books.title AS 'booktitle' FROM issuedetails
	LEFT JOIN issues ON issuedetails.issueid = issues.id
	LEFT JOIN books ON issuedetails.bookid = books.id
	WHERE 1
	";
	if (isset($_POST["data"]))
	{
		$isid = $_POST["data"]["issueid"];
		$table->query .= "
			AND
			(
			issuedetails.issueid = '$isid'
			)
		";
	}
	$load = new Load($table);
}
?>