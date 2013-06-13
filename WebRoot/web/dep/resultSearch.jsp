<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>学生成绩查询</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="<%=basePath%>/css/main.css" rel="stylesheet" type="text/css" />
<link href="./css/interface.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<s:form theme="simple" name="thisForm" namespace="/web"
		action="/web/dep/resultSearch.action">
		<table style="BORDER-COLLAPSE: collapse; margin-top: 20px"
			borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%"
			align=center border=0>
			<tbody>
				<tr>
					<td style="FONT-SIZE: 14px" align=center><B>学生成绩查询</B>
					</td>
				</tr>
			</tbody>
		</table>
		<div align=center></div>
		<div id=SoftRegSLZYD style="MARGIN-TOP: 10px; width: 90%" align=center></div>
		<table id="table_1" class="table_border" cellSpacing=0 cellPadding=0;
			width="100%" align=center border=0>
			<tr>
				<td class="lbTitle table_td" width="15%">学号</td>
				<td class="table_td" width="35%"><s:textfield id="StudentId"
						size="30" name="courseSelectObj.StudentId" /></td>
				<td class="lbTitle table_td">学期</td>
				<td class="table_td"><s:select id="Term"
						name="courseSelectObj.Term"
						list="#{'':'----','1':'第一学期','2':'第二学期','3':'第三学期','4':'第四学期'}" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td" width="15%">课程编号</td>
				<td class="table_td" width="35%"><s:textfield id="CourseId"
						size="30" name="courseSelectObj.CourseId" /></td>
				<td class="lbTitle table_td">课程名</td>
				<td class="table_td"><s:textfield id="CourseNM" size="30"
						name="courseSelectObj.CourseNM" />
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
