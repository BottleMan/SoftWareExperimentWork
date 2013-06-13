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
<title>课程信息管理界面</title>
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
			ShowModalWithResult('getCourseInforById.action?courseId='
					+ e.attributes('value').value + '&operateType=read',
					'450px', '600px');
		}
		if (flag == 1) //修改
		{
			var id = e.attributes('value').value;
			ShowModalWithResult('getCourseInforById.action?courseId='
					+ e.attributes('value').value + '&operateType=edit',
					'450px', '600px');
			ECSideUtil.reload('ec');
		}
		if (flag == 2) //删除
		{
			if (confirm("确认删除此课程信息？") == true) {
				var result = ajaxRequest('web/courseManage/deleteCourseInfor.action?courseId='
						+ e.attributes('value').value);
				if (result != "")//删除成功
				{
					alert("删除课程信息成功！");
				}
				ECSideUtil.reload('ec');
			}
		}
	}
</script>
</head>

<body>

	<ec:table items="courseInforList" var="record" listWidth="100%"
		action="web/courseManage/getCourseList.action" pageSizeList="10,15"
		rowsDisplayed="10" sortRowsCallback="limit"
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
				<a href='javascript:;' value='${record.COURSEID}'
					onclick='javascript:show(1,this);'>修改</a>
				<a href='javascript:;' value='${record.COURSEID}'
					onclick='javascript:show(2,this);'>删除</a>
			</ec:column>
		</ec:row>
	</ec:table>
	<s:form theme="simple" name="thisForm" namespace="/web"
		action="web/courseManage/getCourseList.action">
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
				<td class="lbTitle table_td" width="25%">课程编号</td>
				<td class="table_td" width="75%"><s:textfield id="courseId"
						size="30" name="courseObj.CourseId" />
				</td>

			</tr>
			<tr>
				<td class="lbTitle table_td">课程名称</td>
				<td class="table_td" width="35%" colspan="2"><s:textfield
						id="CourseNM" name="courseObj.CourseNM" cssStyle="WIDTH:95%" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">课程学分</td>
				<td class="table_td"><s:select id="Credit"
						name="courseObj.Credit"
						list="#{'':'----','1':'1分','2':'2分','3':'3分','4':'4分','5':'5分'}"></s:select>
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">开课学期</td>
				<td class="table_td"><s:select id="Semester"
						name="courseObj.Semester"
						list="#{'':'----','1':'第一学期','2':'第二学期','3':'第三学期','4':'第四学期'}" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">先修课程编号</td>
				<td class="table_td"><s:textfield id="FirstCourseID"
						name="courseObj.FirstCourseID" cssStyle="WIDTH:95%" /></td>
			</tr>

			<tr>
				<td class="lbTitle table_td">适合专业</td>
				<td class="table_td"><s:select id="Major"
						name="courseObj.Major"
						list="#{'':'----','计算机科学与技术':'计算机科学与技术','数字媒体艺术':'数字媒体艺术','数字媒体艺术':'数字媒体艺术','通信':'通信','会计':'会计','管理':'管理','公共':'公共'}"></s:select>
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">课程类型</td>
				<td class="table_td"><s:select id="Type" name="courseObj.Type"
						list="#{'':'----','1':'必修','0':'选修'}" /></td>
			</tr>

			<tr>
				<td class="lbTitle table_td">课时数</td>
				<td class="table_td"><s:select id="ClassHour"
						name="courseObj.ClassHour"
						list="#{'':'----','32':'32课时','48':'48课时','64':'64课时'}" /></td>
			</tr>
			<tr>
				<td class="lbTitle table_td">上课时间——周次</td>
				<td class="table_td"><s:select id="courseWeek"
						name="courseWeek" list="#{'':'----','0':'单周','1':'双周','2':'每周'}" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">开始周</td>
				<td class="table_td"><s:select id="courseStart"
						name="courseStart"
						list="#{'':'----','1':'第一周','2':'第二周','3':'第三周','4':'第四周','5':'第五周','6':'第六周','7':'第七周','8':'第八周','9':'第九周','10':'第十周','11':'第十一周','12':'第十二周','13':'第十三周','14':'第十四周','15':'第十五周','16':'第十六周'}" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">结束周</td>
				<td class="table_td"><s:select id="courseEnd" name="courseEnd"
						list="#{'':'----','1':'第一周','2':'第二周','3':'第三周','4':'第四周','5':'第五周','6':'第六周','7':'第七周','8':'第八周','9':'第九周','10':'第十周','11':'第十一周','12':'第十二周','13':'第十三周','14':'第十四周','15':'第十五周','16':'第十六周'}" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">星期</td>
				<td class="table_td"><s:select id="weekDay" name="weekDay"
						list="#{'':'----','1':'周一','2':'周二','3':'周三','4':'周四','5':'周五','6':'周六','7':'周日'}" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">上课时间</td>
				<td class="table_td"><s:select id="classTime" name="classTime"
						list="#{'':'----','1':'1-2节','2':'3-4节','3':'5-6节','4':'7-8节','5':'9-10节','6':'11-12节'}" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">任课教师</td>
				<td class="table_td"><s:textfield id="Teacher"
						name="courseObj.Teacher" cssStyle="WIDTH:95%" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">上课地点</td>
				<td class="table_td"><s:textfield id="Place"
						name="courseObj.Place" cssStyle="WIDTH:95%" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">上课人数</td>
				<td class="table_td"><s:textfield id="Number"
						name="courseObj.Number" cssStyle="WIDTH:95%" />
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
