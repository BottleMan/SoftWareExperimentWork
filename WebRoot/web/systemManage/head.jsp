<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();	
%>
<style>
body { text-align:center; } 
div#wrap { 
text-align:left; 
width:999px; 
margin:0 auto; 
background-color:#ccc; 
} 
</style>
<map name="Map" id="Map">
  <area shape="rect" coords="955,7,994,22" href="#" alt="" target="" onclick="javascript:window.open('<%= (String)session.getAttribute("helpurl") %>','','height=600,width=990,top=80,left=10,depended=yes,toolbar=no,menubar=no,scrollbars=yes, resizable=no,location=no, status=no');"/>
  <area shape="rect" coords="904,7,941,24" href="javascript:ExitLogin()" alt=""/>
  <area shape="rect" coords="851,7,889,24" href="javascript:ReturnLogin()" alt=""/>
</map>
<script type="text/javascript">
var day;   var date;  var time;
function showDateTime(){
  var today = new Date();
  if(today.getDay()==0)     day = "星期日";
  if(today.getDay()==1)     day = "星期一";
  if(today.getDay()==2)     day = "星期二";
  if(today.getDay()==3)     day = "星期三";
  if(today.getDay()==4)     day = "星期四";
  if(today.getDay()==5)     day = "星期五";
  if(today.getDay()==6)     day = "星期六";
  date = today.getFullYear() + "年" +
         (today.getMonth() + 1 ) + "月" +
         today.getDate() + "日&nbsp;&nbsp;&nbsp;"  +
         day;  
  time = "";
  if(today.getHours()<10)
       time += "0" +today.getHours()+":";
  else
       time +=today.getHours()+":";
  if(today.getMinutes()<10)
       time += "0" +today.getMinutes()+":";
  else
       time +=today.getMinutes()+":";
  if(today.getSeconds()<10)
       time += "0" +today.getSeconds();
  else
       time +=today.getSeconds();
 // date += time;
  //document.write(date);
  document.getElementById("datetime").innerHTML = date;
  document.getElementById("nowtime").innerHTML = time;
  setTimeout("showDateTime()",1000);
}
</script>

<div  id="wrap"
					style="background: url(<%=path%>/image/login5.jpg);border=0; height=68;width=1000">
					
</div>
<div id="wrap"
					style="background: url(<%=path%>/image/login10.jpg);border=0; height=28;width=1000">				
</div>
