<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" >
<html>
<head>
<style type="text/css">
.pp-list {
	height: 1%;
	overflow: hidden;
	display: table;
	border-spacing: 10px;
}

.pp-list li {
	border: 1px solid #aaa;
	width: 120px;
	height: 120px;
	text-align: center;
	vertical-align: middle;
	position: relative;
	margin: 10px; *
	float: left;
	display: table-cell;
}

.pp { *
	position: absolute;
	top: 50%;
}

.pp img { *
	position: relative;
	top: -50%;
	left: -50%;
}
</style>

<style>
body {
	text-align: center;
}

div#wrap {
	text-align: left;
	width: 999px;
	margin: 0 auto;
	background-color: #ccc;
}
</style>


<link href="<%=path%>/css/Stylesheet1.css" rel="stylesheet"
	type="text/css" />
<link href="<%=path%>/css/main.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/menu.js"></script>
<script type="text/javascript" src="<%=path%>/js/shield.js"></script>
<script type="text/javascript" src="<%=path%>/js/sysMenu.js"></script>
<link href="<%=path%>/web/systemManage/css/interface.css"
	rel="stylesheet" type="text/css">
<link href="<%=path%>/web/systemManage/css/css.css" rel="stylesheet"
	type="text/css">
<title>SRS-学院管理员界面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>
<body>
	<jsp:include page="./web/systemManage/head1.jsp" flush="true"></jsp:include>
	<jsp:include page="./web/systemManage/logininfo.jsp" flush="true"></jsp:include>
	<div id="wrap">
		<div id="leftDiv" class="xboxcontent">
			<table id="mnuList" width="150" cellspacing="0" cellpadding="0"
				border="0" class="leftMenuSyt" height="500px">
				<tr>
					<td bgcolor="#F0F0F5" id="outLookBarShow" style="height: 100%"
						valign="bottom" align="center"><script type="text/javascript">
							models = "SPLITTiTlE=学生信息管理"
									+ "SPLITItEm=学生成绩录入"
									+ "SPLITUrL=./web/dep/resultLoad.jsp"
									+ "SPLITItEm=代选申请处理"
									+ "SPLITUrL=./web/dep/subApplyLoad.action"
									+ "SPLITItEm=课程信息查询"
									+ "SPLITUrL=./web/dep/courseSearch.jsp"
									+ "SPLITItEm=学生选课查询"
									+ "SPLITUrL=./web/dep/csSearch.jsp"
									+ "SPLITItEm=学生成绩查询"
									+ "SPLITUrL=./web/dep/resultSearch.jsp"
									+ "SPLITItEm=学生信息查询"
									+ "SPLITUrL=./web/dep/stuSearch.jsp";

							var locatemodel = "学生信息管理";
							showsysMenu(models);
							locatefold(locatemodel);
							outlookbar.show();
						</script></td>
				</tr>
			</table>
		</div>
		<div id="middleDiv"
			style="vertical-align: middle; width =10px; height =590px; background: url(<%=path%>/image/sy-jtbj.gif)">
			<img src="./image/sy-jtleft.gif" id="pic" width="8px" height="20px"
				name="pic" style="cursor: hand" onClick="change()" alt="" />
		</div>

		<!-- 去掉右边的阴影长条 -->
		<div id="rightDiv" style="width=838;">
			<div class="xboxcontent"
				style="background: url(<%=path%>/image/right_top.jpg);width=100%;height=22">
				<label valign="center" id="pagename"></label>
			</div>

			<div class="New_A_announcement">
				<iframe name="mainFrame" id="mainFrame" width="100%" height="568px"
					scrolling="yes" src="<%=path%>/web/systemManage/deskTop.jsp">
				</iframe>
			</div>
		</div>
	</div>
	<jsp:include page="./web/systemManage/foot.jsp" flush="true"></jsp:include>
</body>
</html>