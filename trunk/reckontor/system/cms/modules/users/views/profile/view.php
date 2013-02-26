<div class="main users  ">
	<div class="mlm line">
		<div class="main-title-bar">
			<div class="inner tall overlay">
				<div class="mhl inverse-txt">
					<h1 class="man strong ptl"><?php echo lang('profile_display_name'); ?></h1>
					
					<h2 class="man strong info-label h6">My Profile</h2>
				</div>

				<div class="line clearfix ft">
					<div class="page-tabs tabs unit mtm">
						<ul class="tab-control">
							<li class="current"><a href="javascript:;" id="profileLink"><span>My Profile</span></a></li>
							<li class=""><a title="My Wishlist" href="javascript:;"><span>My Wishlist</span></a></li>
							<li class=""><a title="My Bookings" href="javascript:;"><span>My Bookings</span></a></li>
							<li class=""><a title="My Tour Reviews &amp;amp; Photos" href="javascript:;"><span>My Tour Reviews &amp; Photos</span></a></li>
						</ul>
					</div>
				</div>
				
			</div>
		</div>
		<div class="main-content">
            <div class="main-col">
				<div class="line mid-border-b">
					<div class="unit size2of3">
						<h2 class="section-title mtl mbs"><i class="icon icon-section-profile"></i>My Profile</h2>
					</div>
				</div>

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
						<p><label>Gender:</label> Male</p>
						<div class="line">
							<div class="btn unitRight size-btn-edit-my-profile"><button onclick="location.href='{{ url:site uri='edit-profile'}}'" value="" name="" title="Edit My Profile" type="submit"><span>Edit My Profile</span></button></div>
						</div>
					</div>
				</div>
              </div><!-- end main-col -->

              <div class="right-col">
              		<div class="mod basic viamod standing mtm mbn mhn">
                         <b class="top"><b class="tl"></b><b class="tr"></b></b>
                         <div class="inner">
                                <div class="hd">
                                       <h3 class="mod-header">Viator Customer Support</h3>
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
	</div>
</div>