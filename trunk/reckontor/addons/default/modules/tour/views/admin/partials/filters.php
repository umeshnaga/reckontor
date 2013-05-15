<fieldset id="filters">
	
	<legend>Filters</legend>
	
	<?php echo form_open(''); ?>
	<?php echo form_hidden('f_module', $module_details['slug']); ?>
		<ul>  
			<li>
        		<label for="f_tour_status_id">Tour status</label>
        		<?php echo form_dropdown('f_tour_status_id', array('' => lang('global:select-all')) + $all_tour_statuses); ?>
    		</li>
		
			<li>
        		<label for="f_city_id">City</label>
        		<?php echo form_dropdown('f_city_id',  array(0 => lang('global:select-all')) + $all_cities); ?>
    		</li>
			
			<li><label for="f_title">Title</label> <?php echo form_input('f_title'); ?></li>
			<li><?php echo anchor(current_url() . '#', lang('buttons.cancel'), 'class="cancel"'); ?></li>
		</ul>
	<?php echo form_close(); ?>
</fieldset>