$(document).ready(function() {
	$("ul.tab-control > li > a").click(function() {
		$($(this).parent().siblings(".current").removeClass("current").find("> a").attr("href")).addClass("hidden");
		$(this).parent().addClass("current");
		$($(this).attr("href")).removeClass("hidden");
		return false;
	});
});	