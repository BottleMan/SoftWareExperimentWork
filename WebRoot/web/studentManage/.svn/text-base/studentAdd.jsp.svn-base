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
<title>增加学生信息</title>
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
	/web/checkUserName.action?userName=' + userName);

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
	<s:form theme="simple" name="thisForm" action="addStuInfor"
		namespace="/web">
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
				<td class="lbTitle table_td" width="25%">学号 <font color="red">*</font>
				</td>
				<td class="table_td" width="75%"><s:textfield id="studentid"
						size="30" name="studentObj.studentID" cssStyle="WIDTH:95%"
						valid="required|isNumber" maxLength="16"
						title="@#@T必填：学号一般是11位，只能是数字@#@C用户名不能为空！|学号只能是数字！" /></td>

			</tr>
			<tr>
				<td class="lbTitle table_td">姓名 <font color="red">*</font>
				</td>
				<td class="table_td" width="35%" colspan="2"><s:textfield
						id="realname" name="studentObj.studentNM" cssStyle="WIDTH:95%"
						valid="required" title="@#@T必填@#@C学生姓名不能为空！" checkLength="40" />
				</td>
			</tr>
			<tr>
				<td class="lbTitle table_td">性别<font color="red">*</font></td>
				<td class="table_td"><s:select id="sex" name="studentObj.Sex"
						list="#{'1':'男','0':'女'}"></s:select>
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">出生日期<font color="red">*</font></td>
				<td class="table_td"><s:textfield id="birthday"
						name="studentObj.Birthday" cssStyle="WIDTH:95%"
						onfocus="setday(this)" valid="isDate|required"
						title="@#@T必填@#@C出生日期必须为日期！|出生日期不能为空！" maxLength="10">
						<s:param name="value">
							<s:date name="studentObj.Birthday" format="yyyy-MM-dd" />
						</s:param>
					</s:textfield>
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">生源地 <font color="red">*</font>
				</td>
				<td class="table_td"><s:textfield id="birthplace"
						name="studentObj.BirthPlace" cssStyle="WIDTH:95%" valid="required"
						title="@#@T必填@#@C生源地信息不能为空！" maxLength="18" checkLength="80" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">班级 <font color="red">*</font>
				</td>
				<td class="table_td"><s:textfield id="classname"
						name="studentObj.ClassName" cssStyle="WIDTH:95%" valid="required"
						title="@#@T必填@#@C班级信息不能为空！" maxLength="18" checkLength="80" />
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">系别 <font color="red">*</font>
				</td>
				<td class="table_td"><s:select id="department"
						name="studentObj.Department"
						list="#{'计算机科学与技术':'计算机科学与技术','数字媒体艺术':'数字媒体艺术','数字媒体艺术':'数字媒体艺术','通信':'通信','会计':'会计','管理':'管理'}"></s:select>
				</td>
			</tr>

			<tr>
				<td class="lbTitle table_td">入学年份 <font color="red">*</font>
				</td>
				<td class="table_td"><s:textfield id="entrancetime"
						name="studentObj.EntranceTime" cssStyle="WIDTH:95%"
						onfocus="setday(this)" valid="isDate|required"
						title="@#@T必填@#@C入学年份必须为日期！|入学年份不能为空！" maxLength="10">
						<s:param name="value">
							<s:date name="studentObj.EntranceTime" format="yyyy-MM" />
						</s:param>
					</s:textfield>
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