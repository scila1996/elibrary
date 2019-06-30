<?php
include_once $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (isset($_POST["table"])) {

    class Load extends Table {

        public function tr_th() {
            ?>
            <tr class="active">
                <th> # </th>
                <th> Mã mượn sách </th>
                <th> Tài khoản </th>
                <th> Tên người dùng </th>
                <th> Ngày mượn </th>
                <th> Số sách </th>
                <th> Trạng thái </th>
                <th> Ngày trả </th>
                <th></th>
            </tr>
            <?php
        }

        public function tr_td($order, $issue) {
            $text = "";
            if (!$issue["issuing"] && !$issue["lose"]) {
                $text = '<div class="text-success"> Đã trả hết </div>';
            } else {
                if ($issue["overdate"] && $issue["issuing"]) {
                    $text .= '<div class="text-danger"> Quá hạn trả </div>';
                }
                if ($issue["submited"]) {
                    $text .= '<div class="text-success"> Đã trả ' . $issue["submited"] . ' cuốn </div>';
                }
                if ($issue["issuing"]) {
                    $text .= '<div class="text-warning"> Còn ' . $issue["issuing"] . ' cuốn chưa trả </div>';
                }
                if ($issue["lose"]) {
                    $text .= '<div class="text-danger"> Bị mất ' . $issue["lose"] . ' cuốn </div>';
                }
            }
            ?>
            <tr>
                <td style="font-weight: bold"> <?php echo $order ?> </td>
                <td> <?php echo $issue["code"] ?> </td>
                <td> <?php echo $issue["user"] ?> </td>
                <td> <?php echo $issue["name"] ?> </td>
                <td> <?php echo $issue["dateissue"] ?> </td>
                <td> <?php echo $issue["quantity"] ?> </td>
                <td style="font-weight: bold"> <?php echo $text ?> </td>
                <td> <?php echo $issue["datesubmit"] ?> </td>
                <td class="text-right">
                    <button class="btn btn-primary select-issue" value="<?php echo $issue["id"] ?>"><span class="glyphicon glyphicon-check"></span></button>
                </td>
            </tr>
            <?php
        }

    }

    $table = (object) ($_POST["table"]);
    $table->query = "
		SELECT A.* FROM
		(
			SELECT
				CRC32(issues.id) AS 'code',
				issues.*,
				users.name,
				COUNT(issuedetails.bookid) AS 'quantity',
				COUNT(IF(issuedetails.state = 0, 1, NULL)) AS 'submited',
				COUNT(IF(issuedetails.state = 1, 1, NULL)) AS 'issuing',
				COUNT(IF(issuedetails.state = -1, 1, NULL)) AS 'lose',
				DATE(NOW()) > issues.datesubmit AS 'overdate'
			FROM issues
			JOIN issuedetails ON issuedetails.issueid = issues.id
			JOIN users ON users.user = issues.user
			GROUP BY issues.id
		) A
		WHERE 1
	";
    $table->params = array();

    if (isset($_POST["data"])) {
        $keyword = $_POST["data"]["keyword"];
        $state = $_POST["data"]["state"];
        if ($keyword) {
            $table->query .= "
			AND (A.user REGEXP ? OR A.name REGEXP ? OR A.code REGEXP ?)
		";
            $table->params = array_merge($table->params, array_fill(0, 3, $keyword));
        }
        switch ($state) {
            case 1:
                $table->query .= "AND (A.issuing = 0 AND A.lose = 0)";
                break;
            case 2:
                $table->query .= "AND (A.issuing != 0 OR A.lose != 0)";
                break;
            case 3:
                $table->query .= "AND (A.overdate = 1 AND issuing != 0)";
                break;
        }
    }
    $load = new Load($table);
}
?>
