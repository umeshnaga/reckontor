$(document).ready(function() {
	$("ul.tab-control > li > a").click(function() {
		$($(this).parent().siblings(".current").removeClass("current").find("> a").attr("href")).addClass("hidden");
		$(this).parent().addClass("current");
		$($(this).attr("href")).removeClass("hidden");
		return false;
	});
	$("#instagram_photos .img-thumb[class!='selected'] a").click(function() {
		istg_link=$(this).attr("href");
		istg_image=$(this).attr("ref-image");
		istg_caption=$(this).attr("title");
		$("#main-image-container").html('<a href="'+istg_link+'" id="tile_detail_link" class="img-link no-hover mtm"><img src="'+istg_image+'" alt="'+istg_caption+'" title="'+istg_caption+'" class="imgC img-border main-image" /></a><p class="mhn mbs strong large white-text">'+istg_caption+'</p>');
		$('#instagram_photos .img-thumb.selected').removeClass("selected");
		$(this).parent().addClass("selected");
		return false;
	});
	Viator.SegmentedSearch.init();
});

function doFreeTextSearchSubmit(id, url) {
	var temp = document.getElementById(id).value;
	temp = stringFilter(temp);
	temp = temp.replace(/^\s+/, '');
	temp = temp.replace(/\s+$/, '');
	temp = temp.replace('mount.', 'mount');
	temp = temp.replace('mt.', 'mt');
	temp = temp.replace('st.', 'st');
	temp = temp.replace('ste.', 'ste');
	temp = temp.replace('sts.', 'sts');
	temp = stripSpaces(temp);
	if (temp == '' || temp == "Search here..." || temp.length == 0
			|| temp == "Search...") {
		alert("You must enter a keyword to search");
	} else {
		document.location.href=url + "/1/" + temp; 
	}
	return false;
}

function stripSpaces(keyword) {
	if (keyword.indexOf(" ") >= 0) {
		var keywords = keyword.split(" ");
		keyword = "";
		for (i = 0; i < keywords.length; i++) {
			if (keywords[i] != "") {
				if (keyword == "") {
					keyword = keywords[i];
				} else {
					keyword += " " + keywords[i];
				}
			}
		}
	}
	return keyword;
}