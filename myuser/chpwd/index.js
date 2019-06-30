$(document).ready(function () {
    $('[name="pass"]').focus();
    $('form').submit(function () {
        var pass = $('[name="pass"]').val();
        var repass = $('[name="repass"]').val();
        var err = new Array();
        if (!/\S/.test(pass))
        {
            err.push("Mật khẩu không được để trống");
        }
        if (pass.length < 6)
        {
            err.push("Phải có ít nhất 6 ký tự");
        }
        if (pass != repass)
        {
            err.push("Mật khẩu nhập lại không khớp");
        }
        if (err.length)
        {
            $('.error-chpwd').show();
            $('.error-chpwd span').html(err.join('<br />'));
            return false;
        } else
        {
            alert("Bấm OK để thay đổi mật khẩu và đăng nhập lại");
        }
    });
});
