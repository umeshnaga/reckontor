document.write("<iframe src=\"javascript:'';\" id=\"ecos_iframe\" style=\"position:absolute; left: 0; top: 0; width: 1px; height: 1px; visibility: hidden;\" title=\"\"></iframe>");
document.write("<iframe src=\"javascript:'';\" id=\"ecos_iframe2\" style=\"position:absolute; left: 0; top: 0; width: 1px; height: 1px; visibility: hidden;\" title=\"\"></iframe>");
document.write("<div id=\"ecos_surveylayer\" style=\"position:absolute; left: 0; top: 0; width: 1px; height: 1px; visibility: hidden;\" title=\"Visitor Survey (dynamically generated)\"></div>");
/*** eDigitalSurvey survey code v5.0.10 *******/
/* Copyright (c) 2010 eDigitalResearch Ltd   */
/* Please refer to our Terms & Conditions    */
/* for conditions of use.                    */
/* Do NOT modify this code unless directed   */
/* to do so by a member of eDigitalResearch  */
/* staff.                                    */
/*********************************************/

var cookie_firstparty = true;/* change to 'false' to not use first-party cookies */

var ecos_data = '';
var ecos_data2 = '';
var ecos_data3 = '';
var ecos_test = 0;

var ecos_sid = 169842645;
var ecos_host = 'ecustomeropinions.com';
var ecos_vault = '_';
var ecos_ver = '5010';
var ecos_nc = '';
var ecos_go = 0;
var ecos_pu = 0;
var ecos_hm = 0;
var ecos_pm = 0;
var ecos_survey_size_x = 550;
var ecos_survey_size_y = 400;
var ecos_jscode = '';
var ecos_runjs = 'ecos_run();';
var ecos_proportion = 1.0;

var brok = false;
if (parseInt(navigator.appVersion.charAt(0)) >= 4)
	brok = true;


function ecos_buildurl(destpage) {
	var ecos_url = ecos_host + '/survey/' + destpage + '.php?sid=' + ecos_sid;

	ecos_url = ((document.location.protocol == 'https:') ? 'https://' : 'http://') + ecos_url;

	if (ecos_test > 0)
		ecos_url = ecos_url + '&test=1';

	ecos_url += '&v=' + ecos_ver + '&r=' + Math.round(Math.random() * 100000);
	if (ecos_vault.index != '_')
		ecos_url += '&vlt=' + ecos_vault;

	var myvar2 = '';
	myvar = window.location.href;

	var icount = 0;
	for (i=0; i<myvar.length; i++) {
		if (myvar.charAt(i) == '/')
			icount++;
		if (icount >= 3)
			myvar2 += myvar.charAt(i);
	};

	if (ecos_data.length > 0)	ecos_url += '&data=' + ecos_data;
	if (ecos_data2.length > 0)	ecos_url += '&data2=' + ecos_data2;
	if (ecos_data3.length > 0)	ecos_url += '&data3=' + ecos_data3;

	if ((screen.width > 0) && (screen.height > 0))
		ecos_url += '&xres=' + screen.width + '&yres=' + screen.height;

	if (screen.colordepth > 0)
		ecos_url += '&depth=' + screen.colordepth;

	if (ecos_proportion < 1.0) ecos_url += '&mult=' + ecos_proportion;
	ecos_url += '&url=' + escape(myvar2.substring(0,100));
	ecos_url += '&referrer=' + escape(document.referrer.substring(0,100));

	var ck;
	if (ck = ecos_getcookie('ecos'))
		ecos_url += '&ecos_cookie=' + ck;

	if (navigator.userAgent.indexOf("Safari") >= 0)
		ecos_url += '&fullurl=' + escape(window.location.href);

	return ecos_url;
};


function ecos_popup_popup() {

	var ua = navigator.userAgent;
	if ((ua.indexOf('NT 5.1') > 0) && (ua.indexOf(' SV1') > 0))
		return false;

	var sw = window.open(ecos_buildurl('survey'), 'surveywin', 'location=0,toolbar=no,width=' + ecos_survey_size_x + ',height=' + ecos_survey_size_y + ',directories=no,status=no,scrollbars=yes,resizable=yes');

	if ((ecos_pu) && (sw)) {
		sw.blur();
		sw.parent.blur();
	}

	return sw;
}


function ecos_popup_layer() {
	if (!document.getElementById)
		return false;

	var url = ecos_buildurl('layer') + '&inlayer=1';

	if (document.location.hostname != document.domain) {
		el = document.createElement('script');
		el.src = url;
		el.type = 'text/javascript';
		document.getElementsByTagName('head')[0].appendChild(el);
	} else {
		var t = '<SCR' + 'IPT LANGUAGE="Javascript" SRC="' + url + '"></SCR' + 'IPT>';
		var b, a = document.getElementById("ecos_iframe2");
		if (a.contentDocument)
			b = a.contentDocument;
		else if (a.contentWindow)
			b = a.contentWindow.document;
		else if (a.document)
			b = a.document;
		else
			return false;
		b.open();
		b.write(t);
		b.close();
	}

	return true;
}


function ecos_layer_run() {
	eval(ecos_jscode);
}

function ecos_getcookie(name)
{
	var cks = document.cookie.split(';');
	for (var i = 0; i < cks.length; i++)
	{
		var c = cks[i];
		while (c.charAt(0) == ' ') c = c.substring(1, c.length);
		if (c.indexOf(name + '=') == 0) return c.substring(name.length+1, c.length);
	}
	return '';
}

function ecos_layer_gono(delay) {
	if(delay > 0)
	        setTimeout("ecos_layer_gono()", delay);
	else
	        document.getElementById('ecos_surveylayer').style.visibility = 'hidden';
};


function ecos_layer_gosurveysize() {
	ecos_layer_gono();
	var full_survey_url = ecos_buildurl('survey') + '&doneperm=1';
	sw = window.open(full_survey_url, 'surveywin',
		'location=0,toolbar=no,width=' + ecos_survey_size_x + ',height=' + ecos_survey_size_y + ',directories=no,status=no,scrollbars=yes,resizable=yes');
	if ((ecos_pu) && (sw)) {
		sw.blur();
		sw.parent.blur();
	}
	return sw;
};


function ecos_layer_golater() {
	sw = ecos_layer_gosurveysize();
	if (sw) {
		sw.blur();
		sw.parent.blur();
	}
	return sw;
};


var runcounter = 0;
function ecos_popup() {

	if (document.getElementById)
		if (!document.getElementById("ecos_iframe"))
			if (runcounter < 10) {
				runcounter++;
				setTimeout('ecos_popup()', 100);
				return;
			};

	if (ecos_go) {

		switch (ecos_pm) {
		case 0 : ecos_popup_popup(); break;
		case 1 : ecos_popup_layer(); break;
		case 2 : if (!ecos_popup_popup()) ecos_popup_layer(); break;
		case 3 : if (!ecos_popup_layer()) ecos_popup_popup();
		};
	};
};


function ecos_run() {
	if (ecos_go) {
		if (ecos_hm == 0)
			ecos_popup();
		else if ((ecos_hm == 1) && (brok)) {
			ecos_pm = 0;
			window.onunload = ecos_popup;
		};
	};
};


function ecos_i() {
	eval(ecos_runjs);
	var dt = new Date();
	if (ecos_nc != '' && cookie_firstparty)
	{
		var ck = ecos_getcookie('ecos');
		if (ck == '')
			ck = escape(ecos_nc);
		else
		{
			var cksid = ecos_nc.split('-', 2)[0];
			var ckre = new RegExp(cksid + '-\\d+');
			var ckmatches = ck.match(ckre);
			if ((!ckmatches) || ckmatches.length == 0)
				ck = ck + '.' + escape(ecos_nc);
			else
				ck = ck.replace(ckre, escape(ecos_nc));
		}
		dt.setDate(dt.getDate() + 7300);
		document.cookie = 'ecos=' + ck + ';path=/;expires=' + dt.toGMTString();
	}
};


var runcounter2 = 0;
function ecos_load() {
	var a, b;
	if (!(a = document.getElementById("ecos_iframe"))) {
		if (++runcounter2 < 10)
			setTimeout('ecos_load()', 100);
		return;
	};

	if (document.location.hostname != document.domain) {
		el = document.createElement('script');
		el.src = ecos_buildurl('i');
		el.type = 'text/javascript';
		document.getElementsByTagName('head')[0].appendChild(el);
	} else {
		var t = '<SCR' + 'IPT LANGUAGE="Javascript" SRC="' + ecos_buildurl('i') + '"></SCR' + 'IPT>';
		if (a.contentDocument)
			b = a.contentDocument;
		else if (a.contentWindow)
			b = a.contentWindow.document;
		else if (a.document)
			b = a.document;
		if (b) {
			b.open();
			b.write(t);
			b.close();
		};
	}
};

var ecos_allow = ecos_getcookie('ecos_allow');
if (document.location.toString().match('ECOS_SHOW_SURVEY')) {
	ecos_allow = 'y';
} else {
	if (ecos_allow.length < 1) {
		if (ecos_proportion < 1.0) {
			ecos_allow = (Math.random() < ecos_proportion) ? 'y' : 'n';
			document.cookie = 'ecos_allow=' + ecos_allow + ';path=/';
		} else {
			ecos_allow = 'y';
		}
	}
}
if (ecos_allow == 'y') {

if ((document.getElementById) && (window.frames)) {
	ecos_load();
} else {
	ecos_img = new Image;
	ecos_img.src = ecos_buildurl('i') + '&nosup=1';
}}