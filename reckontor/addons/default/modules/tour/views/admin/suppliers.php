<?php if (isset($cmd_add) && $cmd_add === 1): ?>
<div id="add_suppliers"></div>
<div class="blank-slate">
<h2><?php echo lang('contractors.suppliers.add_title'); ?></h2>
<?php echo form_open(uri_string()); ?>
		<?php echo form_fieldset(lang('contractors.suppliers.add_intro')); ?>

		<!-- Name -->
		<?php echo form_label(lang('contractors.suppliers.form_name'), 'name'); ?>
		<?php $supplier_name = array('id'=>'supplier_name','name'=>'supplier_name','type'=>'text'); ?>
		<?php echo form_input($supplier_name); ?>
		
		<!-- /Name -->
		

		<?php echo form_submit('submit', lang('contractors.form_submit'), 'id="submit_add_suppliers" class="green small"'); ?>
		
		
<?php echo form_close(); ?>
</div>
<?php elseif (isset($cmd_index) && $cmd_index === 1): 
	$supplier_id = 0;
?>
	<h2> Review Suppliers </h2>
	<?php if($suppliers['isEmpty']): ?>
		<p> There's no current information about Suppliers</p>
	<?php else: ?>
		<table>
			<thead>
				<tr>
		<?php while ($col_name = current($data_suppliers[0])) {
				echo '<th>'.strtoupper(key($data_suppliers[0])).'</th>';
				next($data_suppliers[0]);
			} ?>
			<th> Delete </th>
			</tr>
			</thead>
			<tbody>
			<?php foreach($data_suppliers as $data): ?>
			<tr>
			<?php while ($col_name = current($data)) {
			if( strcmp(key($data), 'name') == 0 ) 
			{
				echo '<td id="'.$supplier_id.'" class="editable">'.$data[(key($data))].'</td>';
			} 
			else 
			{
				$supplier_id = $data[(key($data))];
				echo '<td>'.$supplier_id.'</td>';
			}
			next($data);
			} ?>
			<td><?php echo anchor('#', 'Delete', array('class' => "btn i_trash delete red icon", 'id' => 'delete-'.$supplier_id.'')); ?></td>
			</tr>
			<?php endforeach;?>
			</tbody>
	<?php endif; ?>
<?php endif; ?>
