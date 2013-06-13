<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Loading...</title>
		<script language="javascript" type="text/javascript">
<%
	if(request.getParameter("logout")!=null && request.getParameter("logout").equals("true"))
	{
		session.invalidate();
	}
%>
window.location.href="<%=path%>/out.action";
</script>
	</head>
	<body>

	</body>
</html>
