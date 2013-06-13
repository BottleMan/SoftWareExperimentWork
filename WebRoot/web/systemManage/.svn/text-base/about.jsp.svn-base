
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>SRS系统说明</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<SCRIPT language="JavaScript">
<!--
	var layers = document.layers, style = document.all, both = layers || style, idme = 908601;
	if (layers) {
		layerRef = 'document.layers';
		styleRef = '';
	}
	if (style) {
		layerRef = 'document.all';
		styleRef = '.style';
	}

	function writeOnText(obj, str) {
		if (layers)
			with (document[obj]) {
				document.open();
				document.write(str);
				document.close();
			}
		if (style)
			eval(obj + '.innerHTML= str');
	}
	//以下是输出的内容，自己修改即可。
	var dispStr = new Array(
					"<br>"
					+ "<font color=blue size=3>欢迎使用大学生选课系统SRS</font><br>"
					+ "<br>"
					+ "<font color=blue size=3>系统分为3个角色，分别是：学生、教务处管理员、学院管理员。</font><br>"
					+ "<font color=blue size=3>每个角色根据不同权限有不同的功能。</font><br>"
					+ "<br>"
					+ "<font color=blue size=3>[学生]的主要功能有：选课、注销课程、申请代选课、申请退课。</font><br>"
					+ "<br>"
					+ "<font color=blue size=3>[教务处管理员]的主要功能有：学生信息的管理（录入、删除、查询、修改），课程信息的管理（录入、删除、查询、修改），学生退课申请的处理，学生的每学期注册，学生学籍的冻结与解冻。</font><br>"
					+ "<br>"
					+ "<font color=blue size=3>[学院管理员]的主要功能有：学生信息的查询，课程信息的查询，学生选课信息的查询，代学生选课（可不考虑先修课），学生成绩的录入。</font><br>"
					+ "<br>"
					+ "<font color=red size=3>[使用建议] 使用7.0以上的IE浏览器，不要使用IE6，好吗？</font><br>"
					+ "<br>"
					+ "<font color=red size=3>[技术支持]  </font><font color=green size=3>bottle.liang@gmail.com</font><br>"
					+ "<br>"
					+ "<font color=red size=3>[版权所有] © TEAM 13 2013.5</font><br>");

	var overMe = 0;

	function txtTyper(str, idx, idObj, spObj, clr1, clr2, delay, plysnd) {
		var tmp0 = tmp1 = '', skip = 0;
		if (both && idx <= str.length) {
			if (str.charAt(idx) == '<') {
				while (str.charAt(idx) != '>')
					idx++;
				idx++;
			}
			if (str.charAt(idx) == '&' && str.charAt(idx + 1) != ' ') {
				while (str.charAt(idx) != ';')
					idx++;
				idx++;
			}
			tmp0 = str.slice(0, idx);
			tmp1 = str.charAt(idx++);

			if (overMe == 0 && plysnd == 1) {
				if (navigator.plugins[0]) {
					if (navigator.plugins["LiveAudio"][0].type == "audio/basic"
							&& navigator.javaEnabled()) {
						document.embeds[0].stop();
						setTimeout("document.embeds[0].play(false)", 100);
					}
				} else if (document.all) {
					ding.Stop();
					setTimeout("ding.Run()", 100);
				}
				overMe = 1;
			} else
				overMe = 0;

			writeOnText(idObj, "<span class="+spObj+"><font color='"+clr1+"'>"
					+ tmp0 + "</font><font color='"+clr2+"'>" + tmp1
					+ "</font></span>");
			setTimeout("txtTyper('" + str + "', " + idx + ", '" + idObj
					+ "', '" + spObj + "', '" + clr1 + "', '" + clr2 + "', "
					+ delay + " ," + plysnd + ")", delay);
		}
	}

	function init() {
		txtTyper(dispStr[0], 0, 'ttl0', 'ttl1', '#339933', '#99FF33', 50, 0);
	}
 -->
</SCRIPT>
</head>

<body bgcolor="#ffffff" onload="init()">
	<div id="wrap"
		style="background: url(<%=path%>/image/login5.jpg);border=0; height=129;width=1024">
	</div>
	<div class=ttl1 id=ttl0>
		<SPAN class=ttl1></SPAN>
	</div>
</body>
</html>


