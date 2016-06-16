$(document).ready(function(){
	var table = 0;
	var state = "";
	function load_Table()
	{
		table = new Table('/myuser/mybooks/table.issue.php', {state: state}, '#issue-table');
	}
	load_Table();
	$(document).on('click', '#issue-table .issue-detail', function(){
		$('#form-issue-details').modal('show');
		var id = $(this).val();
		var tbn = new Table('/myuser/mybooks/table.issuedetail.php', {issueid: id}, '#form-issue-details #issue-details');
	});
	$(document).on('change', '[name="select-state"]', function(){
		state = $(this).val();
		load_Table();
	});
});