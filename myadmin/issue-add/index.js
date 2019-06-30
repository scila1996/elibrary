$(document).ready(function () {
    $('#check-user-for-issue input[type="text"]').focus();
    var category = "";
    var keyword = "";
    var table = 0;
    var table_books = 0;
    var books = new Array();
    var user = 0;
    var limit_book;
    function load_Categories()
    {
        $.ajax({
            url: "/module/form/categories.option.php",
            async: false,
            dataType: "html"
        }).done(function (result) {
            $('#search-books select').empty();
            $('#search-books select').html(result);
        });
        load_Table();
    }
    function load_Table()
    {
        var url = "/myadmin/issue-add/table-book.php";
        var data = {
            keyword: keyword,
            category: category
        };
        table = new Table(url, data, "#table-book", function () {
            scan_Select();
        });
    }
    $(document).on('change', '#search-books .select-category', function () {
        category = $(this).val();
        load_Table();
        remove_Selected();
    });
    $(document).on('submit', '#search-books', function () {
        category = $(this).find('select').val();
        keyword = $(this).find('[type="text"]').val();
        load_Table();
        remove_Selected();
        return false;
    });
    // Check User
    $(document).on('submit', '#check-user-for-issue', function () {
        var f = $(this);
        user = $(this).find('[type="text"]').val();
        $.ajax({
            type: "POST",
            url: "/module/action.php",
            data: {action: "check-info-for-issue", user: user},
            async: false,
            dataType: "json"
        }).done(function (result) {
            f.next().html('');
            if (typeof (result) === "object")
            {
                $('#issue-book-for-user [name="issue-date"]').val(result.date_issue);
                $('#issue-book-for-user [name="submit-date"]').val(result.date_submit);
                if (result.avai == 0)
                {
                    $('#issue-book-for-user').hide();
                    f.next().html(create_Comment("Độc giả này đã mượn tối đa " + result.total + " quyển sách", 'warning'));
                } else
                {
                    $('#issue-book-for-user').show();
                    load_Categories();
                    limit_book = result.avai;
                    f.next().html(create_Comment('Số sách có thể mượn : ' + result.avai + ' quyển sách', 'success'));
                }
            } else
            {
                $('#issue-book-for-user').hide();
                f.next().html(create_Comment("Độc giả không tồn tại, hãy nhập lại !", 'danger'));
            }
        });
        remove_Selected();
        return false;
    });
    $('#issue-book-for-user').hide();
    // Auto Select - Unselect
    function scan_Select()
    {
        $(document).find('#table-book .select-book').each(function () {
            for (var i = 0; i < books.length; i++)
            {
                if ($(this).val() == books[i])
                {
                    $(this).prop('checked', true);
                    return;
                }
            }
            $(this).prop('checked', false);
        });
    }
    function remove_Selected()
    {
        books = new Array();
        scan_Select();
    }
    // Select Book
    $(document).on('click', '#table-book .select-book', function (e) {
        if ($(this).prop('checked'))
        {
            if (books.length == limit_book)
            {
                alert('Đã chọn hết số lượng sách giới hạn');
                e.preventDefault();
            } else
            {
                books.push($(this).val());
            }
        } else
        {
            books.splice(books.indexOf($(this).val()), 1);
        }
    });
    // Remove All Selected
    $(document).on('click', '#table-book .remove-selected', function () {
        remove_Selected();
    });
    // Show Issue Form
    $(document).on('submit', '#issue-book', function () {
        $(this).next().html('');
        if (!books.length)
        {
            $(this).next().html(create_Comment("Chưa chọn cuốn sách nào ?", 'warning'));
        } else
        {
            table_books = new Table('/myadmin/issue-add/form-issue.php', books, '#form-issue-book .modal-body');
            $('#form-issue-book').modal('show');
        }
        return false;
    });
    // Process
    $(document).on('submit', '#issue-book-process', function () {
        $(this).prev().html(create_Comment('Đang xử lý dữ liệu ...', 'success'));
        var d = $('[name="submit-date"]').val();
        $.ajax({
            type: "POST",
            url: "/module/action.php",
            async: false,
            data: {action: "issue-books", books: books, user: user, date: d},
            dataType: "json"
        }).done(function (result) {
            $('#check-user-for-issue').submit();
            $('#form-issue-book').modal('hide');
            $('#issue-success').show();
            $('#issue-success').find('span').html(create_Comment(' Đã xử lý thành công <br /> Mã mượn sách : ' + result.code + '<br />', 'success'));
            $('#issue-success').find('span').append('<button type="button" class="btn btn-primary print-issue" value="' + result.id + '"><span class="glyphicon glyphicon-print"></span> <strong> Print </strong></button>');
        });
        remove_Selected();
        $(document).scrollTop(0);
        $(this).prev().html('');
        return false;
    });
    // Select Expand
    $(document).on('click', '#table-book tr', function (e) {
        $(this).find('.select-book').trigger('click');
    });
});
