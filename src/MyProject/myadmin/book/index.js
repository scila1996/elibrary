$(document).ready(function(){
	var table = 0;
	var keyword = "";
	var categoryid = "";
	load_Categories();
	function create_Table()
	{
		var url = '/myadmin/book/book.php';
		var data = {
			keyword: keyword,
			category: categoryid
		};
		table = new Table(url, data, '#table-show');
	}
	function load_Categories()
	{
		$.ajax({
			url: "/module/form/categories.option.php",
			async: false,
			dataType: "html"
		}).done(function(result){
			$('#select-category').empty();
			$('#select-category').html(result);
			$(document).find('[name="categoryid"]').empty();
			$(document).find('[name="categoryid"]').html(result);
			$(document).find('[name="categoryid"]').find('[value=""]').remove();
		});
		create_Table();
	}
	// Select Categories
	$(document).on('change', '#select-category', function(){		
		categoryid = $(this).val();
		create_Table();
		if (categoryid == "")
		{
			$('#remove-category').attr('disabled', true);
		}
		else
		{
			$('#remove-category').attr('disabled', false);
		}
		return false;
	});
	// Search with Keyword
	$(document).on('submit', '#keyword', function(){
		keyword = $(this).find('input').val();
		create_Table();
		return false;
	});
	// Add book
	$(document).on('hidden.bs.modal', '#add-book', function(){
		$('[data-target="#add-book"]').blur();
	});
	$(document).on('submit', '#add-book', function(){
		var book = new Object();
		$(this).find('[name]').each(function(){
			eval('book.' + $(this).prop('name') + ' = "' + $(this).val() + '"');
		});
		var err = false;
		for (var field in book)
		{
			if (!/\S/.test(book[field]))
			{
				err = true;
				break;
			}
		}
		if (err == true)
		{
			alert("Các trường không được để trống");
		}
		else
		{
			var f = this;
			$.ajax({
				type: "POST",
				url: "/module/action.php",
				async: false,
				data: {action: "add-book", book: book},
				dataType: "json"
			}).done(function(result){
				if (!result.error)
				{
					f.reset();
					$(f).modal('hide');
					var keyw = $('#keyword');
					keyw.find('input').val(book.code);
					keyw.submit();
					alert("Thêm sách mới thành công : " + book.title);
					show_UpdateSuccess($(document).find('#table-show tr:has([value="' + result.res + '"])'));
				}
				else
				{
					alert("Mã sách bị trùng, hãy kiểm tra lại \n" + result.res);
				}
			});
		}
		return false;
	});
	// Delete Book
	$(document).on('click', '#table-show .delete-book', function(){
		var row = $(this).parents('tr').find('td');
		var title = row.eq(2).text();
		var id = row.eq(0).find('[type="checkbox"]').val();
		if (confirm("Bạn có muốn xóa sách \"" + title + "\""))
		{
			$.ajax({
				type: "POST",
				url: "/module/action.php",
				async: false,
				data: {action: "delete-books", books: [id]},
				success: function()
				{
					table.reLoad();
				}
			});
		}
	});
	// Edit Book - Update
	var bookid;
	$(document).on('click', '#table-show .edit-book', function(){
		var row = $(this).parents('tr').find('td');
		var book_modal = $('#edit-book');
		bookid = row.eq(0).find('[type="checkbox"]').val();
		book_modal.modal('show');
		$.ajax({
			type: "POST",
			url: "/module/action.php",
			async: false,
			data: {action: "get-book-info", id: bookid},
			dataType: "json"
		}).done(function(result){
			book_modal.find('select option[value="' + result.categoryid + '"]').attr('selected', true);
			for (var field in result)
			{
				book_modal.find('[name="' + field + '"]').val(result[field]);
			}
		});
	});
	// Form Edit Book
	$(document).on('submit', '#edit-book', function(){
		var book = new Object();
		var f = $(this);
		book.id = bookid;
		$(this).find('[name]').each(function(){
			eval('book.' + $(this).attr('name') + ' = "' + $(this).val() + '";');
		});
		$.ajax({
			type: "POST",
			url: "/module/action.php",
			async: false,
			data: {action: "update-book", book: book}
		}).done(function(result){
			if (result)
			{
				f.modal('hide');
				table.reLoad();
				show_UpdateSuccess($(document).find('#table-show tr:has([value="' + book.id + '"])'));
			}
			else
			{
				alert("Mã sách bị trùng, hãy kiểm tra lại");
			}
		});
		return false;
	});
	// Select Book
	$(document).on('click', '#table-show .select-all', function(){
		if (this.checked == true)
		{
			$('#table-show .checkbox-book').prop('checked', true);
		}
		else
		{
			$('#table-show .checkbox-book').prop('checked', false);
		}
	});
	$(document).on('click', '#table-show .checkbox-book', function(){
		var all = $(document).find('#table-show .checkbox-book').length;
		var sel = $(document).find('#table-show .checkbox-book:checked').length;
		if (sel == all)
		{
			$(document).find('#table-show .select-all').prop('checked', true);
		}
		else
		{
			$(document).find('#table-show .select-all').prop('checked', false);
		}
	});
	$(document).on('click', '#table-show .select-book', function(){
		var sel = $(this).parents('tr').find('td [type="checkbox"]');
		if (!sel.prop('checked')) sel.trigger('click');
	});
	// Delete Multiple Books
	$(document).on('click', '[value="delete-books"]', function(){
		var sel = new Array();
		$(document).find('#table-show .checkbox-book:checked').each(function(){
			sel.push($(this).val());
		});
		if (sel.length)
		{
			if (confirm("Bạn có chắc chắn muốn xóa " + sel.length + " cuốn sách"))
			{
				$.ajax({
					type: "POST",
					url: "/module/action.php",
					async: false,
					data: {action: 'delete-books', books: sel},
					success: function(){
						table.reLoad();
						alert("Đã xóa thành công");	
					}
				});
			}
		}
		else
		{
			alert("Bạn chưa chọn sách nào !");
		}
	});
});
