<div class="main-search">
		<div class="search-title">WHERE DO YOU WANT TO GO?</div>
		<form>
			<div class="forms">
				<div class="form">
					<div class="column small">		
						<h4>Select Country</h4>
					</div>
					<div class="column">						
						<div class="f-item">
							<select class="country_box" with_city_box="#cityDropdown" id="countryDropdown">
								<option selected="selected" value="">Select a country</option>
							<?php foreach ($countries as $country){?>
								<option value="<?php echo $country->country_id;?>"><?php echo $country->country_name;?></option>
							<?php } ?>
							</select>
						</div>
					</div>
					<div class="column small">
						<h4>Destination</h4>
					</div>
					<div class="column">						
						<div class="f-item">
							<select disabled="true" id="cityDropdown">
								<option selected="selected" value="">Select region/city</option>
							</select>
						</div>
					</div>
					<div class="column small smaller">		
						<a class="gradient-button" id="goButton" href="javascript:;" title="Go to results">Go to results</a>
					</div>
				</div>
			</div>
		</form>
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