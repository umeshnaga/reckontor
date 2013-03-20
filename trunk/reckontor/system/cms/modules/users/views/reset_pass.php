<div class="body page-shader mtm">             
				<div class="omniture">

        </div><!-- End of Omniture Code-->

        <div class="line pvl signup">
        	<div class="unit size1of8">&nbsp;</div>
            <div class="main-content page-bg simple-border size3of4 mvl pam">  
            <?php if(!empty($error_string)):?>
				<div class="error-box">
					<?php echo $error_string;?>
				</div>
			<?php endif;?>
			<?php if(!empty($success_string)): ?>
				<div class="success-box">
					<?php echo $success_string; ?>
				</div>
			<?php else: ?>
<div class="line">
	<div class="unit size2of3">
		<p class="h3 strong mbn">Password Reset</p>
		<p class="mts">We will send instructions for creating a new password to the email address associated with your account.</p>
	
		<div id="fieldErrors"></div>
	
		<?php echo form_open('users/reset_pass', array('id'=>'reset-pass')); ?>
			<div class="line mbs">
				<div class="unit size1of3"><p class="mts txtR"><label for="emailAddress">Your email address</label></p></div>
				<div class="unit size2of3"><div class="input-full-wrap mrm"><input type="email" class="input-full" id="emailAddress" name="email"></div></div>
			</div>
			<div class="line">
				<img style="display:none" src="/images/loading.star.gif" alt="loading star" id="loadingStar"> 
				<div class="btn unitRight size-btn-submit mll mrm">
					<button title="submit" type="submit" value="Reset Pass" name="btnSubmit"><span>Submit</span></button>
				</div>
				<div class="unitRight">
					<div class="mts"><a title="Cancel" href="{{ url:site uri='home' }}">Cancel</a></div>
				</div>                    
			</div>
		<?php echo form_close(); ?>
			
		<?php endif; ?>
	</div>

 
	<div class="unit size1of3">
		<div class="mod basic">
			<b class="top"><b class="tl"></b><b class="tr"></b></b>
			<div class="inner light-shader">
				<div class="hd">
					<div class="large strong mhm mtm">Not a member yet?</div>
				</div>
				<div class="bd">
					<p class="mts">It's free and allows you to publish reviews, ratings and photos on ongoasia.com. You'll also have access to members-only promotions and deals.</p>
					<div class="line">						
						<div class="btn btn-light-shader unitRight size-btn-join mrm mbm">
							<a href = "{{ url:site uri='register' }}"><span>Join</span></a>
						</div>						
					</div>
				</div>
			</div>
			<b class="bottom"><b class="bl"></b><b class="br"></b></b>
		</div>
	</div>

</div>

            <div class="unit size1of8">&nbsp;</div>
        </div>					           
            </div><!-- end body -->

		</div>