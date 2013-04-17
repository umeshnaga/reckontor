<div class="left-col sidebar">
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
							foreach ($countries as $row)
							{
								if($selected_country_id==$row->country_id){
									echo '<option selected="selected" value="'.$row->country_id.'">'.$row->country_name.'</option>';
								}else{
									echo '<option value="'.$row->country_id.'">'.$row->country_name.'</option>';
								}
							}
							?>
						</select>

						<select class="input-full no-border" id="cityDropdown"
							disabled="true" selected-value="<?php echo $selected_city_id;?>">
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

						<a class="inverse-link" href="javascript:;"
							onclick="window.open('/customerCareHelpShow.jspa?code=&amp;entryName=&amp;fromShopCart=false','popupwindow','scrollbars=1,resizable=1,width=650,height=850');return false;">

							Click Here</a><span class="inverse-txt"> or Call</span> <a
							href="javascript:;"
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
	<?php if(isset($selected_country_id)){?>
	$("#countryDropdown").trigger("change");
	<?php }?>
});
</script>