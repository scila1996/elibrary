$(document).ready(function () {
    var table = 0;
    var keyword = "";
    function create_Table()
    {
        var data = {
            keyword: keyword
        };
        table = new Table("/myadmin/users/table-users.php", data, "#table-users");
    }
    create_Table();
    $(document).find('#search-user input[type="text"]').focus();
    $(document).on('shown.bs.collapse', '#add-user', function () {
        $(this).find('input:eq(0)').focus();
    });
    $(document).on('hidden.bs.collapse', '#add-user', function () {
        $(document).find('#search-user input[type="text"]').focus();
    });
    // Find User
    $(document).on('submit', '#search-user', function () {
        keyword = $(this).find('input').val();
        create_Table();
        return false;
    });
    // Remove User
    $(document).on('click', '#table-users .remove-user', function () {
        var user = $(this).parents('tr').find('button').val();
        if (confirm("Bạn có muốn xóa người dùng \"" + user + "\""))
        {
            $.ajax({
                type: "POST",
                url: "/module/action.php",
                async: false,
                data: {action: "delete-user", user: user},
                success: function () {
                    table.reLoad();
                }
            });
        }
    });
    // Reset Password
    $(document).on('click', '#table-users .reset-pwd', function () {
        var user = $(this).parents('tr').find('button').val();
        var f_edit = $('.modal:has(#edit-user-pwd)');
        f_edit.modal('show');
        f_edit.find('button[type="submit"]').val(user);
    });

    $(document).on('submit', 'form#edit-user-pwd', function () {
        var user = $(this).find('button[name="user"]').val();
        var pass = $(this).find('input[name="pass"]').val();
        $.ajax({
            type: "POST",
            url: "/module/action.php",
            async: false,
            data: {action: "user-chpwd", user: user, pass: pass}
        }).done(function () {
            $('.modal:has(#edit-user-pwd)').modal('hide');
            alert("Reset mật khẩu hoàn tất");
        });
        return false;
    });

    // Add new user
    $(document).on('submit', '#add-user', function () {
        var _this = $(this);
        var user_info = {
            user: $(this).find('[name="user"]').val(),
            name: $(this).find('[name="name"]').val()
        };
        var err = new Array();
        $.ajax({
            type: "POST",
            url: "/module/action.php",
            async: false,
            data: {action: "check-user", user: user_info.user}
        }).done(function (result) {
            if (parseInt(result))
            {
                err.push("Tài khoản đã tồn tại");
            }
        });
        if (!/\S/.test(user_info.user))
            err.push("Tên TK không được để trống");
        if (!/\S/.test(user_info.name))
            err.push("Tên sai quy tắc (không để trống và không có số)");
        if (err.length)
        {
            $('#new-user-error').show();
            $('#new-user-error span').html(err.join('<br />'));
        } else
        {
            $.ajax({
                type: "POST",
                url: "/module/action.php",
                async: false,
                data: {action: "add-new-user", user: user_info}
            }).done(function () {
                _this.collapse('hide');
                table.reLoad();
                show_UpdateSuccess($(document).find('#table-users tr:has([value="' + user_info.user + '"])'));
            });
            this.reset();
        }
        return false;
    });
});
