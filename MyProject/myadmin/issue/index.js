$(document).ready(function(){
	$('#search-user').find('input[type="text"]').focus();
	var table = 0;
	var table_issue_detail = 0;
	var keyword = "";
	var state = "";
	function load_TableIssue()
	{
		var url = "/myadmin/issue/table-issue.php";
		var data = {
			keyword: keyword,
			state: state
		};
		table = new Table(url, data, "#table-issue");
	}
	function load_TableIssueDetail(issueid)
	{
		var url = "/myadmin/issue/table-issuedetail.php";
		var data = {
			issueid: issueid
		};
		table_issue_detail = new Table(url, data, "#table-issue-detail");
	}
	load_TableIssue();
	// Search by User, Name, Code
	$(document).on('submit', '#search-user', function(){
		keyword = $(this).find('[type="text"]').val();
		load_TableIssue();
		return false;
	});
	// Filter by State
	$(document).on('change', '[name="select-state"]', function(){
		state = $(this).val();
		load_TableIssue();
	});
	// Show Issue Detail
	$(document).on('click', '#table-issue .select-issue', function(){
		$('#form-submit-books').modal('show');
		var issueid = $(this).val();
		load_TableIssueDetail(issueid);
	});
	// Submit Book
	$(document).on('click', '#table-issue-detail .select-submit', function(){
		var issuedetail_id = $(this).val();
		$.ajax({
			type: "POST",
			url: "/module/action.php",
			async: false,
			data: {action: "submit-book", id: issuedetail_id}
		}).done(function(){
			table_issue_detail.reLoad();
		});
	});
	$('#form-submit-books').on('hidden.bs.modal', function(){
		table.reLoad();
	});
});
