<div class="body page-shader mtm">             
				<div class="omniture">

        </div><!-- End of Omniture Code-->

        <div class="line pvl signup">
        	<div class="unit size1of8">&nbsp;</div>
            <div class="main-content page-bg simple-border size3of4 mvl pam">   
            	<?php if ( ! empty($error_string)):?>
	            <div class="error-box">
					<?php echo $error_string;?>
				</div>   
				<?php endif;?>         
				<p class="h3 strong mbn">Sign up for an account</p>
				<p class="mts">
					You only need 3 things to start an account. It's free and
					it means you can contribute and manage your bookings. If you
					already have an account
					<a href="{{ url:site uri='users/login' }}" id="signInLink" title="sign in">sign in</a>.
				</p>

				<p>
					Are you a returning Viator.com customer? If so, an account may already have been created for you, with all of your reviews and photos grouped together in one convenient place. <a href="{{ url:site uri='users/reset_pass' }}">Click here to claim your account</a> and create a new password.
				</p>
				
				<div class="line">
					<h4 class="mbn"><label class="strong">Have a Facebook account? </label><span class="note">(Recommended)</span></h4>
					<div class="media mts">
						<a href="javascript:;" class="img no-hover" id="FacebookBtn">{{ theme:image file="fb_connect.png" }}</a>
						<div class="bd"><p class="small note">One less log-in to remember!</p></div>
					</div>
				</div>
				<div class="light-border-b mbl">
					<p class="txtC floating-border mtn"><span class="strong pam page-bg">OR</span></p>
				</div>				

				<div id="fieldErrors"></div>

				<?php echo form_open('register', array('id' => 'register')); ?>
					<div class="clearfix overlay">
						<p class="h3 strong">Create a Viator.com account</p>
						<div class="line">
							<div class="unit size1of2">									
								<p><label for="emailAddress" id="emailAddressLabel">Email</label><br>
								<input type="email" class="input-xlarge" maxlength="100" id="emailAddress" name="email"><br>
								<?php echo form_input('d0ntf1llth1s1n', ' ', 'class="default-form" style="display:none"'); ?>
								<span class="small note">We treat spam seriously. We will not be giving out your email address and it will not be shown on the site.</span></p>
								<p>
									<label for="newPassword" id="newPasswordLabel">Password</label><br>
									<input type="password" class="input-xlarge" id="newPassword" name="password">
								</p>
								<?php foreach($profile_fields as $field) { if($field['required'] and $field['field_slug'] != 'display_name') { ?>
								<p>
									<label for="<?php echo $field['field_slug']; ?>"><?php echo (lang($field['field_name'])) ? lang($field['field_name']) : $field['field_name'];  ?></label><br />
									<?php echo $field['input']; ?>
								</p>
								<?php } } ?>
							</div>
						</div>
					</div>                   
					
					 <p>
					 	By creating an account you agree to Viator's
						<a target="_blank" title="privacy policy" href="javascript:;">privacy policy</a> and
						<a target="_blank" title="terms &amp; conditions" href="javascript:;">terms &amp; conditions</a>.
					</p>
					<div class="line">
						<div class="btn btn-booking unitRight size-btn-booking-join mrm mbm">
							<button title="Join" type="submit"><span>Join</span></button>
						</div>
						<img style="display:none" src="/images/loading.star.gif" alt="loading star" id="loadingStar">
					</div>
				<?php echo form_close(); ?>
            </div>
            <div class="unit size1of8 lastUnit">&nbsp;</div>
        </div>					           
            </div>