$(document).ready(function() {
	$("ul.tab-control > li > a").click(function() {
		$($(this).parent().siblings(".current").removeClass("current").find("> a").attr("href")).addClass("hidden");
		$(this).parent().addClass("current");
		$($(this).attr("href")).removeClass("hidden");
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