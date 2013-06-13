function AttachEvent(target, eventName, handler, argsObject) {
	var eventHandler = handler;
	if (argsObject) {
		eventHander = function(e) {
			handler.call(argsObject, e);
		}
	}
	if (window.attachEvent)// IE
		target.attachEvent("on" + eventName, eventHander);
	else
		// FF
		target.addEventListener(eventName, eventHander, false);
}

function doClick(e) {

	var button = e.srcElement || e.target;
	btnobjs = document.all("tabbtn");
	if (btnobjs == null)
		return;
	tmptourl = null;
	for (i = 0; i < btnobjs.length; i++) {
		if (btnobjs[i] == button) {// 选的是这个按钮
			// if(btnobjs[i].sel&&btnobjs[i].sel=='true') return;
			tmptourl = btnobjs[i].url;

			btnobjs[i].className = "butindover";
			btnobjs[i].style.backgroundImage = "url(/search/common/mytab/image/but-name02.gif)";
			btnobjs[i].select = "true";
		} else {
			btnobjs[i].className = "butind";
			btnobjs[i].style.backgroundImage = "url(/search/common/mytab/image/but-name01.gif)";
			btnobjs[i].select = "false";
		}
	}
	if (tmptourl != null) {
		document.tab1.location = tmptourl;
	}
}

function initBody() {
	var tmptourl = null;
	var btnobjs = document.getElementsByName("tabbtn");
	for (i = 0; i < btnobjs.length; i++) {
		AttachEvent(btnobjs[i], "click", doClick, btnobjs[i]);
		if (btnobjs[i].select == "true") {// 选的是这个按钮
			tmptourl = btnobjs[i].url;
			btnobjs[i].className = "butindover";
			btnobjs[i].style.backgroundImage = "url(/search/common/mytab/image/but-name02.gif)";
		} else {
			btnobjs[i].className = "butind";
			btnobjs[i].style.backgroundImage = "url(/search/common/mytab/image/but-name01.gif)";
		}
	}
	if (tmptourl != null) {
		document.tab1.location = tmptourl;
	}
}

