$(document).ready(function(){
	var time_update = $(document).find('[time-active]');
	var log = new Date(time_update.attr('time-active'));
	var cur = new Date(time_update.attr('time-current'));
	time_update.removeAttr('time-active');
	time_update.removeAttr('time-current');
	setInterval(function(){
		var diff = new Date(cur - log);
		diff = _Convert(diff.getTime());
		time_update.text(diff.h + " giờ " + diff.i + " phút " + diff.s + " giây");
		cur.setSeconds(cur.getSeconds() + 1);
	}, 1000);
	function _Convert(minisec)
	{
		minisec /= 1000;
		var time = new Object();
		time.h = Math.floor(minisec / 3600);
		minisec -= (time.h * 3600);
		time.i = Math.floor(minisec / 60);
		minisec -= (time.i * 60);
		time.s = minisec;
		return time;
	}
});
