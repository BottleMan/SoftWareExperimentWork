<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>" target="_self">

		<title>My JSP 'modifyPassword.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript" src="<%=path%>/js/system.js"></script>
		<jsp:include page="../../../common/ajax/jqueryAjax.jsp"></jsp:include>
		<script type="text/javascript" src="<%=path%>/js/formcheck.js"></script>
		<jsp:include page="../../../common/tips/tips.jsp"></jsp:include>
		<jsp:include page="../../../common/check/formCheck.jsp" />
		<script type="text/javascript">
		function init()
		{
			if(thisForm.successMessage.value!="")
			{
				alert(thisForm.successMessage.value);
				window.close();
			}
			if(thisForm.errorMessage.value!="")
				alert(thisForm.errorMessage.value);
		}
		function afterValid()
		{	
			result=true;
			//验证密码
			var password= $("#newPassword").val();
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
				showErrorMsg(document.getElementById("newPassword"),"密码长度应该在6到16位之间！");
				result=false;
			}
			
			//验证两次密码是否一致
			var rePassword=$("#repeat").val();
			if(password!=rePassword)
			{
				showErrorMsg(document.getElementById("repeat"),"两次输入密码不一致！");
				result= false;
			}
			return result;
		}
					
	</script>

	</head>

	<body onload="init()">
		<div align="center">
			<s:form theme="simple" name="thisForm" action="updatePassword.action" namespace="/web">
				<s:hidden name="successMessage"></s:hidden>
				<s:hidden name="errorMessage"></s:hidden>
				<table width="84%" height="80" border="0" cellpadding="0"
					cellspacing="0" style="line-height: 200%; font-size: 12px;">
					<tr>
						<td align="center" colspan="3"
							style="font-size: 14px; font-family: 黑体">
							修改用户密码
							<hr style="height: 1px">
						</td>
					</tr>

					<tr>
						<td width="29%">
							&nbsp;
						</td>
						<td width="2%">
							&nbsp;
						</td>
						<td width="69%">
							&nbsp;
						</td>
					</tr>

					<tr>
						<td width="29%" align="right">
							原密码：
						</td>
						<td width="2%" align="right">
							&nbsp;
						</td>
						<td width="69%" align="left">
							<input type="password" name="oldPassword" id="oldPassword"
								valid="required" title="@#@T6到16个字符，包括字母、数字@#@C密码不能为空！"
								size="25" />
						</td>

					</tr>
					<tr>
						<td width="29%" align="right">
							新密码：
						</td>
						<td width="2%" align="right">
							&nbsp;
						</td>
						<td width="69%" align="left">
							<input type="password" name="newPassword" id="newPassword"
								valid="required" title="@#@T6到16个字符，包括字母、数字@#@C新密码不能为空！"
								size="25" />
						</td>

					</tr>

					<tr>
						<td align="right">
							确认密码：
						</td>
						<td align="right">
							&nbsp;
						</td>
						<td align="left">
							<input type="password" name="repeat" id="repeat" valid="required"
								title="@#@C确认密码不能为空！" size="25" />
						</td>
					</tr>

					<tr>
						<td height="40" align="right">
							&nbsp;
						</td>
						<td align="right">
							&nbsp;
						</td>
						<td align="left"> 
							<input type="submit" value="提交" onclick="return saveForm();" />
							<input type="button" onClick="javascript:window.close();" value="返回" />
							
						</td>
					</tr> 
				</table>
			</s:form>

		</div>

	</body>
</html>
