<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>" target="_self">
<title>查询学生信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="<%=basePath%>/css/main.css" rel="stylesheet" type="text/css" />
<link href="./css/interface.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/calendar.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/system.js"></script>
<script type="text/javascript" src="<%=path%>/js/formcheck.js"></script>
<script type="text/javascript" src="<%=path%>/common/ajax/jqueryAjax.js"></script>

</head>
<body>
	<s:form theme="simple" name="thisForm"
		action="./web/dep/stuSearch.action" namespace="/web">
		<table style="BORDER-COLLAPSE: collapse; margin-top: 20px"
			borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%"
			align=center border=0>
			<tbody>
				<tr>
					<td style="FONT-SIZE: 14px" align=center><B>查询学生基本信息</B></td>
				</tr>
			</tbody>
		</table>
		<div align=center></div>
		<div id=SoftRegSLZYD style="MARGIN-TOP: 10px; width: 90%" align=center></div>
		<table id="table_1" class="table_border" cellSpacing=0 cellPadding=0;
			width="100%" align=center border=0>
			<tr>
				<td class="lbTitle table_td" width="25%">学号</td>
				<td class="table_td" width="75%"><s:textfield id="studentid"
						size="30" name="studentObj.studentID" />
				</td>

			</tr>
			<tr>
				<td class="lbTitle table_td">姓名</td>
				<td class="table_td" width="35%" colspan="2"><s:textfield
						id="realname" name="studentObj.studentNM" cssStyle="WIDTH:95%" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">性别</td>
				<td class="table_td"><s:select id="sex" name="studentObj.Sex"
						list="#{'':'--','1':'男','0':'女'}"></s:select></td>
			</tr>

			<tr>
				<td class="lbTitle table_td">生源地</td>
				<td class="table_td"><s:textfield id="birthplace"
						name="studentObj.BirthPlace" cssStyle="WIDTH:95%" /></td>
			</tr>

			<tr>
				<td class="lbTitle table_td">班级</td>
				<td class="table_td"><s:textfield id="classname"
						name="studentObj.ClassName" cssStyle="WIDTH:95%" /></td>
			</tr>

			<tr>
				<td class="lbTitle table_td">系别</td>
				<td class="table_td"><s:select id="department"
						name="studentObj.Department"
						list="#{'':'-----','计算机科学与技术':'计算机科学与技术','数字媒体艺术':'数字媒体艺术','数字媒体艺术':'数字媒体艺术','通信':'通信','会计':'会计','管理':'管理'}"></s:select>
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
							<s:submit name="saveButton" cssClass="TdButton" value="查询" />
							&nbsp;&nbsp;&nbsp;
							<s:submit name="returnButton" cssClass="TdButton"
								onclick="window.close();return false;" value="返回" />
						</div></TD>
				</TR>
			</TBODY>
		</TABLE>
	</s:form>
</body>
</html>