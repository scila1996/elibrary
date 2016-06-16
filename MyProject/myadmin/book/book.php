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
				<th> <input type="checkbox" class="select-all"/> </th>
				<th> # </th>
				<th> Books </th>
				<th class="text-right"><button type="button" class="btn btn-link" name="action" value="delete-books"> Trash <span class="glyphicon glyphicon-trash"></span></button></th>
			</tr>
			<?php
		}
		public function tr_td($order, $row)
		{
			?>
			<tr>
				<td> <input type="checkbox" value="<?php echo $row["id"] ?>" class="checkbox-book" /> </td>
				<td><?php echo $order ?></td>
				<td><?php echo $row["title"] ?></td>
				<td class="text-right">
					<div class="dropdown">
						<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"> <span class="glyphicon glyphicon-cog"></span> <span class="caret"></span> </button>
						<ul class="dropdown-menu pull-right">
							<li><a href="javascript:void(0)" class="edit-book"><span class="glyphicon glyphicon-edit"></span> Edit </a></li>
							<li><a href="javascript:void(0)" class="delete-book"><span class="glyphicon glyphicon-trash"></span> Delete </a></li>
							<li class="divider"></li>
							<li><a href="javascript:void(0)" class="select-book"><span class="glyphicon glyphicon-check"></span> Select </a></li>
						</ul>
					</div>		
				</td>
			</tr>
			<?php
		}
	}
	$table = (object)($_POST["table"]);
	$table->query = "
	SELECT books.*, categories.name AS 'categoryname'
	FROM books JOIN categories
	ON books.categoryid = categories.id WHERE 1
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
			books.description REGEXP '$keyword' OR
			categories.name REGEXP '$keyword'
			)
			AND
			(
			categories.id REGEXP '$category'
			)
		";
	}
	$Load = new Load($table);
	exit("");
}
?>
