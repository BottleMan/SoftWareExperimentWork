

function showtip(tips,maxLength,tipWidth){
			//tips--提示信息		
			//maxLength--输入长度限制
			//tipWidth--提示图层宽度

	
	var my_tips=document.all.mytips;
	if(tips){				
		if(maxLength){
		   tips = tips +  '<br>' + '<font color="red">长度限制：'+maxLength+'字节(一个汉字等于2个字节)</font>&nbsp';
		   }
		my_tips.innerHTML=tips;
		my_tips.style.display="block";
		my_tips.style.width=tipWidth;
		my_tips.style.left=event.clientX+10+document.body.scrollLeft;
		my_tips.style.top=event.clientY+10+document.body.scrollTop;
	   }
	else {
	   my_tips.style.display="none";
	}
}