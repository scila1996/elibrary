<?php
include $_SERVER["DOCUMENT_ROOT"] . "/module/class/import.php";

$lookup_active = TRUE;
?>

<!DOCTYPE HTML>
<html>
    <head>
        <title> eLibrary - Bootstrap </title>
        <?php include $_SERVER["DOCUMENT_ROOT"] . "/module/include.php" ?>
    </head>
    <body>
        <?php
        include $_SERVER["DOCUMENT_ROOT"] . "/module/template/header.php";
        ?>
        <style>
            #search-adv select, #search-adv input
            {
                min-width: 250px;
            }
        </style>
        <div class="text-left">
            <div class="form-group">
                <button type="button" class="btn btn-link" data-toggle="collapse" data-target="#search-adv" title="Click to show"><span class="glyphicon glyphicon-search"></span><strong> Tra cứu nâng cao </strong><span class="caret"></span></button>
            </div>
            <form id="search-adv" class="collapse">
                <div class="well well-lg" style="display: inline-block">
                    <div class="form-inline form-group">
                        <div class="input-group">
                            <div class="input-group-addon"> <div class="text-120"> Thể loại </div> </div>
                            <select class="form-control" name="category">
                            </select>
                        </div>
                    </div>
                    <div class="form-inline form-group">
                        <div class="input-group">
                            <div class="input-group-addon"> <div class="text-120"> Tiêu đề </div> </div>
                            <input type="text" class="form-control add-book-info" placeholder="..." name="title" value=""/>
                        </div>
                    </div>
                    <div class="form-inline form-group">
                        <div class="input-group">
                            <div class="input-group-addon"> <div class="text-120"> Mã sách </div> </div>
                            <input type="text" class="form-control add-book-info" placeholder="..." name="code" value=""/>
                        </div>
                    </div>
                    <div class="form-inline form-group">
                        <div class="input-group">
                            <div class="input-group-addon"> <div class="text-120"> Tác giả </div> </div>
                            <input type="text" class="form-control add-book-info" placeholder="..." name="author" value=""/>
                        </div>
                    </div>
                    <div class="form-inline form-group">
                        <div class="input-group">
                            <div class="input-group-addon"> <div class="text-120"> Nhà xuất bản </div> </div>
                            <input type="text" class="form-control add-book-info" placeholder="..." name="pubhouse" value=""/>
                        </div>
                    </div>
                    <div class="form-inline form-group">
                        <div class="input-group">
                            <div class="input-group-addon"> <div class="text-120"> Năm xuất bản </div> </div>
                            <input type="text" class="form-control add-book-info" placeholder="..."  name="pubyear" value=""/>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span><strong> Tìm </strong></button>
                </div>
            </form>
            <div id="table-book" class="text-left">
            </div>
            <div class="modal fade" id="book-info">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title"> Thông tin sách </h3>
                        </div>
                        <div class="modal-body">
                            <div class="book-record-info">
                                <?php
                                include $_SERVER["DOCUMENT_ROOT"] . "/module/form/book.info.php";
                                ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <?php
        include $_SERVER["DOCUMENT_ROOT"] . "/module/template/footer.php";
        ?>
    </body>
    <script src="/module/js/table.js"></script>
    <script src="index.js"></script>
</html>
