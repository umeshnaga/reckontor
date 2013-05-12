<div class="body page-shader mtm">             
				<div class="omniture">
        </div><!-- End of Omniture Code-->
        <div class="line pvl">
        	<div class="unit size1of6">&nbsp;</div>
            <div class="main-content page-bg simple-border size2of3 mvl pam">
                
<?php if(!empty($error_string)){ ?>
<div class="error-box">
	<?php echo $error_string; ?>
</div>
<?php } else {?>
<div class="success-box">
	Register successfully. Please check your registered email to activate the account. 
</div>
<?php }?>

<?php echo form_open('users/activate', 'id="activate-user"'); ?>


<div class="line">
	<div class="unit size2of3">
		<form onsubmit="ua_postForm('/content/account/ajax-signIn.jspa', '#ua_signInForm'); return false" action="" id="ua_signInForm">
			<!-- p class="h3 strong">Sign in to your ongoasia.com account</p>
			
			<div class="line">
				<h4 class="mbn"><label class="strong">Have a Facebook account? </label><span class="note">(Recommended)</span></h4>
				<div class="mhm mts">
					<div class="line"><a class="img-link unit no-hover mbs" href="#" id="FacebookBtn"><img alt="Connect with Facebook" src="/images/general/fb_connect.png"></a></div>
					<span class="small note">One less log-in to remember!</span>
				</div>
			</div>

			<div class="light-border-b mbl">
				<p class="txtC floating-border mtn"><span class="strong pam page-bg">OR</span></p>
			</div-->
			
			<div id="fieldErrors"></div>
			<p class="h3 strong">Active Your Account</p>
			<p>
				<label for="emailAddress" id="emailAddressLabel">Email</label><br>
				<input type = "text" class="input-xlarge" name="email">
			</p>
			<p>
				<label><?php echo lang('user_activation_code') ?></label><br>
				<input type = "text" class="input-xlarge" name="activation_code">				
				<br>
			</p>
			<p><img style="display:none" src="/images/loading.star.gif" alt="loading star" id="loadingStar"></p>
			<div class="line">
				<div class="btn btn-booking unitRight size-btn-booking-sign-in">
					<button title="Activate" type="submit"><span><?php echo lang('user_activate_btn');?></span></button>
				</div>
			</div>
		</form>
	</div>
	
</div>
<?php echo form_close(); ?>


            </div><!-- end main -->
            <div class="unit size1of6 lastUnit">&nbsp;</div>
        </div>					           
            </div>






