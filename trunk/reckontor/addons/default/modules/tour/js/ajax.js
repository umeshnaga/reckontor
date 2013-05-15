$(document).ready(function() {
	
	$(".country_box").bind("change", function() {
		city_box_ele = $(this).attr("with_city_box");
		if (city_box_ele && city_box_ele != '') {
			if ($(this).val() != "") {
				$city_box = $(city_box_ele);
				$city_box.html("");
				jQuery.ajax({
					url: SITE_URL + 'tour/cities_by_country/' + $(this).val(),
					async: false,
					success: function (cities) {
						cities_count = Object.keys(cities).length;
						option_html = '<option value="">Select region/city</option>'; 
						for(i = 0; i < cities_count; i++) {
							option_html += '<option value="' + cities[i]['city_id'] + '">'+cities[i]['city_name']+'</option>'
						}
						$city_box.html(option_html);
						$city_box.attr("disabled", "");
						selected_value=$city_box.attr("selected-value");
						if(selected_value!=""){
							$city_box.find("option").filter(function() {
							    return $(this).val() == selected_value; 
							}).attr('selected', true);
							$city_box.attr("selected-value","");
						}
					}
				});				
			} else {
				$city_box.html('<option value="">Select region/city</option>');
				$city_box.attr("disabled", "true");
			}
		}
	});
});	