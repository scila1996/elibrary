$(document).ready(function(){
	var table = 0;
	var patt = {
		category: "",
		title: "",
		code: "",
		author: "",
		pubhouse: "",
		pubyear: ""
	};
	$('#search-with-keyword input').focus();
	$.ajax({
		url: "/module/form/categories.option.php",
		async: false,
		dataType: "html"
	}).done(function(result){
		$(document).find('[name="categoryid"]').empty();
		$(document).find('[name="categoryid"]').html(result);
	});
	// Show search form
	$(document).on('shown.bs.collapse', '#search-adv', function(e){
		$('#table-book').hide();
	});
	$(document).on('hidden.bs.collapse', '#search-adv', function(e){
		$('#table-book').show();
	});
	// Search with pattern
	$(document).on('submit', '#search-adv', function(){
		patt.category = $(this).find('[name="category"]').val();
		patt.title = $(this).find('[name="title"]').val();
		patt.code = $(this).find('[name="code"]').val();
		patt.author = $(this).find('[name="author"]').val();
		patt.pubhouse = $(this).find('[name="pubhouse"]').val();
		patt.pubyear = $(this).find('[name="pubyear"]').val();
		$(this).collapse('hide');
		load_Table();
		return false;
	});
	// Book Detail
	$(document).on('click', '#table-book .book-detail', function(){
		var bookinfo = $(document).find('#book-info');
		var bookid = $(this).val();
		var book;
		$.ajax({
			type: "POST",
			url: "/module/action.php",
			async: false,
			data: {action: "get-book-info", id: bookid},
			dataType: "json"
		}).done(function(result){
			book = result;
		});
		bookinfo.find('[name="categoryid"]').prop('disabled', true).find('option[value="' + book.categoryid + '"]').prop('selected', true);
		for (var key in book)
		{
			bookinfo.find('[name="' + key + '"]').val(book[key]).prop('readonly', true);
		}
		bookinfo.modal('show');
	});
	function load_Categories()
	{
		var select_tag = $('#search-adv select');
		$.ajax({
			url: "/module/form/categories.option.php",
			async: false,
			dataType: "html"
		}).done(function(result){
			select_tag.empty();
			select_tag.append(result);
		});
	}
	function load_Table()
	{
		table = new Table("/lookup/table-book.php", patt, "#table-book");
	}
	load_Categories();
	//load_Table();
	$(document).on('change', '#select-category select', function(){
		category = $(this).val();
		load_Table();
	});
});
