<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<script type="text/javascript">
function showError()
{
	<%
	HashMap errorMap=(HashMap)request.getAttribute("errorMap");
	if(errorMap!=null && errorMap.size()>0)
	{
		for (Iterator iter = errorMap.entrySet().iterator(); iter.hasNext();) 
		{   
	    	Map.Entry entry = (Map.Entry) iter.next();     
	    	String key = entry.getKey().toString();     
	    	String val = entry.getValue().toString();    	         
%> 
			var inputObj=document.getElementById("<%=key%>");
			
			// 校验类型	
			var validType = inputObj.getAttribute('valid');
			// 校验对应的错误信息
			var errorMsg = inputObj.getAttribute('errmsg');
			
			// 校验类型数组
			var vts = validType.split('|');
			// 错误信息数组
			var ems = errorMsg.split('|');
			
			var findFlag=false;
			for(var i=0;i<vts.length;i++)
			{
				if(vts[i]=="<%=val%>")
				{
					showErrorMsg(document.getElementById("<%=key%>"),ems[i]);
					findFlag=true;
					break;		
				}
			}
			if(!findFlag)
			{
				alert("没有ID为'<%=key%>'的标签");
			}
<%
		}
	}
%>
}

</script>
