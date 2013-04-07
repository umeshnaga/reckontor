<?php 
$booking_tours = $booking->booking_tours;
$contact = $booking->contact;
?>
<div class="mlm line">
	<div class="main-title-bar">
		<div class="inner overlay">
			<div class="mhl inverse-txt">
				<div class="line">
					<div class="unit size1of2">
						<h1 class="man strong ptl">Conguratulation! You have successfully checking out</h1>
						<p class="mhn mbn mts xlarge">You have <a title="View itinerary" href="javascript:;"><?php echo sizeof($booking_tours);?> tours in your current itinerary</a></p>
					</div>	
					<!-- div class="unit size1of2">
						<div class="product-price inverse-txt txtR ptl">
							<span class="price-from">Current cart total</span>
							<span>USD</span>
							<span class="price-amount price-amount-m"><span class="currency-sign">$</span>111</span>
						</div>
					</div -->					
				</div>                    
			</div>                
		</div>
	</div>

	<div class="main-content">

		<div class="omniture">

		</div><!-- End of Omniture Code-->
		<form method="post" action="{{url:site uri='tour'}}" name="mainform">
			
			<?php
			foreach ($booking_tours as $booking_tour_id => $booking_tour) { ?>
			<div class="main-border-b pvl">
				<h2 class="strong mvn">Traveler Details For [<?php echo $booking_tour->tour_title;?>] Tour</h2>

			    <div class="traveler_list">
			    	<?php 
			    	$traveler_count = 0;
			    	foreach ($booking_tour->travelers as $traveler_id => $traveler) { 
			    		$traveler_count++;?>
					<div class="line mbm">
						
						<div class="unit size1of3">
							<div class="line">
								<div class="unit size2of3">
									<div class="mhm mts">
										<label class="" for="traveler_firstname1">
											<span class="required">*</span> Traveler <?php echo ($traveler_count);?>
										</label>
									</div>
						    	</div>
						    </div>
						</div>
						<div class="unit size1of9 txtC">
							<div class="input-full-wrap mls">
								<?php echo $traveler->title; ?>
							</div>
						</div>

						<div class="unit size5of9">
							<div class="line">
								<div class="unit size1of2"><div class="input-full-wrap mls"><?php echo $traveler->first_name; ?></div></div>
								<div class="unit size1of2"><div class="input-full-wrap mls"><?php echo $traveler->last_name; ?></div></div>
							</div>
						</div>
					</div>
					<?php }?>
					
				</div><!-- end of traveler_list -->
			</div><!-- end of traveler_details -->
			<?php }?>      
			

			<div class="main-border-b pvl">
				<h2 class="strong mvn">Contact Details</h2>
				<div class="line mbs">
					<div class="unit size1of2">
						<div class="line">
							<div class="unitRight size3of5">
								<div class="line">		
									<div class="unit size1of3"><label class="mls" for="area_code">Area code</label></div>
									<div class="unit size1of3"><label class="mls" for="phone_number">Number</label></div>					
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="line mbm">
					<div class="unit size1of2">
						<div class="line">
							<div class="unit size2of5">
								<div class="mhm mts"><label class="" for="area_code"><span class="required">*</span> Home phone number</label></div>
							</div>
							<div class="unit size3of5">
								<div class="line">
									<div class="unit size1of3">
										<div class="input-full-wrap mls">
											<?php echo $contact->phone_area_code;?>
										</div>
									</div>
									<div class="unit size2of3">
										<div class="input-full-wrap mls">
											<?php echo $contact->phone_number;?>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="line">
					<div class="unit size1of2">   
						<div class="line">                     
							<div class="unit size2of5">
								<div class="mhm mts"><label class="email_address" for="email_address"><span class="required">*</span> Email address</label></div>
							</div>
							<div class="unit size3of5">
								<div class="input-full-wrap mls"><?php echo $contact->email;?></div>
							</div>
						</div>
					</div>
				</div>
                    
				<div class="mod basic mhn mbn mtl">
					<b class="top"><b class="tl"></b><b class="tr"></b></b>
					<div class="inner main-shader phm">
						<div class="bd">
							<div class="line small">
								<div class="unit size1of6">
									<p class="strong mln">Please note</p>
								</div>
								<div class="unit size5of6">											
									<ul class="simple-list">
										<li>If you use a Yahoo!, AOL, Hotmail or Gmail email address please add support@ongoasia.com to your address book. <a href="javascript:;">More information</a></li>
										<li>Ongoasia will never sell, share or distribute your personal information. Read our <a title="Privacy Policy"  href="javascript:;" rel="nofollow">Privacy Policy</a>.</li>
									</ul>	
								</div>		
							</div>						
						</div>
					</div>
				</div>
                    
			</div><!-- end main-border-b -->

			<div class="line mvl">
				<div class="mrm">
					<div class="btn btn-input btn-booking unitRight size-btn-booking-book-now">
						<span>
							<input type="submit" name="formSubmit" value="Finish">
						</span>
					</div>
				</div>
			</div>
		</form>
	</div><!-- end main -->
</div>
