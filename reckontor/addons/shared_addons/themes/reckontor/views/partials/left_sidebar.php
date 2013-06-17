<div class="f-left sidebar">	
	<div class="select-dest component">
		<div class="heading heading1">WHERE DO YOU WANT TO GO?</div>
		<select class="mbs input-full no-border country_box"
			with_city_box="#cityDropdown" id="countryDropdown">
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
		<label>Country</label>
		<select class="input-full no-border" id="cityDropdown"
							disabled="true" selected-value="<?php echo $selected_city_id;?>">
							<option selected="selected" value="">Select region/city</option>
						</select>
		<label>Destination</label>
		<input type="button" value="Go" name="go" id="goButton" class="btn"/>
	</div>
	<div class="ad-banner component"><div>AD BANNER</div>
	</div>
	
	<div class="ad-banner small component"><div>AD BANNER</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$(".sidebar select").each(function() {
		//$(this).combobox();
	});
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