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
		var t = $(document).find('#table-issue-detail');
		if (t.find('.select-submit:not([disabled])').length == 0)
		{
			t.find('.select-all-submit').attr('disabled', true);
		}
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
		var form = $('#form-submit-books'); 
		var issueid = $(this).val();
		form.modal('show');
		form.find('.print-issue').val(issueid);
		load_TableIssueDetail(issueid);
	});
	// Submit Book
	$(document).on('click', '#table-issue-detail .select-submit', function(){
		var issuedetail_id = $(this).val();
		$.ajax({
			type: "POST",
			url: "/module/action.php",
			async: false,
			data: {action: "issue-detail-state", id: issuedetail_id, state: 0}
		}).done(function(){
			table_issue_detail.reLoad();
		});
	});
	// Lose Book
	$(document).on('click', '#table-issue-detail .select-lose', function(){
		var issuedetail_id = $(this).val();
		$.ajax({
			type: "POST",
			url: "/module/action.php",
			async: false,
			data: {action: "issue-detail-state", id: issuedetail_id, state: -1}
		}).done(function(){
			table_issue_detail.reLoad();
		});
	});
	$('#form-submit-books').on('hidden.bs.modal', function(){
		table.reLoad();
	});
	// Submit All Books
	$(document).on('click', '#table-issue-detail .select-all-submit', function(){
		var isid = $(this).val();
		$.ajax({
			type: "POST",
			url: "/module/action.php",
			async: false,
			data: {action: "submit-all-books", isid: isid},
		}).done(function(){
			load_TableIssueDetail(isid);
		});
	});
});
