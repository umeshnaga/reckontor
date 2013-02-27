	<div id="contractors-content">
		<h2><?php echo lang('contractors.welcome'); ?></h2>
		<p><?php echo lang('contractors.welcome_intro');?></p>
		<table>
			<thead>
				<tr>
				<th>Information</th>
				<th>Add new information</th>
				<th>View specific information</th>
				</tr>
			</thead>
			<tbody>
				<?php foreach($data_tables as $data): ?>
				<tr>
					<td><?php echo lang($data); ?></td>
					<td><?php echo anchor('/admin/tour/'.strtolower(lang($data)).'/add', 'Add new', 'class="btn i_plus green icon"'); ?></td>
					<td><?php echo anchor('/admin/tour/'.strtolower(lang($data)).'/index', 'View', 'class="btn i_preview blue icon"'); ?></td>
				</tr>
				<?php endforeach;?>
			</tbody>
		</table>
	</div>
	
	