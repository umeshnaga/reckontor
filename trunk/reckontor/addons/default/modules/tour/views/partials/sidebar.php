<script type="text/javascript">
$(document).ready(function(){
	$('#countryDropdown').change(function(){
		$.ajax({
			url: "{{ url:site uri='tour/country/get-cities' }}",
			data: {country_id: $(this).val()},
			type: "POST",
            success: function(text) {
                var region = document.getElementById("cityDropdown");           
                $(region).html(text);                
                if (region.length > 1) {
                    region.disabled = false;
                    region.selectedIndex = 0;
                } else {
                    region.disabled = true;
                }
            }
        });
	});
	$('#goButton').click(function(){
		var city = $("#cityDropdown").val();
	    var country = $("#countryDropdown").val();

	    if (city != "") 
	    {
			window.location="{{ url:site uri='tour/city' }}"+"/"+country;		
		} 
	    else if (country != "") 
	    {
	    	window.location="{{ url:site uri='tour/country' }}"+"/"+country;
		} 
	    else 
	    {
			alert("You must select a country to search");
		}
	});
});
</script>
<div class="left-col sidebar">
	<div id="DEBUG_DIV"></div>
	<div class="mod basic viamod-alt mhn mtn">
		<b class="top"><b class="tl"></b><b class="tr"></b>
		</b>
		<div class="inner">
			<div class="hd">
				<div class="mam pbs mod-header hd-border h2">Find Things to Do</div>
			</div>
			<div class="bd">
					<div class="mhm">
						<div style="display: none;" id="tmpDisabledPascountry">
							<p>Select a country</p>
						</div>
						<select class="mbs input-full no-border" id="countryDropdown">
							<option selected="selected" value="">Select a country</option>
							<?php
							foreach ($_SESSION['countries'] as $row)
							{
								echo '<option value="'.$row['country_id'].'">'.$row['country_name'].'</option>';
							}
							?>
						</select>

						<div style="display: none;" id="tmpDisabledPasregion">
							<p>Select region/city</p>
						</div>



						<select class="input-full no-border" id="cityDropdown"
							disabled="true">
							<option selected="selected" value="">Select region/city</option>
						</select>

					</div>





					<div class="btn unitRight mam size-btn-go">
						<button value="Go" name="go" id="goButton"
							type="button">
							<span>Go</span>
						</button>
					</div>


					<input name="from_mm" value="11"
						onchange="setSelVal(this.form.from_yyyymm, this.form.from_mm.value+' '+this.form.from_yyyy.value);"
						type="hidden"> <input name="from_yyyy" value="2012" type="hidden">
					<input name="to_mm" value="11"
						onchange="setSelVal(this.form.to_yyyymm, this.form.to_mm.value+' '+this.form.to_yyyy.value);"
						type="hidden"> <input name="to_yyyy" value="2012" type="hidden"> <input
						name="section" value="ttd" type="hidden"> <input
						name="destinationID" value="" type="hidden"> <input
						name="categoryName" value="" type="hidden"> <input
						name="activities" value="all" type="hidden">
			</div>
		</div>
		<b class="bottom"><b class="bl"></b><b class="br"></b>
		</b>
	</div>
	<!-- on the LHS -->
	<div mmid="3040" layoutcode="LH_HOT_DESTINATIONS" position="1">
		<div class="mod basic viamod-alt mtn mhn">
			<b class="top"><b class="tl"></b><b class="tr"></b>
			</b>
			<div class="inner">
				<div class="hd">
					<div class="mam">
						<i class="icon icon-destinations mbm"></i>
						<div class="pbs mod-header hd-border h3">Hot Destinations</div>
					</div>
				</div>
				<div class="bd">
					<ul class="mtn">



						<li><a href="http://www.viator.com/Rome/d511-ttd"
							class="inverse-txt inverse-link info-label strong">Rome</a>
						</li>


						<li><a href="http://www.viator.com/Las-Vegas/d684-ttd"
							class="inverse-txt inverse-link info-label strong">Las Vegas</a>
						</li>


						<li><a href="http://www.viator.com/New-York-City/d687-ttd"
							class="inverse-txt inverse-link info-label strong">New York City</a>
						</li>


						<li><a href="http://www.viator.com/Paris/d479-ttd"
							class="inverse-txt inverse-link info-label strong">Paris</a>
						</li>


						<li><a href="http://www.viator.com/London/d737-ttd"
							class="inverse-txt inverse-link info-label strong">London</a>
						</li>



						<li><a href="http://www.viator.com/Florence/d519-ttd"
							class="inverse-txt inverse-link info-label strong">Florence</a>
						</li>


						<li><a href="http://www.viator.com/Venice/d522-ttd"
							class="inverse-txt inverse-link info-label strong">Venice</a>
						</li>


						<li><a href="http://www.viator.com/San-Francisco/d651-ttd"
							class="inverse-txt inverse-link info-label strong">San Francisco</a>
						</li>


						<li><a href="http://www.viator.com/Tokyo/d334-ttd"
							class="inverse-txt inverse-link info-label strong">Tokyo</a>
						</li>


						<li><a href="http://www.viator.com/Sydney/d357-ttd"
							class="inverse-txt inverse-link info-label strong">Sydney</a>
						</li>



						<li><a href="http://www.viator.com/Munich/d487-ttd"
							class="inverse-txt inverse-link info-label strong">Munich</a>
						</li>


						<li><a href="http://www.viator.com/Melbourne/d384-ttd"
							class="inverse-txt inverse-link info-label strong">Melbourne</a>
						</li>


						<li><a href="http://www.viator.com/Barcelona/d562-ttd"
							class="inverse-txt inverse-link info-label strong">Barcelona</a>
						</li>


						<li><a href="http://www.viator.com/Los-Angeles/d645-ttd"
							class="inverse-txt inverse-link info-label strong">Los Angeles</a>
						</li>


						<li class="last"><a
							href="http://www.viator.com/Amsterdam/d525-ttd"
							class="inverse-txt inverse-link info-label strong">Amsterdam</a>
						</li>


					</ul>
				</div>
			</div>
			<b class="bottom"><b class="bl"></b><b class="br"></b>
			</b>
		</div>
	</div>














	<!-- 
request.getRemoteAddr is 113.160.225.200
geoIPCountry is "VN"
-->











	<div mmid="4360" layoutcode="LH_CUST_CARE" position="2">
		<div class="mod basic viamod mtn mhn">
			<b class="top"><b class="tl"></b><b class="tr"></b>
			</b>
			<div class="inner">
				<div class="hd">


					<a href="#"
						onclick="window.open('/customerCareHelpShow.jspa?code=&amp;entryName=&amp;fromShopCart=false','popupwindow','scrollbars=1,resizable=1,width=650,height=850');return false;"
						class="no-hover">


						<div class="mam pbs mod-header hd-border h3">
							Questions?<br>Need a Hug?
						</div> </a>


				</div>
				<div class="bd">
					<p class="inverse-txt xlarge mvn">

						<a class="inverse-link" href="javascript:void(0);"
							onclick="window.open('/customerCareHelpShow.jspa?code=&amp;entryName=&amp;fromShopCart=false','popupwindow','scrollbars=1,resizable=1,width=650,height=850');return false;">

							Click Here</a><span class="inverse-txt"> or Call</span> <a
							href="javascript:void(0);"
							onclick="window.open('/customerCareHelpShow.jspa?code=&amp;entryName=&amp;fromShopCart=false','popupwindow','scrollbars=1,resizable=1,width=650,height=850');return false;"
							class="inverse-link"> +1(702) 648-5873 </a>



					</p>
					<i class="icon icon-customer-care mam"></i>
				</div>
			</div>
			<b class="bottom"><b class="bl"></b><b class="br"></b>
			</b>
		</div>
	</div>
	<div class="mod basic viamod-alt mtn mhn">
		<b class="top"><b class="tl"></b><b class="tr"></b>
		</b>
		<div class="inner">
			<div class="hd">
				<div class="mam">
					<i class="icon icon-newsletter mbm"></i>
					<div class="pbs mod-header hd-border h3">
						Get the <br>Inside Scoop
					</div>
				</div>
			</div>
			<div class="bd">
				<form name="subscribe" id="subscribe" action="#" method="get">
					<input name="EMAIL_REQUIRED" value="T" type="hidden">
					<div class="input-full-wrap mhm">
						<input id="user-email" name="EMAIL" maxlength="255"
							placeholder="Enter email address"
							class="input-full no-border sidebar-input" type="text">
					</div>
					<div class="line">
						<div class="btn unitRight mtm mhm mbs size-btn-sign-up">
							<button value="Sign up" type="submit" name="Sign up"
								onclick="f_validateForm(this.form.name);return false;">
								<span>Sign Up</span>
							</button>
						</div>
					</div>
					<p class="mtn txtR">

						<a href="#"
							onclick="window.open('/privacy-policy','privacyPolicy','toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,width=1100,height=600'); return false;"
							class="inverse-txt small inverse-link">Privacy Policy</a>

					</p>
				</form>
			</div>
		</div>
		<b class="bottom"><b class="bl"></b><b class="br"></b>
		</b>
	</div>
</div>