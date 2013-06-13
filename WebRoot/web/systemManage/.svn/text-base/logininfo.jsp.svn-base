<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript">
var targetUrl="";


function langSelecter_onChanged()
{
	document.getElementById("langForm").submit();
}

function search()
{
     var condition=document.getElementById("textfield").value;
      condition="condition="+condition;
      var tab=window.frames("mainFrame");
      var targetUrl;
      try{
              var test=tab.document.getElementById("ifr").src;
              targetUrl = Split(test,'?')[0];
              tab.document.getElementById("ifr").src= encodeURI(targetUrl+"?"+condition);
      }
      catch(e)
      {
              var test=document.all("mainFrame").src;
              targetUrl = Split(test,'?')[0];
              document.all("mainFrame").src= encodeURI(targetUrl+"?"+condition);
      }
      document.getElementById("textfield").value = "";
}
function getKeys(manageid,publishid)
{
    // alert('打开查询窗口');
    //出版社
    if(publishid != "-1"){
      document.all("mainFrame").src =
      "./cxtj/complexsearch/complexsearch.jsp";
      return;
    }
    //主管单位
    if(publishid == "-1" && manageid != "-1"){
      document.all("mainFrame").src =
          "./cxtj/complexsearch/complexsearch.jsp";
      return;
    }
    //条码中心、总署
    if(publishid == "-1" && manageid == "-1"){
      document.all("mainFrame").src =
          "./cxtj/complexsearch/complexsearch.jsp";
      return;
    }
}
//根据字符切分字符串的函数
function Split(str,ch)
{
    var last = str.substring(str.length-1,str.length);
    if(last==ch)
    {
            str = str.substring(0,str.length-1);
    }
    var data = new Array("");
    var tempstr = "";
    var j = 0;
    while(str.indexOf(ch)>-1){
            var index = str.indexOf(ch);
            tempstr = str.substring(0,index);
            data[j++] = new Array(tempstr);
            str = str.substring(index+1,str.length);
    }
    data[j] = str;
    return data;
}
//回车触发事件
function document.onkeydown(){
   if(event.keyCode == 13){
       document.getElementById("search").click();
       return false;
   }
}
</script>

<form action="<s:url/>" id="langForm" style="margin: 0px;">
	<table width="998px" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="703" class="searchSty">您好，<%=session.getAttribute("userName")%>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				当前时间 <label id="datetime"></label> <label id="nowtime"></label> 
				<script type="text/javascript">showDateTime();</script>
			</td>
		</tr>
	</table>
</form>
