function Init()
{
	$(document).on('mouseenter', '[title]', function(){
		$(this).tooltip('show');
	});
	$(document).find('.alert-hide').hide();
	$(document).find('.scroll-to').hide();
	$(document).find('.scroll-to').removeClass('hide');
	$(document).on('click', '.alert a', function(){
		$(this).parent().hide();
	});
	$(document).on('click mouseleave', 'button, a', function(){
		$(this).blur();
	});
	$(window).scroll(function(){
		var jump_to = $(document).find('.scroll-to');
		if ($(this).scrollTop() >= $(this).height())
		{
			jump_to.fadeIn(100);
		}
		else
		{
			jump_to.fadeOut(0);
		}
	});
	$(document).find('.scroll-to button').on('click', function(){
		var v = $(this).val();
		switch (v)
		{
			case 'top':
				v = 0;
				break;
			case 'bottom':
				v = $(document).height();
				break;
		}
		$(window).scrollTop(v);
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
	$(document).find('#show-loading-gif').modal({backdrop: "static"});
}

function hide_Loading()
{
	$(document).find('#show-loading-gif').modal('hide');
}

function show_UpdateSuccess(item, time)
{
	if (time === undefined)
	{
		time = 10000;
	}
	item.addClass('success');
	var update_icon = $(document).find('.update-success').clone();
	item.find('td:eq(0)').append(update_icon);
	$('body').animate({
		scrollTop: item.offset().top
	});
	setTimeout(function(){
		update_icon.remove();
		item.removeClass('success');
	}, time);
}

$(document).ready(function(){
	Init();
});

