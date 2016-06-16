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
			</tr>
			<?php
		}
		public function tr_td($row)
		{
			static $i = 0;
			?>
			<tr>
				<td> <?php echo ++$i ?> </td>
				<td> <?php echo $row["title"] ?> </td>
			</tr>
			<?php
		}
	}
	$table = (object)($_POST["table"]);
	$table->query = "
	SELECT books.*, categories.name AS 'categoryname'
	FROM books JOIN categories
	ON books.categoryid = categories.id
	";
	if (isset($_GET["keyword"]))
	{
		$table->query .= "
		WHERE
		(
		books.title REGEXP '$_GET[keyword]' OR
		books.code REGEXP '$_GET[keyword]' OR
		books.author REGEXP '$_GET[keyword]' OR
		books.pubhouse REGEXP '$_GET[keyword]' OR
		books.pubyear REGEXP '$_GET[keyword]' OR
		books.description REGEXP '$_GET[keyword]' OR
		categories.name REGEXP '$_GET[keyword]'
		)
		";
	}
	$Load = new Load($table);
	exit("");
}
?>
