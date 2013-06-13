<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>" />

<title>登录页面</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />
<link href="<%=path%>/root/css/main.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript">	
    function changeImage()
	{
		document.getElementById('verifyImg').src='<%=path%>/servlet/verify.png?param=' + Math.random();
	}
</script>

</head>

<body>
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="baimage">
		<s:form theme="simple" action="loginCheckForInternal"
			namespace="/">
			<input class="usertest" type="text" value=""
				name="userName" />
			<input type="password" class="passwordtest" value=""
				name="password" />
			<input class="suretest" type="text" id="verifyCode" name="verifyCode" />
			<img id="verifyImg" src="<%=path%>/servlet/verify.png"
				class="sureimage" />
			<a href="javascript:;" onclick="changeImage();"
				class="surefont">看不清?</a>
			<input value="登录" class="bt1" type="submit" />
			<input type="reset" class="bt2" value="重置" />
		</s:form>
	</div>
</body>
</html>
