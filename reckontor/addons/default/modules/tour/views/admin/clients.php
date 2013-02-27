<div class="blank-slate">
<?php if (isset($cmd_add) && $cmd_add === 1): ?>
<h2><?php echo lang('contractors.clients.add_title'); ?></h2>
<?php echo form_open(uri_string()); ?>
		<?php echo form_fieldset(lang('contractors.clients.add_intro')); ?>

		<!-- Name -->
		
		<?php echo form_label(lang('contractors.clients.form_name'), 'client_name'); ?>
		<?php $client_name = array('id'=>'client_name','name'=>'client_name','type'=>'text', 'class'=>'integer'); ?>
		<?php echo form_input($client_name); ?>
		
		<!-- /Name -->
		
		
		<?php echo form_submit('submit', lang('contractors.form_submit'), 'class="green small"'); ?>
		
<?php echo form_close(); ?>
<?php elseif (isset($cmd_index) && $cmd_index === 1): ?>
	<?php print_r($suppliers); ?>
	Hello!
	
<?php endif; ?>
</div>