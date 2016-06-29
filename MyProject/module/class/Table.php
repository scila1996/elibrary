<?php

include_once $_SERVER["DOCUMENT_ROOT"] . "/module/class/Sql.php";

abstract class Table
{
	protected $query;
	protected $pagesize;
	protected $jump_page;
	public function __construct($data)
	{
		$this->query = $data->query;
		$this->pagesize = intval($data->pagesize);
		$this->jump_page = intval($data->page);
		$this->Show();
	}
	public function Show() // Return String's HTML
	{
		$offset = ($this->jump_page - 1) * $this->pagesize;
		$num = 0;
		$i = $offset;
		?>
		<table class="table table-striped table-hover">
			<thead>
				<?php $this->tr_th() ?>
			</thead>
			<tbody>
				<?php
				if (!$num = Sql::select_WithCallBack($this->query, function($value) use (&$i) {
					++$i;
					$this->tr_td($i, $value);
					return TRUE;
				}, $offset, $this->pagesize))
				{
					?>
					<tr class="warning">
						<td colspan="100"><span class="text-warning"><strong> Không tìm thấy dữ liệu </strong></span></td>
					</tr>
					<?php
				}
				?>
			</tbody>
		</table>
		<?php
		$size = array(
			10, 20, 50, 100, $num
		);
		$size = array_unique($size);
		?>
		<div class="form-inline">
			<div class="input-group">
				<div class="input-group-addon"><span class="text-default"> Page size </span></div>
				<select class="form-control set-pagesize">
					<?php
					foreach ($size as $val)
					{
						if ($val * $this->jump_page <= $num)
						{
							?>
							<option value="<?php echo $val ?>" <?php if ($val <= $this->pagesize) echo "selected" ?>> <?php echo $val ?> </option>
							<?php
						}
					}
					?>
				</select>
			</div>
		</div>
		<?php
		$show = 5;
		$start = $this->jump_page;
		while (($start - 1) % $show) $start--;
		$end = $start + $show - 1;
		$pagemax = ceil($num / $this->pagesize);
		if (!$pagemax) $pagemax+=1;
		?>
		<ul class="pagination" style="font-weight: bold">
			<?php
			if ($this->jump_page == 1)
			{
				?>
				<li><a title="First"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
				<li><a title="Previous"><span class="glyphicon glyphicon-step-backward"></span></a></li>
				<?php
			}
			else
			{
				?>
				<li><a href="?page=1" title="First" class="page"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
				<li><a href="?page=<?php echo $this->jump_page - 1 ?>" title="Previous" class="page"><span class="glyphicon glyphicon-step-backward"></span></a></li>
				<?php
			}
			if ($this->jump_page > $show)
			{
				?>
				<li><a href="?page=<?php echo $start - $show?>" class="page"> ... </a></li>
				<?php
			}
			for ($i = $start; $i <= $end && $i <= $pagemax; $i++)
			{
				if ($i == $this->jump_page)
				{
					?>
					<li class="active"><a> <?php echo $i ?> </a></li>
					<?php
				}
				else
				{
					?>
					<li><a href="?page=<?php echo $i ?>" class="page"> <?php echo $i ?> </a></li>
					<?php
				}
			}
			if ($end < $pagemax)
			{
				?>
				<li><a href="?page=<?php echo $end + 1?>" class="page"> ... </a></li>
				<?php
			}
			if ($this->jump_page == $pagemax)
			{
				?>
				<li><a title="Next"><span class="glyphicon glyphicon-step-forward"></span></a></li>
				<li><a title="Last"><span class="glyphicon glyphicon-fast-forward"></span></a></li>
				<?php
			}
			else
			{
				?>
				<li><a title="Next" href="?page=<?php echo $this->jump_page + 1 ?>" class="page"><span class="glyphicon glyphicon-step-forward"></span></a></li>
				<li><a title="Last" href="?page=<?php echo $pagemax ?>" class="page"><span class="glyphicon glyphicon-fast-forward"></span></a></li>
				<?php
			}
			?>
			<li><a href="?page=<?php echo $this->jump_page ?>" title="Refresh" class="page"><strong><span class="glyphicon glyphicon-refresh"></span></strong></a></li>
			<li><a> <?php echo "$this->jump_page / $pagemax" ?> </a></li>
		</ul>
		<?php
	}
	abstract public function tr_th();
	abstract public function tr_td($order, $row);
}
