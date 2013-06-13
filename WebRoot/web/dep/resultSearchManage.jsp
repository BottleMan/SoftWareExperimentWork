<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib uri="http://www.ecside.org" prefix="ec"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>成绩询结果界面</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="<%=path%>/css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/common/ecside/css/ecside_style.css" />
<script type="text/javascript"
	src="<%=path%>/common/ecside/js/prototype_mini.js"></script>
<script type="text/javascript"
	src="<%=path%>/common/ecside/js/ecside_msg_utf8_cn.js"></script>
<script type="text/javascript"
	src="<%=path%>/common/ecside/js/myecside.js"></script>
<script type="text/javascript" src="<%=path%>/js/system.js"></script>

<script type="text/javascript"
	src="<%=path%>/common/ecside/js/ecside.js"></script>
</head>

<body>

	<ec:table items="resultList" var="record" listWidth="100%"
		action="./web/dep/resultSearch.action"
		pageSizeList="10,15" rowsDisplayed="10" sortRowsCallback="limit"
		retrieveRowsCallback="limit" sortable="false" filterable="false">
		<ec:row>
			<ec:column width="5%" property="_0" title="序号"
				style="{text-align:center}" value="${GLOBALROWCOUNT}" />
			<ec:column width="15%" property="CourseId" title="课程编号"
				style="{text-align:center}" />
			<ec:column width="15%" property="CourseNM" title="课程名"
				style="{text-align:center}" />
			<ec:column width="15%" property="StudentId" title="学号"
				style="{text-align:center}" />
			<ec:column width="10%" property="Credit" title="学分"
				style="{text-align:center}" />
			<ec:column width="15%" property="Term" title="选课学期"
				style="{text-align:center}" />
			<ec:column width="10%" property="CourseGrade" title="课程成绩"
				style="{text-align:center}" />
			<ec:column width="15%" property="Pass" title="是否通过"
				style="{text-align:center}" />
		</ec:row>
	</ec:table>
</body>
</html>
