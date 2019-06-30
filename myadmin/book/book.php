<?php
include_once $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (isset($_POST["table"])) {

    class Load extends Table {

        public function tr_th() {
            ?>
            <tr class="active">
                <th> <input type="checkbox" class="select-all"/> </th>
                <th> # </th>
                <th> Books </th>
                <th class="text-right"><button type="button" class="btn btn-link" name="action" value="delete-books"> Trash <span class="glyphicon glyphicon-trash"></span></button></th>
            </tr>
            <?php
        }

        public function tr_td($order, $row) {
            ?>
            <tr>
                <td> <input type="checkbox" value="<?php echo $row["id"] ?>" class="checkbox-book" /> </td>
                <td><?php echo $order ?></td>
                <td><?php echo $row["title"] ?></td>
                <td class="text-right">
                    <div class="dropdown">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"> <span class="glyphicon glyphicon-cog"></span> <span class="caret"></span> </button>
                        <ul class="dropdown-menu pull-right">
                            <li><a href="javascript:void(0)" class="edit-book"><span class="glyphicon glyphicon-edit"></span> Sửa </a></li>
                            <li><a href="javascript:void(0)" class="delete-book"><span class="glyphicon glyphicon-trash"></span> Xóa </a></li>
                            <li class="divider"></li>
                            <li><a href="javascript:void(0)" class="select-book"><span class="glyphicon glyphicon-check"></span> Chọn </a></li>
                        </ul>
                    </div>		
                </td>
            </tr>
            <?php
        }

    }

    $table = (object) ($_POST["table"]);
    $table->query = "
	SELECT books.*, categories.name AS 'categoryname'
	FROM books JOIN categories
	ON books.categoryid = categories.id WHERE 1
	";
    $table->params = array();

    if (isset($_POST["data"])) {
        $keyword = $keyword = $_POST["data"]["keyword"];
        $category = $category = $_POST["data"]["category"];

        if ($keyword) {
            $table->query .= "
			AND
			(
			books.title REGEXP ? OR
			books.code REGEXP ? OR
			books.author REGEXP ? OR
			books.pubhouse REGEXP ? OR
			books.pubyear REGEXP ? OR
			books.description REGEXP ? OR
			categories.name REGEXP ?
			)";
            $table->params = array_merge($table->params, array_fill(0, 7, $keyword));
        }
        if ($category) {
            $table->query .= "
			AND
			(
			categories.id REGEXP ?
			)
		";
            $table->params = array_merge($table->params, array($category));
        }
    }
    $Load = new Load($table);
    exit("");
}
?>
