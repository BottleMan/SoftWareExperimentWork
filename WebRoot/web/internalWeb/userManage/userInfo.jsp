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
		<base href="<%=basePath%>">
		<title>用户管理</title>
		<link href="<%=basePath%>/css/main.css" rel="stylesheet" type="text/css" />
		<link href="./css/interface.css" rel="stylesheet" type="text/css" />
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
		<script type="text/javascript"> 
		   function init()
			{	
			    if(thisForm.errorMessage.value!= "")
			    {	
			    	alert(thisForm.errorMessage.value);			    	
			  	}
				if(thisForm.successMessage.value != "" )
				{	
			    	alert(thisForm.successMessage.value);
			    	window.close();
			    }		
			   <%			    	
			    //if(request.getParameter("operateType").equals("read"))
			    //{
			   %>	
			   /* document.getElementById("username").readOnly=true;
			   document.getElementById("realname").readOnly=true;
			   document.getElementById("sex").disabled=true;
			   document.getElementById("birthday").disabled=true;
			   document.getElementById("mobile").readOnly=true;
			   document.getElementById("email").readOnly=true;
			   document.getElementById("address").readOnly=true;
			   document.getElementById("recordtime").readOnly=true; */
			   <%
			   // }
			   %>
			}
		</script>
	</head>
    <body onload="init()">
<!-- 	<s:hidden name="operateType" /> -->
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
								<s:textfield id="userName" cssStyle="WIDTH:95%" name="userinfo.username" readOnly="true"  maxLength="30" title="@#@T用户名为不可修改项！" />
								<s:hidden id="userid" name="userinfo.userid"></s:hidden>
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
									title="@#@C真实姓名不能为空！" checkLength="30" />
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
								联系方式
								<font color="red">*</font>
							</td>
							<td class="table_td">
								<s:textfield id="mobile"
									name="userinfo.mobile" cssStyle="WIDTH:95%"
									valid="required" title="@#@C联系方式不能为空！" maxLength="18" />
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
						
						<tr>
							<td class="lbTitle table_td">
								记录时间
								<font color="red">*</font>
							</td>
							<td class="table_td">
								<s:textfield id="recordtime" name="userinfo.recordtime" maxLength="10"
									cssStyle="WIDTH:95%" onfocus="setday(this)" valid="required|isDate" 
									title="@#@C入职时间不能为空！|入职时间必须为日期！" >
								<s:param name="value">
										<s:date name="userinfo.recordtime" format="yyyy-MM-dd" />
								</s:param>
								</s:textfield>
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
	</body>
</html>
