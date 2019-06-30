$(document).ready(function () {
    var table = 0;
    var category = "";
    var keyword = "";
    $('#search-with-keyword input').focus();
    $.ajax({
        url: "/module/form/categories.option.php",
        async: false,
        dataType: "html"
    }).done(function (result) {
        $(document).find('[name="categoryid"]').empty();
        $(document).find('[name="categoryid"]').html(result);
    });
    $(document).on('submit', '#search-with-keyword', function () {
        keyword = $(this).find('input').val();
        load_Table();
        return false;
    });
    $(document).on('click', '#table-book .book-detail', function () {
        var bookinfo = $(document).find('#book-info');
        var bookid = $(this).val();
        var book;
        $.ajax({
            type: "POST",
            url: "/module/action.php",
            async: false,
            data: {action: "get-book-info", id: bookid},
            dataType: "json"
        }).done(function (result) {
            book = result;
        });
        bookinfo.find('[name="categoryid"]').prop('disabled', true).find('option[value="' + book.categoryid + '"]').prop('selected', true);
        for (var key in book)
        {
            bookinfo.find('[name="' + key + '"]').val(book[key]).prop('readonly', true);
        }
        bookinfo.modal('show');
    });
    function load_Categories()
    {
        var select_tag = $('#select-category select');
        $.ajax({
            url: "/module/form/categories.option.php",
            async: false,
            dataType: "html"
        }).done(function (result) {
            select_tag.empty();
            select_tag.append(result);
        });
    }
    function load_Table()
    {
        var data = {
            keyword: keyword,
            category: category
        };
        table = new Table("/home/table-book.php", data, "#table-book");
    }
    load_Categories();
    load_Table();
    $(document).on('change', '#select-category select', function () {
        category = $(this).val();
        load_Table();
    });
});
