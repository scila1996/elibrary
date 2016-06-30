$(document).on('click', '.print-issue', function(){
	show_Loading();
	var isid = $(this).val();
	$.ajax({
		type: "POST",
		url: "/module/form/print.issue.php",
		async: false,
		data: {print: true, isid: isid},
		dataType: "html"
	}).done(function(result){
		hide_Loading();
		$(document).find('body').append(result);
		var t = document.title;
		document.title = (new Date()).getTime();
		window.print();
		$(document).find('#print-order-issue-books').remove();
		document.title = t;
	});
});