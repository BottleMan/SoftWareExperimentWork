<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://www.ecside.org" prefix="ec"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>内部用户管理界面</title>
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
						ShowModalWithResult('getInternalUserInfo.action?userId='+id+'&operateType=read','520px','700px');
					}
					if(flag==4)  //启用
					{
					   if(confirm("确认启用此用户？")==true)
						{
						    var result=ajaxRequest('web/internalWeb/userManage/resetUserInfo.action?userId='+e.attributes('value').value);
					        if(result!="")//启用成功
							{
								alert("启用此用户成功！");
							}
					        ECSideUtil.reload('ec');
					    }
					}
				}
			</script>
	</head>

	<body> 
		<ec:table items="userList" var="record" retrieveRowsCallback="process"   
			listWidth="100%" action="web/internalWeb/userManage/getInternalUserList.action?stopFlag=1"
			pageSizeList="10,15" rowsDisplayed="10" sortRowsCallback="limit"
			retrieveRowsCallback="limit" sortable="true"
			filterable="true">
			<ec:row>
				<ec:column width="10%" property="_0" title="序号"
					style="{text-align:center}" value="${GLOBALROWCOUNT}"
					sortable="false" />
				<ec:column width="20%" property="USERNAME" title="用户名"
					style="{text-align:center}" />
				<ec:column width="20%" property="REALNAME" title="真实姓名"
					style="{text-align:center}" />
				<ec:column width="20%" property="POSITION" title="职位"
					style="{text-align:center}" />
				<ec:column width="20%" property="INDIVIDUALMOBILE" title="移动电话"
					style="{text-align:center}" />
				<ec:column width="10%" property="null" title="操作"
					style="{text-align:center}" sortable="false">
					<a href='javascript:;' value='${record.USERID}'
						onclick='javascrip:show(0,this);'>查看</a>
					<a href='javascript:;' value='${record.USERID}'
						onclick='javascript:show(4,this);'>启用</a>
				</ec:column>
			</ec:row>
		</ec:table>
	</body>
</html>
