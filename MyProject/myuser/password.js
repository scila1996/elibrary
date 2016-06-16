$(document).ready(function(){
	$('[name="oldpass"]').focus();
	$('form').submit(function(){
		var oldpass = $('[name="oldpass"]').val();
		var pass = $('[name="pass"]').val();
		var repass = $('[name="repass"]').val();
		var err = new Array();
		$.ajax({
			type: "POST",
			async: false,
			url : "/module/action.php",
			data: {action: "user-password", oldpass: oldpass},
			dataType: "json"
		}).done(function(result){
			if (!result)
			{
				err.push("<strong> Mật khẩu hiện tại không đúng </strong>");
			}
		});
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
		}
		else
		{
			alert("Bấm OK để thay đổi mật khẩu và đăng nhập lại");
		}
	});
});
