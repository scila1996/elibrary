$(document).ready(function(){
	var catname = "";
	var table = 0;
	
	function load_Table()
	{
		table = new Table('/myadmin/category/table-category.php', null, '#table-category');
	}
	load_Table();
	function find_Td(id)
	{
		return $('#table-category').find('tr:has([value="' + id + '"]) td:eq(0)');
	}
	$(document).on('click', '.edit-category', function(){
		var f_edit = $('.modal:has(#edit-category)');
		f_edit.modal('show');
		f_edit.find('button[type="submit"]').val($(this).val());
		row_selected = $(this).parents('tr');
	});
	$(document).on('shown.bs.modal', '.modal:has(#edit-category)', function(){
		$(this).find('input').focus();
		$(this).find('form').get(0).reset();
	});
	$(document).on('shown.bs.collapse', '#add-category', function(){
		this.reset();
		$(this).find('input').focus();
	});
	// Edit - Category
	$(document).on('submit', '#edit-category', function(){
		var id = $(this).find('button[type="submit"]').val();
		var name = $(this).find('input[type="text"]').val();
		var err = $(this).next();
		err.empty();
		if (!/\S/.test(name))
		{
			err.html(create_Comment('Lỗi ! Tên không được để trống', 'warning'));
			$(this).find('input').focus();
		}
		else
		{
			$.ajax({
				type: "POST",
				url: "/module/action.php",
				async: false,
				data: {action: "modify-category" , id: id, name: name},
			}).done(function(){
				table.reLoad();
			});
			$(this).parents('.modal').modal('hide');
			show_UpdateSuccess(find_Td(id));
		}
		return false;
	});
	// Remove - Category
	$(document).on('click', '.delete-category', function(){
		if (confirm("Bạn có chắc chắn muốn xóa danh mục này ?"))
		{
			var id = $(this).val();
			$.ajax({
				type: "POST",
				url: "/module/action.php",
				async: false,
				data: {action: "remove-category", id: id}
			}).done(function(){
				table.reLoad();
			});
		}
	});
	
	// Add Category
	$(document).on('submit', '#add-category', function(){
		var categoryname = $(this).find('input[type="text"]');
		$(this).next().html('');
		if (!/\S/.test(categoryname.val()))
		{
			$(this).next().html(create_Comment('Tên danh mục không được để trống', 'warning'));
			categoryname.focus();
		}
		else
		{
			$.ajax({
				type: "POST",
				url: "/module/action.php",
				async: false,
				data: {action: "add-category", categoryname: categoryname.val()},
				dataType: "json"
			}).done(function(result){
				load_Table();
				show_UpdateSuccess(find_Td(result));
			});
			this.reset();
			$(this).collapse('hide');
		}
		return false;
	});
});
