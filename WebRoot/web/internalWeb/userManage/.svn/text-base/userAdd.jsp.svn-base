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
		<title>增加用户</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link href="<%=basePath%>/css/main.css" rel="stylesheet"
			type="text/css" />
		<link href="./css/interface.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=path%>/js/calendar.js"></script>
		<script type="text/javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/system.js"></script>
		<jsp:include page="../../../common/ajax/jqueryAjax.jsp"></jsp:include>
		<script type="text/javascript" src="<%=path%>/js/formcheck.js"></script>
		<jsp:include page="../../../common/tips/tips.jsp"></jsp:include>
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
		function afterValid()
		{	
			result=true;
			//验证密码
			var password= $("#password").val();
			if(password == "") return false;
			var len;
			var i;
			var isPassword = true;
			len = 0;
			for (i=0;i<password.length;i++){
				if (password.charCodeAt(i)>255) isPassword = false;
			}
			if(!isPassword || password.length > 16 || password.length < 6)
			{
				showErrorMsg(document.getElementById("password"),"密码长度应该在6到16位之间！");
				result=false;
			}
			//验证两次密码是否一致
			var rePassword=$("#rePassword").val();
			if(password!=rePassword)
			{
				showErrorMsg(document.getElementById("rePassword"),"两次输入密码不一致！");
				result= false;
			}
			return result;
							
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
			var result=ajaxRequest('<%=path%>/web/checkUserName.action?userName='+userName);
			if(result=="1")//重名
			{				
				document.getElementById("canUse").style.display="none";
				showErrorMsg(document.getElementById("userName"),"用户名重复！")
			}
			else if(result="2")//不重名
			{
				document.getElementById("canUse").style.display="block";
			}
		}	
		</script>
	</head>
	<body bgcolor="#D7EBFD" onload="init()">
		<s:form theme="simple" name="thisForm" action="addUser"
			namespace="/web">
			<s:hidden name="successMessage"></s:hidden>
			<s:hidden name="errorMessage"></s:hidden>
			<table style="BORDER-COLLAPSE: collapse; margin-top: 20px"
				borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%"
				align=center border=0>
				<tbody>
					<tr>
						<td style="FONT-SIZE: 14px" align=center>
							<B>用户信息</B>
						</td>
					</tr>
				</tbody>
			</table>
			<div align=center>
				<div id=SoftRegSLZYD style="MARGIN-TOP: 10px; width: 90%"
					align=center>
					<table id="table_1" class="table_border" cellSpacing=0
						cellPadding=0; width="100%" align=center border=0>
						<tr>
							<td class="lbTitle table_td" width="25%">
								用户名
								<font color="red">*</font>
							</td>
							<td class="table_td" width="75%">
								<s:textfield id="userName" size="30" name="userinfo.username" valid="required|isUserName|userNameRepeat"  maxLength="16" 
							title="@#@T6到16个字符，包括字母、数字、下划线@#@C用户名不能为空！|合法长度为6到16个字符，包括字母、数字、下划线！|已存在该用户名，请更换用户名。" />
								<input size="20" type="button" value="检查用户名"
									onclick="checkUser()">
								<span id="canUse" style="color: green; display: none">&nbsp&nbsp&nbsp&nbsp该用户名可用。</span>
							</td>

						</tr>
						<tr>
							<td class="lbTitle table_td">
								真实姓名
								<font color="red">*</font>
							</td>
							<td class="table_td" width="35%" colspan="2">
								<s:textfield id="realname" name="userinfo.realname"
									cssStyle="WIDTH:95%" valid="required"
									title="@#@C真实姓名不能为空！" checkLength="40" />
							</td>
						</tr>
						<tr>
							<td class="lbTitle table_td">
								性别
							</td>
							<td class="table_td">
								<s:select id="sex" name="userinfo.sex" list="#{'1':'男','0':'女'}"></s:select>
							</td>
						</tr>

						<tr>
							<td class="lbTitle table_td">
								出生日期
							</td>
							<td class="table_td">
								<s:textfield id="birthday" name="userinfo.birthday"
									cssStyle="WIDTH:95%" onfocus="setday(this)" valid="isDate" title="@#@C出生日期必须为日期！" maxLength="10">
									<s:param name="value">
										<s:date name="userinfo.birthday" format="yyyy-MM-dd" />
									</s:param>
								</s:textfield>
							</td>
						</tr>

						<tr>
							<td class="lbTitle table_td">
								密码
								<font color="red">*</font>
							</td>
							<td class="table_td">
								<input type="password" id="password" name="userinfo.password"
									size="67" valid="required" maxLength="16"
									title="@#@T密码可使用字母加数字或符号的组合，长度为6-16个字符@#@C请设置您的密码！" />
							</td>
						</tr>
						<tr>
							<td class="lbTitle table_td">
								确认密码
								<font color="red">*</font>
							</td>
							<td class="table_td">
								<input type="password" id="rePassword" name="rePassword"
									size="67" valid="required"
									title="@#@T请再次输入您设置的密码@#@C请再次输入您设置的密码！" maxLength="16" />
							</td>
						</tr>
						<tr>
							<td class="lbTitle table_td">
								联系方式
								<font color="red">*</font>
							</td>
							<td class="table_td">
								<s:textfield id="mobile"
									name="userinfo.mobile" cssStyle="WIDTH:95%"
									valid="required" title="@#@C联系电话（手机）不能为空！" maxLength="18" />
							</td>
						</tr>
						<tr>
							<td class="lbTitle table_td">
								邮箱
								<font color="red">*</font>
							</td>
							<td class="table_td" colspan="2">
								<s:textfield id="email" name="userinfo.email"
									cssStyle="WIDTH:95%" valid="required|isEmail" maxLength="28"
									title="@#@T请填写正确邮箱!@#@C邮箱不能为空！|邮箱格式不正确！" />
							</td>
						</tr>

						<tr>
							<td class="lbTitle table_td">
								住址
							</td>
							<td class="table_td">
								<s:textfield id="address" name="userinfo.address"
									cssStyle="WIDTH:95%" checkLength="120"/>
							</td>
						</tr>

						
					</table>
					<table class="table_oper">
						<tr>
							<td>
								&nbsp;
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