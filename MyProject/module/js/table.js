function Table(url, data_post, output, func)
{
	var u = url;
	var out = output;
	var data = new Object({
		table: {
			page: 1,
			pagesize: 20
		},
		data: data_post
	});
	var Load = function(){
		show_Loading();
		$.ajax({
			type: "POST",
			url: u,
			data: data,
			dataType: "html",
			async: false
		}).done(function(result){
			$(out).empty();
			$(out).html(result);
			hide_Loading();
		});
		if (func !== undefined && func) func(arguments);
	};
	var scroll_onTable = function(){
		$('body').animate({
			scrollTop: $(output).offset().top
		});
	};
	$(document).off('click', output + ' .page');
	$(document).on('click', output + ' .page', function(e){
		e.preventDefault();
		var page = parseInt($(this).attr('href').match(/\d+\s{0,}$/));
		data.table.page = page;
		Load();
		scroll_onTable();
	});
	$(document).on('change', output + ' .set-pagesize', function(){
		var size = $(this).val();
		data.table.pagesize = size;
		Load();
		scroll_onTable();
	});
	this.reLoad = function(){
		Load();
	};
	Load();
}
