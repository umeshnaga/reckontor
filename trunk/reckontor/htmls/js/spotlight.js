function getSpotlight(reqObj, params) {
	var trgObj = document.getElementById(params[0]);
	if (reqObj.readyState == 4) {
		if (reqObj.status == 200) {
			trgObj.innerHTML = reqObj.responseText;
		}
	}
}