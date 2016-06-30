$(document).ready(function(){
	$('[name="oldpass"]').focus();
	$('form').submit(function(){
		var oldpass = $('[name="oldpass"]').val();
		var pass = $('[name="pass"]').val();
		var repass = $('[name="repass"]').val();
		var err_str = new Array();
		$.ajax({
			type: "POST",
			url: "/module/action.php",
			async: false,
			data : {action: "check-pwd", type: "admin", oldpass: oldpass},
			dataType: "json",
			success: function(result){
				if (result == false) err_str.push('<strong> Mật khẩu hiện tại không chính xác </strong>');
			}
		});
		if (pass.length < 8) err_str.push("Mật khẩu phải có ít nhất 8 ký tự");
		if (!(/\S\d|\d\S/).test(pass)) err_str.push("Phải bao gồm cả ký tự thường và ký tự số");
		if (pass != repass) err_str.push("Mật khẩu không khớp");
		if (!err_str.length)
		{
			return confirm("Bấm OK để thay đổi mật khẩu");
		}
		else
		{
			$(this).find('#error-chpwd').show();
			$(this).find('#error-chpwd span').html(err_str.join('<br />'));
			return false;
		}
	});
});