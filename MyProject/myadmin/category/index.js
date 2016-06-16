$(document).ready(function(){
	var id = "";
	var catname = "";
	function load_Categories()
	{
		$.ajax({
			url: "/module/form/categories.option.php",
			async: false,
			dataType: "html"
		}).done(function(result){
			var select_cat = $('[name="select-category"]');
			select_cat.empty();
			select_cat.append(result);
			select_cat.find('option').eq(0).remove();
			if (id)
			{
				select_cat.val(id);
			}
			select_cat.change();
		});
	}
	function show_Success(text)
	{
		$('#success-message').show();
		$('#success-message').find('span').html('<strong>' + text + '</strong>');
	}
	
	$(document).on('hide.bs.collapse', '#form-edit-category', function(){
		$(this).next().empty();
	});
	
	// Select Category Name
	$(document).on('change', '#list-category [name="select-category"]', function(){
		id = $(this).val();
		catname = $(this).find('option:selected').text();
		$('#form-edit-category [name="category-name"]').val(catname);
		$('.collapse').collapse('hide');
		if (!id)
		{
			$('[data-toggle="collapse"]').prop('disabled', true);
		}
		else
		{
			$('[data-toggle="collapse"]').prop('disabled', false);
		}
	});
	// Edit Category Name
	$(document).on('submit', '#form-edit-category', function(){
		var name = $(this).find('[name="category-name"]').val();
		$(this).next().empty();
		if (!/\S/.test(name))
		{
			$(this).next().html(create_Comment('Tên không được để trống', 'warning'));
		}
		else
		{
			$.ajax({
				type: "POST",
				url: "/module/action.php",
				async: false,
				data: {action: "modify-category", id: id, name: name}
			}).done(function(){
				show_Success("Cập nhật thông tin danh mục thành công.");
				load_Categories();
			});
		}
		return false;
	});
	// Remove Category
	$(document).on('click', '#list-category [name="remove-category"]', function(e){
		e.preventDefault();
		if (id && confirm("Bạn có chắc chắn muốn xóa danh mục \"" + catname + "\" ?"))
		{
			$.ajax({
				type: "POST",
				url : "/module/action.php",
				async: false,
				data: {action: "remove-category", categoryid: id}
			}).done(function(){
				show_Success("Đã xóa danh mục \"" + catname + "\"");
				id = "";
				load_Categories();
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
				show_Success("Thêm danh mục \"" + categoryname.val() + "\" thành công.");
				id = result;
				load_Categories();
			});
		}
		categoryname.val('');
		return false;
	});
	load_Categories();
});
