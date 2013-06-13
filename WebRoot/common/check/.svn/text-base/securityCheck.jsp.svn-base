<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%!
	
	//	oper:模块号
	//	userModels：当前用户的模块号
	//	models:系统所有的模块号和模块名	
	String getOperName(int oper,HashSet userModels,HashMap<Integer,String> models)
	{
		if(userModels.contains(oper))//该用户有访问该模块的权利
		{			
			return models.get(oper);
		}
		else
		{
			return "";
		}
	}
%>



<%
HashMap<Integer,String> models=(HashMap<Integer,String>)session.getAttribute("models");
HashSet<Integer> userModels=(HashSet<Integer>)session.getAttribute("userModels");
/* if(modelID!=-1 && !userModels.contains(modelID))
{
	response.sendRedirect(request.getContextPath()+"/error/rightError.jsp");
	return;
} */
%>