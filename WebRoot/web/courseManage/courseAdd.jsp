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
<title>增加课程信息</title>
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
<script type="text/javascript" src="<%=path%>/common/tips/tips.js"></script>

<style type="text/css">
#mytips {
	BORDER-RIGHT: orange 1px solid;
	PADDING-RIGHT: 6px;
	BORDER-TOP: orange 1px solid;
	DISPLAY: none;
	PADDING-LEFT: 6px;
	FONT-SIZE: 12px;
	FILTER: progid:DXImageTransform.Microsoft.Shadow(color=#999999,
		direction=135, strength=3 );
	LEFT: 0px;
	PADDING-BOTTOM: 6px;
	BORDER-LEFT: orange 1px solid;
	/* 	WIDTH: 600px; */
	COLOR: black;
	LINE-HEIGHT: 18px;
	PADDING-TOP: 6px;
	BORDER-BOTTOM: orange 1px solid;
	POSITION: absolute;
	TOP: 5px;
	HEIGHT: 50px;
	BACKGROUND-COLOR: #ffffe6;
	TEXT-ALIGN: left
}
</style>

<script type="text/javascript">	
	function showtip(tips,maxLength,tipWidth){
			//tips--提示信息		
			//maxLength--输入长度限制
			//tipWidth--提示图层宽度

	var my_tips=document.all.mytips;
	var left=document.documentElement.scrollLeft;
	var top=document.documentElement.scrollTop ;	
	if(left==0)
	{
		left=document.body.scrollLeft+3;
	}
	if(top==0)
	{
		top=document.body.scrollTop+3;
	}
	
	if(tips && maxLength)
	{	
			
		tips = tips +  '<br>' + '<font color="red">长度限制：'+maxLength+'字节(一个汉字等于3个字节)</font>&nbsp';
		my_tips.innerHTML=tips;		
		my_tips.style.width=tipWidth;
		
		my_tips.style.left=event.clientX+left ;		
		my_tips.style.top=event.clientY+top ;
		my_tips.style.display="block";
		my_tips.style.zIndex=1;
		
			
	}	
	else if(tips)
	{				
		my_tips.innerHTML=tips;		
		my_tips.style.width=tipWidth;
		my_tips.style.left=event.clientX+left ;	
		my_tips.style.top=event.clientY+top;
		my_tips.style.display="block";
		my_tips.style.zIndex=1;
	}		   
	else if(maxLength)
	{		
		tips ='<font color="red">长度限制：'+maxLength+'字节</font>&nbsp';
		my_tips.innerHTML=tips;		
		my_tips.style.width=tipWidth;
		my_tips.style.left=event.clientX+left;		
		my_tips.style.top=event.clientY+top;
		my_tips.style.display="block";
		my_tips.style.zIndex=1;
	}
	else {
	   my_tips.style.display="none";
	}
	
	
}
</script>

<script type="text/javascript"> 
		function init()
		{
			if(thisForm.successMessage.value!='')
			{
			    alert(thisForm.successMessage.value);
				window.close();
			}
			if(thisForm.errorMessage.value!='')
			{
				alert(thisForm.errorMessage.value);
				document.getElementById("userName").value="";
			}

		}
		function checkUser()
		{
			clearErrorMsgDiv();
			document.getElementById("canUse").style.display="none";
			var userName=document.getElementById("userName").value.trim();
			if(userName=="")
			{
				showErrorMsg(document.getElementById("userName"),"用户名不能为空！")
				return;				
			}	
			if(executeVerifyByValue(userName,/^[a-zA-Z0-9_]{6,16}$/)==false)
			{
				showErrorMsg(document.getElementById("userName"),"合法长度为6到16个字符，包括字母、数字、下划线！")
				return;	
			}	
			var result=ajaxRequest('<%=path%>
	/web/checkUserName.action?userName='
				+ userName);

		if (result == "1")//重名
		{
			document.getElementById("canUse").style.display = "none";
			showErrorMsg(document.getElementById("userName"), "用户名重复！")
		} else if (result = "2")//不重名
		{
			document.getElementById("canUse").style.display = "block";
		}
	}
</script>

</head>
<body bgcolor="#D7EBFD" onload="init()">
	<DIV id=mytips></DIV>
	<s:form theme="simple" name="thisForm" action="courseAdd"
		namespace="/web">
		<table style="BORDER-COLLAPSE: collapse; margin-top: 20px"
			borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%"
			align=center border=0>
			<tbody>
				<tr>
					<td style="FONT-SIZE: 14px" align=center><B>课程基本信息</B></td>
				</tr>
			</tbody>
		</table>
		<div align=center></div>
		<div id=SoftRegSLZYD style="MARGIN-TOP: 10px; width: 90%" align=center></div>
		<table id="table_1" class="table_border" cellSpacing=0 cellPadding=0;
			width="100%" align=center border=0>
			<tr>
				<td class="lbTitle table_td" width="25%">课程编号 <font color="red">*</font>
				</td>
				<td class="table_td" width="75%"><s:textfield id="courseId"
						size="30" name="courseObj.CourseId" valid="required|isNumber"
						maxLength="16" title="@#@T必填：只能是数字@#@C课程编号不能为空！|课程编号号只能是数字！" />
				</td>

			</tr>
			<tr>
				<td class="lbTitle table_td">课程名称 <font color="red">*</font></td>
				<td class="table_td" width="35%" colspan="2"><s:textfield
						id="CourseNM" name="courseObj.CourseNM" cssStyle="WIDTH:95%"
						valid="required" title="@#@T必填@#@C课程名称不能为空！" checkLength="40" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">课程学分 <font color="red">*</font>
				</td>
				<td class="table_td"><s:select id="Credit"
						name="courseObj.Credit"
						list="#{'1':'1分','2':'2分','3':'3分','4':'4分','5':'5分'}"></s:select>
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">开课学期 <font color="red">*</font>
				</td>
				<td class="table_td"><s:select id="Semester"
						name="courseObj.Semester"
						list="#{'1':'第一学期','2':'第二学期','3':'第三学期','4':'第四学期'}" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">先修课程编号</td>
				<td class="table_td"><s:textfield id="FirstCourseID"
						name="courseObj.FirstCourseID" cssStyle="WIDTH:95%"
						title="@#@T非必填" /></td>
			</tr>

			<tr>
				<td class="lbTitle table_td">适合专业 <font color="red">*</font></td>
				<td class="table_td"><s:select id="Major" name="courseObj.Major"
						list="#{'计算机科学与技术':'计算机科学与技术','数字媒体艺术':'数字媒体艺术','数字媒体艺术':'数字媒体艺术','通信':'通信','会计':'会计','管理':'管理','公共':'公共'}"></s:select></td>
			</tr>

			<tr>
				<td class="lbTitle table_td">课程类型 <font color="red">*</font></td>
				<td class="table_td"><s:select id="Type" name="courseObj.Type"
						list="#{'1':'必修','0':'选修'}" /></td>
			</tr>
			
			<tr>
				<td class="lbTitle table_td">课时数 <font color="red">*</font></td>
				<td class="table_td"><s:select id="ClassHour" name="courseObj.ClassHour"
						list="#{'32':'32课时','48':'48课时','64':'64课时'}" /></td>
			</tr>
			<tr>
				<td class="lbTitle table_td">上课时间——周次 <font color="red">*</font></td>
				<td class="table_td"><s:select id="courseWeek" name="courseWeek"
						list="#{'0':'单周','1':'双周','2':'每周'}" /></td>
			</tr>
			
			<tr>
				<td class="lbTitle table_td">开始周 <font color="red">*</font></td>
				<td class="table_td"> <s:select id="courseStart" name="courseStart"
						list="#{'1':'第一周','2':'第二周','3':'第三周','4':'第四周','5':'第五周','6':'第六周','7':'第七周','8':'第八周','9':'第九周','10':'第十周','11':'第十一周','12':'第十二周','13':'第十三周','14':'第十四周','15':'第十五周','16':'第十六周'}" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">结束周 <font color="red">*</font></td>
				<td class="table_td"> <s:select id="courseEnd" name="courseEnd"
						list="#{'1':'第一周','2':'第二周','3':'第三周','4':'第四周','5':'第五周','6':'第六周','7':'第七周','8':'第八周','9':'第九周','10':'第十周','11':'第十一周','12':'第十二周','13':'第十三周','14':'第十四周','15':'第十五周','16':'第十六周'}" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">星期 <font color="red">*</font></td>
				<td class="table_td"> <s:select id="weekDay" name="weekDay"
						list="#{'1':'周一','2':'周二','3':'周三','4':'周四','5':'周五','6':'周六','7':'周日'}" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">上课时间 <font color="red">*</font></td>
				<td class="table_td"> <s:select id="classTime" name="classTime"
						list="#{'1':'1-2节','2':'3-4节','3':'5-6节','4':'7-8节','5':'9-10节','6':'11-12节'}" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">任课教师 <font color="red">*</font>
				</td>
				<td class="table_td"><s:textfield id="Teacher"
						name="courseObj.Teacher" cssStyle="WIDTH:95%" valid="required"
						title="@#@T必填@#@C教师信息不能为空！" maxLength="18" checkLength="80" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">上课地点 <font color="red">*</font>
				</td>
				<td class="table_td"><s:textfield id="Place"
						name="courseObj.Place" cssStyle="WIDTH:95%" valid="required"
						title="@#@T必填@#@C上课地点不能为空！" maxLength="18" checkLength="80" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">上课人数 <font color="red">*</font>
				</td>
				<td class="table_td"><s:textfield id="Number"
						name="courseObj.Number" cssStyle="WIDTH:95%"
						valid="required|isNum" title="@#@T必填,只能是数字@#@C上课人数不能为空！|必须是数字！"
						maxLength="18" checkLength="80" />
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
							<s:submit name="saveButton" cssClass="TdButton" value="保存"
								onclick="return saveForm();" />
							&nbsp;&nbsp;&nbsp;
							<s:submit name="returnButton" cssClass="TdButton"
								onclick="window.close();return false;" value="返回" />
						</div>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
	</s:form>

</body>
</html>