<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
%>
<script type="text/javascript" src="<%=path%>/common/tips/tips.js"></script>

<style type="text/css">
	#mytips {
	BORDER-RIGHT: orange 1px solid; PADDING-RIGHT: 6px; BORDER-TOP: orange 1px solid; DISPLAY: none; PADDING-LEFT: 6px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Shadow(color=#999999,direction=135,strength=3); LEFT: 0px; PADDING-BOTTOM: 6px; BORDER-LEFT: orange 1px solid; WIDTH: 600px; COLOR: black; LINE-HEIGHT: 18px; PADDING-TOP: 6px; BORDER-BOTTOM: orange 1px solid; POSITION: absolute; TOP: 5px; HEIGHT: 50px; BACKGROUND-COLOR: #ffffe6; TEXT-ALIGN: left
	} 
</style>

<script type="text/javascript">	
	function showtip(tips,maxLength,tipWidth){
			//tips--提示信息		
			//maxLength--输入长度限制
			//tipWidth--提示图层宽度

	var my_tips=document.all.mytips;
	var left=document.documentElement.scrollLeft;
	var top=document.documentElement.scrollTop ;	
	if(left==0)
	{
		left=document.body.scrollLeft+3;
	}
	if(top==0)
	{
		top=document.body.scrollTop+3;
	}
	
	if(tips && maxLength)
	{	
			
		tips = tips +  '<br>' + '<font color="red">长度限制：'+maxLength+'字节(一个汉字等于3个字节)</font>&nbsp';
		my_tips.innerHTML=tips;		
		my_tips.style.width=tipWidth;
		
		my_tips.style.left=event.clientX+left ;		
		my_tips.style.top=event.clientY+top ;
		my_tips.style.display="block";
		my_tips.style.zIndex=1;
		
			
	}	
	else if(tips)
	{				
		my_tips.innerHTML=tips;		
		my_tips.style.width=tipWidth;
		my_tips.style.left=event.clientX+left ;	
		my_tips.style.top=event.clientY+top;
		my_tips.style.display="block";
		my_tips.style.zIndex=1;
	}		   
	else if(maxLength)
	{		
		tips ='<font color="red">长度限制：'+maxLength+'字节</font>&nbsp';
		my_tips.innerHTML=tips;		
		my_tips.style.width=tipWidth;
		my_tips.style.left=event.clientX+left;		
		my_tips.style.top=event.clientY+top;
		my_tips.style.display="block";
		my_tips.style.zIndex=1;
	}
	else {
	   my_tips.style.display="none";
	}
	
	
}
</script>
<DIV id=mytips></DIV>