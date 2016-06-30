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
				<th> Books </th>
				<th></th>
			</tr>
			<?php
		}
		public function tr_td($order, $row)
		{
			?>
			<tr class="text-left">
				<td><strong> <?php echo $order ?> </strong></td>
				<td> <?php echo $row["title"] ?> </td>
				<td>
					<button type="button" class="btn btn-link pull-right book-detail" value="<?php echo $row["id"] ?>"><span class="glyphicon glyphicon-ok-circle"></span> Chi tiết </button>
				</td>
			</tr>
			<?php
		}
	}
	$table = (object)($_POST["table"]);
	$table->query = "
	SELECT books.*, categories.name AS 'categoryname'
	FROM books JOIN categories
	ON books.categoryid = categories.id
	WHERE 1
	";
	if (isset($_POST["data"]))
	{
		$category = $_POST["data"]["category"];
		$title = $_POST["data"]["title"];
		$code = $_POST["data"]["code"];
		$author = $_POST["data"]["author"];
		$pubhouse = $_POST["data"]["pubhouse"];
		$pubyear = $_POST["data"]["pubyear"];
		$table->query .= "
			AND
			(
			books.categoryid REGEXP '$category' AND
			books.title REGEXP '$title' AND
			books.code REGEXP '$code' AND
			books.author REGEXP '$author' AND
			books.pubhouse REGEXP '$pubhouse' AND
			books.pubyear REGEXP '$pubyear'
			)
		";
	}
	$Load = new Load($table);
	exit("");
}
?>