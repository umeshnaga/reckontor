function oiq_addPageMfg(s){ if(!window.oiq_pMfg) {window.oiq_pMfg = new Array();} window.oiq_pMfg.push(s); }
function oiq_addPageBrand(s){ if(!window.oiq_pMfg) {window.oiq_pMfg = new Array();} window.oiq_pMfg.push(s); }
function oiq_addPageDT(s) { if(!window.oiq_pDT) {window.oiq_pDT = new Array();} window.oiq_pDT.push(s); }
function oiq_addPageCat(s) { if(!window.oiq_pDT) {window.oiq_pDT = new Array();} window.oiq_pDT.push(s); }
function oiq_addPageProduct(s){ window.oiq_pProduct = s; }
function oiq_addPageSource(s) { window.oiq_pSource = s; }
function oiq_addPageLifecycle(s) { window.oiq_pSource = s; }
function oiq_addUserId(s) { window.oiq_pUser = s; }

function oiq_is (req) {
	var stags=document.getElementsByTagName("script");
	var ltag = stags[stags.length-1];
	if (ltag == null) { return; }

	var s=document.createElement("script");
	s.type = "text/javascript";
	s.async = true;
	s.src = req;
	
	ltag.parentNode.insertBefore(s,ltag);
}

function oiq_doTag() {
	var t = new Array();
	if(!window.oiq_pMfg && !window.oiq_pDT && !window.oiq_pProduct) {
		t.push('f|"'+encodeURIComponent(document.title)+'"');
	}else{
		var i;
		if (window.oiq_pMfg)   { for(i=0; i < window.oiq_pMfg.length; i++) { t.push('m|"'+encodeURIComponent(window.oiq_pMfg[i])+'"')}}
		if (window.oiq_pDT)    { for(i=0; i < window.oiq_pDT.length; i++) { t.push('d|"'+encodeURIComponent(window.oiq_pDT[i])+'"')}}
		if (window.oiq_pProduct) t.push('p|"'+encodeURIComponent(window.oiq_pProduct)+'"');
	}
	var req='http://px.owneriq.net/j/'+'?pt=viato'+'&t='+encodeURI(t.join());
	if (window.oiq_pSource) req+='&s='+window.oiq_pSource;
	oiq_is(req);

	if (window.oiq_pUser) {
		var oiq_user_img = new Image();
		oiq_user_img.src = "http://px.owneriq.net/euid?pt=viato&uid="+encodeURIComponent(window.oiq_pUser);
	}
}

if (typeof(_oiqq) != "undefined") {
	while (_oiqq.length != 0) {
		var t = _oiqq.shift();
		var f = window[t[0]];
		if (typeof(f) == "function") {
			if (typeof(t[1]) != "undefined") {
				f(t[1]);
			} else {
				f();
			}
		}
	}
}