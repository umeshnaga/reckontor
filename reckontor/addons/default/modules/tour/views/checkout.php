<div class="mlm line">
	<div class="main-title-bar">
		<div class="inner overlay">
			<div class="mhl inverse-txt">
				<div class="line">
					<div class="unit size1of2">
						<h1 class="man strong ptl">Secure Checkout</h1>
						<p class="mhn mbn mts xlarge">You have <a title="View itinerary" onclick="window.open('/popup/itineraryPopup.jspa','popupwindow','scrollbars=1,resizable=1,width=655,height=555'); return false;" href="#">2 items in your current itinerary</a></p>
						<div class="xlarge pbl">
							<p class="man">Total Price for <?php echo $traveler_count;?> Travelers: USD $<?php echo $total_fee;?></p>
						</div>
					</div>	
					<div class="unit size1of2">
						<div class="product-price inverse-txt txtR ptl">
							<span class="price-from">Current cart total</span>
							<span>USD</span>
							<span class="price-amount price-amount-m"><span class="currency-sign">$</span><?php echo $total_fee;?></span>
						</div>
					</div>					
				</div>                    
			</div>                
		</div>
	</div>

	<div class="main-content">

		<div class="omniture">

		</div><!-- End of Omniture Code-->
		<form method="post" action="{{url:site uri='tour/payment'}}" name="mainform">
			
			    
			<?php foreach ($booking_details as $i => $booking_detail) { ?>
			<div class="main-border-b pvl">
				<h2 class="strong mvn">Traveler Details For [<?php echo $booking_detail->tour->title;?>] Tour</h2>
			    <div class="line mbs">
			    	<div class="unit size1of3">
			    		<div class="unitRight size1of3 txtC">
							<label class="traveler_index" for="traveler_index1">Lead traveler</label>
						</div>
					</div>
			       
			        <div class="unit size1of9 txtC">
			        	<div class="mls">
			        		<label for="traveler_title1">Title</label>
			        	</div>
			        </div>
			        <div class="unit size5of9">
			        	<div class="line">
							<div class="unit size1of2"><div class="mls"><label class="traveler_firstname" for="traveler_firstname1">First name/Given name</label></div></div>
							<div class="unit size1of2"><div class="mls"><label class="traveler_lastname" for="traveler_lastname1">Last name/Family name</label></div></div>
						</div>
					</div>
			    </div>

			    <div class="traveler_list">
			    	<?php for ($i = 0; $i < $booking_detail->adult_count; $i++) { ?>
					<div class="line mbm">
						<div class="unit size1of3">
							<div class="line">
								<div class="unit size2of3">
									<div class="mhm mts">
										<label class="" for="traveler_firstname1">
											<span class="required">*</span> Traveler <?php echo ($i + 1);?> <span class="small note">(Adult)</span>
										</label>
									</div>
						    	</div>
						    	<div class="unit size1of3 txtC">
									<input type="radio" value="1" class="radio imgC mtm" name="leadTravellerIndex" id="traveler_index1">
						    	</div>
						    </div>
						</div>
						<div class="unit size1of9 txtC">
							<div class="input-full-wrap mls">
								<select class="input-full" name="traveler_adult_title">
									<option value="Mr">Mr</option>
									<option value="Mrs">Mrs</option>
									<option value="Ms">Ms</option>
									<option value="Miss">Miss</option>
									<option value="Mstr">Mstr</option>
									<option value="Dr">Dr</option>
								</select>
							</div>
						</div>

						<div class="unit size5of9">
							<div class="line">
								<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text"  value="" name="traveler_adult_firstname" maxlength="15" class="input-full"></div></div>
								<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text"  value="" name="traveler_adult_lastName" maxlength="35" class="input-full"></div></div>
							</div>
						</div>
					</div>
					<?php }?>
					<?php for ($i = 0; $i < $booking_detail->children_count; $i++) { ?>
					<div class="line mbm">
						<div class="unit size1of3">
							<div class="line">
								<div class="unit size2of3">
									<div class="mhm mts">
										<label class="" for="traveler_firstname">
											<span class="required">*</span> Traveler <?php echo $booking_detail->adult_count + $i + 1;?> <span class="small note">(Children)</span>
										</label>
									</div>
						    	</div>
						    </div>
						</div>
						<div class="unit size1of9 txtC">
							<div class="input-full-wrap mls">
								<select class="input-full" name="traveler_children_title">
									<option value="Mr">Mr</option>
									<option value="Mrs">Mrs</option>
									<option value="Ms">Ms</option>
									<option value="Miss">Miss</option>
									<option value="Mstr">Mstr</option>
									<option value="Dr">Dr</option>
								</select>
							</div>
						</div>

						<div class="unit size5of9">
							<div class="line">
								<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text"  value="" name="traveler_children_firstName" maxlength="15" class="input-full"></div></div>
								<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text"  value="" name="traveler_children_lastName" maxlength="35" class="input-full"></div></div>
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
											<input type="tel" value="" maxlength="5" size="5" name="contact_area_code" class="input-full" id="area_code">
										</div>
									</div>
									<div class="unit size2of3">
										<div class="input-full-wrap mls">
											<input type="tel" value="" maxlength="20" name="contact_phone_number" class="input-full" id="phone_number">
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
								<div class="input-full-wrap mls"><input type="email" value="" name="contact_email" class="input-full" id="email_address"></div>
							</div>
						</div>
					</div>
					<div class="unit size1of2">   
						<div class="line">							
							<div class="unit size2of5">
								<div class="mhm mts txtR"><label class="verify_email_address" for="verify_email_address"><span class="required">*</span> Verify email address</label></div>
							</div>
							<div class="unit size3of5">
								<div class="input-full-wrap mls"><input type="email" value="" name="email1" class="input-full" id="verify_contact_email"></div>
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
			<div class="main-border-b pvl">
				<h2 class="strong mvn">Credit Card Details</h2>
				<div class="mod basic mhn mbl">
					<b class="top"><b class="tl"></b><b class="tr"></b></b>
					<div class="inner main-shader phm">
						<div class="bd">
							<div class="line small">
								<div class="unit size1of6">
									<p class="strong mln">Please note</p>
								</div>
								<div class="unit size5of6">											
									<ul class="simple-list">
										<li>This booking will be listed as Ongoasia on your credit card statement.</li>
										<li>The billing address below <span class="strong">must</span> match the billing address on file for your credit card.</li>
										<li><a class="no-hover" title="Your payment details are secure" href="javascript:;"><i class="icon icon-lock"></i></a><a href="javascript:;">Your payment details are secure</a></li>
									</ul>
								</div>		
							</div>						
						</div>
					</div>
				</div>

				<div class="line mbs">
					<div class="unitRight size4of5">
						<div class="line">
							<div class="unit size1of2"><label class="mls" for="credit_card_firstname">First name/Given name</label></div>
							<div class="unit size1of2"><label class="mls" for="credit_card_lastname">Last name/Family name</label></div>
						</div>
					</div>
				</div>
				<div class="line mbm">
					<div class="unit size1of5">
						<div class="mlm mts"><label class="" for="credit_card_firstname"><span class="required">*</span> Name on credit card</label></div>
					</div>
					<div class="unit size4of5">
						<div class="line">
							<div class="unit size1of2">
								<div class="input-full-wrap mls">
									<input type="text" value="" maxlength="15" name="payment_first_name" id="credit_card_firstname" class="input-full">
								</div>
							</div>
							<div class="unit size1of2">
								<div class="input-full-wrap mls">
									<input type="text" value="" maxlength="35" name="payment_last_name" id="credit_card_lastname" class="input-full">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="line mbm">
					<div class="unit size1of5">
						<div class="mlm mts"><label class="" for="billing_address1"><span class="required">*</span> Billing address <span class="small note">(line 1)</span></label></div>
					</div>
					<div class="unit size4of5">
						<div class="line">
							<div class="unit size1of2">
								<div class="input-full-wrap mls">
									<input type="text" value="" class="input-full " name="payment_address1" id="billing_address1">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="line mbm">
					<div class="unit size1of5">
						<div class="mlm mts"><label for="billing_address2">Billing address <span class="small note">(line 2)</span></label></div>
					</div>
					<div class="unit size4of5">
						<div class="line">
							<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" value="" name="payment_address2" id="billing_address2" class="input-full"></div></div>
						</div>
					</div>
				</div>
				<div class="line mbm">
					<div class="unit size1of5">
						<div class="mlm mts"><label class="" for="billing_city"><span class="required">*</span> City</label></div>
					</div>
					<div class="unit size4of5">
						<div class="line">
							<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" value="" class="input-full" name="payment_city" id="billing_city"></div></div>
						</div>
					</div>
				</div>
				<div class="line mbm">
					<div class="unit size1of5">
						<div class="mlm mts"><label class="" for="billing_country"><span class="required">*</span> Country</label></div>
					</div>
					<div class="unit size4of5">
						<div class="line">
							<div class="unit size1of2">
								<div class="input-full-wrap mls">
									<select name="payment_country" id="billing_country" class="input-full country_box" with_city_box="#payment_state">
										<option value="">Please select</option>
										<?php foreach ($countries as $i => $country) { ?>
										<option value="<?php echo $country->country_id;?>"><?php echo $country->country_name;?></option>
										<?php }?>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="line mbm">
					<div class="unit size1of5">
						<div class="mlm mts">
							
							<label class="input-full" for="billing_state"><span class="required">*</span> Province/State/County</label>
						</div>
					</div>
					<div class="unit size4of5">
						<div class="line">
							<div class="unit size1of2">
								<div class="input-full-wrap mls">
									<select name="payment_state" id="payment_state" class="input-full">
										<option value=""> ---- </option>
									</select>
								</div>
							</div>
							<div class="unit size1of2">
								<div class="line">
									<div class="unit size2of3">
										<div class="mts mhs txtR"><label for="billing_unlisted_state" class=""> Enter state/county if not listed</label></div>
									</div>
									<div class="unit size1of3">
										<div class="input-full-wrap mls"><input type="text" value="" size="11" name="payment_unlisted_state" id="billing_unlisted_state" class="input-full"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="line mbm">
					<div class="unit size1of5">
						<div class="mlm mts"><label class="" for="billing_zip"><span class="required">*</span> Postcode/ZIP</label></div>
					</div>
					<div class="unit size4of5">
						<div class="line">
							<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" value="" class="input-full" size="6" name="payment_post_code" id="billing_zip"></div></div>
						</div>
					</div>
				</div>
		    	<div class="line mbm">
			        <div class="unit size1of5">
			            <div class="mlm mts">
			                <label class="" for="credit_card_type"><span class="required">*</span> Credit card type</label>
			            </div>
			        </div>
			        <div class="unit size4of5">
			            <select name="payment_credit_card_type" id="credit_card_type" class="unit mhs">
			                <option value="">Please select</option>
							<option value="Visa">Visa</option>
							<option value="Mastercard">Mastercard</option>
							<option value="Amex">American Express</option>
							<option value="Discover">Discover</option>
			            </select>
			            <span class="credit_card_type_img">
			                <a title="Visa" class="visa no-hover" ><span>Visa</span></a>
			                <a title="Mastercard" class="mastercard no-hover" ><span>Mastercard</span></a>
		                    <a title="AMEX" class="amex no-hover"><span>AMEX</span></a>
		                    <a title="Discover" class="discover no-hover"><span>Discover</span></a>
			            </span>
					</div>
				</div>


				<div class="line mbm">
					<div class="unit size1of5">
						<div class="mlm mts"><label class="" for="credit_card_number"><span class="required">*</span> Credit card number</label></div>
					</div>
					<div class="unit size4of5">
						<div class="line">
							<div class="unit size1of2">
								<div class="input-full-wrap mls">
									<input type="tel" value="" class="input-full" name="payment_credit_card_number" id="credit_card_number">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="display:block;" id="ccv" class="line mbm">
					<div class="unit size1of5">
						<div class="mlm mts">
							<label id="credit_card_security_label" for="credit_card_security"><span class="required">*</span> Card security number</label>
						</div>
					</div>
					<div class="unit size4of5">
						<div class="line">
							<div class="unit size1of4">
								<div class="input-full-wrap mls mrm">
									<input type="tel" value="" class="input-full" maxlength="4" size="5" id="credit_card_security" name="payment_ccv">
								</div>
							</div>
							<div class="unit size1of2"><a href="javascript:;">What's this?</a></div>
						</div>
					</div>
				</div>
				<div class="line">
					<div class="unit size1of5">
						<div class="mlm mts"><label class="" for="credit_card_month"><span class="required">*</span> Expiry date</label></div>
					</div>
					<div class="unit size4of5">
						<select class="mls input-medium" name="payment_expiry_month" id="credit_card_month">
							<option value="">Select month</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
						</select>
							/
						<select name="payment_expiry_year" class="input-medium">
							<option value="">Select year</option>
							<option value="2013">2013</option>
							<option value="2014">2014</option>
							<option value="2015">2015</option>
							<option value="2016">2016</option>
							<option value="2017">2017</option>
							<option value="2018">2018</option>
							<option value="2019">2019</option>
							<option value="2020">2020</option>
							<option value="2021">2021</option>
							<option value="2022">2022</option>
							<option value="2023">2023</option>
							<option value="2024">2024</option>
						</select>
					</div>
				</div>

			</div>


			<div class="main-border-b pvl">
				<div class="mod basic man">
					<b class="top"><b class="tl"></b><b class="tr"></b></b>
					<div class="inner main-shader phm">
						<div class="bd">
							<div class="line small">
								<h2 class="h4 strong mbn">Conditions &amp; Cancellation Policy</h2>									
								<ul class="simple-list mts">
									<li>When paying by credit card, your card is charged the total amount as soon as we receive confirmation of your booking.</li>
									<li>If confirmation isn't received instantly, an authorization is held against your card until it arrives.</li>
									<li>If you change or cancel your booking request, charges may apply.</li>
								</ul>
							</div>						
						</div>
					</div>
				</div>
			</div>

			<div class="main-border-b pvl">
				<p class="txtR mbn">
				    <label for="agree_cancelpolicy">I have read and agree to the <a title="Conditions and Cancellation Policy." href="javascript:;">Conditions and Cancellation Policy</a></label>
					<input type="checkbox" value="true" name="conditionsAgreement" class="checkbox" id="agree_cancelpolicy">
				</p>
			</div><!-- end of conditions_policy -->
			<div class="line mvl">
				<div class="mrm">
					<div class="btn btn-input btn-booking unitRight size-btn-booking-book-now">
						<span>
							<input type="submit" name="formSubmit" value="Book Now">
						</span>
					</div>
				</div>
			</div>
		</form>
	</div><!-- end main -->
</div>
