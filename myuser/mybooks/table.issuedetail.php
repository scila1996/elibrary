<?php
include_once $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (isset($_POST["table"])) {

    class Load extends Table {

        public function tr_th() {
            ?>
            <tr class="active">
                <th> # </th>
                <th> Sách </th>
                <th> Trạng thái </th>
            </tr>
            <?php
        }

        public function tr_td($order, $issue) {
            ?>
            <tr>
                <td style="font-weight: bold"> <?php echo $order ?> </td>
                <td> <?php echo "<strong> {$issue['bookcode']} </strong>: {$issue["booktitle"]}" ?> </td>
                <td> <?php echo $issue["state"] == 1 ? "Đang mượn - chưa trả" : "Đã trả" ?> </td>
            </tr>
            <?php
        }

    }

    $isid = "";

    if (isset($_POST["data"])) {
        $isid = $_POST["data"]["issueid"];
    }

    $table = (object) ($_POST["table"]);
    $table->query = "
		SELECT
			issuedetails.*,
			books.title AS 'booktitle',
                        books.code as 'bookcode'
		FROM issuedetails
		LEFT JOIN issues ON issuedetails.issueid = issues.id
		LEFT JOIN books ON issuedetails.bookid = books.id
                ";

    if ($isid) {
        $table->query .= " WHERE issuedetails.issueid REGEXP ?";
        $table->params = array($isid);
    }

    $load = new Load($table);
}
?>