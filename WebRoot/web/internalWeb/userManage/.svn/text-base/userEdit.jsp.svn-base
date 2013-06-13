<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>" target="_self"/>
		<title>修改内部用户</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="<%=path%>/js/calendar.js"></script>
				
	</head>
	<body bgcolor="#D7EBFD" >
		<s:form theme="simple" name="thisForm" action="updateUser" namespace="/web">
			<jsp:include page="userInfo.jsp"></jsp:include>
			<!-- <jsp:include page="userInfo.jsp"></jsp:include> -->
			<s:hidden name="successMessage"></s:hidden>
			<s:hidden name="errorMessage"></s:hidden>
			<TABLE class="table_oper">
			<TBODY>
				<TR height=5>
					<TD></TD> 
				</TR>
				<TR>
					<TD>
						<div align="center" >
							<s:submit name="saveButton" cssClass="TdButton"
									value="保存" onclick="return saveForm();" />
								&nbsp;&nbsp;&nbsp;
							<s:submit name="returnButton" cssClass="TdButton" onclick="window.close();return false;"
									value="返回" />
						</div>
					</TD>
				</TR>
			</TBODY>
		</TABLE>	
		</s:form>
	</body>
</html>