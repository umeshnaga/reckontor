/****** Start ajax.js ü ******/
var onloadIfrIDArray = new Array();
var defaultpage = ""+window.location;
var serverHost = ""+window.location.host;
if (window.location.hash != null){
    defaultpage = defaultpage.replace(window.location.hash, "");
}
defaultpage = defaultpage.substring( defaultpage.indexOf(serverHost)+serverHost.length, defaultpage.length );
defaultpage = "/exclude" + defaultpage;

function getRefToDiv(divID,oDoc) {
    if( document.getElementById ) {
        return document.getElementById(divID);
    }
    if( document.all ) {
        return document.all[divID];
    }
    if( !oDoc ) {
        oDoc = document;
    }
    if( document.layers ) {
        if( oDoc.layers[divID] ) {
            return oDoc.layers[divID];
        }
        else {
            //repeatedly run through all child layers
            for( var x = 0, y; !y && x < oDoc.layers.length; x++ ) {
                //on success, return that layer, else return nothing
                y = getRefToDiv(divID,oDoc.layers[x].document);
            }
            return y;
        }
    }
    return false;
}

function getCompStyle(obj, styleProp, rInt) {
    var cs, prop = 'undefined';
    if(document.defaultView && document.defaultView.getComputedStyle) {
        cs = document.defaultView.getComputedStyle(obj, '');
        if (cs) {
            prop = cs.getPropertyValue(styleProp);
        }
    } else if(obj.currentStyle) {
        var propName = styleProp.split('-');
        styleProp = propName[0];
        for (var i=1; i<propName.length; ++i) {
            var ch = propName[i].charAt(0);
            styleProp += propName[i].replace(ch, ch.toUpperCase());
        }
        prop = obj.currentStyle[styleProp];
    } else {
        return null;
    }
    if (rInt) {
        return parseInt(prop);
    }
    return prop;
}

function showLoading() {
    var loadingObj = document.getElementById('loadingMsg');
    var windowWidth = 0;
    var windowHeight = 0;
    var scrollXOffset = 0;
    var scrollYOffset = 0;
    var XOffset = 0;
    var YOffset = 0;
    if (loadingObj != null ) {
        if (isIE) {
            /*
			windowWidth = parent.document.documentElement.clientWidth;
			windowHeight = parent.document.documentElement.clientHeight;
			XOffset = parent.document.documentElement.scrollLeft;
			YOffset = parent.document.documentElement.scrollTop;
*/
            windowWidth = document.body.clientWidth;
            windowHeight = document.body.clientHeight;
            XOffset = document.body.scrollLeft;
            YOffset = document.body.scrollTop;
            scrollX = 0;
            scrollY = 0;
        } else {
            windowWidth = parent.window.innerWidth;
            windowHeight = parent.window.innerHeight;
            scrollX = parent.window.pageXOffset;
            scrollY = parent.window.pageYOffset;
            XOffset = 0;
            YOffset = 0;
        }
        loadingObj.style.left = (windowWidth - parseInt(parseInt(getCompStyle(loadingObj, "width")))) / 2 + scrollX + XOffset + "px";
        loadingObj.style.top = (windowHeight - parseInt(parseInt(getCompStyle(loadingObj, "height")))) / 2 + scrollY + YOffset + "px";
        //	loadingObj.left = parseInt(loadingObj.style.left);
        //	loadingObj.top = parseInt(loadingObj.style.top);
        loadingObj.style.visibility = 'visible';
    }
}

function showLoading2(windowLocation)
{
    //if there is an existing nyromodal, don't do it
    
    
    $.nmManual("/inc/loading.jsp",
    {
        callbacks: 
        {
            afterShowCont: function(nm) 
            {
                //nm.resize(true);
                if(windowLocation != null && windowLocation.length > 0)
                    window.location.href = windowLocation;
            }
        }
    });
    return false;
    
}

function hideLoading() {
    var loadingObj = document.getElementById('loadingMsg');
    if (loadingObj != null ) {
        loadingObj.style.visibility = 'hidden';
    }
}

function showDiv(divID_as_a_string) {
    //get a reference as above ...
    if (document.getElementById(divID_as_a_string) != null ) {
        myReference = getRefToDiv(divID_as_a_string);
        if( !myReference ) {
            //			window.alert('Nothing works in this browser');
            return; //don't go any further
        }
        //now we have a reference to it
        if( myReference.style ) {
            //DOM & proprietary DOM
            //myReference.style.visibility = 'visible';
            myReference.style.display = 'block';
        } else {
            //layers syntax
            myReference.visibility = 'show';
        }
    }
}

function hideDiv(divID_as_a_string) {
    //get a reference as above ...
    if (document.getElementById(divID_as_a_string) != null ) {
        myReference = getRefToDiv(divID_as_a_string);
        if( !myReference ) {
            //			window.alert('Nothing works in this browser');
            return; //don't go any further
        }
        //now we have a reference to it
        if( myReference.style ) {
            //DOM & proprietary DOM
            //myReference.style.visibility = 'hidden';
            myReference.style.display = 'none';
        } else {
            //layers syntax
            myReference.visibility = 'hidden';
        }
    }
}

/** Creates an XMLHTTPRequest object. */
function makeXMLHTTPRequest()
{
    var http_request;
    if (window.XMLHttpRequest) { // Mozilla, Safari,...
        http_request = new XMLHttpRequest();
    } else if (window.ActiveXObject) { // IE
        try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
        } catch (e) {
            try {
                http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
        }
    }

    return http_request;
}

/*
* Makes a XMLHttpRequest with the given url
*/
function makeRequest(url) {
    var http_request = makeXMLHTTPRequest();
    if (http_request.overrideMimeType) {
        http_request.overrideMimeType('text/xml');
    // See note below about this line
    }

    if (!http_request) {
        //		alert('Giving up :( Cannot create an XMLHTTP instance');
        return false;
    }
    showLoading();
    http_request.onreadystatechange = function() {
        applyContents( http_request);
    };
    try {
        http_request.open('GET', url, true);
    } catch (e) {
    //alert(e);
    }
    http_request.send(null);
}

/*
* Replace page content with content from the XMLHttpRequest
*/
function applyContents(http_request) {
    if (http_request.readyState == 4) {
        if (http_request.status == 200) {
            var content = http_request.responseText;
            //omni_clearS();
            //omni_setS(omni_parse(content));
            void(s.t());
            document.getElementById(divContentID).innerHTML = content;
            hideLoading();
        } else {
        //			alert('There was a problem with the request.');
        }
    }
}

/*
* Initialisation of DHTML history and history events
*/
function initialize() {
    dhtmlHistory.initialize();   // initialize our DHTML history
    dhtmlHistory.addListener(historyChange);   // subscribe to DHTML history change events
    // if this is the first time we have loaded the page...
    if (dhtmlHistory.isFirstLoad()) {
        checkAjaxBookMark();
    }
/*
	if (historyStorage.get("url") != null) {
		makeRequest(historyStorage.get("url"));
	}
	*/
}

/*
* Our callback to receive history change events.
*/
function historyChange(newLocation, historyData) {
    var historyMsg = historyData;
    if (newLocation != null && newLocation != "") {
        if (newLocation.indexOf("exclude") >= 0) { //add for VTC-691, so that it will scroll to internal anchors i.e #77
            makeRequest(unescape(newLocation));
            var thisPageUrl = unescape(newLocation);
            buildList(getUrlParameter(thisPageUrl, "section"));
            if (getUrlParameter(thisPageUrl, "section") != null) {
                tabState = getUrlParameter(thisPageUrl, "section");
            }
        }
    } else {
        if (defaultpage.indexOf("prodAvailSearch.jspa") < 0) {
            makeRequest(defaultpage);
        }
        buildList(getUrlParameter(defaultpage, "section"));
    }
}

/*
* Our callback to receive history change events.
*/
function displayPage(pageUrl) {
    dhtmlHistory.add(escape(pageUrl), pageUrl);  //Register page to Dthml history
    //historyStorage.put("url", pageUrl);  //Register page to Dthml history
    makeRequest(pageUrl);   //grab page
}

/*
 * Redirect user to bookmarked page
 */
function checkAjaxBookMark(){
    if (window.document.referrer.length<=0) {
        var hashedUrl = window.location.hash;
        hashedUrl = unescape(hashedUrl);
        hashedUrl = hashedUrl.replace("/exclude", "");
        hashedUrl = hashedUrl.replace("#", "");
        if (hashedUrl.length > 0) {
            window.location.replace(hashedUrl);
        }
    }
}

/*
* Returns a value in a url given the key
*/

function getUrlParameter(pageUrl, key) {
    if (pageUrl != null) {
        var justParameters = pageUrl.substring( pageUrl.indexOf("?")+1, pageUrl.length );
        if (justParameters != null) {
            var parameters = justParameters.split("&");
            for (i=0; i<parameters.length;i++) {
                var keyValue = parameters[i].split("=");
                //comparism of param key against argument key
                if (keyValue[0] == key) {
                    return keyValue[1];
                }
            }
        }

        if (key == "section") {
            if (pageUrl.indexOf("-ttd") >= 0 ) {
                return "ttd";
            } else if (pageUrl.indexOf("-vd") >= 0 ) {
                return "vd";
            } else if (pageUrl.indexOf("TravelerReviews") >= 0 ) {
                return "ur";
            } else {
                return "hl";
            }
        }
    }
}

function doAjaxModule(reqObj, params) {
    var trgObj = params[0];
    if (reqObj.readyState == 4) {
        if (reqObj.status == 200) {
            trgObj.innerHTML = reqObj.responseText;
        }
    }
}

function sbcTab(sbcTabVal, modID, defaultModClass, modClass, hRef) {
    for(var i=0;i<3;i++) {
        if (document.getElementById("mm_"+modID+"_tablist"+i) && document.getElementById("mm_"+modID+"_tab"+i)) {
            addClass(document.getElementById("mm_"+modID+"_tablist"+i), "hideMe");
            remClass(document.getElementById("mm_"+modID+"_tab"+i), "on");
        }
    }
    if (document.getElementById("mm_"+modID+"_tablist"+sbcTabVal) && document.getElementById("mm_"+modID+"_tab"+sbcTabVal)) {
        remClass(document.getElementById("mm_"+modID+"_tablist"+sbcTabVal), "hideMe");
        addClass(document.getElementById("mm_"+modID+"_tab"+sbcTabVal), "on");
    }
	
    //update the mk_mod's class annoying but true 
    var mkmod = document.getElementById("mm_"+modID); 
    mkmod.className = defaultModClass + " " + modClass; 
    
    //getXML('/exclude/shopByCategoryMM.jspa?sbcTab='+sbcTabVal+"&ieisevil="+escape(Math.random()), true, null, null);
    //hmm.. lets not use getXML as much as possible anymore jQuery is a lot better
    
    $.ajax(
    {
        url: '/exclude/shopByCategoryMM.jspa?sbcTab='+sbcTabVal,
        type: 'POST',
        dataType: 'html',
        success: function(result) 
        {
            if(hRef != null && modClass == 'smartsearch')
            {
                AJAXrefreshProductSearchResults(true, false);
                AJAXrefreshCategoriesTab();
            }
        }
    });
    
    
}

function AJAXrefreshCategoriesTab()
{
    var destinationID = $("input[name='destinationID']").val();
    $.ajax
    (
    {
        type: "POST",
        url: "AJAXReloadCategoriesModule.jspa?useOSCache=false&destinationID="+destinationID,
        success: function(data)
        {
            $("ul[qsid='category']").empty().append(data);
        }
    }
    )
}
/****** End of ajax.js ******/

/****** Start booking.js ******/
function moveNextVoucherInput(theField, theNextField) {
    if (theField.value.length == 4) {
        theField.blur();
        theNextField.focus();
    }
}
function watchGCInput(theField, theNextField) {
    if (theField.value.length < 1) {
        gcIntervalID = setInterval('moveNextVoucherInput(document.mainform.'+theField.name+', document.mainform.'+theNextField.name+')', 10);
    }
    return gcIntervalID;
}
/****** End of booking.js ******/

/****** Start calendar.js ******/
function showHideCalendar(calObj, show) {
    if (calObj != null) {
        if (typeof(show) == "undefined") {
            if (calObj.style.display == "block") {
                show = false;
            } else {
                show = true;
            }
        }
        
        //alert("debugger1 : " + $(calObj).attr("id") + " : " + $(calObj).attr("height"));
        
        //debugger;

        if (show) {
            //			calObj.timeoutID = setTimeout("showHideCalendar(document.getElementById('"+calObj.id+"'), false)", 3000);
            var calSrc = "/calendar.jspa?cid="+calObj.id+"&dy="+getSelVal(calObj.yField)+"&dm="+(parseInt(getSelVal(calObj.mField)) - 1)+"&sy="+getSelVal(calObj.yField)+"&sm="+(parseInt(getSelVal(calObj.mField)) - 1)+"&sd="+getSelVal(calObj.dField);
            if (typeof(calObj.codeField) != 'undefined') {
                if (calObj.codeField != null) {
                    calSrc += "&code="+calObj.codeField.value;
                }
            }
            if (typeof(calObj.ptField) != 'undefined') {
                if (calObj.ptField != null) {
                    calSrc += "&productType="+calObj.ptField.value;
                }
            }
            if (typeof(calObj.startDateCal) != 'undefined') {
                if (calObj.startDateCal != null) {
                    calSrc += "&fy="+getSelVal(calObj.startDateCal.yField);
                    calSrc += "&fm="+(parseInt(getSelVal(calObj.startDateCal.mField)) - 1);
                    calSrc += "&fd="+getSelVal(calObj.startDateCal.dField);
                }
            }
            if (typeof(calObj.gc) != 'undefined') {
                if (calObj.gc != null) {
                    calSrc += "&gc="+calObj.gc;
                }
            }
            if (typeof(calObj.doNotHide) != 'undefined') {
                if (calObj.doNotHide != null) {
                    calSrc += "&doNotHide="+calObj.doNotHide;
                }
            }
            //if (isIE && getInternetExplorerVersion() < 9.0) //VL re-introducing IE version check as we seem to have switched off the IE9->IE8 forcing thing or maybe MS did
            if (isIE) 
            {
                calObj.Document.location.replace(calSrc);
            } else {
                calObj.contentDocument.location.replace(calSrc);
            }
            calObj.style.visibility = "hidden";
            calObj.style.display = "block";
        } else {
            if (calObj.timeoutID) {
                clearTimeout(calObj.timeoutID);
            }
            calObj.style.display = "none";
        }
    }
}

function createCalendar(ifID, trgYYYY, trgMM, trgDD, startDateCal, srcCode, srcPT) {
    var calObj = document.createElement("IFRAME");
    calObj.setAttribute("id", ifID);
    calObj.setAttribute("width", "160");
    calObj.setAttribute("height", "380");
    calObj.style.display = "none";
    calObj.style.zIndex = "99";
    calObj.style.position = "absolute";
    calObj.style.left = "500px";
    calObj.style.top = "172px";
    calObj.style.border = "0px";
    calObj.setAttribute("scrolling", "no");
    calObj.frameBorder = 0;
    calObj.setAttribute("src", "javascript:false;");
    calObj.dispDate = new Date();
    calObj.selDate = new Date();
    calObj.onmouseover = function() {
        if (this.timeoutID) {
            clearTimeout(this.timeoutID);
        }
    };
    calObj.onmouseout = function() {
        this.timeoutID = setTimeout("showHideCalendar(document.getElementById('"+calObj.id+"'), false)", 1000);
    };
    calObj.yField = trgYYYY;
    calObj.mField = trgMM;
    calObj.dField = trgDD;
    calObj.startDateCal = startDateCal;
    calObj.ptField = srcPT;
    calObj.codeField = srcCode;
    return calObj;
}

function createCalendarDoNotHide(ifID, trgYYYY, trgMM, trgDD, startDateCal, srcCode, srcPT, gc, doNotHide) {
    var calObj = document.createElement("IFRAME");
    calObj.setAttribute("id", ifID);
    calObj.setAttribute("width", "160");
    calObj.setAttribute("height", "380");
    //calObj.style.display = "none";
    calObj.style.zIndex = "99";
    calObj.style.position = "absolute";
    //calObj.style.left = "500px";
    //calObj.style.top = "172px";
    calObj.style.border = "0px";
    calObj.setAttribute("scrolling", "no");
    calObj.frameBorder = 0;
    calObj.setAttribute("src", "javascript:false;");
    calObj.dispDate = new Date();
    calObj.selDate = new Date();
    //calObj.onmouseover = function() { if (this.timeoutID) { clearTimeout(this.timeoutID); } };
    //calObj.onmouseout = function() { this.timeoutID = setTimeout("showHideCalendar(document.getElementById('"+calObj.id+"'), false)", 1000); };
    calObj.yField = trgYYYY;
    calObj.mField = trgMM;
    calObj.dField = trgDD;
    calObj.startDateCal = startDateCal;
    calObj.ptField = srcPT;
    calObj.codeField = srcCode;
    calObj.gc = gc;
    calObj.doNotHide = doNotHide;
    return calObj;
}

function do_dateClick(calFrameRef, yyyy, mm, dd, doNotHide) {
    //debugger;
    if(calFrameRef.stopDateCal != null) {
        var stopDateCal = calFrameRef.stopDateCal;
        var currStopY = getSelVal(stopDateCal.yField)
        var currStopM = getSelVal(stopDateCal.mField)
        var currStopD = getSelVal(stopDateCal.dField);
        setSelVal(calFrameRef.yField, yyyy);
        setSelVal(calFrameRef.mField, parseInt(mm + 1));
        setSelVal(calFrameRef.dField, dd);
        //		setSelVal(stopDateCal.dField, currStopD);
        if (currStopY < yyyy || (currStopY == yyyy && currStopM < parseInt(mm + 1)) || (currStopY == yyyy && currStopM == parseInt(mm + 1) && currStopD < dd)) {
            setSelVal(stopDateCal.yField, yyyy);
            setSelVal(stopDateCal.mField, (mm+1));
            setSelVal(stopDateCal.dField, dd);
        }
    } else {
        setSelVal(calFrameRef.yField, yyyy);
        setSelVal(calFrameRef.mField, parseInt(mm + 1));
        setSelVal(calFrameRef.dField, dd);
    }
    if(!doNotHide)
    {
        showHideCalendar(calFrameRef, false);
    }
}

function resizeMe(calObj) {
    if (calObj != null) {
        calObj.height = this.document.body.scrollHeight;
        if (calObj.launcher != null) {
            var tmpObj = calObj.launcher;
            var oslTotal = 0;
            var ostTotal = 0;
            while (tmpObj.offsetParent != null) {
                oslTotal += tmpObj.offsetLeft;
                ostTotal += tmpObj.offsetTop;
                tmpObj = tmpObj.offsetParent;
            }

            var newLeft = (oslTotal + calObj.launcher.offsetWidth) + 5;
            var newTop = ostTotal;

            if (isIE) {
                windowWidth = parent.document.body.clientWidth;
                windowHeight = parent.document.body.clientHeight;
                scrollX = parent.document.body.scrollLeft;
                scrollY = parent.document.body.scrollTop;
                scrollX = parent.document.documentElement.scrollLeft;
                scrollY = parent.document.documentElement.scrollTop;
            } else {
                //debugger;
                //alert($(parent).html());
                windowWidth = parent.window.innerWidth;
                windowHeight = parent.window.innerHeight;
                scrollX = parent.window.pageXOffset;
                scrollY = parent.window.pageYOffset;
            }

            if ((newLeft + parseInt(getCompStyle(calObj, "width", true)) - scrollX) + 18 > windowWidth) {
                newLeft = windowWidth + scrollX - parseInt(calObj.width) - 18;
            }
            if ((newTop + parseInt(getCompStyle(calObj, "height", true)) - scrollY) + 18 > windowHeight) {
                newTop = windowHeight + scrollY - parseInt(calObj.height) - 18;
            }

            calObj.style.left = newLeft + "px";
            calObj.style.top = newTop + "px";
            calObj.style.visibility = "visible";
        }
    }
}

function writeBody(reqObj, params, calFrameRef) {
    var calFrameRef = params[0];
    if (reqObj.readyState == 4) {
        if (reqObj.status == 200) {
            document.body.innerHTML = reqObj.responseText;
            resizeMe(calFrameRef);
        }
    }
}

/*
 * pqSicCal1 = createCalendar('document.quoteform.year, document.quoteform.month, document.quoteform.day, document.quoteform.code, document.quoteform.productType);
 */
function showCalendarAJAX(hrefObj, year, month, code, prodType)
{
    var sd = $('input[name="dayTemp"]').val();
    var sm = $('input[name="month"]').val()-1;
    var sy = $('input[name="year"]').val();
    var calUrl = "/calendarGridQFAJAX.jspa?dy="+year+"&dm="+month+"&code="+code+"&productType="+prodType+"&sy="+sy+"&sm="+sm+"&sd="+sd;
	
    $.ajax(
    {
        url: calUrl,
        type: "POST",
        success: function(data)
        {
            //alert(data);
            var theDiv = $("#calendarPopup");
            $(theDiv).empty();
            $(theDiv).append(data);
            var pos = $(hrefObj).position();
            $(theDiv).css({
                position: "absolute", 
                left: pos.left + $(hrefObj).width()/2 - $(theDiv).width()/2, 
                top: pos.top - $(theDiv).height() + $(hrefObj).height()/2
            });
            $(theDiv).show();
            var calButton = $('#calRealButton');
            var pos = calButton.offset();
            window.popupCalPos = {
                top: pos.top,
                left: pos.left + calButton.width()
            }
            $(theDiv).css(window.popupCalPos);
        }
    }		
    );
}

/****** End of calendar.js ******/

/****** Start capsPromocode.js ******/
function getCapsPromo()
{
    var temp=document.getElementById('p-code').value;
    document.getElementById('p-code').value=temp.toUpperCase();
    return true;
}

function getSicCapsPromo()
{
    var temp=document.getElementById('promo_code').value;
    checkForIllegalChars(document.getElementById('promo_code'));
    temp = stringFilter(temp);
    temp = temp.replace(/\s+/g,'');
    document.getElementById('promo_code').value=temp.toUpperCase();
    return true;
}

function stringFilter (keyword)
{
    filteredValues = "+/?%&#";     // Characters stripped out
    var i;
    var returnString = "";
    for (i = 0; i < keyword.length; i++)
    {  // Search through string and append to unfiltered values to returnString.
        var c = keyword.charAt(i);
        if (filteredValues.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function checkForIllegalChars(field)
{
    filteredValues = "+/?%&#";
    var val = $(field).val();
    var charCount = 0;
    for (i = 0; i < val.length; i++)
    {
        //var c = val.charAt(val.length-1);
        var c = val.charAt(i);
        if (filteredValues.indexOf(c) != -1)
        {
            charCount++;
        }
    }
    if(charCount>0)
        alert("The following characters are not permitted in a Promotion Code:  +, /, ?, %, &, and #.");
}

/****** End of capsPromocode.js ******/

/****** Start cookie.js ******/
function setCookie(name, value, expires, path, domain, secure) {
    // set time, it's in milliseconds
    var today = new Date();
    today.setTime(today.getTime());

    /*
	if the expires variable is set, make the correct
	expires time, the current script below will set
	it for x number of days, to make it for hours,
	delete * 24, for minutes, delete * 60 * 24
	*/
    if (expires) {
        expires = expires * 1000 * 60 * 60 * 24;
    }
    var expires_date = new Date(today.getTime() + (expires));

    document.cookie = name + "=" +escape(value) +
    ((expires) ? ";expires=" + expires_date.toGMTString() : "") +
    ((path) ? ";path=" + path : "") +
    ((domain) ? ";domain=" + domain : "") +
    ((secure) ? ";secure" : "");
}

// this function gets the cookie, if it exists
function getCookie(name) {
    var start = document.cookie.indexOf(name + "=");
    var len = start + name.length + 1;
    if ((!start) && (name != document.cookie.substring(0, name.length))) {
        return null;
    }
    if (start == -1) return null;
    var end = document.cookie.indexOf(";", len);
    if (end == -1) end = document.cookie.length;
    return unescape(document.cookie.substring(len, end));
}

// this deletes the cookie when called
function deleteCookie(name, path, domain) {
    if (getCookie(name)) document.cookie = name + "=" +
        ((path) ? ";path=" + path : "") +
        ((domain) ? ";domain=" + domain : "") +
        ";expires=Thu, 01-Jan-1970 00:00:01 GMT";
}
/****** End of cookie.js ******/

/****** Start dateThingies.js ******/
// requires tools.js

function writeAvailDays(yField, mField, dField, fyField, fmField, fdField, cField, ptField) {
    //debugger;
    var url = '/availDates.jspa';
    url += '?yyyy=' + escape(getSelVal(yField));
    url += '&mm=' + escape(getSelVal(mField));
    url += '&dd=' + escape(getSelVal(dField));
    url += '&f=date';
    if (typeof(fyField) != 'undefined' && typeof(fmField) != 'undefined' && typeof(fdField) != 'undefined' && fyField != null && fmField != null && fdField != null) {
        url += '&fy=' + escape(getSelVal(fyField));
        url += '&fm=' + escape(getSelVal(fmField));
        url += '&fd=' + escape(getSelVal(fdField));
    }
    if (typeof(cField) != 'undefined' && typeof(ptField) != 'undefined' && cField != null && ptField != null) {
        url += '&code='+escape(cField.value);
        url += '&productType='+escape(ptField.value);
    }
    getXML(url, false, xmlDD, [dField]);
    if (dField.onchange != null && typeof(dField.onchange) != 'undefined') {
        dField.onchange();
    }
}

function writeAvailMonths(yField, mField, dField, fyFieldget, fmField, fdField, cField, ptField) {
    var url = '/availDates.jspa';
    url += '?yyyy=' + escape(getSelVal(yField));
    url += '&mm=' + escape(getSelVal(mField));
    url += '&dd=' + escape(getSelVal(dField));
    url += '&f=month';
    if (typeof(fyField) != 'undefined' && typeof(fmField) != 'undefined' && typeof(fdField) != 'undefined' && fyField != null && fmField != null && fdField != null) {
        url += '&fy=' + escape(getSelVal(fyField));
        url += '&fm=' + escape(getSelVal(fmField));
        url += '&fd=' + escape(getSelVal(fdField));
    }
    if (typeof(cField) != 'undefined' && typeof(ptField) != 'undefined' && cField != null && ptField != null) {
        url += '&code='+escape(cField.value);
        url += '&productType='+escape(ptField.value);
    }
    getXML(url, false, xmlDD, [mField]);
    if (mField.onchange != null && typeof(mField.onchange) != 'undefined') {
        mField.onchange();
    }
}

function writeAvailYears(yField, mField, dField, fyField, fmField, fdField, cField, ptField) {
    var url = '/availDates.jspa';
    url += '?yyyy=' + escape(getSelVal(yField));
    url += '&mm=' + escape(getSelVal(mField));
    url += '&dd=' + escape(getSelVal(dField));
    url += '&f=year';
    if (typeof(fyField) != 'undefined' && typeof(fmField) != 'undefined' && typeof(fdField) != 'undefined' && fyField != null && fmField != null && fdField != null) {
        url += '&fy=' + escape(getSelVal(fyField));
        url += '&fm=' + escape(getSelVal(fmField));
        url += '&fd=' + escape(getSelVal(fdField));
    }
    if (typeof(cField) != 'undefined' && typeof(ptField) != 'undefined' && cField != null && ptField != null) {
        url += '&code='+escape(cField.value);
        url += '&productType='+escape(ptField.value);
    }
    getXML(url, false, xmlDD, [yField]);
    if (yField.onchange != null && typeof(yField.onchange) != 'undefined') {
        yField.onchange();
    }
}

function writeAvailYearMonths(ymField, yField, mField, dField, fyField, fmField, fdField, cField, ptField) {
    var url = '/availDates.jspa';
    url += '?yyyy=' + escape(getSelVal(yField));
    url += '&mm=' + escape(getSelVal(mField));
    url += '&dd=' + escape(getSelVal(dField));
    url += '&f=yearmonth';
    if (typeof(fyField) != 'undefined' && typeof(fmField) != 'undefined' && typeof(fdField) != 'undefined' && fyField != null && fmField != null && fdField != null) {
        url += '&fy=' + escape(getSelVal(fyField));
        url += '&fm=' + escape(getSelVal(fmField));
        url += '&fd=' + escape(getSelVal(fdField));
    }
    if (typeof(cField) != 'undefined' && typeof(ptField) != 'undefined' && cField != null && ptField != null) {
        url += '&code='+escape(cField.value);
        url += '&productType='+escape(ptField.value);
    }
    getXML(url, false, xmlDD, [ymField]);
    if (mField.onchange != null && typeof(mField.onchange) != 'undefined') {
        mField.onchange();
    }
}
/****** End of dateThingies.js ******/

/****** Start dateTTD-popup.js ******/
function showChangeDatespopup()
{
    changedatesUrl = "http://"+document.location.host+"/common/datesTTD-popup.jsp";
    changedatesWindow = window.open(changedatesUrl,'CookiedateManagerWindow','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=650,,height=300,left=120,top=120');
    changedatesWindow.focus();
    return false;

}
/****** End of dateTTD-popup.js ******/

/****** Start doubleClick.js ******/
var trapClicksForHowManySeconds = 10;
var trapTime = 0;
var doubleClickTrapperCounter = 0;

function checkDoubleClick() {
    doubleClickTrapperCounter++;
    var trapTheClick = false;
    if (doubleClickTrapperCounter > 1) {
        trapTheClick = true;
    }

    if (trapTheClick == true) {
        var tDate = new Date();
        if (trapTime == 0) {
            trapTime = tDate.valueOf();
        } else {
            var localTrapTime = tDate.valueOf();
            if ((localTrapTime - trapTime) > (trapClicksForHowManySeconds * 1000)) {
                doubleClickTrapperCounter = 0;
                trapTime = 0;
                trapTheClick = false;
            }
        }
    }

    return trapTheClick;
}
/****** End of doubleClick.js ******/

/****** Start shopCart.js ******/
function getPageURL() {
    var pageURL = document.location.href;
    if (pageURL.indexOf("#/exclude") > 0 && !(pageURL.indexOf("#/exclude")+1 == pageURL.length) ) {
        pageURL = pageURL.substring(pageURL.indexOf("#/exclude")+1, pageURL.length)
        pageURL = pageURL.replace("/exclude", "");
        pageURL = unescape(pageURL);
    }
    return escape(pageURL);
}

function deleteSCItem(productID) {
    var delSCUrl = "/deleteFromShoppingCart.jspa?id=" + productID;
    var thisPageURL = getPageURL();
    if(thisPageURL.indexOf("agencyCodeDisplay")>0)
    {
        thisPageURL = thisPageURL.replace(/agencyCodeDisplay/,"");
    }
    if(thisPageURL.indexOf("showPromoCodeError%3DSTATE_ERROR")>0)
    {
        thisPageURL = thisPageURL.replace("showPromoCodeError%3DSTATE_ERROR","");
    }
    delSCUrl += "&thisPage="+thisPageURL;
    document.location.href = delSCUrl;
}

function confirmClearShoppingCart() {
    var result = confirm("Are you sure you want to delete everything from shopping cart?");
    if (result) {
        window.location="/clearShoppingCart.jspa";
    }
}

function displayGiftBox(checkbox, giftbox) {
    if (document.getElementById(checkbox).checked) {
        document.getElementById(giftbox).style.display = 'block';
        wrapGift2(checkbox, 'YES');
    }
    else {
        document.getElementById(giftbox).style.display = 'none';
        wrapGift2(checkbox, 'NO');
    }
}

function wrapGift(giftField, giftValue) {
    var xmlHttp;
    try
    {   // Firefox, Opera 8.0+, Safari
        xmlHttp=new XMLHttpRequest();
    }
    catch (e)
    {   // Internet Explorer
        try
        {
            xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e)
        {
            try
            {
                xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (e)
            {
                alert("Your browser does not support AJAX!");
                return false;
            }
        }
    }
    giftValue = giftValue.replace(/&/g, '!n!');
    xmlHttp.open("GET", "/wrapGift.jspa?giftField="+giftField+"&giftValue="+giftValue, true);
    xmlHttp.send(null);
}

function wrapGift2(giftField, giftValue) {
    var xmlHttp;
    try{
        xmlHttp=new XMLHttpRequest();
    }catch (e){
        try{
            xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
        }catch (e){
            try{
                xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
            }catch (e){
                alert("Your browser does not support AJAX!");
                return false;
            }
        }
    }
    xmlHttp.open("GET", "/wrapGift.jspa?giftField="+giftField+"&giftValue="+giftValue, true);
    xmlHttp.send(null);
}
/****** End of shopCart.js ******/

/****** Start showCookieManager.js ******/
function showCookieManager(jsID) {
    cookieManagerUrl = "http://"+document.location.host+"/wishlistManager.jspa";
    cookieManagerWindow = window.open(cookieManagerUrl,'CookieManagerWindow','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=650,,height=300,left=120,top=120');
    cookieManagerWindow.focus();
    return false;
}
/****** End of showCookieManager.js ******/

/****** Start showLearnGiftCert.js ******/
function showLearnGiftCert() {
    learnGiftCertUrl = "http://"+document.location.host+"/common/gc-popup.jsp";
    GiftCertWindow = window.open(learnGiftCertUrl,'GiftCertWindow','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=650,,height=600,left=120,top=120');
    GiftCertWindow.focus();
    return false;
}
/****** End of showLearnGiftCert.js ******/

/****** Start sitemap.js ******/
function siteMap_toggDest(destID, onOff) {
    if (typeof(onOff) == 'undefined') {
        onOff = 2;
    }
    var obj = document.getElementById('dest_'+destID);
    var imgObj = document.getElementById('expColImg_'+destID);
    if (obj.style.display == 'none' || onOff == 1) {
        obj.style.display = 'block';
        //imgObj.src = '/images/icon-collapse.gif';
        imgObj.src = '/images/general/toggle_minus.gif';
        imgObj.title = 'Collapse';
        imgObj.alt = 'collapse';
    } else {
        obj.style.display = 'none';
        //imgObj.src = '/images/icon-expand.gif';
        imgObj.src = '/images/general/toggle_plus.gif';
        imgObj.title = 'Expand';
        imgObj.alt = 'expand';
    }
}

function siteMap_toggAllDest(onOff) {
    var imgList = document.getElementById('main').getElementsByTagName('IMG');
    for(var i=0;i<imgList.length;i++) {
        var imgObj = imgList.item(i);
        if (imgObj.getAttribute('ID') != null) {
            if (imgObj.getAttribute('ID').indexOf('expColImg_') == 0) {
                var destID = imgObj.getAttribute('ID').substr(10);
                var destObj = document.getElementById('dest_'+destID);
                if (onOff) {
                    //imgObj.src = '/images/icon-collapse.gif';
                    imgObj.src = '/images/general/toggle_minus.gif';
                    imgObj.alt = 'collapse';
                    destObj.style.display = 'block';
                } else {
                    //imgObj.src = '/images/icon-expand.gif';
                    imgObj.src = '/images/general/toggle_plus.gif';
                    imgObj.alt = 'expand';
                    destObj.style.display = 'none';
                }
            }
        }
    }
}
/****** End of sitemap.js ******/

/****** Start spotlight.js ******/
function getSpotlight(reqObj, params) {
    var trgObj = document.getElementById(params[0]);
    if (reqObj.readyState == 4) {
        if (reqObj.status == 200) {
            trgObj.innerHTML = reqObj.responseText;
        }
    }
}
/****** End of spotlight.js ******/

/****** Start states.js ******/
States = new Array();

function state(country, value, name) {
    this.COUNTRY = country;
    this.VALUE = value;
    this.NAME = name;
}

States[0] = new state("", "", "");
States[1] = new state("CA","","Select Province");
States[2] = new state("CA","Alberta","Alberta");
States[3] = new state("CA","British Columbia","British Columbia");
States[4] = new state("CA","Manitoba","Manitoba");
States[5] = new state("CA","New Brunswick","New Brunswick");
States[6] = new state("CA","Newfoundland and Labrador","Newfoundland");
States[7] = new state("CA","Northwest Territories","Northwest Territories");
States[8] = new state("CA","Nova Scotia","Nova Scotia");
States[9] = new state("CA","Nunavut","Nunavut");
States[10] = new state("CA","Ontario","Ontario");
States[11] = new state("CA","Prince Edward Island","Prince Edward Island");
States[12] = new state("CA","Quebec","Quebec");
States[13] = new state("CA","Saskatchewan","Saskatchewan");
States[14] = new state("CA","Yukon","Yukon Territory");
States[15] = new state("US","","Select State");
States[16] = new state("US","AL","Alabama");
States[17] = new state("US","AK","Alaska");
States[18] = new state("US","AZ","Arizona");
States[19] = new state("US","AR","Arkansas");
States[20] = new state("US","CA","California");
States[21] = new state("US","CO","Colorado");
States[22] = new state("US","CT","Connecticut");
States[23] = new state("US","DE","Delaware");
States[24] = new state("US","DC","District of Columbia");
States[25] = new state("US","FL","Florida");
States[26] = new state("US","GA","Georgia");
States[27] = new state("US","HI","Hawaii");
States[28] = new state("US","ID","Idaho");
States[29] = new state("US","IL","Illinois");
States[30] = new state("US","IN","Indiana");
States[31] = new state("US","IA","Iowa");
States[32] = new state("US","KS","Kansas");
States[33] = new state("US","KY","Kentucky");
States[34] = new state("US","LA","Louisiana");
States[35] = new state("US","ME","Maine");
States[36] = new state("US","MD","Maryland");
States[37] = new state("US","MA","Massachusetts");
States[38] = new state("US","MI","Michigan");
States[39] = new state("US","MN","Minnesota");
States[40] = new state("US","MS","Mississippi");
States[41] = new state("US","MO","Missouri");
States[42] = new state("US","MT","Montana");
States[43] = new state("US","NE","Nebraska");
States[44] = new state("US","NV","Nevada");
States[45] = new state("US","NH","New Hampshire");
States[46] = new state("US","NJ","New Jersey");
States[47] = new state("US","NM","New Mexico");
States[48] = new state("US","NY","New York");
States[49] = new state("US","NC","North Carolina");
States[50] = new state("US","ND","North Dakota");
States[51] = new state("US","OH","Ohio");
States[52] = new state("US","OK","Oklahoma");
States[53] = new state("US","OR","Oregon");
States[54] = new state("US","PA","Pennsylvania");
States[55] = new state("US","RI","Rhode Island");
States[56] = new state("US","SC","South Carolina");
States[57] = new state("US","SD","South Dakota");
States[58] = new state("US","TN","Tennessee");
States[59] = new state("US","TX","Texas");
States[60] = new state("US","UT","Utah");
States[61] = new state("US","VT","Vermont");
States[62] = new state("US","VA","Virginia");
States[63] = new state("US","WA","Washington");
States[64] = new state("US","WV","West Virginia");
States[65] = new state("US","WI","Wisconsin");
States[66] = new state("US","WY","Wyoming");
States[67] = new state("AU","",  "Select State");
States[68] = new state("AU","ACT","Australian Capital Territory");
States[69] = new state("AU","NSW","New South Wales");
States[70] = new state("AU","NT" ,"Northern Territory");
States[71] = new state("AU","QLD","Queensland");
States[72] = new state("AU","SA","South Australia");
States[73] = new state("AU","TAS","Tasmania");
States[74] = new state("AU","VIC","Victoria");
States[75] = new state("AU","WA" ,"Western Australia");

function setState(theCountryField, theStateListField) {
    if (theCountryField) {
        selectedCountry = theCountryField.options[theCountryField.selectedIndex].value;
        if (selectedCountry == "US" || selectedCountry == "CA" || selectedCountry == "AU") {
            theStateListField.length = 0;
            for(var i=0;i<States.length; i++) {
                if (States[i].COUNTRY == selectedCountry) {
                    theStateListField[theStateListField.length] = new Option(States[i].NAME,States[i].VALUE);
                }
            }
        }
        else {
            theStateListField.length = 0;
        }
        if (theStateListField.length == 0) {
            theStateListField[theStateListField.length] = new Option(" ---- ","");
        }
        theStateListField.options[0].selected = true;
    }
}

function getStateByCode(theCountryCode, theStateCode) { 
    for(var i=0;i<States.length; i++) {
        if(States[i].COUNTRY != theCountryCode) { 
            continue;
        } 
        
        if (States[i].VALUE == theStateCode) {
            return States[i].NAME; 
            break; 
        }
    }
    return ""; 
}

/****** End of states.js ******/

/****** Start swfobject.js ******/
/**
 * SWFObject v1.4.2: Flash Player detection and embed - http://blog.deconcept.com/swfobject/
 *
 * SWFObject is (c) 2006 Geoff Stearns and is released under the MIT License:
 * http://www.opensource.org/licenses/mit-license.php
 *
 * **SWFObject is the SWF embed script formerly known as FlashObject. The name was changed for
 *   legal reasons.
 */
if(typeof deconcept=="undefined"){
    var deconcept=new Object();
}
if(typeof deconcept.util=="undefined"){
    deconcept.util=new Object();
}
if(typeof deconcept.SWFObjectUtil=="undefined"){
    deconcept.SWFObjectUtil=new Object();
}
deconcept.SWFObject=function(_1,id,w,h,_5,c,_7,_8,_9,_a,_b){
    if(!document.getElementById){
        return;
    }
    this.DETECT_KEY=_b?_b:"detectflash";
    this.skipDetect=deconcept.util.getRequestParameter(this.DETECT_KEY);
    this.params=new Object();
    this.variables=new Object();
    this.attributes=new Array();
    if(_1){
        this.setAttribute("swf",_1);
    }
    if(id){
        this.setAttribute("id",id);
    }
    if(w){
        this.setAttribute("width",w);
    }
    if(h){
        this.setAttribute("height",h);
    }
    if(_5){
        this.setAttribute("version",new deconcept.PlayerVersion(_5.toString().split(".")));
    }
    this.installedVer=deconcept.SWFObjectUtil.getPlayerVersion();
    if(c){
        this.addParam("bgcolor",c);
    }
    var q=_8?_8:"high";
    this.addParam("quality",q);
    this.setAttribute("useExpressInstall",_7);
    this.setAttribute("doExpressInstall",false);
    var _d=(_9)?_9:window.location;
    this.setAttribute("xiRedirectUrl",_d);
    this.setAttribute("redirectUrl","");
    if(_a){
        this.setAttribute("redirectUrl",_a);
    }
};
deconcept.SWFObject.prototype={
    setAttribute:function(_e,_f){
        this.attributes[_e]=_f;
    },
    getAttribute:function(_10){
        return this.attributes[_10];
    },
    addParam:function(_11,_12){
        this.params[_11]=_12;
    },
    getParams:function(){
        return this.params;
    },
    addVariable:function(_13,_14){
        this.variables[_13]=_14;
    },
    getVariable:function(_15){
        return this.variables[_15];
    },
    getVariables:function(){
        return this.variables;
    },
    getVariablePairs:function(){
        var _16=new Array();
        var key;
        var _18=this.getVariables();
        for(key in _18){
            _16.push(key+"="+_18[key]);
        }
        return _16;
    },
    getSWFHTML:function(){
        var _19="";
        if(navigator.plugins&&navigator.mimeTypes&&navigator.mimeTypes.length){
            if(this.getAttribute("doExpressInstall")){
                this.addVariable("MMplayerType","PlugIn");
            }
            _19="<embed wmode=\"transparent\" type=\"application/x-shockwave-flash\" src=\""+this.getAttribute("swf")+"\" width=\""+this.getAttribute("width")+"\" height=\""+this.getAttribute("height")+"\"";
            _19+=" id=\""+this.getAttribute("id")+"\" name=\""+this.getAttribute("id")+"\" ";
            var _1a=this.getParams();
            for(var key in _1a){
                _19+=key+"=\""+_1a[key]+"\" ";
            }
            var _1c=this.getVariablePairs().join("&");
            if(_1c.length>0){
                _19+="flashvars=\""+_1c+"\"";
            }
            _19+="/>";
        }else{
            if(this.getAttribute("doExpressInstall")){
                this.addVariable("MMplayerType","ActiveX");
            }
            _19="<object id=\""+this.getAttribute("id")+"\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" width=\""+this.getAttribute("width")+"\" height=\""+this.getAttribute("height")+"\">";
            _19+="<param name=\"movie\" value=\""+this.getAttribute("swf")+"\" />";
            _19+="<param name=\"wmode\" value=\"transparent\" />";
            var _1d=this.getParams();
            for(var key in _1d){
                _19+="<param name=\""+key+"\" value=\""+_1d[key]+"\" />";
            }
            var _1f=this.getVariablePairs().join("&");
            if(_1f.length>0){
                _19+="<param name=\"flashvars\" value=\""+_1f+"\" />";
            }
            _19+="</object>";
        }
        return _19;
    },
    write:function(_20){
        if(this.getAttribute("useExpressInstall")){
            var _21=new deconcept.PlayerVersion([6,0,65]);
            if(this.installedVer.versionIsValid(_21)&&!this.installedVer.versionIsValid(this.getAttribute("version"))){
                this.setAttribute("doExpressInstall",true);
                this.addVariable("MMredirectURL",escape(this.getAttribute("xiRedirectUrl")));
                document.title=document.title.slice(0,47)+" - Flash Player Installation";
                this.addVariable("MMdoctitle",document.title);
            }
        }
        if(this.skipDetect||this.getAttribute("doExpressInstall")||this.installedVer.versionIsValid(this.getAttribute("version"))){
            var n=(typeof _20=="string")?document.getElementById(_20):_20;
            n.innerHTML=this.getSWFHTML();
            return true;
        }else{
            if(this.getAttribute("redirectUrl")!=""){
                document.location.replace(this.getAttribute("redirectUrl"));
            }
        }
        return false;
    }
};
deconcept.SWFObjectUtil.getPlayerVersion=function(){
    var _23=new deconcept.PlayerVersion([0,0,0]);
    if(navigator.plugins&&navigator.mimeTypes.length){
        var x=navigator.plugins["Shockwave Flash"];
        if(x&&x.description){
            _23=new deconcept.PlayerVersion(x.description.replace(/([a-zA-Z]|\s)+/,"").replace(/(\s+r|\s+b[0-9]+)/,".").split("."));
        }
    }else{
        try{
            var axo=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");
        }
        catch(e){
            try{
                var axo=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");
                _23=new deconcept.PlayerVersion([6,0,21]);
                axo.AllowScriptAccess="always";
            }
            catch(e){
                if(_23.major==6){
                    return _23;
                }
            }
            try{
                axo=new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
            }
            catch(e){}
        }
        if(axo!=null){
            _23=new deconcept.PlayerVersion(axo.GetVariable("$version").split(" ")[1].split(","));
        }
    }
    return _23;
};
deconcept.PlayerVersion=function(_27){
    this.major=_27[0]!=null?parseInt(_27[0]):0;
    this.minor=_27[1]!=null?parseInt(_27[1]):0;
    this.rev=_27[2]!=null?parseInt(_27[2]):0;
};
deconcept.PlayerVersion.prototype.versionIsValid=function(fv){
    if(this.major<fv.major){
        return false;
    }
    if(this.major>fv.major){
        return true;
    }
    if(this.minor<fv.minor){
        return false;
    }
    if(this.minor>fv.minor){
        return true;
    }
    if(this.rev<fv.rev){
        return false;
    }
    return true;
};
deconcept.util={
    getRequestParameter:function(_29){
        var q=document.location.search||document.location.hash;
        if(q){
            var _2b=q.substring(1).split("&");
            for(var i=0;i<_2b.length;i++){
                if(_2b[i].substring(0,_2b[i].indexOf("="))==_29){
                    return _2b[i].substring((_2b[i].indexOf("=")+1));
                }
            }
        }
        return "";
    }
};
deconcept.SWFObjectUtil.cleanupSWFs=function(){
    var _2d=document.getElementsByTagName("OBJECT");
    for(var i=0;i<_2d.length;i++){
        _2d[i].style.display="none";
        for(var x in _2d[i]){
            if(typeof _2d[i][x]=="function"){
                _2d[i][x]=null;
            }
        }
    }
};
if(typeof window.onunload=="function"){
    var oldunload=window.onunload;
    window.onunload=function(){
        deconcept.SWFObjectUtil.cleanupSWFs();
        oldunload();
    };
}else{
    window.onunload=deconcept.SWFObjectUtil.cleanupSWFs;
}
if(Array.prototype.push==null){
    Array.prototype.push=function(_30){
        this[this.length]=_30;
        return this.length;
    };
    
}

var getQueryParamValue=deconcept.util.getRequestParameter;
var FlashObject=deconcept.SWFObject; // for legacy support
var SWFObject=deconcept.SWFObject;
/****** End of swfobject.js ******/

/****** Start tools.js ******/
var months = new Array(12);
months[0] = new monthObj(31,"January","Jan");
months[1] = new monthObj(28,"February","Feb");
months[2] = new monthObj(31,"March","Mar");
months[3] = new monthObj(30,"April","Apr");
months[4] = new monthObj(31,"May","May");
months[5] = new monthObj(30,"June","Jun");
months[6] = new monthObj(31,"July","Jul");
months[7] = new monthObj(31,"August","Aug");
months[8] = new monthObj(30,"September","Sep");
months[9] = new monthObj(31,"October","Oct");
months[10] = new monthObj(30,"November","Nov");
months[11] = new monthObj(31,"December","Dec");

var days = new Array(7);
days[0] = new dayObj("Sunday","Sun");
days[1] = new dayObj("Monday","Mon");
days[2] = new dayObj("Tuesday","Tue");
days[3] = new dayObj("Wednesday","Wed");
days[4] = new dayObj("Thursday","Thu");
days[5] = new dayObj("Friday","Fri");
days[6] = new dayObj("Saturday","Sat");

var isIE = (document.all && getInternetExplorerVersion()<9.0)? true:false; //VL added the version check here, looks like IE9 behaves more like normal browsers than IE

var mouseX = 0;
var mouseY = 0;

document.onmousemove = function(e) {
    if (typeof(event)!= "undefined") {
        mouseX = event.x;
        mouseY = event.y;
    } else {
        mouseX = e.pageX;
        mouseY = e.pageY;
    }
};

function setSelVal(theField, theVal) {
    if (typeof(theField.nodeName) == "SELECT" && theField.options.length > 0) {
        for(var i=0;i<theField.options.length;i++) {
            if (theField.options[i].value == theVal) {
                theField.options[i].selected = true;
            } else {
                theField.options[i].selected = false;
            }
        }
    } else {
        theField.value = theVal;
    }
    if (theField.onchange != null && typeof(theField.onchange) != 'undefined') {
        theField.onchange();
    }
}

function getSelVal(theField) {
    if (typeof(theField.nodeName) == "SELECT" && theField.options.length > 0) {
        return theField.options[theField.selectedIndex].value;
    } else {
        return theField.value;
    }
}

function rewriteDays(yField, mField, dField) {
    var year = yField.value;
    var mon = parseInt(mField.value) - 1;
    var monDays = getMonthDays(mon, year);
    var defVal = getSelVal(dField);
    for(var i=dField.length-1;i>=0;i--) {
        dField.options[i] = null;
    }
    dField.length = monDays;
    for(i=1;i<monDays+1;i++) {
        dField.options[i-1] = new Option(i, i);
    }
    setSelVal(dField, defVal);
}

function monthObj(days, name, shortName) {
    this.days = days;
    this.name = name;
    this.shortName = shortName;
}

function dayObj(name, shortName) {
    this.name = name;
    this.shortName = shortName;
}

function getMonthDays(theMonth, theYear) {
    theMonth = parseInt(theMonth, 10);
    if (theYear % 4 == 0 && theMonth == 1) {
        return 29;
    }
    else {
        return months[theMonth].days;
    }
}

function getXML(url, contExec, onReadyFunc, onReadyFuncParams) {
    var reqObj = getReqObj();
    if (reqObj) {
        if (contExec) {
            reqObj.onreadystatechange = function() {
                if (typeof(onReadyFunc) != 'undefined' && onReadyFunc != null) {
                    onReadyFunc(reqObj, onReadyFuncParams);
                }
            }
            reqObj.open("GET", url, true);
            reqObj.send("");
        } else {
            reqObj.open("GET", url, false);
            reqObj.send("");
            if (typeof(onReadyFunc) != 'undefined' && onReadyFunc != null) {
                onReadyFunc(reqObj, onReadyFuncParams);
            }
        }
    }
}

function getReqObj() {
    var reqObj = false;
    if(window.XMLHttpRequest) {
        try {
            reqObj = new XMLHttpRequest();
        } catch(e) {
            reqObj = false;
        }
    } else if(window.ActiveXObject) {
        try {
            reqObj = new ActiveXObject("Msxml2.XMLHTTP");
        } catch(e) {
            try {
                reqObj = new ActiveXObject("Microsoft.XMLHTTP");
            } catch(e) {
                reqObj = false;
            }
        }
    }
    return reqObj;
}


function addClass(obj, cName) {
    obj.className += " "+cName;
}

function remClass(obj, cName) {
    var re = new RegExp();
    re.compile("\\b"+cName+"\\b", "g");
    obj.className = obj.className.replace(re, "");
}

function unEsc(str) {
    if (str != null) {
        str = str.replace(/\++/g, " ");
        str = unescape(str);
    }
    return str;
}

function sel_processXML(xmlObj) {
    var root = xmlObj.firstChild;
    var objArr = new Array();
    if (root.nodeName == "select") {
        if (root.hasChildNodes()) {
            for(var i=0;i<root.childNodes.length;i++) {
                var node = root.childNodes[i];
                if (node.nodeName == "option") {
                    var opt = document.createElement('option');
                    opt.value = unEsc(node.getAttribute('value'));
                    opt.text = unEsc(node.getAttribute('text'));
                    for(var k=0;k<node.attributes.length;k++) {
                        var theAttr = node.attributes[k];
                        if (theAttr.nodeName == "selected") {
                            opt.selected = (unEsc(theAttr.nodeValue) == "true");
                        } else if (theAttr.nodeName == "isTheme" || theAttr.nodeName == "isPOI") {
                            opt.setAttribute(theAttr.nodeName, unEsc(theAttr.nodeValue) == "true");
                        } else {
                            opt.setAttribute(theAttr.nodeName, unEsc(theAttr.nodeValue));
                        }
                    }
                    objArr[objArr.length] = opt;
                }
                if (node.nodeName == "optgrp") {
                    var grpNode = node;
                    var grp = document.createElement('optgroup');
                    grp.label = unEsc(grpNode.getAttribute('label'));
                    objArr[objArr.length] = grp;
                    if (grpNode.hasChildNodes()) {
                        for(var j=0;j<grpNode.childNodes.length;j++) {
                            var optNode = grpNode.childNodes[j];
                            if (optNode.nodeName == "option") {
                                var opt = document.createElement('option');
                                opt.value = unEsc(optNode.getAttribute('value'));
                                opt.text = unEsc(optNode.getAttribute('text'));
                                for(var k=0;k<optNode.attributes.length;k++) {
                                    var theAttr = optNode.attributes[k];
                                    if (theAttr.nodeName == "selected") {
                                        opt.selected = (unEsc(theAttr.nodeValue) == "true");
                                    } else if (theAttr.nodeName == "isTheme" || theAttr.nodeName == "isPOI") {
                                        opt.setAttribute(theAttr.nodeName, unEsc(theAttr.nodeValue) == "true");
                                    } else {
                                        opt.setAttribute(theAttr.nodeName, unEsc(theAttr.nodeValue));
                                    }
                                }
                                if (document.implementation.createDocument) {
                                    grp.appendChild(opt);
                                } else {
                                    objArr[objArr.length] = opt;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return objArr;
}

function xmlDD(reqObj, params) {
    var selObj = params[0];
    if (typeof(selObj) != 'undefined') {
        if (reqObj.readyState == 4) {
            if (reqObj.status == 200) {
                var responseText = html_entity_decode(reqObj.responseText);
                if (responseText.indexOf("&") >= 0) {
                    // replace & to &amp; after html entity converted
                    responseText = responseText.replace(/&/g, "&amp;");
                }
                var xmlObj;
                if (document.implementation.createDocument) {
                    xmlObj = (new DOMParser()).parseFromString(responseText, "text/xml");
                } else if (window.ActiveXObject) {
                    xmlObj = document.createElement("xml");
                    xmlObj.loadXML(responseText);
                }
                addSelOpt(selObj, sel_processXML(xmlObj), true);
            }
        }
    }
}

function html_entity_decode(str) {
    var ta=document.createElement("textarea");
    ta.innerHTML=str.replace(/</g,"&lt;").replace(/>/g,"&gt;");
    return ta.value;
}


function addSelOpt(selObj, opts, clearSel) {
    if (typeof(selObj) != 'undefined') {
        if (clearSel) {
            clearSelOpt(selObj);
        }
        var selIdx = 0;
        for (var i=0;i<opts.length;i++) {
            if (opts[i].selected) {
                selIdx = i;
            }
            if (document.implementation.createDocument || opts[i].nodeName == "OPTGROUP") {
                selObj.appendChild(opts[i]);
            } else {
                selObj[selObj.length] = opts[i];
            }
        }
        if (selObj.length > selIdx) {
            selObj.options[selIdx].selected = true;
        }
    }
}

function clearSelOpt(selObj) {
    if (typeof(selObj) != 'undefined') {
        while(selObj.hasChildNodes()) {
            selObj.removeChild(selObj.firstChild);
        }
    }
}

function getInternetExplorerVersion()
//Copied from MS. Returns the version of Internet Explorer or a -1
//(indicating the use of another browser).
{
    var rv = -1; // Return value assumes failure.
    if (navigator.appName == 'Microsoft Internet Explorer')
    {
        var ua = navigator.userAgent;
        var re  = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
        if (re.exec(ua) != null)
            rv = parseFloat( RegExp.$1 );
    }
    return rv;
}

/****** End of tools.js ******/

/****** Start wishlist-popup.js ******/
//Take into accounts ajax urls, urls returned are unescaped
function getParentURL() {
    var parentURL = window.opener.document.location.href;
    if (parentURL.indexOf("#") > 0 && parentURL.indexOf("#") == parentURL.indexOf("#/exclude") && !(parentURL.indexOf("#")+1 == parentURL.length) ) {
        parentURL = parentURL.substring(parentURL.indexOf("#")+1, parentURL.length)
        parentURL = parentURL.replace("/exclude", "");
        parentURL = unescape(parentURL);
    }
    if (parentURL.indexOf("#product-display-page") > 0 || parentURL.indexOf("#intro") > 0
        || parentURL.indexOf("#schedule") > 0  || parentURL.indexOf("#pricing") > 0 || parentURL.indexOf("#additional") > 0 || parentURL.indexOf("#top") > 0 || parentURL.indexOf("#quote") > 0) {  //VTC-657
        parentURL = parentURL.substring(0, parentURL.indexOf("#"));
    }
    return parentURL;
}

function deleteAllWSItems() {
    var delAllWSUrl = "/popupDeleteAllWishlistItem.jspa";
    document.location.href = delAllWSUrl;
}

function reloadWishListMMandHeader()
{
    $("#reloadHeaderBtn").click();
    $("#reloadWishListBtn").click();
}

function reloadWishList()
{
    $.ajax
    (
    {
        type: "POST",
        url: "/wishlistAJAX.jspa",
        success: function(data)
        {
            $("div[class='mod-wishlist']").replaceWith(data);
        }
    }
    );
}

function showProduct(productCode, id, productType, productID) {
    showItemUrl = "http://"+document.location.host+"/showDetail.jspa?";
    if (productType == 'GIFT') {
        showItemUrl = "http://"+document.location.host+"/giftcertMsg.jspa?";
    }
    showItemUrl += "code=" + productCode + "&id=" + id + "&productType=" + productType + "&productId=" + productID;
    window.opener.document.location.href = showItemUrl;
    window.close();
}

function showProductRewriteURL(productCode, id, productType, productID, destName, destID, productName) {
    if (productType == 'GIFT') {
        showItemUrl = "http://"+document.location.host+"/gift-certificates-message?"+"code=" + productCode + "&id=" + id + "&productType=" + productType + "&productId=" + productID;
    } else if (productType == 'ATTRACT') {
        showItemUrl = "http://"+document.location.host+"/attractions/"+destName+"/"+productName+"/"+"d"+destID+"-"+productCode;
    } else if (productType == 'EVENT'){
        showItemUrl = "http://"+document.location.host+"/event/"+destName+"/"+productName+"/"+"d"+destID+"-"+productCode;
    } else if (productType == 'SIC'){
        showItemUrl = "http://"+document.location.host+"/tours/"+destName+"/"+productName+"/"+"d"+destID+"-"+productCode;
    }
    window.opener.document.location.href = showItemUrl;
    window.close();
}

function showProductReview(productCode, id, productType, productID) {
    showReviewItemUrl = "http://"+document.location.host+"/showProductReviews.jspa?";
    showReviewItemUrl += "code=" + productCode + "&id=" + id + "&productType=" + productType + "&productId=" + productID;
    window.opener.document.location.href = showReviewItemUrl;
    window.close();
}

function showWishlistEmailForm(newdocument) {
    wsEmailUrl = "http://"+document.location.host+"/common/emailWishlist-popup.jsp";
    document.location.href = wsEmailUrl;
    return false;
}

function closeWSManager() {
    //window.opener.document.location.href = getParentURL();
    //reloadWishListMMandHeaderInParentWindow();
    window.close();
}
/****** End of wishlist-popup.js ******/

/****** Start wishlist.js ******/
function showWishlistManager() {
    wsManagerUrl = "http://"+document.location.host+"/wishlistManager.jspa";
    wsManagerWindow = window.open(wsManagerUrl,'WishlistManagerWindow','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=700,,height=550,left=120,top=120');
    wsManagerWindow.focus();
    closeWishlistNag(true);
    return false;
}

function showWishlistEmailForm() {
    wsEmailUrl = "http://"+document.location.host+"/common/emailWishlist-popup.jsp";
    wsEmailWindow = window.open(wsEmailUrl,'EmailWindow','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=650,,height=650,left=120,top=120');
    wsEmailWindow.focus();
    return false;
}

//Take into accounts ajax urls, urls returned are escaped
function getCurrentURL() {
    var currentURL = document.location.href;

    if (currentURL.indexOf("#") > 0 && currentURL.indexOf("#") == currentURL.indexOf("#/exclude") ) {
        currentURL = currentURL.substring(currentURL.indexOf("#")+1, currentURL.length)
        currentURL = currentURL.replace("/exclude", "");
    } else {
        currentURL = escape(currentURL);
    }

    return currentURL;
}

function deleteWSItem(productCode, productType) {
    var delWSUrl = "http://"+document.location.host+"/deleteWishlistItem.jspa?ProductCode=" + productCode + "&ProductType=" + productType;
    delWSUrl += "&thisPage="+getCurrentURL();
    document.location.href = delWSUrl;
}

function deleteAllWSItems() {
    //var delAllWSUrl = "http://"+document.location.host+"/deleteAllWishlistItem.jspa?thisPage="+getCurrentURL();
    //document.location.href = delAllWSUrl;
    $.ajax(
    {
        url: "/deleteAllWishlistItem.jspa",
        type: "POST",
        success: function(data)
        {
            reloadWishListMMandHeader();
        }
    }
    )
}

function addWSItem(productCode, productType) 
{
    if(productType == null || productType.length < 1)
    {
        productType = "SIC";
    }
    addWSUrl = "http://"+document.location.host+"/addWishlistItem.jspa?";
    addWSUrl += "productCode=" + productCode + "&productType=" + productType;
    addWSUrl += "&thisPage="+getCurrentURL();
  
    $.ajax
    (
    {
        url: addWSUrl,
        type: "POST",
        success: function(data)
        {
            reloadWishListMMandHeader();
            closeWishlistNag(true);
        }
    }
    )
  
    //wsManagerWindow = window.open(addWSUrl,'WishlistManagerWindow','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=650,height=650,left=120,top=120');
    wsManagerWindow = window.open("http://"+document.location.host+"/wishlistManager.jspa",
        'WishlistManagerWindow','toolbar=no,location=no,directories=no,status=yes,menubar=yes,scrollbars=yes,resizable=yes,width=700,,height=550,left=120,top=120');
    wsManagerWindow.focus();
    return false;
}
/****** End of wishlist.js ******/


function csFindTitleSpan(target)
{
    for (var i=0; i<target.childNodes.length; i++) {
        if (target.childNodes[i].tagName.toLowerCase() == "a") {
            var a = target.childNodes[i];
            for (var j=0; j<a.childNodes.length; j++) {
                if (a.childNodes[j].tagName.toLowerCase() == "span") {
                    return a.childNodes[j];
                }
            }
        }
    }
}


// Given the response to a getProductLocations AJAX request, this function adds
// a "Location: " span to each product returned from the AJAX request.
function csHandleLocationData(divName, productCodes, data)
{
    var prefix = "cs-rec-" + divName.replace(/-/g, '_').toLowerCase();

    for (var i=0; i<productCodes.length; i++) {
        var productCode = productCodes[i];
        var target = getRefToDiv(prefix + productCode.toLowerCase());

        if (target) {
            //if (children[i].id.indexOf(prefix) == 0) {
            //var target = children[i];
            //var productCode = target.id.substring(prefix.length).toUpperCase();
            var location = csExtractLocation(data[productCode].category);

            // Add the "Location: " text.
            var text = "Location: " + location;
            var span = document.createElement("span");
            span.appendChild(document.createTextNode(text));
            target.appendChild(span);

            // Set up the product overlay handlers:
            target.setAttribute("productCode", productCode);
            target.onmouseover = function() {
                document.productOverlay.enterProduct(this, divName);
            }
            target.onmouseout  = function() {
                document.productOverlay.leaveArea(this, divName);
            }

            // Trim the product name if it's too long.
            var titleSpan = csFindTitleSpan(target);

            if (titleSpan) {
                var text = titleSpan.innerHTML;
                if (text.length > 54) {
                    var end = text.lastIndexOf(' ', 54);
                    if (end == -1) end = 54;
                    titleSpan.innerHTML = text.substring(0, end) + "...";
                }
            }

        }
    }
}


// List of words which are not spelled in sentence case.
var csSpecialCases = new Array(" and ", " da ", " DC", " de ", " del ", " el ",
    " of ", " the ", "-US");

// Special case words in uppercase.
var csSpecialCasesUpper = arrayToUpper(csSpecialCases);


// Returns str, with the characters between start (inclusive) and end (exclusive)
// replaced with repWith.
function replaceRange(str, start, end, repWith)
{
    return str.substring(0, start) +
    repWith +
    str.substring(end);
}


// Extracts the Location text from the CleverSet category and fixes up the
// text case, taking into account any special cases.
function csExtractLocation(csValue)
{
    var n = csValue.lastIndexOf(">");
    if (n >= 0) csValue = csValue.substring(n+1);

    // Convert to Sentence Case:
    var afterSep = true;
    var scStr = "";
    for (var i=0; i<csValue.length; i++) {
        var ch = csValue.charAt(i);

        if ((ch == ' ') || (ch == '.') || (ch == '-')) {
            afterSep = true;
        } else {
            if (afterSep) {
                ch = ch.toUpperCase();
            } else {
                ch = ch.toLowerCase();
            }
            afterSep = false;
        }

        scStr += ch;
    }

    var scStrUpper = scStr.toUpperCase();
    for (var i=0; i<csSpecialCases.length; i++) {
        var n = scStrUpper.indexOf(csSpecialCasesUpper[i]);
        while (n != -1) {
            var end = n + csSpecialCases[i].length;
            scStr = replaceRange(scStr, n, end, csSpecialCases[i]);
            scStrUpper = replaceRange(scStrUpper, n, end, csSpecialCasesUpper[i]);
            n = scStrUpper.indexOf(csSpecialCasesUpper[i], end);
        }
    }

    return scStr;
}


// Creates and returns a new array containing all the elements in arr, but in
// uppercase.
function arrayToUpper(arr)
{
    var dest = new Array();

    for (var i=0; i<arr.length; i++) {
        dest[i] = arr[i].toUpperCase();
    }

    return dest;
}


// Adds the product codes from the divs in the given container div.
function csFindProductCodes(container, prefix, productCodes)
{
    for (var i=0; i<container.childNodes.length; i++) {
        var childID = container.childNodes[i].id;
        if (childID) {
            if (childID.substring(0, prefix.length) == prefix) {
                var productCode = childID.substring(prefix.length).toUpperCase();
                productCodes[productCodes.length] = productCode;
            }
        }
    }
}


// Called when the CleverSet div has been loaded: Creates an getProductLocations
// AJAX request.
function csLoaded(divName)
{
    var container = getRefToDiv(divName);
    var prefix = "cs-rec-" + divName.toLowerCase().replace(/-/g, '_');
    var productCodes = new Array();

    if ((container.childNodes.length > 1) &&
        (container.childNodes[1].className == "wipe-container")) {
        var wipeContainer = container.childNodes[1];
        for (var i=0; i<wipeContainer.childNodes.length; i++) {
            csFindProductCodes(wipeContainer.childNodes[i], prefix, productCodes);
        }

    } else {
        csFindProductCodes(container, prefix, productCodes);
    }

    CleverSet.myLocationHandler = function(data)
    {
        csHandleLocationData(divName, productCodes, data);
    }

    CleverSet.getProductInfo(new Array('category'), productCodes, "myLocationHandler");
}


// Waits for the CleverSet div to load, currently by polling every 250ms for
// 30 seconds.
function csWaitForLoad(divName)
{
    if (typeof(CleverSet) != 'undefined') { // make sure that Cleverset actualyl exists
        // TODO: Try to find a way to do this that is not horrible in every way.
        var triesLeft = 120;
        var tryAgain = function() {
            if (CleverSet.erg.cond("render")) {
                if (CleverSet.erg.cond("render") >= 1) {
                    csLoaded(divName);
                }
            } else {
                triesLeft--;
                if (triesLeft > 0) {
                    setTimeout(tryAgain, 250);
                }
            }
        }
        tryAgain();
    }
}


// Stops the operation of the CleverSet wiper.
function csStopWiper(divID)
{
    if (divID) {
        CleverSet.fx.clearInterval(divID);
    }
}


// Restarts the operation of the CleverSet wiper.
function csRestartWiper(divID)
{
    if (divID) {
        var wiperDir = document.getElementById(divID).getAttribute("wiperDir");
        CleverSet.fx.setInterval(divID,
            "CleverSet.fx.wipe('#" + divID + " .wipe-container', '" + wiperDir + "', '1000')",
            7000);
    }
}


// This class tracks the product overlay, and loads/displays/hides the overlay
// when required.
function ProductOverlay(overlayDivID, isCenter)
{

    // The ID of the div which should be used to display the product overlay.
    this.overlayDivID = overlayDivID;

    // The product code of the current product.
    this.productCode = '';

    // True if the overlay is being displayed.
    this.visible = false;

    // True if the overlay is about to be hidden (unless the user moves the
    // mouse back over the product).
    this.aboutToHide = false;

    // True if the cleverset div is positioned in the center
    this.isCenter = isCenter;

    // The last CleverSet Div ID.
    this.lastCSDivID = "";


    // Called when the mouse moves over a link to a product. If we are
    // already displaying this product, keep displaying it. Otherwise,
    // load and display the appropriate product.
    this.enterProduct = function(theA, csDivID)
    {
        var productCode = theA.getAttribute("productCode");
        if ((this.visible) && (this.productCode == productCode)) {
            this.aboutToHide = false;

        } else {
            if (this.visible) this.hide();
            this.show(theA, productCode);
            if (csDivID) {
                csStopWiper(csDivID);
                this.lastCSDivID = csDivID;
            } else if (this.lastCSDivID != "") {
                csStopWiper(this.lastCSDivID);
            }
        }
    }


    // Called when the mouse moves onto the overlay.
    this.enterOverlay = function()
    {
        this.aboutToHide = false;
    }


    // Called when the mouse moves off a link to a product.
    this.leaveArea = function(theA, csDivID)
    {
        var me = this;
        me.aboutToHide = true;
        setTimeout(function()
        {
            if (me.aboutToHide) {
                me.hide();
                if (csDivID) {
                    csRestartWiper(csDivID);
                    this.lastCSDivID = csDivID;
                } else if (this.lastCSDivID != "") {
                    csRestartWiper(this.lastCSDivID);
                }
            }
        }, 500);
    }


    // Immediately displays a product overlay for a particular product.
    this.show = function(theA, productCode)
    {
        var request = makeXMLHTTPRequest();
        var overlayDiv = getRefToDiv(this.overlayDivID);
        var me = this;

        if (request) {
            request.onreadystatechange = function ()
            {
                if (request.readyState != 4) return;
                if (request.status != 200 && request.status != 304) return;

                me.visible = true;
                me.productCode = productCode;
                overlayDiv.innerHTML = request.responseText;
                overlayDiv.style.position = "absolute";
                overlayDiv.style.zIndex = 10;
                overlayDiv.style.display = "block";

                var bsIEFixDiv;
                for(var i=0;i<overlayDiv.getElementsByTagName("div").length;i++) {
                    if (overlayDiv.getElementsByTagName("div")[i].className == "bullshit_IE_fix") {
                        bsIEFixDiv = overlayDiv.getElementsByTagName("div")[i];
                    }
                    if (overlayDiv.getElementsByTagName("div")[i].className == "product") {
                        bsIEFixDiv.style.height = overlayDiv.getElementsByTagName("div")[i].offsetHeight + "px";
                        break;
                    }
                }

                if (isCenter){
                    overlayDiv.style.left = (getOffset(theA, "left") - overlayDiv.scrollWidth + 150) + "px";
                }else{
                    overlayDiv.style.left = (getOffset(theA, "left") - overlayDiv.scrollWidth + 330) + "px";
                }
                overlayDiv.style.top = (getOffset(theA, "top") - overlayDiv.scrollHeight + 40) + "px";
            }

            var url = "/getProductPopup.jspa?productCodes=" + productCode;
            request.open("GET", url, true);
            request.send("");
        }
    }


    // Immediately hides the product overlay.
    this.hide = function()
    {
        var overlayDiv = getRefToDiv(this.overlayDivID);
        overlayDiv.style.display = "none";
        this.visible = false;
        this.aboutToHide = false;
    }


    // Creates the product overlay container div.
    this.createDiv = function()
    {
        var myDiv = document.createElement("div");
        myDiv.id = this.overlayDivID;
        myDiv.style.display = "none";
        myDiv.style.position = "absolute";
        myDiv.onmouseover = function() {
            document.productOverlay.enterOverlay();
        };
        myDiv.onmouseout = function() {
            document.productOverlay.leaveArea();
        };

        document.body.appendChild(myDiv);
    }

};


// Returns the global offset of an element.
function getOffset(theEle, os)
{
    var osVal = os == 'top' ? theEle.offsetTop : theEle.offsetLeft;
    while(theEle.offsetParent) {
        osVal += os == 'top' ? theEle.offsetParent.offsetTop : theEle.offsetParent.offsetLeft;
        theEle = theEle.offsetParent;
    }
    return osVal;
}

// Shows / hides the Add To bookmarking / sharing feature
function showHideAT(theHref) {
    var theDiv = document.getElementById("addthis_dropdown15");
    if (typeof(theDiv) != 'undefined') {
        if (theDiv.style.display != "none") {
            theDiv.style.display = "none";
        } else {
            addthis_open(theHref, '', '[URL]', '[TITLE]');
            clearTimeout(theHref.timeoutID);
            theHref.timeoutID = setTimeout(addthis_close, 2000);
            theDiv.onmouseover = function(e) {
                clearTimeout(theHref.timeoutID);
            };
            theDiv.onmouseout = function(e) {
                clearTimeout(theHref.timeoutID);
                theHref.timeoutID = setTimeout(addthis_close, 2000);
            };
        }
    }
}

/**
 * VL added the remove/prepend bit
 * this is to prevent the iframes being stored in browser history
 * as per VTC-3442
 **/
function launchTourOptionIfr(callingObj, url, relPosVert, relPosHoriz, osLeft)
{
    //debugger;
    //var theIfr = document.getElementById('tourOptions_Ifr');
    //alert(callingObj);
    var theIfr = document.getElementById('tourOptions_Ifr');
    if(theIfr != null && theIfr != 'undefined')
    {
        $(theIfr).remove();
    }
    var theIfrHTML = '<iframe id="tourOptions_Ifr" name="tourOptions_Ifr" frameborder="0" scrolling="no" style="position:absolute;visibility:hidden;z-index:9999;"></iframe>';
    $("body").prepend(theIfrHTML);
    theIfr = document.getElementById('tourOptions_Ifr');
    theIfr.style.visibility = "hidden";
    theIfr.callingObj = callingObj;
    theIfr.relPosVert = relPosVert;
    theIfr.relPosHoriz = relPosHoriz;
    theIfr.osLeft = osLeft;
    url = url.replace(/\+/g," ");
    url = unescape(url);
    theIfr.src = url;
    void(document.body.appendChild(theIfr));
    //$(theIfr).show();
    //alert($(theIfr).html());
    return false;
}

function launchTourOptionIfrPop(callingObj, url, relPosVert, relPosHoriz, osLeft)
{
    //debugger;
    //var theIfr = document.getElementById('tourOptions_Ifr');
    var theIfr = document.getElementById('tourOptions_Ifr');
    if(theIfr == null || theIfr == 'undefined')
    {
        var theIfrHTML = '<iframe id="tourOptions_Ifr" name="tourOptions_Ifr" frameborder="0" scrolling="no" style="position:absolute;visibility:hidden;z-index:9999;"></iframe>';
        $("body").prepend(theIfrHTML);
        theIfr = document.getElementById('tourOptions_Ifr');
    }
    theIfr.style.visibility = "hidden";
    theIfr.callingObj = callingObj;
    theIfr.relPosVert = relPosVert;
    theIfr.relPosHoriz = relPosHoriz;
    theIfr.osLeft = osLeft;
    url = url.replace(/\+/g," ");
    url = unescape(url);
    theIfr.src = url;
    void(document.body.appendChild(theIfr));
    //$(theIfr).show();
    return false;
}


/**
 * this function is used by the pricing availability popup calendar
 */
function checkAddToCartURL()
{
    var addToCartParamsStr = $("#addToCartParams").html();
    var addToCartParms = addToCartParamsStr.split("|");
    if(addToCartParamsStr != "WAITING")
    {
        //alert(addToCartURL);
        var opnr = window.opener.document;
        var bookDate = $(opnr).find("input[id='addToCartFormBookDate']");
        $(bookDate).attr("value",addToCartParms[0]);
        var tourGrade = $(opnr).find("input[id='addToCartFormTourGrade']");
        $(tourGrade).attr("value",addToCartParms[1]);
        var itemKey = $(opnr).find("input[id='addToCartFormItemKey']");
        $(itemKey).attr("value",addToCartParms[2]);
        var btn = $(opnr).find("button[id='addToCartFormButton']");
        $(btn).click();
        window.close();
    }
}

/* three functions below are used by the ajaxCalendar feature
 * adding these here as they may be used on multiple pages
 * for this to work the page hosting the ajaxCalendar must have
 * a div calContainer and calContainerLoading (to display a loading image)
 * and be linked to appropriate styles
 * see tour_options.jsp for an example
 */
// START
function addCalendarContent(url)
{
    var calContainer = $("#calContainer");
    //replace carContainer contents with a waiting image
    var calContainerLoading = $("#calContainerLoading").html();
    $(calContainer).empty();
    $(calContainer).attr("class","calendar-month cal_month_loading");
    $(calContainer).append(calContainerLoading);
    //populate carContainer with Ajax data
    jQuery.get(url, function(data)
    {
        $(calContainer).empty();
        $(calContainer).attr("class","calendar-month");
        $(calContainer).append(data);
    });
}

function doCalPrev()
{
    var prevLinkUrl = $("a[id='calPrevUrl']").attr("url");
    addCalendarContent(prevLinkUrl);
}

function doCalNext()
{
    var nextLinkUrl = $("a[id='calNextUrl']").attr("url");
    addCalendarContent(nextLinkUrl);
}

function do_dateClickAjax(yFieldRef, mFieldRef, dFieldRef, yyyy, mm, dd, submitForm)
{
    //debugger;
    var yFR = "[name='"+yFieldRef+"']";
    var mFR = "[name='"+mFieldRef+"']";
    var dFR = "[name='"+dFieldRef+"']";
    var yFObj = $(yFR).get(0);
    var mFObj = $(mFR).get(0);
    var dFObj = $(dFR).get(0);
    setSelVal(yFObj, yyyy);
    setSelVal(mFObj, parseInt(mm + 1));
    setSelVal(dFObj, dd);
    if(submitForm)
    {
        var theButId = "button[id='calSubmit']";
        var theLinkId = "a[id='updatedate']";
        var parDoc = $(window.parent.document);
        var theBut = $(parDoc).find(theButId);
        var theLink = $(parDoc).find(theLinkId);
        if(theBut != null)
            $(theBut).click();

        if(theLink != null)
            $(theLink).click();
    }
}

/**
 * this function will split long continious strings (i.e. strings with no spaces or breaks)
 * into hyphenated "words", note, the hyphens aren't added according to any grammar rules
 * simply after a set number of characters
 */
function splitLine(st,n)
{
    var stringWords = st.split(' ');
    for (var i = 0; i < stringWords.length; i++) {
        if (stringWords[i].length > n)
        {
            stringWords[i] = stringWords[i].split('').join('&shy;');
        }
    }
    st = stringWords.join(' ');
    return st;
}

/**
 * This method can take up to 3 arguments.
The first is the maximum line length,
the second is the minimum length of a hyphenated word,
the third is a switch for the line break string.
 */
function splitLongString(str, n, hyphen, br)
{
    var str1, tem, ax, diff, lim, S= [];
    var A= str.split(/\s*\n/);
    n= n || 50;
    hyphen= hyphen || n*2;
    hyphen= Math.floor(hyphen/2);
    while(A.length){
        str1= A.shift();
        while(str1 && str1.length> n){
            if(ax=== 0 && /^\S/.test(str1)) S[S.length-1]+= '-';
            tem= str1.substring(0, n);
            ax= tem.lastIndexOf(' ')+ 1;
            if(ax== 0){
                S.push(str1.substring(0, n-1));
                str1= str1.substring(n-1);
            }
            else{
                tem= str1.substring(0, ax);
                diff= n-ax;
                if(diff> hyphen){
                    lim=ax+ hyphen;
                    while(ax<lim && /\w/.test(str1.charAt(ax))) ++ax;
                    tem= str1.substring(0, ax)+'-';
                }
                str1= str1.substring(ax);
                S.push(tem);
            }
        }
        if(str1) S.push(str1);
    }
    br= br? '<br>\n': '\n';
    return S.join(br);
}


function endsWith(testString, endingString)
{
    return testString.indexOf(endingString, testString.length - endingString.length) !== -1;
      
/*if(endingString.length > testString.length)
          return false;
      else
          return testString.indexOf(endingString)==(testString.length-endingString.length);
*/
}

function showRecaptcha(key, element, themeName)
{
    Recaptcha.create(key, element,
    {
        theme: themeName,
        tabindex: 0,
        callback: Recaptcha.focus_response_field
    });
}

//
//Word count stuff
//

//word count copied from net!   
function word_count_remaining(field, count, max) {

    var number = 0;
    var matches = $(field).val().match(/\b/g);
    if(matches) {
        number = matches.length/2;
    }
    
    var remaining = max - number

    if (remaining > 0) {  
        $(count).text(remaining);
        return true;
    } else {
        $(count).text("0");
        return false; 
    }                      
}

function remainingCharsUpdate(field, maxChars, fieldToUpdate)
{
    var remChars = maxChars - $(field).val().length;
    if(remChars >= 0)
    {
        $("#"+fieldToUpdate).html("Characters remaining: " + remChars);
    }
    else
    {
        $("#"+fieldToUpdate).html("Characters remaining: 0");
        $(field).val($(field).val().substring(0,maxChars));
    }
//alert(remChars);
}

//Used in the keypress event for word count 
function wordCountEvent(e, wordsField, countField, maxWords) {
    var result = word_count_remaining(wordsField, countField, maxWords) 
    if(e.which == 8) { //backspace always allowed!
        return true;  
    } else {
        return result;  
    }       
}

/****** Report Problem ******/
function reportProblemWindow(contentId) { 
    window.open('/content/problem/popup-reportProblem-form.jspa?contentId=' + contentId,'ReportProblemWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=720,height=700,left=120,top=120');
    return false; 
}

function addReviewWindow(pageId, destinationId) {
    window.open('/content/review/popup-postReview-form.jspa?pageId=' + pageId+'&destinationID='+destinationId,'AddReviewWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=700,height=700,left=120,top=120');
    return false; 
}


function addPhotoWindow(pageId, destinationId) {
    window.open('/content/photo/popup-uploadPhotos-form.jspa?pageId=' + pageId+'&destinationID='+destinationId+'&resetPhotoList=true','AddPhotoWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=700,height=700,left=120,top=120');
    return false; 
}

function addPhotoToProductWindow(productCode) {
    window.open('/content/photo/popup-uploadPhotos-form.jspa?productCode=' + productCode+'&resetPhotoList=true','AddPhotoWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=700,height=700,left=120,top=120');
    return false; 
}

function suggestNewAttrRecomm()
{
    $("button[id='suggestNewAttrRecomm']").click();
}

function updateSelHotelAjax(sesKey, sesValue)
{
    //alert(sesKey + '/' + sesValue);
    var ajaxUrl = '/ajax/updateSelHotelAjax.jspa?selHotelSessionKey='+sesKey+'&selHotelValue='+sesValue;
    jQuery.get(ajaxUrl, function(data){});
}

function jQueryScrollTo(elemId)
{
    $("html, body").animate(
    {
        scrollTop: $("#"+elemId).offset().top
    }, 2000);
}

/*
 * this is for MOD pages only
 */

function loadDealsCalendar(selCalDate,selDealDate)
{
    //populate contents of the details via ajax code
    //selCalDate is the date-month to display the calendar for
    //selDealDate is the date to display teh deals for
    jQuery.post("/memberOnlyDealsCalendarAJAX.jspa?calendarDateSelStr="+selCalDate+"&dealsDateSelStr="+selDealDate, {
        action: "get"
    }, function(data)

    //jQuery.get("/memberOnlyDealsCalendarAJAX.jspa?calendarDateSelStr="+selCalDate+"&dealsDateSelStr="+selDealDate, function(data)

    //VL replaced get with post because stupid IE is caching ajax requests

    {
            $("div[id='modCalendar']").empty();
            $("div[id='modCalendar']").append(data);
        });
}

/** 
 * hostUrl - includes the protocol/domain eg https://www.viator.com
 * page either sign in or up! 
 */
function showSignInUpPage(hostUrl, page)
{
    //location.href="${httpsHost}/content/account/SSL/" + page + "-form.jspa?back=true". The EL variable doesn't work in js files! 
    location.href=hostUrl + "/content/account/SSL/" + page + "-form.jspa?back=true"
}


function onCheckBoxChange(chkBox)
{
    var myChkBox = $(chkBox);
    if($(myChkBox).is(':checked'))
    {
        $(myChkBox).attr("checked", "checked");
        $(myChkBox).val("true");
    }
    else
    {
        $(myChkBox).removeAttr("checked");
        $(myChkBox).val("false");
    }
}

function getValidStr(src){
    var result="";
    for (var i = 0, n = src.length; i < n; i++) {
        if (src.charCodeAt( i ) <= 255)
        {
            result += src.charAt(i);
        }
    }
    return result;
}


function closeNyroModal()
{
    if($.nmTop())
    {
        $.nmTop().close();
    }
}

/** function to preload images
 * @param {Array} arrayOfImageURLs, array of Urls of images to preload
 * 
 */
function preloadImages(arrayOfImageURLs) {
    var images=[];
    for (var i = 0; i < arrayOfImageURLs.length; i++) {
        images[i] = new Image();
        images[i].src = arrayOfImageURLs[i];
    }   
}

function submitAtc(button) {
    var $button = $(button);    
    if ($button.data("clicked")) {
        return false;
    }
    $button.data("clicked",true);
    $button.parent("div").addClass("btn-inactive");

    if($.browser.msie && parseFloat($.browser.version) < 8){
        $button.closest("form").submit();
    }
}


function dateTimeStringToDate(dateTimeStr){
    var reggie = /(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/;
    var dateArray = reggie.exec(dateTimeStr); 
    return new Date(
        (+dateArray[1]),
        (+dateArray[2])-1, // Careful, month starts at 0!
        (+dateArray[3]),
        (+dateArray[4]),
        (+dateArray[5]),
        (+dateArray[6])
        );
}
//showWishlistNag(1,0.003472222);//variation and delay
//VTC-6545 show one or whatever version of the wishlis
//if there are no items in the wishlist then the div won't be there, which is ok with jQuery - it won't show a JS error
//@todo pass experimentID from optimizely so that it doesn't ahve to be hardcoded.'
function showWishlistNag(nagVersionNo,delay)
{
    $("div[id^='abWishlist']").each(function()
    {
        $(this).hide();
    });
    // $("#ABwishlist").hide();
    
    //for testing only. to trigger nag message instantly instead of waiting for 24 hrs
  //  $("#ABwishlist").show();
  //  $("#abWishlist"+nagVersionNo).show();
   // return;
    //end testing 
    
    // AFF-5541 don't nag the user straight away. at least the next day. 
    // the MarketingVars only contains the date last modified and not the time
    // also, if this function gets called more than once, it will only show the nag text for the latest call
    var today = new Date();
   
    
    if (Viator.MarketingVars.wishlistLastModified != null) {
        var timeWishListModified = dateTimeStringToDate(Viator.MarketingVars.wishlistLastModified);
      
        var timeNow=dateTimeStringToDate(Viator.MarketingVars.serverTime);
    
        var diff=timeNow.getTime()-timeWishListModified.getTime();
        var diffInDays=diff/(1000*60*60*24);
        //console.log(diffInDays);
   
        if( diffInDays>delay && diffInDays <10 ){
           //$("[id^=abWishlist]").hide();
           if( $("#abWishlist"+nagVersionNo).size()>0){
               $("#abWishlist"+nagVersionNo).show();
                $("#ABwishlist").show();
           }
          
        }
       
    }
    
    
    
}

/*
 * true to close,
 * false to show again (will happen when they add another item to their wishlist)
 * we'll also need to know the optimizely experiment id
 * so that we can update the cookie value to include/exclude this user from the experiment
 */
function closeWishlistNag(trueFalse)
{
  
    
    /*
     * remove the nag from DOM
     * and update session variable value
     */
    if(trueFalse)
    {
        updateSessionVarViaAJAX(true,"MARKETING_DATA_SHOW_WISHLIST_NAG", false);         
        updateDoNotCountMarkVariableViaAJAX("wishListNagABTest");
        $("#ABwishlist").hide();
    }
    if(!trueFalse)
    {
        updateSessionVarViaAJAX(true,"MARKETING_DATA_SHOW_WISHLIST_NAG", true);
        $("#ABwishlist").show();        
        updateDoNotCountMarkVariableViaAJAX("wishListNagABTest", true);
    //also trigger Optimizely to add this user to the experiment
    }
    
}

/*
 * true for add
 * false for remove
 */
function updateSessionVarViaAJAX(addRemove, varName, varValue)
{
    $.ajax(
    {
        url: "/AJAXupdateSessionVariable.jspa?sessionVarAddRemove="+addRemove+"&sessionVarName="+varName+"&sessionVarValue="+varValue,
        type: "POST",
        success: function(result)
        {
        //alert(result); don't need to do anything here
        }
    });
}

/*
 * setting resetDoNotCount to true will remove this expId from the donotcount cookie
 */
function updateDoNotCountMarkVariableViaAJAX(expId, resetDoNotCount)
{
    var theUrl = "/AJAXaddValueToDoNotCountCookie.jspa?experimentId="+expId;
    if(resetDoNotCount)
        theUrl = theUrl + "&resetDoNotCount=true";
    
    $.ajax(
    {
        url: theUrl,
        type: "POST",
        success: function(result)
        {
        //alert(result); don't need to do anything here
        }
    });
    
    
}

/*
* billboard versions will be as follows
* 
* 1) no changes to the current billboard, i.e. do nothing
* 2) replace the first position in the billboard with an image related to the last destination visited
* update the image as the user session progresses, autoscroll to the first position on home page re-load
* 3) replace teh billboard with a list of three products from the last destination visited.
* //I think have the 2 and 3 tests preloaded into a hidden div on the homepage for performance reasons, the div could be used for some other mktng experiments later
 */function billboardABTesting(billboardVersion)
{    
    var customSlide = $("#billboadABTest"+billboardVersion);
    if(customSlide){
      //$billboardSlides object is created in home.jsp page
      $billboardSlides.prependTo(customSlide,0);
    }
}
 
