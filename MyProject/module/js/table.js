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
			scrollTop: $(out).offset().top
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
	$(document).off('keydown');
	$(document).on('keydown', function(e){
		var step = 0;
		switch (e.which)
		{
			case 37:
				step = -1;
				break;
			case 39:
				step = 1;
				break;
		}
		if (step)
		{
			var select = $(document).find(out + ' ' + '.pagination .active');
			if (step == -1)
			{
				select = select.prev();
			}
			else
			{
				select = select.next();
			}
			if (select.length)
			{
				select.find('a.page').trigger('click');
			}
		}
	});
	this.reLoad = function(){
		Load();
	};
	Load();
}
