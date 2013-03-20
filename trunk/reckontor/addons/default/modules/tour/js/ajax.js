$(document).ready(function() {
	
	$(".country_box").bind("change", function() {
		city_box_ele = $(this).attr("with_city_box");
		if (city_box_ele && city_box_ele != '') {
			$city_box = $(city_box_ele);
			$city_box.html("");
			jQuery.ajax({
				url: SITE_URL + 'tour/cities_by_country/' + $(this).val(),
				async: false,
				success: function (cities) {
					window.cities = cities;
				}
			});
			cities = window.cities;
			cities_count = Object.keys(cities).length;
			option_html = ''; 
			for(i = 0; i < cities_count; i++) {
				option_html += '<option value="' + cities[i]['city_id'] + '">'+cities[i]['city_name']+'</option>'
			}
			$city_box.html(option_html);
		}
	});
	
});	