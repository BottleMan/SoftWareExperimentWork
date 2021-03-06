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
<title>处理课程代选界面</title>
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
		if (flag == 1) {
			if (confirm("确认批准此申请？") == true) {
				ShowModalWithResult('web/subApplyDeal.action?courseId='
						+ e.attributes('value1').value + '&studentId='
						+ e.attributes('value2').value + '&operator=1', '2px', '3px');
			}
		} else {
			if (confirm("确认不批准此申请？") == true) {
				ShowModalWithResult('web/subApplyDeal.action?courseId='
						+ e.attributes('value1').value + '&studentId='
						+ e.attributes('value2').value + '&operator=2', '2px', '3px');
			}
		}
		ECSideUtil.reload('ec');
	}
</script>
</head>

<body>

	<ec:table items="resultList" var="record" listWidth="100%"
		action="web/dep/subApplyLoad.action" pageSizeList="10,15"
		rowsDisplayed="10" sortRowsCallback="limit"
		retrieveRowsCallback="limit" sortable="false" filterable="false">
		<ec:row>
			<ec:column width="10%" property="_0" title="序号"
				style="{text-align:center}" value="${GLOBALROWCOUNT}"
				sortable="false" />
			<ec:column width="10%" property="CourseId" title="课程编号"
				style="{text-align:center}" />
			<ec:column width="20%" property="CourseNM" title="课程名"
				style="{text-align:center}" />
			<ec:column width="10%" property="StudentId" title="学号"
				style="{text-align:center}" />
			<ec:column width="10%" property="StudentNM" title="学生姓名"
				style="{text-align:center}" />
			<ec:column width="15%" property="ApplyTime" title="申请时间"
				style="{text-align:center}" />
			<ec:column width="15%" property="null" title="操作"
				style="{text-align:center}" sortable="false">
				<a href='javascript:;' value1='${record.CourseId}'
					value2='${record.StudentId}' onclick='javascript:show(1,this);'>批准</a>
				<a href='javascript:;' value1='${record.CourseId}'
					value2='${record.StudentId}' onclick='javascript:show(2,this);'>不批准</a>
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html>
