<section class="title">
	<h4>Tours</h4>
</section>

<section class="item">
	<?php template_partial('filters'); ?>

	<?php echo form_open('admin/tour/action'); ?>

		<div id="filter-stage">
			<?php template_partial('tables/posts'); ?>
		</div>

		<div class="table_action_buttons">
			<?php $this->load->view('admin/partials/buttons', array('buttons' => array('delete'))); ?>
		</div>

	<?php echo form_close(); ?>

</section>
