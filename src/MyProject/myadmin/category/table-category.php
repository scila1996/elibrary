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
				<th> Tên danh mục </th>
				<th> Số sách </th>
				<th></th>
			</tr>
			<?php
		}
		public function tr_td($order, $category)
		{
			?>
			<tr>
				<td style="font-weight: bold"> <?php echo $order ?> </td>
				<td> <?php echo $category["name"] ?> </td>
				<td> <?php echo $category["amount"] ?> </td>
				<td class="text-right">
					<button type="button" class="btn btn-link edit-category" value="<?php echo $category["id"] ?>"><span class="glyphicon glyphicon-edit"></span> Sửa </button>
					<button type="button" class="btn btn-link delete-category" value="<?php echo $category["id"] ?>"><span class="glyphicon glyphicon-trash"></span> Xóa </button>
				</td>
			</tr>
			<?php
		}
	}
	$table = (object)($_POST["table"]);
	$table->query = "
		SELECT categories.*, COUNT(books.id) AS 'amount' FROM categories
		LEFT JOIN books ON categories.id = books.categoryid
		GROUP BY categories.id
	";
	$Load = new Load($table);
	exit("");
}
?>
