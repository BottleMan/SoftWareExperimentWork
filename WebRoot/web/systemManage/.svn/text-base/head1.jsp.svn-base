<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>div</title>
<link href="./web/systemManage/css/css.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="./web/systemManage/css/index.css" rel="stylesheet"
	type="text/css" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<script type="text/javascript" src="./web/systemManage/js/menu.js"></script>
<script type="text/javascript" src="<%=path%>/js/shield.js"></script>
<script type="text/javascript" src="<%=path%>/js/sysMenu.js"></script>
<script type="text/javascript" src="<%=path%>/js/system.js"></script>

</head>
<script type="text/javascript">
  function logout()
{
	if(confirm("确认注销？")==true)
	{
		window.location.href="<%=path%>/index.jsp";	
	}
}
function exit()
{
	if(confirm("确认退出？")==true)
	{
		window.close();
	}
}

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

<script language=JavaScript>
	var mylocation = "./web/systemManage/about.jsp"
	var winheight = 100
	var winsize = 100
	var x = 5
	function go() {
		win2 = window.open("", "", "scrollbars")
		win2.location = mylocation
		if (!document.layers && !document.all) {
			win2.location = mylocation
			return
		}
		win2.resizeTo(100, 100)
		win2.moveTo(100, 50)
		go2()
	}
	function go2() {
		if (winheight >= 600)
			x = 0
			
		win2.resizeBy(5, x)
		winheight += 5
		winsize += 5
		
		if (winsize >= 935) {
			win2.location = mylocation
			winheight = 100
			winsize = 100
			x = 5
			return
		}
		setTimeout("go2()", 50)
	}
</script>

<body>
	<div id="wrap">
		<div id="header">
			<div id="menu">
				<ul>

					<li><a href="javascript:go()">系统说明</a>
					</li>
					<li><a href="javascript:;" onclick="logout()">注销</a>
					</li>
					<li><a href="javascript:;" onclick="exit()">退出</a>
					</li>
					<li><a href="javascript:;"
						onclick="ShowModalWithResult('<%=path%>/web/internalWeb/userManage/modifyPassword.jsp?','300px','400px');">修改密码</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>
