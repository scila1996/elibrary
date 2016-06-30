<?php

include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (isset($_POST["print"]))
{
	$isid = $_POST["isid"];
	$connect = Sql::open_MySQL();
	$result = $connect->query("
		SELECT
			issues.*,
			CRC32(issues.id) AS 'code',
			users.name,
			COUNT(issuedetails.id) AS 'quantity'
		FROM issues
		LEFT JOIN issuedetails ON issuedetails.issueid = issues.id
		LEFT JOIN users ON users.user = issues.user
		WHERE issues.id = '$isid'
		GROUP BY issues.id
		HAVING 1
	");
	$result = $result->fetch_array();
	?>
	<div id="print-order-issue-books" style="display: none; padding: 25px">
		<h2>
			Thư viện điện tử : eLibrary - BK
		</h2>
		<div>
			<p> Tên bạn đọc : <?php echo $result["name"] ?> </p>
			<p> Mã bạn đọc : <?php echo $result["user"] ?> </p>
			<hr />
			<p> Mã mượn sách : <?php echo $result["code"] ?> </p>
			<p> Ngày mượn : <?php echo $result["dateissue"] ?> </p>
			<p> Ngày phải trả : <?php echo $result["datesubmit"] ?> </p>
			<p> Số sách : <?php echo $result["quantity"] ?> </p>
			<hr />
			<ol>
				<?php
				$result = $connect->query("
					SELECT books.* FROM books
					JOIN issuedetails ON issuedetails.bookid = books.id
					JOIN issues ON issuedetails.issueid = issues.id
					WHERE issues.id = '$isid'
				");
				$total_price = 0;
				while ($book = $result->fetch_array())
				{
					?>
					<li> <?php printf("%s - ISBN : %s - Giá : %s vnd", $book["title"], $book["code"], $book["price"]) ?> </li>
					<?php
					$total_price += $book["price"];
				}
				?>
			</ol>
			<hr />
			<p> Tổng tiền mượn : <?php echo $total_price ?> vnd </p>
			<hr />
			<p style="font-style: italic">
				Thư viện điện tử eLibrary - Thủ thư : <?php echo $_SESSION["admin"]->get_Name() ?> .
			</p>
		</div>
	</div>
	<?php
	$connect->close();
}

?>