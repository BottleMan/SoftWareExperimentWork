<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>" target="_self">
<title>学生详细信息查看</title>
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
		<s:hidden name="successMessage"></s:hidden>
		<s:hidden name="errorMessage"></s:hidden>
		<table style="BORDER-COLLAPSE: collapse; margin-top: 20px"
			borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%"
			align=center border=0>
			<tbody>
				<tr>
					<td style="FONT-SIZE: 14px" align=center><B>学生基本信息</B>
					</td>
				</tr>
			</tbody>
		</table>
		<div align=center></div>
		<div id=SoftRegSLZYD style="MARGIN-TOP: 10px; width: 90%" align=center></div>
		<table id="table_1" class="table_border" cellSpacing=0 cellPadding=0;
			width="100%" align=center border=0>
			<tr>
				<td class="lbTitle table_td">学号</td>
				<td class="table_td"><s:textfield id="studentid" size="30"
						name="studentObj.studentID" maxLength="16" readonly="true" />
				</td>

			</tr>
			<tr>
				<td class="lbTitle table_td">姓名</td>
				<td class="table_td"><s:textfield id="realname"
						name="studentObj.studentNM" cssStyle="WIDTH:95%" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">性别
				<td class="table_td"><s:textfield id="sex"
						name="studentObj.Sex" cssStyle="WIDTH:95%" readonly="true" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">出生日期
				<td class="table_td"><s:textfield id="birthday"
						name="studentObj.Birthday" cssStyle="WIDTH:95%" readonly="true" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">生源地
				<td class="table_td"><s:textfield id="birthplace"
						name="studentObj.BirthPlace" cssStyle="WIDTH:95%" readonly="true" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">班级
				<td class="table_td"><s:textfield id="classname"
						name="studentObj.ClassName" cssStyle="WIDTH:95%" readonly="true" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">系别
				<td class="table_td"><s:textfield id="department"
						name="studentObj.Department" cssStyle="WIDTH:95%" readonly="true" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">入学年份
				<td class="table_td"><s:textfield id="entrancetime"
						name="studentObj.EntranceTime" cssStyle="WIDTH:95%"
						readonly="true" /></td>
			</tr>

			<tr>
				<td class="lbTitle table_td">第一学期已注册
				<td class="table_td"><s:textfield id="FirstRegister"
						name="studentObj.FirstRegister" cssStyle="WIDTH:95%"
						readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">第二学期已注册
				<td class="table_td"><s:textfield id="SecondRegister"
						name="studentObj.SecondRegister" cssStyle="WIDTH:95%"
						readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">第三学期已注册
				<td class="table_td"><s:textfield id="ThirdRegister"
						name="studentObj.ThirdRegister" cssStyle="WIDTH:95%"
						readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">第四学期已注册
				<td class="table_td"><s:textfield id="FourthRegister"
						name="studentObj.FourthRegister" cssStyle="WIDTH:95%"
						readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">是否休学
				<td class="table_td"><s:textfield id="DropOut"
						name="studentObj.DropOut" cssStyle="WIDTH:95%" readonly="true" />
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