<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (isset($_POST["table"])) {

    class Load extends Table {

        public function tr_th() {
            ?>
            <tr class="active">
            <tr class="active">
                <th> # </th>
                <th> Tên sách đã chọn </th>
            </tr>
            </tr>
            <?php
        }

        public function tr_td($order, $row) {
            ?>
            <tr class="a-book">
                <td style="font-weight: bold"> <?php echo $order ?> </td>
                <td> <?php echo $row["title"] ?> - giá : <?php echo $row["price"] ?> vnd </td>
            </tr>
            <?php
        }

    }

    $list = implode($_POST["data"], "', '");

    $vals = $_POST["data"];
    $params = implode(',', array_fill(0, count($vals), '?'));


    $table = (object) ($_POST["table"]);
    $table->query = "
		SELECT books.title, books.price FROM books
		WHERE books.id IN ($params)
	";
    $table->params = $vals;

    $Load = new Load($table);

    Sql::select_WithCallBack("
		SELECT
			DATE(NOW()) AS 'issue-date',
			DATE(DATE_ADD(NOW(), INTERVAL issue_rule.month MONTH)) AS 'submit-date'
		FROM issue_rule
	", array(), function($result) {
        ?>
        <div class="input-group form-group">
            <div class="input-group-addon"><span class="text-default"> Ngày mượn </span></div>
            <input type="date" class="form-control" name="issue-date" value="<?php echo $result["issue-date"] ?>" readonly />
        </div>
        <div class="input-group form-group">
            <div class="input-group-addon"><span class="text-default"> Ngày trả </span></div>
            <input type="date" class="form-control" name="submit-date" value="<?php echo $result["submit-date"] ?>" readonly />
        </div>
        <?php
    });
    $info;
    Sql::select_WithCallBack("
	SELECT COUNT(*) AS 'length', SUM(books.price) AS 'price' FROM books
	WHERE books.id IN (?)
	", array($list), function($result) use (&$info) {
        $info = $result;
        return false;
    });
    ?>
    <div class="well well-sm text-default">
        <div><strong> Tổng số sách : </strong> <?php echo $info["length"] ?> </div>
        <div><strong> Tổng tiền thuê : </strong> <?php echo $info["price"] ?> vnd </div>
    </div>
    <?php
}
?>