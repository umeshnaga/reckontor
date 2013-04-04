<div class="mlm line">
<div id="item-reviewed" class="main-title-bar">
    <div class="main-title-bar-wrapper">
        <h1 class="ptl mtn mhl product-title-l">
            <a class="inverse-txt no-hover" href="javascript:;">
                <span><?php echo $tour->title;?></span>
            </a>
        </h1>
        
        <div class="media man plm">
            <div class="img img-product overlay">                   
				<a href="#" title="0 Photos of <?php echo $tour->title;?>">
					{{ theme:image file="<?php echo $tour->photo_path;?>" title="<?php echo $tour->title;?>" alt="<?php echo $tour->title;?>" class="product-display-header" }}
				</a>
            </div>
            <div class="bd">
                <div class="inverse-txt mlm">
                    <p class="large mtn mhn mbs">
						<a class="no-hover" title="Add to Wishlist"  href="#"><i class="icon icon-wishlist-alt"></i></a>
						<a href="#">Add to Wishlist</a>
                    </p>
                    <div class="size1of2">
                        <div >
                        <div class="media man">
                            <i class="icon icon-location-alt img mtxs"></i>
                            <div class="bd">
                                <span class="info-label strong">Location:</span> 
                                <span class="large"><?php echo $tour->city_name;?>, <?php echo $tour->country_name;?></span>
                            </div>                                                
                        </div>
                        <div class="media man">
                            <i class="icon icon-clock-alt img mtxs"></i>
                            <div class="bd">
                                <span class="info-label strong">Duration:</span> 
                                <span class="large"><?php echo $tour->duration_hours;?> hours</span>
                            </div>
                        </div>
                        <div class="media man">
                            <i class="icon icon-info-alt img mtxs"></i>
                            <div class="bd">
                                <span class="info-label strong">Tour Code:</span> 
                                <span class="large"><?php echo $tour->code;?></span>
                            </div>
                        </div>
                        </div>
                        <p class="mhn mtl mbn no-print">
                            <a class="inverse-link small" href="javascript:;">
                                <i class="icon icon-arrow-link-alt mts unit"></i>
                                View similar tours &amp; things to do
                            </a>
                        </p>                                                
                    </div>
                </div>
            </div>
        </div>                            

        <div class="line clearfix">
            <div class="page-tabs tabs unit mtl">
                <div class="hd">
                    <ul class="tab-control">
                        <li class="current">
                            <a title="Activity Info" href="javascript:;">
                                <span>Activity Info</span>
                            </a>
                        </li>
                    </ul>                                        
                </div>
            </div>
        </div>
    </div> <!-- main-title-bar-wrapper -->

</div>

<div class="omniture">

</div><!-- End of Omniture Code-->

<div class="main-content product-details">
    
    <div class="main-col ">
        
		<div class="mod basic shader mhn no-print">
		    <b class="top"><b class="tl"></b><b class="tr"></b></b>
		    <div class="inner">
		        <div class="pam">
		            <div class="unit size2of3"></div>
		            <div class="unit size1of3">
				    <div class="media unitRight size-print mvn mrn">
				    	<a class="no-hover img" title="Print this page" href="javascript:;"><i class="icon icon-print unit mrxs"></i></a>
				        <div class="bd">
							<a class="inverse-link xsmall" href="javascript:;">Print</a>
				        </div>
				    </div>
		
		
				    <div class="media unitRight size-email mvn mrn">
				    	<a class="no-hover img" title="Email this page"  href="javascript:;"><i class="icon icon-mail unit mrxs"></i></a>
				    	<div class="bd">
							<a class="inverse-link xsmall" href="javascript:;">Email</a>
						</div>
				    </div>
		
		
		            </div>
		            <div class="clear"></div>
		        </div>
		    </div>
		    <b class="bottom"><b class="bl"></b><b class="br"></b></b>
		</div>
    


		<div class="cms-content mhm"><?php echo $tour->introduction;?></div>
        <div class="section"></div>
    
        <h2 class="section-title mid-border-b pbs ptl phm mhn">
            <i class="icon icon-section-arrow"></i>
            Highlights
        </h2>
    
	    <div class="cms-content">
			<ul class="simple-list">
				<?php echo $tour->highlight;?>
			</ul>
	    </div>
		<a name="media"></a>      
		<a name="mediaGallery"></a>


		<h2 class="section-title mid-border-b pbs ptl phm mhn">
		    <i class="icon icon-section-info"></i>Useful Information
		</h2>        

		<div class="mod simple standing mhn mbl">
		    <b class="top"><b class="tl"></b><b class="tr"></b></b>
		    <div class="inner secondary-tabs-bg" id="tabs">
		        <div class="line clearfix page-tabs-wrapper">
		            <div class="secondary-tabs tabs unit">
		                <div class="hd">
		                    <ul class="tab-control" id="topTabs">
		                        <li class="current">
		                            <a href="javascript:;">
		                                <span>
		                                    <strong>Description</strong>
		                                </span>
		                            </a>
		                        </li>
		                        <li>
		                            <a href="javascript:;">
		                                <span>Schedule &amp; Pricing</span>
		                            </a>
		                        </li>
		                        <li>
		                            <a href="javascript:;">
		                                <span>Additional Info</span>
		                            </a>
		                        </li>
		                    </ul>
		                </div>
		            </div>
		        </div>
		        <div class="bd">
		            <div class="pam tab-content" id="tab1">
		                <div class="cms-content mhm mtm"><?php echo $tour->description;?></div>
		            </div>
		            <div class="pam tab-content hidden" id="tab2">
		                <div class="cms-content mhm mtm"><?php echo $tour->scheduler;?></div>
		            </div>
		            <div class="pam tab-content hidden" id="tab3">
		                <div class="cms-content mhm mtm"><?php echo $tour->additional_info;?></div>
		            </div>
		        </div>
		    </div>
		</div>


		<div class="unitRight mbl no-print">
		    <a class="inverse-link" href="#quoteform">
		        <i class="icon icon-arrow-north unit mtxs"></i>
		        Go back to top to select a date
		    </a>
		</div>
    </div><!-- end main -->

    <div class="right-col">
    	
        <form method="post" action="{{ url:site uri='tour/add_to_cart' }}" name="quoteform" id="quoteform">
        	<input type="hidden" name="tour_id" value = "<?php echo $tour->tour_id;?>">
            <div class="booking-widget-hd">
            	
                <div class="pbs ptm mlm mrm overlay hd-border">
                    <div id="booking-offer" class="inverse-txt">
                        <span class="price-from">
                            From USD
                        </span>
                        <span class="price-amount price-amount-l">
                            <span class="currency-sign mrs-neg">$</span><?php echo $tour->common_adult_price;?>
                        </span>                       
                    </div>
                    <a class="inverse-txt inverse-link" href="javascript:;">
                        <i class="icon icon-arrow-link-alt mts unit"></i> View price calendar
                    </a>                                
                    
                </div>
                <p class="txtC">
                    <a target="_blank" class="no-hover" href="javascript:;">
                        <i class="icon icon-low-price"></i>
                    </a>
                    <a class="inverse-txt info-label inverse-link strong small" target="_blank" href="javascript:;">Low Price Guarantee</a>
                </p>
                <div class="mhl mtl ptl mid-border-b">
                	<?php echo validation_errors(); ?>
					<div class="media mbs mhn">
						<i class="icon icon-number-1 img"></i>
						<div class="bd">
							<h3 class="strong man mtxs">Select Travel Date</h3>
						</div>
					</div>
					<div class="mll">
					    <div class="mam">
					    	<script type="text/javascript">
					    		function reloadAvailableDay() {
					    			$("#day").html("");
						    		var selectedMonthYear = $("#monthyear").val();
						    		var dates = window.availabeDates[selectedMonthYear];
						    		var i;
						    		
						    		var optionsHtml = "";
						    		for (i = 0; i < dates.length; i++) {
						    			optionsHtml = optionsHtml + '<option value="' + dates[i] + '">' + dates[i] + '</option>';
						    		}
						    		$("#day").html(optionsHtml);
					    		}
					    	</script>
					    	<select class="input-xsmall input-date" id="day" name="day">
					    	</select>
					    	<script  type="text/javascript">
					        		var availabeDates = new Array();
					        </script>
					        <?php 
					        	foreach ($tour->tour_dates as $m_y => $tour_date) {
					        	?>
					        	<script  type="text/javascript">
					        		availabeDates['<?php echo $m_y;?>'] = <?php echo json_encode($tour_date["available_dates"]);?>;
					        	</script>
					        	
					        	<?php 
					        	}?>
					        	
					        <select class="input-small" name="monthyear" id = "monthyear" onchange="reloadAvailableDay();">
					        	<?php 
					        	foreach ($tour->tour_dates as $tour_date) {
					        	?>
					            <option value="<?php echo $tour_date["value"]?>"><?php echo $tour_date["text"];?></option>
					            <?php 
					        	}?>
					        </select>
					        <script type="text/javascript">
					        	reloadAvailableDay();
					        </script>
					        <div class="travel-calendar" id="calendarPopup"></div>
					    </div>
					    <p>
					        <a class="action-link inverse-link" href="javascript:;">
					            <i class="icon icon-arrow-link mts unit"></i>
					            Can I change my dates?
					        </a><br>						                    
					        <a class="action-link inverse-link" href="javascript:;">
					            <i class="icon icon-arrow-link mts unit"></i>
					            What if my dates are not available?
					        </a>
					    </p>
					</div>
                        
				</div>
				<div class="mhl mid-border-b">						                                    
				    <div class="media mbs mhn">
				        <i class="icon icon-number-2 img"></i>
				        <div class="bd">
				            <h3 class="strong man mtxs">Enter Total Number of Travelers</h3>
				        </div>
				    </div>
				    <div class="mll">								
						<div class="line"> 
							<div class="unit size1of2">
								<div class="txtR mrm mts">
									<label for="ageBands0_count">Adult</label> 
									<span class="note small">(Age 3+)</span>
								</div>
							</div>
							<div class="unit size1of2">
							    <select class="input-xsmall" id="adultCount" name="adult_count">
							    	<option value="0">0</option>
							    	<option value="1">1</option>
							    	<option value="2">2</option>
							    	<option value="3">3</option>
							    	<option value="4">4</option>
							    	<option value="5">5</option>
							    	<option value="6">6</option>
							    	<option value="7">7</option>
							    	<option value="8">8</option>
							    	<option value="9">9</option>
							    </select>
							</div>
						</div>
						<div class="line mtm">
						    <div class="unit size1of2">
						        <div class="txtR mrm mts">
						            <label for="ageBands1_count">
						            	Children <span class="note small">(Age 0&ndash;2)</span>
						            </label>
						        </div>
						    </div>
						    <div class="unit size1of2 lastUnit">
						        <select class="Infant input-xsmall"  id="infantCount" name="children_count">
						        	<option value="0">0</option>
						        	<option value="1">1</option>
						        	<option value="2">2</option>
						        	<option value="3">3</option>
						        	<option value="4">4</option>
						        	<option value="5">5</option>
						        	<option value="6">6</option>
						        	<option value="7">7</option>
						        	<option value="8">8</option>
						        	<option value="9">9</option>
						        </select>
						    </div>						                    
						</div>
                            <p>
                                <a class="action-link inverse-link"  href="javascript:;">
                                    <i class="icon icon-arrow-link mts unit"></i>
                                    What's this, and can I change it?
                                </a>
                            </p>
                        </div>
                </div>
				<div class="mhl pbm">
                    <div class="btn btn-add-to-cart mhm mtl mbm">
                        <button type="submit" title="Add to Cart">Add to Cart</button>
                    </div>
                    <p class="txtC note small mbn mhn">
                        <span class="strong">Please note:</span> 
                        After your purchase is confirmed we will email you a link to your voucher. 
                        <a  href="javascript:;">What's this?</a>
                    </p>
                </div>
            </div>
            <b class="bottom booking-widget-ft"></b>    
        </form>

    </div>
</div>
</div>
