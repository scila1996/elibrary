<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";
?>

<!DOCTYPE HTML>
<html>
	<head>
		<?php include $_SERVER["DOCUMENT_ROOT"] . "/module/include.php" ?>
	</head>
	<body>
		<p> aa </p>
		<p> bb </p>
	</body>
	<script>
		$(document).ready(function(){
			$('p:eq(0)').css({
				'color': 'red'
			});
		});
	</script>
</html>
