<?php
include_once $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (isset($_POST["table"])) {

    class Load extends Table {

        public function tr_th() {
            ?>
            <tr class="active">
                <th> # </th>
                <th> Mã sách </th>
                <th> Tên sách </th>
                <th> Còn lại </th>
                <th></th>
            </tr>
            <?php
        }

        public function tr_td($order, $row) {
            ?>
            <tr class="text-left">
                <td><strong> <?php echo $order ?> </strong></td>
                <td> <?php echo $row["code"] ?> </td>
                <td> <?php echo $row["title"] ?> </td>
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
                    SELECT books.*, books.amount - IFNULL(a.outofbox IS NULL, 0) AS 'total' FROM books
                    LEFT JOIN
                    (
                        SELECT issuedetails.bookid, COUNT(issuedetails.bookid) AS outofbox FROM issuedetails
                        WHERE issuedetails.state
                        GROUP BY issuedetails.bookid
                    ) AS a
                    ON books.id = a.bookid
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