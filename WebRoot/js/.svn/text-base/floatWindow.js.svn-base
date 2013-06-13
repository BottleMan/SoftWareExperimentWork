var timeout;
function floatWindow(objid) {
	var value=document.getElementById(objid).attributes("tips").value
	$("#" + objid).mouseover(function (e) {
	   var floatdiv=$("<div id=\"floatdiv\"><font color=\"red\">*" +value+ 
		"</font></div>");
	$("body").append(floatdiv);
		$("#floatdiv").css({top:e.pageY, left:e.pageX}).show();
	});
	$("#" + objid).mouseout(function (e) {
		$("#floatdiv").remove();
	});
	$("#" + objid).mousemove(function (e) {
		$("#floatdiv").css({top:e.pageY, left:e.pageX}).show();
	});
}
function jqueryAjax(objid) {
var message;
	$.ajax({url:"./web/floatWindow.action?key=" + objid, cache:false, async:false, type:"POST", success:function (msg) {
		message = msg;
	
	}});
	return message;
	
}

