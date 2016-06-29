<?php

include_once $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

$punish = 0;

if (isset($_POST["table"]))
{
	$isid = $_POST["data"]["issueid"];
	class Load extends Table
	{
		public function tr_th()
		{
			?>
			<tr class="active">
				<th> # </th>
				<th> Sách </th>
				<th> Trạng thái </th>
				<th colspan="100" class="text-right"> <button type="button" class="btn btn-primary select-all-submit" value="<?php global $isid; echo $isid ?>"><strong> Trả hết </strong></button> </th>
			</tr>
			<?php
		}
		public function tr_td($order, $issue)
		{
			?>
			<tr>
				<td style="font-weight: bold"> <?php echo $order ?> </td>
				<td> <?php echo $issue["booktitle"] . " giá : " . $issue["price"] ?> </td>
				<td>
					<?php
					switch ($issue["state"])
					{
						case 1:
							?> <div class="text-warning"> Đang mượn </div> <?php
							break;
						case -1:
							?> <div class="text-danger"> Bị mất </div> <?php
							global $punish;
							$punish += $issue["price"];
							break;
						case 0:
							?> <div class="text-success"> Đã trả </div> <?php
							break;
					}
					?>
				</td>
				<td class="text-right">
					<?php
					$disable = "";
					if ($issue["state"] == 0)
					{
						$disable = "disabled";
					}
					?>
					<button type="button" class="btn btn-link select-submit" <?php echo $disable ?> value="<?php echo $issue["id"] ?>"> Trả sách </button>
					<button type="button" class="btn btn-link select-lose" <?php echo $disable ?> value="<?php echo $issue["id"] ?>"> Mất / Hỏng </button>
				</td>
			</tr>
			<?php
		}
	}
	$table = (object)($_POST["table"]);
	$table->query = "
	SELECT issuedetails.*, books.title AS 'booktitle', books.price FROM issuedetails
	LEFT JOIN issues ON issuedetails.issueid = issues.id
	LEFT JOIN books ON issuedetails.bookid = books.id
	WHERE 1
	";
	if (isset($_POST["data"]))
	{
		$table->query .= "
			AND
			(
			issuedetails.issueid = '$isid'
			)
		";
	}
	$table->query .= "
		ORDER BY issuedetails.state DESC
	";
	$load = new Load($table);
	if ($punish)
	{
		?>
		<div class="text-danger"><strong> Tiền phạt bị mất sách <?php echo $punish ?> vnd </strong></div>
		<?php
	}
}
?>