<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
    //Integer modelID = 31;			
%>
<% // include file="../../../../common/check/securityCheck.jsp"%>
<%@ taglib uri="http://www.ecside.org" prefix="ec"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>用户信息管理界面</title>
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
		<jsp:include page="../../../common/ajax/jqueryAjax.jsp"></jsp:include>

		<script type="text/javascript" charset="utf-8">
				function show(flag,e)
				{
					if(flag==0) //查看
					{
						var id=e.attributes('value').value;
						ShowModalWithResult('getUserInfoById.action?userId='+id+'&operateType=read','400px','600px');
					}
					if(flag==1)  //修改
					{
						var id=e.attributes('value').value;
						ShowModalWithResult('getUserInfoById.action?userId='+id+'&operateType=edit','400px','600px');
						ECSideUtil.reload('ec');	
					}
					if(flag==2) //禁用
					{
						if(confirm("确认禁用此用户？")==true)
						{
							var result=ajaxRequest('web/internalWeb/userManage/deleteUserInfo.action?userId='+e.attributes('value').value);
							if(result!="")//禁用成功
							{
								alert("禁用此用户成功！");
							}
							ECSideUtil.reload('ec');	
						}					
					}
					if(flag==3)  //增加
					{
					   var result=ShowModalWithResult('userAdd.jsp','400px','600px');
					   ECSideUtil.reload('ec');
					}
					if(flag==4)  //重置密码
					{
						var result=ajaxRequest('web/internalWeb/userManage/resetPassword.action?userId='+e.attributes('value').value);
						if(result=="true")
						{
							alert("密码已重置为000000");
							ECSideUtil.reload('ec');
						}
						else
						{
							alert("提交请求失败！");
						}
						
						
					}
				}
				
			</script>
	</head>

	<body>
		<ec:table items="userList" var="record" retrieveRowsCallback="process"   
			listWidth="100%" action="web/internalWeb/userManage/getUserInfoList.action?stopFlag=0"
			pageSizeList="10,15" rowsDisplayed="10" sortRowsCallback="limit"
			retrieveRowsCallback="limit" sortable="true"
			filterable="true">
			<ec:row>
				<ec:column width="10%" property="_0" title="序号"
					style="{text-align:center}" value="${GLOBALROWCOUNT}"
					sortable="false" />
				<ec:column width="15%" property="USERNAME" title="用户名"
					style="{text-align:center}" />
				<ec:column width="20%" property="REALNAME" title="真实姓名"
					style="{text-align:center}" />
				<ec:column width="20%" property="MOBILE" title="联系电话"
					style="{text-align:center}" />
				<ec:column width="20%" property="EMAIL" title="邮箱"
					style="{text-align:center}" />
				<ec:column width="15%" property="null" title="操作"
					style="{text-align:center}" sortable="false">
					<a href='javascript:;' value='${record.USERID}'
						onclick='javascrip:show(0,this);'>查看</a>
					<a href='javascript:;' value='${record.USERID}'
						onclick='javascript:show(1,this);'>修改</a>
					<a href='javascript:;' value='${record.USERID}'
						onclick='javascript:show(2,this);'>禁用</a>
					<a href='javascript:;' value='${record.USERID}'
						onclick='javascript:show(4,this);'>重置密码</a>
				</ec:column>
			</ec:row>
			<ec:extend location="bottom">
				<input type="button" class="button" value="新增"
					onclick="show(3,this)">
			</ec:extend>
		</ec:table>
	</body>
</html>
