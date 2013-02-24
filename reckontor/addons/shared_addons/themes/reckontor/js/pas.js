function isDigit(num) {
    if (num.length>1){return false;}
    var string="1234567890";
    if (string.indexOf(num)!=-1){return true;}
    return false;
}
function getCompStyle2(obj, styleProp) {
    var cs, prop = 'undefined';if(document.defaultView && document.defaultView.getComputedStyle) {cs = document.defaultView.getComputedStyle(obj, '');if (cs) { prop = cs.getPropertyValue(styleProp); }} else if(obj.currentStyle) {var propName = styleProp.split('-');styleProp = propName[0];for (var i=1; i<propName.length; ++i) {var ch = propName[i].charAt(0);styleProp += propName[i].replace(ch, ch.toUpperCase());}prop = obj.currentStyle[styleProp];} else { return null; }return prop;
}


/*function showLoading2() {
    var loadingObj = document.getElementById('loadingMsg');
    var windowWidth = 0;
    var windowHeight = 0;
    var scrollXOffset = 0;
    var scrollYOffset = 0;
    var XOffset = 0;
    var YOffset = 0;
    var scrollX = 0;
    var scrollY = 0;
    if (loadingObj != null ) {
    if (window.innerWidth){
        //Firefox browser
        windowWidth = parent.window.innerWidth;
        windowHeight = parent.window.innerHeight;
        scrollX = parent.window.pageXOffset;
        scrollY = parent.window.pageYOffset;
        XOffset = 0;
        YOffset = 0;
    }
    else if (document.documentElement && (document.documentElement.clientWidth || document.documentElement.clientHeight)) {
        //IE6+
        windowWidth = parent.document.documentElement.clientWidth;
        windowHeight = parent.document.documentElement.clientHeight;
        XOffset = parent.document.documentElement.scrollLeft;
        YOffset = parent.document.documentElement.scrollTop;
        scrollX = 0;
        scrollY = 0;
    }
    else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ){
        //Other
        windowWidth = document.body.clientWidth;
        windowHeight = document.body.clientHeight;
        XOffset = document.body.scrollLeft;
        YOffset = document.body.scrollTop;
        scrollX = 0;
        scrollY = 0;
    }

    loadingObj.style.left = (windowWidth - parseInt(parseInt(getCompStyle2(loadingObj, "width")))) / 2 + scrollX + XOffset + "px";
    loadingObj.style.top = (windowHeight - parseInt(parseInt(getCompStyle2(loadingObj, "height")))) / 2 + scrollY + YOffset + "px";
    loadingObj.style.visibility = 'visible';
    loadingObj.src='/inc/loading.jsp'; //Re-assign src so the gif reloads upon display: VTC-1248
    }
}*/

function pasCheck() {
    var pasregion = $("#pasregion").val();
    var pascountry = $("#pascountry").val();

    if (pasregion != "") 
    {
		showLoading2(pasregion);
		
	} 
    else if (pascountry != "") 
    {
		showLoading2(pascountry);
	} 
    else 
    {
		alert("You must select a country to search");
	}
	return false;
    
	/*
    if (pas.activities_checkbox.checked) {
        var toDate = new Date();
        var fromDate = new Date();
        toDate.setFullYear(pas.to_yyyy.value,pas.to_mm.value-1,pas.to_dd.value);
        fromDate.setFullYear(pas.from_yyyy.value,pas.from_mm.value-1,pas.from_dd.value);
        if (toDate<fromDate) {
            alert("The From date selected must be before the To date");
            return false;
        }
        var difference = Date.UTC(toDate.getFullYear(),toDate.getMonth(),toDate.getDate(),0,0,0) - Date.UTC(fromDate.getFullYear(),fromDate.getMonth(),fromDate.getDate(),0,0,0);
        if (difference/1000/60/60/24 > 30) {
            alert("Please verify your arrival and departure dates are within 30 days of one another. Unfortunately, we cannot process requests for trip durations greater than 30 days.");
            return false;
        }
    } else {
        document.pasForm.action = "/destProdSearch.jspa";
    }
    if (pas.country.value!="" || pas.region.value!="") {
        var srcOpt = pas.country.options[pas.country.selectedIndex];
        if (pas.region.value!="") { srcOpt = pas.region.options[pas.region.selectedIndex]; }
        for(var i=0;i<srcOpt.value.length;i++){
            if(srcOpt.getAttribute("isTheme") != null || srcOpt.getAttribute("isPOI") != null) {
                pas.categoryName.value = srcOpt.getAttribute("catName");
                if (srcOpt.getAttribute("isTheme") == "true") {
                    pas.action = "/themeProdSearch.jspa";
                } else {
                    pas.action = "/poiProdSearch.jspa";
                }
            }
        }
        pas.destinationID.value = srcOpt.getAttribute("dID");
    } else {
        alert("You must select a country to search");
        return false;
    }
    showLoading2();
    return doPasLoad(pas);
    */
}

/**
 * Just reload assuming that the stuff is correct?? 
 * @param pas
 * @return
 */
function pasReload(pas) {
    pas.action = "/destProdSearch.jspa";
    var srcOpt = pas.country.options[pas.country.selectedIndex];
    if (pas.region.value!="") { srcOpt = pas.region.options[pas.region.selectedIndex]; }
    pas.destinationID.value = srcOpt.getAttribute("dID");
    return doPasLoad(pas, true);
}
 
function setActivities() {
    document.pasForm.activities_checkbox.checked=true;
    document.pasForm.activities.value = "from";
}
