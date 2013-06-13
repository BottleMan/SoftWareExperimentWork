<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//Integer modelID = 31;
%>
<%
	// include file="../../../../common/check/securityCheck.jsp"
%>
<%@ taglib uri="http://www.ecside.org" prefix="ec"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>学生信息管理界面</title>
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
<script type="text/javascript" src="<%=path%>/js/calendar.js"></script>
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
			ShowModalWithResult('getStudentInforById.action?studentId='
					+ e.attributes('value').value + '&operateType=read',
					'450px', '600px');
		}
		if (flag == 1) //修改
		{
			var id = e.attributes('value').value;
			ShowModalWithResult('getStudentInforById.action?studentId='
					+ e.attributes('value').value + '&operateType=edit',
					'450px', '600px');
			ECSideUtil.reload('ec');
		}
		if (flag == 2) //删除
		{
			if (confirm("确认删除此学生信息？") == true) {
				var result = ajaxRequest('web/studentManage/deleteStudentInfor.action?studentId='
						+ e.attributes('value').value);
				if (result != "")//删除成功
				{
					alert("删除学生信息成功！");
				}
				ECSideUtil.reload('ec');
			}
		}
	}
</script>
</head>

<body>

	<ec:table items="studentInforList" var="record" listWidth="100%"
		action="web/studentManage/getStudentInforList.action"
		pageSizeList="10,15" rowsDisplayed="10" sortRowsCallback="limit"
		retrieveRowsCallback="limit" sortable="false" filterable="false">
		<ec:row>
			<ec:column width="10%" property="_0" title="序号"
				style="{text-align:center}" value="${GLOBALROWCOUNT}"
				sortable="false" />
			<ec:column width="15%" property="StudentID" title="学号"
				style="{text-align:center}" />
			<ec:column width="20%" property="StudentNM" title="姓名"
				style="{text-align:center}" />
			<ec:column width="20%" property="Sex" title="性别"
				style="{text-align:center}" />
			<ec:column width="20%" property="ClassName" title="班级"
				style="{text-align:center}" />
			<ec:column width="15%" property="null" title="操作"
				style="{text-align:center}" sortable="false">
				<a href='javascript:;' value='${record.StudentID}'
					onclick='javascrip:show(0,this);'>详细</a>
				<a href='javascript:;' value='${record.StudentID}'
					onclick='javascript:show(1,this);'>修改</a>
				<a href='javascript:;' value='${record.StudentID}'
					onclick='javascript:show(2,this);'>删除</a>
			</ec:column>
		</ec:row>
	</ec:table>
	<s:form theme="simple" name="thisForm"
		action="web/studentManage/getStudentInforList.action" namespace="/web">
		<table style="BORDER-COLLAPSE: collapse; margin-top: 20px"
			borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%"
			align=center border=0>
			<tbody>
				<tr>
					<td style="FONT-SIZE: 14px" align=center><B>交叉查询</B>
					</td>
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
						size="30" cssStyle="WIDTH:95%" name="studentObj.studentID" /></td>

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
						list="#{'':'--','1':'男','0':'女'}"></s:select>
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">生源地</td>
				<td class="table_td"><s:textfield id="birthplace"
						name="studentObj.BirthPlace" cssStyle="WIDTH:95%" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">班级</td>
				<td class="table_td"><s:textfield id="classname"
						name="studentObj.ClassName" cssStyle="WIDTH:95%" />
				</td>
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
						</div>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</s:form>
</body>
</html>
