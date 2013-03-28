<script type="text/javascript">
$(document).ready(function(){
	$('#goButton').click(function(){
		var city = $("#cityDropdown").val();
	    var country = $("#countryDropdown").val();
	    if (city != "" || country != "")  {
		    search_url = "{{ url:site uri='tour/search' }}" + "/1/" + country;
		    if (city != "") {
		    	search_url = search_url + "/" + city;
		    }
			window.location = search_url;		
		}  else  {
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
						<select class="mbs input-full no-border country_box" with_city_box="#cityDropdown" id="countryDropdown">
							<option selected="selected" value="">Select a country</option>
							<?php
							$selectedCountryId="";
							if(isset($country)){
								$selectedCountryId=$country->country_id;
							}
							foreach ($countries as $row)
							{
								if($selectedCountryId==$row->country_id){
									echo '<option selected="selected" value="'.$row->country_id.'">'.$row->country_name.'</option>';
								}else{
									echo '<option value="'.$row->country_id.'">'.$row->country_name.'</option>';
								}
							}
							?>
						</select>

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
			</div>
		</div>
		<b class="bottom"><b class="bl"></b><b class="br"></b>
		</b>
	</div>
	<!-- on the LHS -->
	<div>
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
						<?php foreach ($hot_cities as $i => $hot_city) { ?>
						<li><a href="javascript:;"
							class="inverse-txt inverse-link info-label strong"><?php echo $hot_city->name;?></a>
						</li>
						<?php }?>
					</ul>
				</div>
			</div>
			<b class="bottom"><b class="bl"></b><b class="br"></b>
			</b>
		</div>
	</div>


	<div>
		<div class="mod basic viamod mtn mhn">
			<b class="top"><b class="tl"></b><b class="tr"></b>
			</b>
			<div class="inner">
				<div class="hd">
					<a href="javascript:;" class="no-hover">
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
</div>
