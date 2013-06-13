<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%
	String path = request.getContextPath();
%>
<title>大学生课程注册系统</title>
<META content="text/html; charset=UTF-8" http-equiv=Content-Type>
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<LINK rel=stylesheet type=text/css href="passport_files/style.css">
<style type="text/css">
body {
	margin: 0;
	padding: 0;
}

div {
	margin: -200px auto auto -275px;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 550px;
	height: 100px;
	background: url(/cpcc/images/blue_style/index_label_bg.gif) repeat-x;
	text-align: center;
	line-height: 100px;
	border: 1px solid #A8C29F;
}
</style>
<script language="javascript" defer> 
function go2URL(){
    var type='<%=request.getAttribute("InternalLogin")%>';
    if(type== "InternalLogin")
	   window.location.href= "<%=path%>/index.jsp";
	else 
	   window.location.href= "<%=path%>
		/out.action";
		}
		var pcount = 0;
		function run() {
			if (pcount >= 2) {
				go2URL();
			} else {
				pcount++;
				setTimeout('run()', 1000);
			}
		}
		run();
	</script>
</head>
<body>



	<div><%=request.getAttribute("content")%></div>



</body>
</html>
