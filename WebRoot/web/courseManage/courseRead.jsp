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
<title>课程详细信息查看</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="<%=basePath%>/css/main.css" rel="stylesheet" type="text/css" />
<link href="./css/interface.css" rel="stylesheet" type="text/css" />
</head>

<body bgcolor="#D7EBFD">
	<s:form theme="simple" name="thisForm">
		<table style="BORDER-COLLAPSE: collapse; margin-top: 20px"
			borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%"
			align=center border=0>
			<tbody>
				<tr>
					<td style="FONT-SIZE: 14px" align=center><B>课程基本信息</B>
					</td>
				</tr>
			</tbody>
		</table>
		<div align=center></div>
		<div id=SoftRegSLZYD style="MARGIN-TOP: 10px; width: 90%" align=center></div>
		<table id="table_1" class="table_border" cellSpacing=0 cellPadding=0;
			width="100%" align=center border=0>
			<tr>
				<td class="lbTitle table_td">课程编号</td>
				<td class="table_td"><s:textfield id="courseId" size="30"
						name="courseObj.courseId" maxLength="16" readonly="true" />
				</td>

			</tr>
			<tr>
				<td class="lbTitle table_td">课程名称</td>
				<td class="table_td"><s:textfield id="CourseNM"
						name="courseObj.CourseNM" cssStyle="WIDTH:95%" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">课程学分</td>
				<td class="table_td"><s:textfield id="Credit"
						name="courseObj.Credit" cssStyle="WIDTH:95%" readonly="true" /></td>
			</tr>

			<tr>
				<td class="lbTitle table_td">开课学期
				<td class="table_td"><s:textfield id="Semester"
						name="courseObj.Semester" cssStyle="WIDTH:95%" readonly="true" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">先修课程编号</td>
				<td class="table_td"><s:textfield id="FirstCourseID"
						name="courseObj.FirstCourseID" cssStyle="WIDTH:95%"
						readonly="true" /></td>
			</tr>

			<tr>
				<td class="lbTitle table_td">适合专业</td>
				<td class="table_td"><s:textfield id="Major"
						name="courseObj.Major" cssStyle="WIDTH:95%" readonly="true" /></td>
			</tr>

			<tr>
				<td class="lbTitle table_td">课程类型</td>
				<td class="table_td"><s:textfield id="Type"
						name="courseObj.Type" cssStyle="WIDTH:95%" readonly="true" /></td>
			</tr>

			<tr>
				<td class="lbTitle table_td">课时数</td>
				<td class="table_td"><s:textfield id="ClassHour"
						name="courseObj.ClassHour" cssStyle="WIDTH:95%" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">上课时间</td>
				<td class="table_td"><s:textfield id="Schooltime"
						name="courseObj.Schooltime" cssStyle="WIDTH:95%" readonly="true" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">任课教师</td>
				<td class="table_td"><s:textfield id="Teacher"
						name="courseObj.Teacher" cssStyle="WIDTH:95%" readonly="true" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">上课地点</td>
				<td class="table_td"><s:textfield id="Place"
						name="courseObj.Place" cssStyle="WIDTH:95%" readonly="true" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">上课人数</td>
				<td class="table_td"><s:textfield id="Number"
						name="courseObj.Number" cssStyle="WIDTH:95%" readonly="true" />
				</td>
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
							<s:submit name="returnButton" cssClass="TdButton"
								onclick="window.close();return false;" value="返回" />
							&nbsp;&nbsp;&nbsp;
						</div></TD>
				</TR>
			</TBODY>
		</TABLE>
	</s:form>
</body>
</html>