
		
		<div class="main-content">
            <div class="main-col">

				<div class="line mid-border-b">
					<div class="unit size2of3">
						<h2 class="section-title mtl mbs"><i class="icon icon-section-profile"></i>My Profile</h2>
					</div>
				</div>
				<?php if (validation_errors()):?>
					<div class="error-box">
						<?php echo validation_errors();?>
					</div>
				<?php endif;?>
				<div class="media mtl">
					<div class="img avatar-l">								
						<div class="mod complex photo man">
							<b class="top"><b class="tl"></b><b class="tr"></b></b>
							<div class="inner">
								<div class="bd">
									<?php echo gravatar($_user->email, 50);?>
								</div>
							</div>
							<b class="bottom"><b class="bl"></b><b class="br"></b></b>
						</div>								
		
						<p class="mhn mts">
						<a onclick="return false" class="nyroModal inverse-link" href="javascript:;" title="" id="photoNyroId">
						<i class="icon icon-arrow-link unit mts"></i>
							Change my photo
						</a></p>
					</div>
					<div class="bd">
						<div class="details form" id="profileFormDiv">
							<?php echo form_open_multipart('', array('id'=>'user_edit'));?>
								<div class="mlm mbm">
									<label for="email"><?php echo lang('user_email_label') ?></label><br>
									<div class="input-full-wrap">
										<?php echo form_input('email', $_user->email); ?>
									</div>
								</div>
								<div class="mlm mbm">
									<label for="password"><?php echo lang('user_password') ?></label><br/>
									<div class="input-full-wrap">
										<?php echo form_password('password', '', 'autocomplete="off"'); ?>
									</div>
								</div>
								<div class="mlm mbm">
									<label for="display_name"><?php echo lang('profile_display_name'); ?></label><br>
									<div class="input-full-wrap">
										<?php echo form_input(array('name' => 'display_name', 'id' => 'display_name', 'value' => set_value('display_name', $display_name))); ?>
									</div>
								</div>
								<?php foreach($profile_fields as $field): ?>
									<?php if($field['input']): ?>
										<div class="mlm mbm">
											<label for="<?php echo $field['field_slug']; ?>">
												<?php echo (lang($field['field_name'])) ? lang($field['field_name']) : $field['field_name'];  ?>
												<?php if ($field['required']) echo '<span>*</span>'; ?>
											</label><br>
					
											<?php if($field['instructions']) echo '<p class="instructions">'.$field['instructions'].'</p>'; ?>
											
											<div class="input-full-wrap">
												<?php echo $field['input']; ?>
											</div>
										</div>
									<?php endif; ?>
								<?php endforeach; ?>
						
								<div class="line">
									<div class="btn unitRight size-btn-update-my-profile mll"><button value="" name="" title="Update My Profile" type="submit"><span>Update my profile</span></button></div>
									<div class="unitRight">
										<p class="mts"><a title="Cancel" href="{{url:site uri='my-profile'}}">Cancel</a></p>
									</div>
								</div>
							<?php echo form_close(); ?>
						</div>
					</div>
				</div>
        	</div><!-- end main-col -->

	        <div class="right-col">
	             <div class="mod basic viamod standing mtm mbn mhn">
	                  <b class="top"><b class="tl"></b><b class="tr"></b></b>
	                  <div class="inner">
	                        <div class="hd">
	                              <h3 class="mod-header">Ongoasia Customer Support</h3>
	                        </div>
	                        <div class="bd page-bg">
	                              <div class="simple-border ptm bdr-tn">
	                                     <p class="mtn">To contact Customer Support with a booking-related question, click the "My Bookings" tab and navigate to the specific tour or itinerary in question. This guarantees you the quickest - and most accurate! - reply from our Customer Support team.</p>
	                                     <div class="line">
	                                           <p class="mtn unitRight"><a class="inverse-link" href="javascript:;"><i class="icon icon-arrow-link unit mts"></i>Go to My Bookings</a></p>
	                                     </div>
	                              </div>
	                        </div>
	                  </div>
	             </div>
	         </div> <!-- end right col --> 
                             
    	</div><!-- end main-content -->
