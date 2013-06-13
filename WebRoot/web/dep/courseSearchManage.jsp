<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://www.ecside.org" prefix="ec"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>课程信息查询结果界面</title>
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
<script type="text/javascript"
	src="<%=path%>/common/ajax/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/common/ajax/jqueryAjax.js"></script>
<script type="text/javascript" charset="utf-8">
	function show(flag, e) {
		if (flag == 0) //查看
		{
			var id = e.attributes('value').value;
			ShowModalWithResult('../../web/courseManage/getCourseInforById.action?courseId='
					+ e.attributes('value').value + '&operateType=read',
					'450px', '600px');
		}
	}
</script>
</head>

<body>

	<ec:table items="resultList" var="record" listWidth="100%"
		action="./web/dep/courseSearch.action"
		pageSizeList="10,15" rowsDisplayed="10" sortRowsCallback="limit"
		retrieveRowsCallback="limit" sortable="false" filterable="false">
		<ec:row>
			<ec:column width="10%" property="_0" title="序号"
				style="{text-align:center}" value="${GLOBALROWCOUNT}"
				sortable="false" />
			<ec:column width="15%" property="COURSEID" title="课程编号"
				style="{text-align:center}" />
			<ec:column width="20%" property="COURSENM" title="课程名"
				style="{text-align:center}" />
			<ec:column width="20%" property="CREDIT" title="课程学分"
				style="{text-align:center}" />
			<ec:column width="20%" property="TEACHER" title="任课教师"
				style="{text-align:center}" />
			<ec:column width="15%" property="null" title="操作"
				style="{text-align:center}" sortable="false">
				<a href='javascript:;' value='${record.COURSEID}'
					onclick='javascrip:show(0,this);'>详细</a>
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html>
