<div class="body page-shader mtm">             
				<div class="omniture">
 <!--/DO NOT REMOVE/-->




        </div><!-- End of Omniture Code-->
        <div class="line pvl">
        	<div class="unit size1of6">&nbsp;</div>
            <div class="main-content page-bg simple-border size2of3 mvl pam">
                
<?php if (validation_errors()): ?>
<div class="error-box">
	<?php echo validation_errors();?>
</div>
<?php endif; ?>

<?php echo form_open('users/login', array('id'=>'login'), array('redirect_to' => $redirect_to)); ?>


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
			<p class="h3 strong">Log in to your Ongoasia account</p>
			<p>
				<label for="emailAddress" id="emailAddressLabel">Email</label><br>
                                <input type="email" class="input-xlarge" value="" name="email" id="email">
			</p>
			<p>
				<label for="password" id="passwordLabel">Password</label><br>
				<input type="password" class="input-xlarge" id="password" name="password">
<br>
				<span class="small note"> 
					
					<a href="{{ url:site uri='users/reset_pass' }}" title="Password Reset" class="flinks" id="forgettenPassword">Password reset</a>
				</span>
			</p>
			<div class="media">
				<input type="checkbox" class="checkbox img" id="rememberme" value="true" name="remember">
				<div class="bd"><label for="rememberme">Keep me signed in</label></div>
			</div>
			<p><img style="display:none" src="/images/loading.star.gif" alt="loading star" id="loadingStar"></p>
			<div class="line">
				<div class="btn btn-booking unitRight size-btn-booking-sign-in">
					<button title="Sign in" type="submit"><span>Sign in</span></button>
				</div>
				<div class="unitRight">
					<p class="mrl"><a title="Cancel" href="{{ url:site uri='home' }}">Cancel</a> </p>
				</div>    
			</div>
		</form>
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
<?php echo form_close(); ?>


            </div><!-- end main -->
            <div class="unit size1of6 lastUnit">&nbsp;</div>
        </div>					           
            </div>