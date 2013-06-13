//等待check.jsp实现
function showError()
{
};
$(function(){	
	var tips = $("*[title],*[checkLength]");
	$.each(tips,function(i, n){		
		var temptip=n.title.split("@#@");
		for(var i=1;i<temptip.length;i++)
		{
			if(temptip[i].charAt(0)=="T")//正常提示
			{
				n.setAttribute("tip",temptip[i].substring(1,temptip[i].length));				
			}
			else if(temptip[i].charAt(0)=="C")//错误提示
			{
				n.setAttribute("errmsg",temptip[i].substring(1,temptip[i].length));				
			}
			else
			{
				alert(temptip+"未设置正确！！！");
			}
		}
		n.removeAttribute("title");				
	});	
	
	tips.mousemove(function() {
		var obj = $(this);				
		showtip(obj.attr("tip"),obj.attr("checkLength"),300);
	});
	
	tips.mouseout(function() {		
		showtip();		
	});
	
	showError();
});
