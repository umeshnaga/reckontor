<?php if ($tours) : ?>
	<table border="0" class="table-list">
		<thead>
			<tr>
				<th width="20"><?php echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all')); ?></th>
				<th>City</th>
				<th>Title</th>
				<th>Available date</th>
				<th>Status</th>
				<th width="130"></th>
			</tr>
		</thead>
		<tfoot>
			<tr>
				<td colspan="5">
					<div class="inner"><?php $this->load->view('admin/partials/pagination'); ?></div>
				</td>
			</tr>
		</tfoot>
		<tbody>
			<?php foreach ($tours as $tour) : ?>
				<tr>
					<td><?php echo form_checkbox('action_to[]', $tour->tour_id); ?></td>
					<td><?php echo $tour->city_name; ?></td>
					<td><?php echo $tour->title; ?></td>
					<td><?php echo $tour->available_from_date." &rarr; ".$tour->available_to_date; ?></td>
					<td><?php echo $tour->status_name; ?></td>
					<td>
						<?php echo anchor('admin/tour/edit/' . $tour->tour_id, 'Edit', 'class="btn orange edit"'); ?>
						<?php echo anchor('admin/tour/delete/' . $tour->tour_id, 'Delete', array('class'=>'confirm btn red delete')); ?>
					</td>
				</tr>
			<?php endforeach; ?>
		</tbody>
	</table>
<?php else: ?>
	<div class="no_data">There are no tours at the moment.</div>
<?php endif; ?>