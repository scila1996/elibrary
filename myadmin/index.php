<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

if (!isset($_SESSION["admin"])) {
    Misc::ss_destroy();
    header("Location:/login");
    die("");
}

$login_active = TRUE;
?>
<!DOCTYPE HTML>
<html>
    <head>
        <title> <?php echo $_SESSION["admin"]->get_User() ?> </title>
        <?php include $_SERVER["DOCUMENT_ROOT"] . "/module/include.php" ?>
    </head>
    <body>
        <?php
        include $_SERVER["DOCUMENT_ROOT"] . "/module/template/header.php";
        ?>
        <h4 class="well text-left text-info">
            <p><strong> Thông tin quản trị viên </strong></p>
            <hr />
            <p><strong> Tài khoản </strong> : "<?php echo $_SESSION["admin"]->get_User() ?>"</p>
            <p><strong> Quản trị viên </strong> : "<?php echo $_SESSION["admin"]->get_Name() ?>"</p>
            <?php
            $d = new DateTime($_SESSION["admin"]->get_LastTime());
            ?>
            <p><strong> Lần đăng nhập cuối </strong> : "<?php echo $d->format("l / d-m-Y / H:i:s") ?>" </p>
        </h4>
        <?php include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php" ?>
    </body>
    <script src="index.js"></script>
</html>
