function Init()
{
	$('[title]').tooltip();
	$('.alert-hide').hide();
	$(document).find('.on-top').hide();
	$(document).find('.on-top').removeClass('hide');
	$('.alert a').click(function(){
		$(this).parent().hide();
	});
	$('button, a').mouseup(function(){
		$(this).blur();
	});
	$(document).on('scroll', function(){
		var top = $(this).scrollTop();
		if (top >= $(window).height())
		{
			$(document).find('.on-top').show();
		}
		else
		{
			$(document).find('.on-top').hide();
		}
	});
	$(document).on('click', '.on-top', function(){
		$(document).find('body').animate({scrollTop: '0'});
	});
}

function create_Comment(text, color)
{
	switch (color)
	{
		case 'success':
			color = '#5cb85c';
			break;
		case 'warning':
			color = '#f0ad4e';
			break;
		case 'danger':
			color = '#d9534f';
			break;
	}
	var err = $(document.createElement('div'));
	err.append('<strong> ' + text + '</strong> ').css({
		'color': color,
		'padding': '5px'
	});
	return err;
}

function show_Loading()
{
	$(document).find('#show-loading-gif').modal('show');
}

function hide_Loading()
{
	$(document).find('#show-loading-gif').modal('hide');
}

$(document).ready(function(){
	Init();
});
