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
<title>学生选课历史界面</title>
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

	<ec:table items="csHisList" var="record" listWidth="100%"
		action="web/crManage/CSHistory.action"
		pageSizeList="10,15" rowsDisplayed="10" sortRowsCallback="limit"
		retrieveRowsCallback="limit" sortable="false" filterable="true">
		<ec:row>
			<ec:column width="10%" property="_0" title="序号"
				style="{text-align:center}" value="${GLOBALROWCOUNT}"
				sortable="false" />
			<ec:column width="15%" property="CourseId" title="课程编号"
				style="{text-align:center}" />
			<ec:column width="20%" property="CourseNM" title="课程名"
				style="{text-align:center}" />
			<ec:column width="10%" property="Term" title="选课学期"
				style="{text-align:center}" />
			<ec:column width="10%" property="Credit" title="学分"
				style="{text-align:center}" />
			<ec:column width="20%" property="CourseGrade" title="课程成绩"
				style="{text-align:center}" />
			<ec:column width="15%" property="Pass" title="是否通过"
				style="{text-align:center}" />
		</ec:row>
	</ec:table>
	<s:form theme="simple" name="thisForm" namespace="/web" action="web/crManage/CSHistory.action">
		<table style="BORDER-COLLAPSE: collapse; margin-top: 20px"
			borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%"
			align=center border=0>
			<tbody>
				<tr>
					<td style="FONT-SIZE: 14px" align=center><B>当前选择学期的总学分为：${request.sumPoint}</B>
					</td>
				</tr>
			</tbody>
		</table>
		<div align=center></div>
		<div id=SoftRegSLZYD style="MARGIN-TOP: 10px; width: 90%" align=center></div>
		<table id="table_1" class="table_border" cellSpacing=0 cellPadding=0;
			width="100%" align=center border=0>
			<tr>
				<td class="lbTitle table_td">选择学期<font color="red">*</font></td>
				<td class="table_td"><s:select id="term" name="term"
						list="#{'':'所有','1':'第一学期','2':'第二学期','3':'第三学期','4':'第四学期'}"/>
				</td>
			</tr>

		</table>
		<table class="table_oper">
			<tr>
				<td>&nbsp;</td>
			</tr>
		</table>
		<TABLE class="table_oper">
			<TBODY>
				<TR height=5>
					<TD></TD>
				</TR>
				<TR>
					<TD>
						<div align="center">
							<s:submit name="saveButton" cssClass="TdButton" value="确定"/>
						</div>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</s:form>
</body>
</html>
