<?php
include_once $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (isset($_POST["table"])) {

    class Load extends Table {

        public function tr_th() {
            ?>
            <tr class="active">
                <th> # </th>
                <th> Tên sách </th>
                <th> Số sách còn lại </th>
                <th></th>
            </tr>
            <?php
        }

        public function tr_td($order, $row) {
            ?>
            <tr class="text-left">
                <td><strong> <?php echo $order ?> </strong></td>
                <td> <?php printf("%s - (%s)", $row["title"], $row["categoryname"]) ?> </td>
                <td> <?php echo $row["total"] ?> </td>
                <td>
                    <button type="button" class="btn btn-link pull-right book-detail" value="<?php echo $row["id"] ?>"><span class="glyphicon glyphicon-ok-circle"></span> Chi tiết </button>
                </td>
            </tr>
            <?php
        }

    }

    $table = (object) ($_POST["table"]);
    $table->query = "
	SELECT books.*, categories.name AS 'categoryname', (books.amount - COUNT(issuedetails.id)) AS 'total' FROM books
	LEFT JOIN categories ON categories.id = books.categoryid
	LEFT JOIN issuedetails ON issuedetails.bookid = books.id AND issuedetails.state != 0
	WHERE 1
	";
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
			)";
            $table->params = array_merge($table->params, array_fill(0, 6, $keyword));
        }
        if ($category) {
            $table->query .= "
                        AND
			(
			books.categoryid REGEXP ?
			)
		";
            $table->params = array_merge($table->params, array($category));
        }

        $table->query .= "
		GROUP BY books.id
	";

        $Load = new Load($table);
        exit("");
    }
}
?>