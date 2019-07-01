<?php
include_once $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (isset($_POST["table"])) {

    class Load extends Table {

        public function tr_th() {
            ?>
            <tr class="active">
                <th> # </th>
                <th> Tên sách </th>
                <th class="text-right"><button type="button" class="btn btn-link remove-selected"><span class="glyphicon glyphicon-remove"></span> Xóa </button></th>
            </tr>
            <?php
        }

        public function tr_td($order, $row) {
            ?>
            <tr class="text-left">
                <td><strong> <?php echo $order ?> </strong></td>
                <td> <?php echo $row["title"] ?> </td>
                <td class="text-right">
                    <input type="checkbox" class="select-book" value="<?php echo $row["id"] ?>" />
                </td>
            </tr>
            <?php
        }

    }

    $table = (object) ($_POST["table"]);
    $table->query = "
	SELECT books.*, categories.name AS 'categoryname' FROM books
	JOIN categories ON books.categoryid = categories.id
	LEFT JOIN issuedetails ON issuedetails.bookid = books.id AND issuedetails.state
	WHERE 1
	";
    $table->params = array();

    if (isset($_POST["data"])) {
        $keyword = $_POST["data"]["keyword"];
        $category = $_POST["data"]["category"];

        if ($keyword) {
            $table->query .= "
			AND
			(
			books.title REGEXP ? OR
			books.code REGEXP ? OR
			books.author REGEXP ? OR
			books.pubhouse REGEXP ? OR
			books.pubyear REGEXP ? OR
			books.description REGEXP ?
			)
                        ";
            $table->params = array_fill(0, 6, $keyword);
        }
        if ($category) {
            $table->query .= "AND
			(
			books.categoryid REGEXP ?
			)
		";
            $table->params = array_merge($table->params, array($category));
        }

        $table->query .= "
			GROUP BY books.id
			HAVING COUNT(bookid) < books.amount";
    }
    $Load = new Load($table);
    exit("");
}
?>
