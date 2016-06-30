<div class="input-group form-group">
	<div class="input-group-addon"> <div class="text-120"> Thể loại </div> </div>
	<select class="form-control" name="categoryid">
	</select>
</div>
<div class="input-group form-group">
	<div class="input-group-addon"> <div class="text-120"> Tiêu đề </div> </div>
	<input type="text" class="form-control add-book-info" placeholder="Tiêu đề sách" name="title" value=""/>
</div>
<div class="input-group form-group">
	<div class="input-group-addon"> <div class="text-120"> Mã sách </div> </div>
	<input type="text" class="form-control add-book-info" placeholder="Mã Barcode trên sách" name="code" value=""/>
</div>
<div class="input-group form-group">
	<div class="input-group-addon"> <div class="text-120"> Tác giả </div> </div>
	<input type="text" class="form-control add-book-info" placeholder="Tác giả cuốn sách" name="author" value=""/>
</div>
<div class="input-group form-group">
	<div class="input-group-addon"> <div class="text-120"> Nhà xuất bản </div> </div>
	<input type="text" class="form-control add-book-info" placeholder="Tên nhà xuất bản" name="pubhouse" value=""/>
</div>
<div class="input-group form-group">
	<div class="input-group-addon"> <div class="text-120"> Năm xuất bản </div> </div>
	<input type="number" min="1900" max="<?php echo date('Y') ?>" class="form-control add-book-info" placeholder="Năm xuất bản sách" name="pubyear" value=""/>
</div>
<div class="input-group form-group">
	<div class="input-group-addon"> <div class="text-120"> Giá </div> </div>
	<input type="number" min="1000" class="form-control add-book-info" placeholder="Giá sách" name="price" value=""/>
</div>
<div class="input-group form-group">
	<div class="input-group-addon"> <div class="text-120"> Ghi chú </div> </div>
	<textarea rows="5" cols="1024" class="form-control" style="resize: none" name="description"></textarea>
</div>
<div class="input-group form-group">
	<div class="input-group-addon"> <div class="text-120"> Số lượng </div> </div>
	<input type="number" min="1" class="form-control add-book-info" placeholder="Số lượng sách" name="amount" value=""/>
</div>
<div class="input-group form-group">
	<div class="input-group-addon"> <div class="text-120"> Số trang </div> </div>
	<input type="number" min="2" class="form-control add-book-info" placeholder="Số trang" name="page" value=""/>
</div>
