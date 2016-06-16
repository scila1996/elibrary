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
		$keyword = $_POST["data"]["keyword"];
		$category = $_POST["data"]["category"];
		$table->query .= "
			AND
			(
			books.title REGEXP '$keyword' OR
			books.code REGEXP '$keyword' OR
			books.author REGEXP '$keyword' OR
			books.pubhouse REGEXP '$keyword' OR
			books.pubyear REGEXP '$keyword' OR
			books.description REGEXP '$keyword'
			)
			AND
			(
			books.categoryid REGEXP '$category'
			)
		";
	}
	$Load = new Load($table);
	exit("");
}
?>