function Init()
{
	$(document).on('mouseenter', '[title]', function(){
		$(this).tooltip('show');
	});
	$(document).find('.alert-hide').hide();
	$(document).find('.on-top').hide();
	$(document).find('.on-top').removeClass('hide');
	$(document).on('click', '.alert a', function(){
		$(this).parent().hide();
	});
	$(document).on('click mouseleave', 'button, a', function(){
		$(this).blur();
	});
	$(window).scroll(function(){
		if ($(this).scrollTop() >= $(this).height())
		{
			$(document).find('.on-top').show();
		}
		else
		{
			$(document).find('.on-top').hide();
		}
	});
	$(document).on('click', '.on-top', function(){
		$(window).scrollTop(0);
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
		time = 5000;
	}
	var update_icon = $(document).find('.update-success').clone();
	item.append(update_icon);
	setTimeout(function(){
		update_icon.remove();
	}, time);
}

$(document).ready(function(){
	Init();
});

