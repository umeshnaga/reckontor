	<section class="title">
<h4><?php echo $post->tour_id?'Edit tour "'.$post->original_title.'"':'New tour';?></h4>
</section>
<section class="item"> <?php echo form_open(''); ?>
<div class="tabs">

	<ul class="tab-menu">
		<li><a href="#overview-tab"><span>Overview</span> </a></li>
		<li><a href="#detail-tab"><span>Detail</span> </a></li>
		<li><a href="#date-tab"><span>Available date</span> </a></li>
	</ul>
	<div class="form_inputs" id="overview-tab">
		<fieldset>
			<ul>
				<li><label for="city_id">City <span>*</span> </label>
					<div class="input">
					<?php echo form_dropdown('city_id', $all_cities, @$post->city_id); ?>
					</div>
					<?php echo form_hidden('tour_id',$post->tour_id)?>
				</li>
				<li class="<?php echo $post->tour_id?'':'hide-me'?>"><label for="tour_status_id">Tour status <span>*</span> </label>
					<div class="input">
						<?php echo form_dropdown('tour_status_id', $all_tour_statuses, @$post->tour_status_id); ?>
					</div>
				</li>
				<li><label for="code">Code <span>*</span> </label>
					<div class="input">
					<?php echo form_input('code', $post->code, 'maxlength="20"'); ?>
					</div>
				</li>
				<li><label for="title">Title <span>*</span> </label>
					<div class="input">
					<?php echo form_input('title', htmlspecialchars_decode($post->title), 'maxlength="2056"'); ?>
					</div>
				</li>
				<li><label for="common_adult_price">Common adult price <span>*</span>
				</label>
					<div class="input">
					<?php echo form_input('common_adult_price', $post->common_adult_price, 'maxlength="20"'); ?>
					</div>
				</li>
				<li><label for="common_child_price">Common child price <span>*</span>
				</label>
					<div class="input">
					<?php echo form_input('common_child_price', $post->common_child_price, 'maxlength="20"'); ?>
					</div>
				</li>
				<li><label for="duration">Duration <span>*</span> </label>
					<div class="input">
					<?php echo form_input('duration', $post->duration, 'maxlength="100"'); ?>
					</div>
				</li>
				<li><label for="photo_id">Photo <span>*</span></label>
					<div class="input">
					<?php echo form_dropdown('photo_id', array('0' => 'No photo') + $all_tour_photos, @$post->photo_id); ?>
					<div class="photo_preview"></div>
					</div>
				</li>
			</ul>
		</fieldset>
	</div>
	<div class="form_inputs" id="detail-tab">
		<fieldset>
			<ul>
				<li><label for="introduction">Introduction <span>*</span> </label> <br
					class="clear-both" /> <?php echo form_textarea(array('id' => 'introduction', 'name' => 'introduction', 'value' => $post->introduction, 'rows' => 5, 'class' => 'wysiwyg-simple')); ?>
				</li>
				<li><label for="highlight">Highlight <span>*</span> </label> <br
					class="clear-both" /> <?php echo form_textarea(array('id' => 'highlight', 'name' => 'highlight', 'value' => $post->highlight, 'rows' => 5, 'class' => 'wysiwyg-simple')); ?>
				</li>
				<li class="editor"><label for="description">Description <span>*</span>
				</label> <br class="clear-both" /> <?php echo form_textarea(array('id' => 'description', 'name' => 'description', 'value' => $post->description, 'rows' => 30, 'class' => "wysiwyg-advanced")); ?>
				</li>
				<li class="editor"><label for="scheduler">Scheduler <span>*</span> </label>
					<br class="clear-both" /> <?php echo form_textarea(array('id' => 'scheduler', 'name' => 'scheduler', 'value' => $post->scheduler, 'rows' => 30, 'class' => "wysiwyg-advanced")); ?>
				</li>
				<li class="editor"><label for="additional_info">Additional info <span>*</span>
				</label> <br class="clear-both" /> <?php echo form_textarea(array('id' => 'additional_info', 'name' => 'additional_info', 'value' => $post->additional_info, 'rows' => 30, 'class' => "wysiwyg-advanced")); ?>
				</li>
			</ul>
		</fieldset>
	</div>
	<div class="form_inputs" id="date-tab">
		<fieldset>
			<div class="table_action_buttons">
				<input type="button" value="Delete" class="btn red small"
					id="btn_delete_all_date_range" />
				<?php echo form_hidden('delete_tour_available_date_ids',$post->delete_tour_available_date_ids)?>
			</div>			
			<table border="0" class="table-list" id="tbl_date_range">
				<thead>
					<tr>
						<th><?php echo form_checkbox(array('name' => 'action_to_all', 'class' => 'check-all'));?>
						</th>
						<th>From <span class="red">*</span></th>
						<th>To <span class="red">*</span></th>
						<th>Adult price <span class="red">*</span></th>
						<th>Child price <span class="red">*</span></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<tr class="newrow">
						<td><span class="red">*</span></td>
						<td><input type="text" id="tmp_available_from_date" maxlength="10"
							class="datepicker" />
						</td>
						<td><input type="text" id="tmp_available_to_date" maxlength="10"
							class="datepicker" />
						</td>
						<td><input type="text" id="tmp_adult_price" maxlength="20" />
						</td>
						<td><input type="text" id="tmp_child_price" maxlength="20" />
						</td>
						<td class="actions"><input type="button" value="Add new"
							class="btn green small" id="btn_add_date_range" /></td>
					</tr>
					<?php foreach ($post->available_dates as $available_date) {?>
					<tr>
						<td><input type="checkbox" name="action_to[]">
							<?php echo form_hidden('tour_available_date_id[]',$available_date->tour_available_date_id)?>
							<?php echo form_hidden('tour_available_date_status[]','')?></td>
						<td>
							<?php echo form_input('available_from_date[]', $available_date->available_from_date, 'maxlength="10" class="datepicker"'); ?>
						</td>
						<td><?php echo form_input('available_to_date[]', $available_date->available_to_date, 'maxlength="10" class="datepicker"'); ?>
						</td>
						<td><input type="text" name="adult_price[]" maxlength="20" value="<?php echo $available_date->adult_price; ?>" /></td>
						<td><input type="text" name="child_price[]" maxlength="20" value="<?php echo $available_date->child_price; ?>" /></td>
						</td>
						<td class="actions"><input type="button" value="Delete"
							class="btn red small btn_delete_date_range" /></td>
					</tr>
					<?php }?>
				</tbody>
			</table>

		</fieldset>
	</div>
	<div class="buttons">
	<?php $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel'))); ?>
	</div>
	<?php echo form_close(); ?>

</section>
