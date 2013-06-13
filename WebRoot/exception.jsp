<html>
	<head>
		<META http-equiv="Content-Type" content="text/html; charset=utf-8">	
		<%@ taglib prefix="s" uri="/struts-tags"%>				
	</head>
	<body>
		出错了，异常为：
		<%
			((Throwable)request.getAttribute("exception")).printStackTrace(new java.io.PrintWriter(out));
			((Throwable)request.getAttribute("exception")).printStackTrace();
		 %>			
	</body>
</html>