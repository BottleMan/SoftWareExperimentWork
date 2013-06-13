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
<title>教务处管理员退课处理界面</title>
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
		if (flag == 1) //批准
		{
			if (confirm("确认批准此申请？") == true) {
				ajaxRequest('web/crManage/dealCancelApply.action?courseId='
						+ e.attributes('value1').value + "&studentId=" + e.attributes('value2').value + "&dealFlag=" + flag + '&term' +e.attributes('value3').value);
			}
		} else//不批准
		{
			if (confirm("确认不批准此申请？") == true) {
				ajaxRequest('web/crManage/dealCancelApply.action?courseId='
						+ e.attributes('value1').value + "&studentId=" + e.attributes('value2').value + "&dealFlag=" + flag + '&term' +e.attributes('value3').value);
			}
		}
		ECSideUtil.reload('ec');
	}
</script>
</head>

<body>

	<ec:table items="csHisList" var="record" listWidth="100%"
		action="./web/crManage/getCancelApplyList.action" pageSizeList="10,15"
		rowsDisplayed="10" sortRowsCallback="limit"
		retrieveRowsCallback="limit" sortable="false" filterable="true">
		<ec:row>
			<ec:column width="10%" property="_0" title="序号"
				style="{text-align:center}" value="${GLOBALROWCOUNT}"
				sortable="false" />
			<ec:column width="15%" property="COURSEID" title="课程编号"
				style="{text-align:center}" />
			<ec:column width="20%" property="COURSENM" title="课程名"
				style="{text-align:center}" />
			<ec:column width="20%" property="STUDENTID" title="学号"
				style="{text-align:center}" />
			<ec:column width="20%" property="STUDENTNM" title="学生姓名"
				style="{text-align:center}" />
			<ec:column width="20%" property="TERM" title="学期"
				style="{text-align:center}" />
			<ec:column width="20%" property="APPLYTIME" title="申请时间"
				style="{text-align:center}" />
			<ec:column width="15%" property="null" title="操作"
				style="{text-align:center}" sortable="false">
				<a href='javascript:;' value1='${record.COURSEID}' value2='${record.STUDENTID}' value3='${record.TERM}'
					onclick='javascrip:show(1,this);'>批准</a>
				<a href='javascript:;' value1='${record.COURSEID}' value2='${record.STUDENTID}' value3='${record.TERM}'
					onclick='javascript:show(2,this);'>不批准</a>
			</ec:column>
		</ec:row>
	</ec:table>
</body>
</html>
