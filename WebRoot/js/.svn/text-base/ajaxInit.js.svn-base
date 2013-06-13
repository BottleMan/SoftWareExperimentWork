
var XMLHttpReq;
var xmlDoc;
function createXMLHttpRequest() {
	if (window.XMLHttpRequest) {
		XMLHttpReq = new XMLHttpRequest();//Mizilla
	} else {
		if (window.ActiveXObject) {
			try {
				XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");//Old IE
			}
			catch (e) {
				try {
					XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");//New IE 
				}
				catch (e) {
				}
			}
		}
	}
	if (!XMLHttpReq) {
		window.alert("Can't Create XMLHttpRequest object!");
		return false;
	}
}
/*
创建XMLDocument对象，以XML方式操作服务器端返回的数据
Creator:余利平
Create Date:2009-5-23
*/
function loadXMLDoc(dname) {
	try { //Internet Explorer
		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
		xmlDoc.async = false;
		xmlDoc.loadXML(dname);
	}
	catch (e) {
		try {
			parser = new DOMParser();
			xmlDoc = parser.parseFromString(dname, "text/xml");
		}
		catch (e) {
		}
	}
}
/*
将xml和URL中的特殊字符处理掉
*/
function rebuildString(str){
    if(str==null)
        return null;
    str = str.toString();
    str = str.replace(/</g,'＜');
    str = str.replace(/>/g,'＞');
    str = str.replace(/\'/g,'＇');
    str = str.replace(/=/g,'＝');
    str = str.replace(/!/g,'！');
    str = str.replace(/%/g,'％');
    str = str.replace(/\+/g,'＋');
    str = str.replace(/\"/g,'＂');
    str = str.replace(/\&/g,'＆');
    str = str.replace(/\?/g,'？');
    
    //str = str.replace(/,/g,'，');
    //str = str.replace(/--/g,'——');
    //str = str.replace(/\(/g,'（');
    //str = str.replace(/\)/g,'）');
    //str = str.replace(/\|/g,'｜');
    //str = str.replace(/:/g,'：');
    //str = str.replace(/\./g,'．');
    //str = str.replace(/\//g,'／');
    //str = str.replace(/\\/g,'＼');
    //str = str.replace(/;/g,'；');
    //str = str.replace(/\[/g,'［');
    //str = str.replace(/\]/g,'］');
    //str = str.replace(/~/g,'～');
    //str = str.replace(/\^/g,'︿');
    return str;
}
