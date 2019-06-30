<?php
include_once $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (isset($_POST["table"])) {

    class Load extends Table {

        public function tr_th() {
            ?>
            <tr class="active">
                <th> # </th>
                <th> Books </th>
                <th></th>
            </tr>
            <?php
        }

        public function tr_td($order, $row) {
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

    $table = (object) ($_POST["table"]);
    $table->query = "
	SELECT books.*, categories.name AS 'categoryname'
	FROM books JOIN categories
	ON books.categoryid = categories.id
	WHERE 1
	";

    $table->params = array();

    if (isset($_POST["data"])) {
        $data = array(
            'categoryid' => $_POST["data"]["category"],
            'title' => $_POST["data"]["title"],
            'code' => $_POST["data"]["code"],
            'author' => $_POST["data"]["author"],
            'pubhouse' => $_POST["data"]["pubhouse"],
            'pubyear' => $_POST["data"]["pubyear"],
        );

        foreach ($data as $column => $val) {
            if ($val) {
                $table->query .= " AND $column REGEXP ?";
                $table->params = array_merge($table->params, array($val));
            }
        }
    }
    $Load = new Load($table);
    exit("");
}
?>