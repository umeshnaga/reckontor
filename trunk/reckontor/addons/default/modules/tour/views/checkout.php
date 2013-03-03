					<div class="mlm line">

		<div class="main-title-bar">
			<div class="inner overlay">
				<div class="mhl inverse-txt">
					<div class="line">
						<div class="unit size1of2">
							<h1 class="man strong ptl">Secure Checkout</h1>
							<p class="mhn mbn mts xlarge">You have <a title="View itinerary" onclick="window.open('/popup/itineraryPopup.jspa','popupwindow','scrollbars=1,resizable=1,width=655,height=555'); return false;" href="#">2 items in your current itinerary</a></p>
                            <div class="xlarge pbl">
								<p class="man">Total Price for 7 Travelers: USD $2,348.89</p>
                                
                            </div>
						</div>	
						<div class="unit size1of2">
							<div class="product-price inverse-txt txtR ptl">
								<span class="price-from">Current cart total</span>
								<span>USD</span>
								<span class="price-amount price-amount-m"><span class="currency-sign">$</span>2,348.89</span>
							</div>
						</div>						
                    </div>                    
                </div>                
            </div>
        </div>

        <div class="main-content">

            <div class="omniture">

            </div><!-- End of Omniture Code-->

            <form method="post" action="/booking/booking.jspa" name="mainform">
                <input type="hidden" value="57561404" name="bookingAttempt_sessionId">
                <input type="hidden" value="8957" name="bookingAttempt_sessionKey">
                <input type="hidden" value="27340824" name="itineraryId">
                <input type="hidden" value="7" name="numOfTravellers">
                <input type="hidden" value="2" name="itemCount">
                <input type="hidden" value="234889" name="totalPrice">
                <input type="hidden" value="234889" name="totalUSDValue">
                <input type="hidden" value="" name="code">
                <input type="hidden" value="false" name="onlyGiftItems">
                <input type="hidden" value="false" name="showGiftCertificateSection">
                <input type="hidden" value="" name="currencyCode">
                <input type="hidden" value="false" name="checkLeadTravelerName">
                    <div class="main-border-b pvl">
                        <h2 class="strong mvn">Traveler Details</h2>

                        <div class="line mbs">
                        	<div class="unit size1of3">
                        		<div class="unitRight size1of3 txtC">
									<label class="traveler_index" for="traveler_index1">Lead traveler</label>
								</div>
							</div>
                           
                            <div class="unit size1of9 txtC"><div class="mls"><label for="traveler_title1">Title</label></div></div>
                            <div class="unit size5of9">
                            	<div class="line">
									<div class="unit size1of2"><div class="mls"><label class="traveler_firstname" for="traveler_firstname1">First name/Given name</label></div></div>
									<div class="unit size1of2"><div class="mls"><label class="traveler_lastname" for="traveler_lastname1">Last name/Family name</label></div></div>
								</div>
							</div>
                        </div>

                        <div class="traveler_list">
                            
                            
                            <!-- do adults first -->
                            
                                
                                    <div class="line mbm">
                                    
                                    <div class="unit size1of3">
                                    	<div class="line">
                                    		<div class="unit size2of3">
												<div class="mhm mts"><label class="" for="traveler_firstname1">
													
													<span class="required">*</span> Traveler 1 <span class="small note">(Adult)</span>
												</label>
												</div>
                                        	</div>
                                        	<div class="unit size1of3 txtC">
												<input type="radio" onchange="unColorRadioBackground(document.mainform.leadTravellerIndex);" onclick="updatePayerName(0)" checked="checked" value="0" class="radio imgC mtm" name="leadTravellerIndex" id="traveler_index1">
                                        	</div>
                                        </div>
                                    </div>
                                    <div class="unit size1of9 txtC">
                                    	<div class="input-full-wrap mls">
											<select onchange="updatePayerTitle(0)" name="travellers(0).title" id="traveler_title1" class="input-full">
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
											<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" onchange="updatePayerFirstName(0);unColorBackground(this);if(this.value.toLowerCase()=='markymark'){preFillForm(document.mainform);}" value="Le" name="travellers(0).firstName" maxlength="15" class="input-full" id="traveler_firstname1"></div></div>
											<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" onchange="updatePayerLastName(0);unColorBackground(this);" value="Hung" name="travellers(0).lastName" maxlength="35" class="input-full" id="traveler_lastname1"></div></div>
										</div>
                                    </div>
                                    <input type="hidden" value="30" name="travellers(0).age">
                                    <input type="hidden" value="0" name="travellers(0).poolIndex">
                                    </div>
                                
                                    <div class="line mbm">
                                    
                                    <div class="unit size1of3">
                                    	<div class="line">
                                    		<div class="unit size2of3">
												<div class="mhm mts"><label class="" for="traveler_firstname5">
													<span class="required">*</span> Traveler 2 <span class="small note">(Adult)</span>
												</label>
												</div>
                                        	</div>
                                        	<div class="unit size1of3 txtC">
														<input type="radio" onchange="unColorRadioBackground(document.mainform.leadTravellerIndex);" onclick="updatePayerName(4)" value="4" class="radio imgC mtm" name="leadTravellerIndex" id="traveler_index5">
                                        	</div>
                                        </div>
                                    </div>
                                    <div class="unit size1of9 txtC">
                                    	<div class="input-full-wrap mls">
											<select onchange="updatePayerTitle(4)" name="travellers(4).title" id="traveler_title5" class="input-full">
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
											<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" onchange="updatePayerFirstName(4);unColorBackground(this);if(this.value.toLowerCase()=='markymark'){preFillForm(document.mainform);}" value="" name="travellers(4).firstName" maxlength="15" class="input-full" id="traveler_firstname5"></div></div>
											<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" onchange="updatePayerLastName(4);unColorBackground(this);" value="" name="travellers(4).lastName" maxlength="35" class="input-full" id="traveler_lastname5"></div></div>
										</div>
                                    </div>
                                    <input type="hidden" value="30" name="travellers(4).age">
                                    <input type="hidden" value="4" name="travellers(4).poolIndex">
                                    </div>
                                    <div class="line mbm">
                                    <div class="unit size1of3">
                                    	<div class="line">
                                    		<div class="unit size2of3">
												<div class="mhm mts"><label class="" for="traveler_firstname6">
													
													<span class="required">*</span> Traveler 6 <span class="small note">(Age 3)</span>
												</label>
												</div>
                                        	</div>
                                        	<div class="unit size1of3 txtC">
                                        	</div>
                                        </div>
                                    </div>
                                    <div class="unit size1of9 txtC">
                                    	<div class="input-full-wrap mls">
											<select onchange="updatePayerTitle(5)" name="travellers(5).title" id="traveler_title6" class="input-full">
														<option value="Mr">Mr</option>
														<option value="Mrs">Mrs</option>
														<option value="Ms">Ms</option>
														<option value="Miss">Miss</option>
														<option value="Mstr">Mstr</option>
														<option value="Dr">Dr</option>
											</select>
										</div>
                                    </div>

                                    <!--
                                      top: com.viator.webwork.action.booking.TravellerInfo@114d31b5
                                      firstName: 
                                      lastName: 
                                    -->
                                    <div class="unit size5of9">
                                    	<div class="line">
											<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" onchange="updatePayerFirstName(5);unColorBackground(this);if(this.value.toLowerCase()=='markymark'){preFillForm(document.mainform);}" value="" name="travellers(5).firstName" maxlength="15" class="input-full" id="traveler_firstname6"></div></div>
											<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" onchange="updatePayerLastName(5);unColorBackground(this);" value="" name="travellers(5).lastName" maxlength="35" class="input-full" id="traveler_lastname6"></div></div>
										</div>
                                    </div>
                                    <input type="hidden" value="3" name="travellers(5).age">
                                    <input type="hidden" value="6" name="travellers(5).poolIndex">
                                    </div>
                                    <div class="line mbm">
                                    
                                    <div class="unit size1of3">
                                    	<div class="line">
                                    		<div class="unit size2of3">
												<div class="mhm mts"><label class="" for="traveler_firstname7">
													
													<span class="required">*</span> Traveler 7 <span class="small note">(Age 1)</span>
												</label>
												</div>
                                        	</div>
                                        	<div class="unit size1of3 txtC">
                                        	</div>
                                        </div>
                                    </div>
                                    <div class="unit size1of9 txtC">
                                    	<div class="input-full-wrap mls">
											<select onchange="updatePayerTitle(6)" name="travellers(6).title" id="traveler_title7" class="input-full">
														<option value="Mr">Mr</option>
														<option value="Mrs">Mrs</option>
														<option value="Ms">Ms</option>
														<option value="Miss">Miss</option>
														<option value="Mstr">Mstr</option>
														<option value="Dr">Dr</option>
											</select>
										</div>
                                    </div>

                                    <!--
                                      top: com.viator.webwork.action.booking.TravellerInfo@62fa6af2
                                      firstName: 
                                      lastName: 
                                    -->
                                    <div class="unit size5of9">
                                    	<div class="line">
											<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" onchange="updatePayerFirstName(6);unColorBackground(this);if(this.value.toLowerCase()=='markymark'){preFillForm(document.mainform);}" value="" name="travellers(6).firstName" maxlength="15" class="input-full" id="traveler_firstname7"></div></div>
											<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" onchange="updatePayerLastName(6);unColorBackground(this);" value="" name="travellers(6).lastName" maxlength="35" class="input-full" id="traveler_lastname7"></div></div>
										</div>
                                    </div>
                                    <input type="hidden" value="1" name="travellers(6).age">
                                    <input type="hidden" value="5" name="travellers(6).poolIndex">
                                    </div>
                                

                        </div><!-- end of traveler_list -->
                         
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
														<li>The Lead Traveler must present a valid Photo ID when redeeming their Viator Voucher(s).</li>
														<li>Accompanying children do not require Photo ID.</li>
													
												</ul>	
											</div>		
										</div>						
									</div>
								</div>
							</div>
                        
                    </div><!-- end of traveler_details -->

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
										<div class="unit size1of3"><div class="input-full-wrap mls"><input type="tel" onchange="checkPhoneFields(); unColorBackground(this);" value="" maxlength="5" size="5" name="areaCode" class="input-full" id="area_code"></div></div>
										<div class="unit size2of3"><div class="input-full-wrap mls"><input type="tel" onchange="checkPhoneFields(); unColorBackground(this);" value="" maxlength="20" name="phoneNumber" class="input-full" id="phone_number"></div></div>
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
									<div class="input-full-wrap mls"><input type="email" onchange="unColorBackground(this);unColorEmailBackground();" value="lequochungit@yahoo.com" name="email" class="input-full" id="email_address"></div>
								</div>
							</div>
						</div>
						<div class="unit size1of2">   
							<div class="line">							
								<div class="unit size2of5">
									<div class="mhm mts txtR"><label class="verify_email_address" for="verify_email_address"><span class="required">*</span> Verify email address</label></div>
								</div>
								<div class="unit size3of5">
									<div class="input-full-wrap mls"><input type="email" onchange="unColorBackground(this);unColorEmailBackground();" value="lequochungit@yahoo.com" name="email1" class="input-full" id="verify_email_address"></div>
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
												<li>If you use a Yahoo!, AOL, Hotmail or Gmail email address please add support@viator.com to your address book. <a onclick="window.open('/whatis/moreInfoEmail-popup.jsp','whatiswindow','scrollbars=1,resizable=1,width=650,height=450'); return false;" href="#">More information</a></li>
												<li>Viator will never sell, share or distribute your personal information. Read our <a title="Privacy Policy" onclick="window.open('/privacy-policy','privacyPolicy','toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=1100,height=600'); return false;" href="#" rel="nofollow">Privacy Policy</a>.</li>
											</ul>	
										</div>		
									</div>						
								</div>
							</div>
						</div>
                    
                </div><!-- end main-border-b -->


                    
                        <input type="hidden" value="mandatory" id="ccv_state" name="ccv_state">
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
													<li>This booking will be listed as Viator on your credit card statement.</li>
													<li>The billing address below <span class="strong">must</span> match the billing address on file for your credit card.</li>
													<li><a class="no-hover" title="Your payment details are secure" onclick="window.open('/booking/paymentSecure-popup.jsp','paymentSecure','scrollbars=1,resizable=1,width=650,height=400'); return false;" href="#"><i class="icon icon-lock"></i></a><a onclick="window.open('/booking/paymentSecure-popup.jsp','paymentSecure','scrollbars=1,resizable=1,width=650,height=400'); return false;" href="#">Your payment details are secure</a></li>
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
										<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" onchange="unColorBackground(this);" value="Le" maxlength="15" name="firstName" id="credit_card_firstname" class="input-full"></div></div>
										<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" onchange="unColorBackground(this);" value="Hung" maxlength="35" name="lastName" id="credit_card_lastname" class="input-full"></div></div>
									</div>
								</div>
							</div>
							<div class="line mbm">
								<div class="unit size1of5">
									<div class="mlm mts"><label class="" for="billing_address1"><span class="required">*</span> Billing address <span class="small note">(line 1)</span></label></div>
								</div>
								<div class="unit size4of5">
									<div class="line">
										<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" onchange="unColorBackground(this);" value="" class="input-full " name="address1" id="billing_address1"></div></div>
									</div>
								</div>
							</div>
							<div class="line mbm">
								<div class="unit size1of5">
									<div class="mlm mts"><label for="billing_address2">Billing address <span class="small note">(line 2)</span></label></div>
								</div>
								<div class="unit size4of5">
									<div class="line">
										<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" value="" name="address2" id="billing_address2" class="input-full"></div></div>
									</div>
								</div>
							</div>
							<div class="line mbm">
								<div class="unit size1of5">
									<div class="mlm mts"><label class="" for="billing_city"><span class="required">*</span> City</label></div>
								</div>
								<div class="unit size4of5">
									<div class="line">
										<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" onchange="unColorBackground(this);" value="" class="input-full" name="city" id="billing_city"></div></div>
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
											<select onchange="changeCountry=true;setState(this, document.mainform.state);document.mainform.unlistedState.value='';unColorBackground(this);getCCVState();" name="country" id="billing_country" class="input-full">
														<option value="">Please select</option>
														<option value="AU">Australia</option>
														<option value="CA">Canada</option>
														<option value="FR">France</option>
													
														<option value="">- - - - - - - - - - - -</option>
														<option value="AW">Aruba</option>
														<option value="AU">Australia</option>
														<option value="AZ">Azerbaijan</option>
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
												<select onchange="document.mainform.unlistedState.value=this.value;unColorBackground(this);unColorBackground(document.mainform.unlistedState);" name="state" id="billing_state" class="input-full">
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
													<div class="input-full-wrap mls"><input type="text" onchange="unColorBackground(this);unColorBackground(document.mainform.state);" value="" size="11" name="unlistedState" id="billing_unlisted_state" class="input-full"></div>
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
										<div class="unit size1of2"><div class="input-full-wrap mls"><input type="text" onchange="unColorBackground(this);" value="" class="input-full" size="6" name="postCode" id="billing_zip"></div></div>
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
                                    <select onchange="unColorBackground(this);getCCVState();" name="creditCardType" id="credit_card_type" class="unit mhs">
                                        <option value="">Please select</option>
                                                <option value="Visa">Visa</option>
                                                <option value="Mastercard">Mastercard</option>
                                                <option value="Amex">American Express</option>
                                                <option value="Discover">Discover</option>
                                    </select>
                                    <span class="credit_card_type_img">
                                        <a title="Visa" class="visa no-hover" onclick="setSelVal(document.getElementById('credit_card_type'), 'Visa');"><span>Visa</span></a>
                                        <a title="Mastercard" class="mastercard no-hover" onclick="setSelVal(document.getElementById('credit_card_type'), 'Mastercard');"><span>Mastercard</span></a>
                                            <a title="AMEX" onclick="setSelVal(document.getElementById('credit_card_type'), 'Amex');" class="amex no-hover"><span>AMEX</span></a>
                                            <a title="Discover" onclick="setSelVal(document.getElementById('credit_card_type'), 'Discover');" class="discover no-hover"><span>Discover</span></a>
                                    </span>
								</div>
							</div>

							<div style="display: none" id="3dSecure">
								<p class="threeD_secure">
									<input type="radio" checked="" value="false" name="use3dSecure" id="3dSecureOptionNo" class="radio">
									<label for="3dSecureOptionNo" id="3dSecureTitleVisa">No, I am not enrolled with Verified by Visa</label>
									<label for="3dSecureOptionNo" id="3dSecureTitleMastercard">No, I am not enrolled with MasterCard SecureCode</label>
									<br>
									<input type="radio" value="true" name="use3dSecure" id="3dSecureOptionYes" class="radio">
									<label for="3dSecureOptionYes" id="3dSecureTitleVisa">Yes, I am enrolled with Verified by Visa</label>
									<label for="3dSecureOptionYes" id="3dSecureTitleMastercard">Yes, I am enrolled with MasterCard SecureCode</label>
								</p>
								<p id="3dSecureTitleVisa" class="threeD_secure">
									<img src="/images/verified_by_visa_sml.gif" alt="Verified by Visa">
									<a title="What's this?" onclick="window.open('/popup/whatsVerifiedByVisa.jspa','whatiswindow','scrollbars=1,resizable=1,width=650,height=500'); return false;" href="#">What's this?</a>
								</p>
								<p id="3dSecureTitleMastercard" class="threeD_secure">
									<img src="/images/mastercard_securecode_sml.gif" alt="MasterCard SecureCode">
									<a title="What's this?" onclick="window.open('/popup/whatsMasterCardSecureCode.jspa','whatiswindow','scrollbars=1,resizable=1,width=650,height=500'); return false;" href="#">What's this?</a>
								</p>
							</div>

							<div class="line mbm">
								<div class="unit size1of5">
									<div class="mlm mts"><label class="" for="credit_card_number"><span class="required">*</span> Credit card number</label></div>
								</div>
								<div class="unit size4of5">
									<div class="line">
										<div class="unit size1of2"><div class="input-full-wrap mls"><input type="tel" onchange="unColorBackground(this);" value="" class="input-full" name="creditCardNumber" id="credit_card_number"></div></div>
									</div>
								</div>
							</div>
							<div style="display:block;" id="ccv" class="line mbm">
								<div class="unit size1of5">
									<div class="mlm mts">
										<label class=" " id="credit_card_security_label" for="credit_card_security"><span class="required">*</span> Card security number</label>
									</div>
								</div>
								<div class="unit size4of5">
									<div class="line">
										<div class="unit size1of4"><div class="input-full-wrap mls mrm"><input type="tel" onchange="unColorBackground(this);" value="" class="input-full" maxlength="4" size="5" id="credit_card_security" name="ccv"></div></div><div class="unit size1of2"><a onclick="window.open('/popup/whatsCCV.jspa','whatiswindow','scrollbars=1,resizable=1,width=650,height=800'); return false;" href="#">What's this?</a></div>
									</div>
								</div>
							</div>
							<div class="line">
								<div class="unit size1of5">
									<div class="mlm mts"><label class="" for="credit_card_month"><span class="required">*</span> Expiry date</label></div>
								</div>
								<div class="unit size4of5">
									<select class="mls input-medium" onchange="unColorBackground(document.mainform.expiryMonth);unColorBackground(document.mainform.expiryYear);" name="expiryMonth" id="credit_card_month">
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
									<select onchange="unColorBackground(document.mainform.expiryMonth);unColorBackground(document.mainform.expiryYear);" name="expiryYear" class="input-medium">
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
                            <label for="agree_cancelpolicy">I have read and agree to the <a title="Conditions and Cancellation Policy." onclick="window.open('/terms-and-conditions','termsNcondition','toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=1100,height=600'); return false;" href="#">Conditions and Cancellation Policy</a></label>
                            
                            
                                <input type="checkbox" onchange="unColorBackground(this);" value="true" name="conditionsAgreement" class="checkbox" id="agree_cancelpolicy">
                            
                        </p>
                    </div><!-- end of conditions_policy -->
                <!-- maxPurchasePriceExceeded -->
                <!-- maxPurchasePriceExceeded -->
                
                <div class="line mvl"><div class="mrm"><div class="btn btn-input btn-booking unitRight size-btn-booking-book-now"><span><input type="submit" onclick="return doSubmit();" name="formSubmit" value="Book Now"></span></div></div></div>
            </form>
        </div><!-- end main -->
					</div>
