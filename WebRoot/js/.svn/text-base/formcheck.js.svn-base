/**
--------------------------------------------------------
表单通用校验
特别说明：
	这个文件来自不易，先后经历过项目组成员(中国版权保护中心著作权登记项目)李
维一的不懈努力，以及项目经理陈朝阳的深度挖掘和多方思考后，才有现在这个成果。
	可以说，这个成果是本次项目实施中，对大而复杂的业务表单进行js校验的一个很
好的解决方案，也是本项目组全体成员的共同努力的结晶。
	最后，本人能有幸整理之，实感荣幸。当然由于个人能力的局限，还有诸多的地方
需要改进，如果您正在使用此文件，还请多多赐教!
	补充：本人李鹏从中国版权保护中心著作权登记项目中下载到了该js，对其进行了改进。若以后有人继续使用并改进，希望能qq我，告诉我bug。多谢赐教。qq：3766905
--------------------------------------------------------
input中加如下属性：
	tips="请填姓名或单位"  //鼠标放上去后的浮动提示框内容
	valid="required"     //验证类型，下面有详细的说明，多个以"|"分隔
	errmsg="不能为空！"    //错误提示信息，多个以"|"分隔
	length="10" 		//长度限制
	onmousemove="cpcc_showtip(this.tips,this.valid,this.length,500)" 
	onMouseOut="cpcc_showtip()"
--------------------------------------------------------
valid 验证类型说明：
	isNumber        //数字
	isEmail         //email
	isPhone         //电话
	isMobile        //手机
	isIdCard        //证件号
	isMoney         // money
	isZip           // 邮编
	isQQ            //  qq
	isInt           // 数字
	isEnglish       //英文
	isChinese       // 中文
	isUrl           //  url
	isDate          // 日期
	isTime          // 时间
	required        //不为空规则
	custom          //定制规则，必须包含 rules 属性，属性值为正则表达式
	limitEmpty      //可选规则，如果填了内容，则应该包含 limitRules 属性
*/
// 校验前的处理function
function beforeValid(){
	//需重实现，选项
}
// 通用校验后，特殊校验，通过返回true，不通过返回false
function afterValid(){
	//需重实现，选项
	return true;
}
// 在校验之后需要处理的一些逻辑
function lastLogic(){
	//需重实现，选项
}

// 关闭当前页面
function goBack()
{
	self.close();
}
	
// 提交表单响应函数
function saveForm(){
	try
	{
		clearErrorMsgDiv();
		// 校验前的处理function
		beforeValid();
		var canSubmit = false;
		var comVerify = validFormElements();
		var specialVerify = afterValid();
	
		if(comVerify && specialVerify){
			canSubmit = true;
		}
		// 校验之后需要处理的一些逻辑
		lastLogic();
		if(canSubmit)//验证通过
		{
			deleteFile=false;//不用删除上传的文件了。（deleteFile在jquery_lipeng.js中定义了）。		
		}
		/*if(canSubmit){
			//alert("====== 1 =======" + parent);
			document.forms[0].submit();
			//修改表单后，刷新父页面
			//alert("====== 2 =======" + parent.parent);
			//alert(reload_parent());
			//parent.reload_parent();*/
		return canSubmit;	
	}
	catch(e)
	{		
		alert("验证的javascript发生了错误！(saveForm)错误为："+e.description);
		return false;
	}
}

function modifyForm(){
	
	clearErrorMsgDiv();
	// 校验前的处理function
	beforeValid();
	var canSubmit = validFormElements();
	var afterB = afterValid();
	if(canSubmit && afterB){
		canSubmit = true;
	}
	// 校验之后需要处理的一些逻辑
	lastLogic();
	
	if(canSubmit){
		document.forms[0].submit();
	}
}


// 清楚上次的留下的校验错误信息
function clearErrorMsgDiv(){
	var fm = document.forms[0];
	var fm_els = fm.elements;
	//alert("x : "+fm_els[0].outerHTML);
	for(var i=0; i<fm_els.length; i++){
		var _td = getParentEF(fm_els[i], "TD");
		if(_td == null){
			continue;	
		}
		
		for(var j=0; j<_td.children.length; j++){
			var _tmp = _td.children(j);
			
			if(_tmp.tagName == "DIV" && _tmp.className == "divErrorRed"){
				_td.removeChild(_tmp);
				// 需要特别注意：很多时候，都会忘了下面这步操作
				j--;
			}
		}
	}	
}

/* 
*   检查指定的域是否需要校验
*   无需校验，返回true，否则返回false
*/
function checkIfNeedValid(inputObj){
	// 1、域的valid属性为空，或等于no、""时，则不校验
	if(!inputObj.valid || inputObj.valid == 'no' || inputObj.valid == ''){
		return true;
	}
	// 2、如果被一个隐藏的html标签包含，则不校验
	var _hiddenTag = inputObj.parentNode;
	if(_hiddenTag && _hiddenTag.style.display == 'none'){
		return true;
	}
	// 3、如果被一个隐藏的tbody包含，则不校验
	var _tbody = getParentEF(inputObj, "TBODY");
	if(_tbody && _tbody.style.display == 'none'){
		return true;
	}
	// 4、如果包含在一个table中，并且这个table又被一个隐藏的html标签包含，则不校验
	var _table = getParentEF(inputObj, "TABLE");
	_table = _table.parentNode;
	if(_table && _table.style.display == 'none'){
		return true;
	}
	
	return false;
}

/*
*  对指定域属性中指定的校验属性进行相应的校验
*      如果是定制的校验逻辑，即valid=“custom”，
*      则需提供rules属性，其包含的内容为本次校验的正则表达式逻辑。
*
*      如果校验通过，返回true；
*      如果校验没通过，显示错误信息，返回false
*/
var errorCount = 0;//没通过校验的个数
function validAppointElement(inputObj){
	
	try
	{
		// 校验类型	
		var validType = inputObj.getAttribute('valid');
		// 校验对应的错误信息
		var errorMsg = inputObj.getAttribute('errmsg');
		
		// 校验类型数组
		var vts = validType.split('|');
		// 错误信息数组
		var ems = errorMsg.split('|');
		
		for (var j=0; j<vts.length; j++) {
			var curValidType = vts[j];
			var curErrorMsg = ems[j];
			
			validTypeChoose(inputObj, curValidType, curErrorMsg);
		}
	}
	catch(e)
	{
		errorCount++;
		alert("验证的javascript发生了错误！(validAppointElement)错误为："+e.description);		
	}
}
// 对limitEmpty限制允许空的情况的处理
function limitEmptyValid(inputObj){
	
	// 校验类型
	var validType = inputObj.getAttribute('limitRules');
	// 校验对应的错误信息
	var errorMsg = inputObj.getAttribute('errmsg');
	
	// 校验类型数组
	var vts = validType.split('|');
	// 错误信息数组
	var ems = errorMsg.split('|');
	
	for (var j=0; j<vts.length; j++) {
		var curValidType = vts[j];
		var curErrorMsg = ems[j];
		
		validTypeChoose(inputObj, curValidType, curErrorMsg);
	}
}
// 根据验证验证类型进行校验, validAppointElement方法的辅助方法
function validTypeChoose(inputObj, curValidType, curErrorMsg){
	try
	{
	
		if(curValidType.indexOf("int-range")==0)//限定整形范围
		{			
			var temp= curValidType.split("-");
			var min=(temp[2]);
			var max=(temp[3]);
			
			if(!executeVerify(inputObj,RegStorage["isInt"]))///^[-+]?[1-9]\d*$|^0$/))
			{
				errorCount++;
				showErrorMsg(inputObj, curErrorMsg);
			}		
			
			if(parseInt(inputObj.value)<parseInt(min) ||  parseInt(inputObj.value)>parseInt(max))
			{
				errorCount++;
				showErrorMsg(inputObj, curErrorMsg);
			}			
		}
		else if(curValidType.indexOf("int-min-value")==0)//限定整形最小值
		{
			var temp= curValidType.split("-");
			var min=(temp[3]);			
			
			if(!executeVerify(inputObj,RegStorage["isInt"]))///^[-+]?[1-9]\d*$|^0$/))
			{
				errorCount++;
				showErrorMsg(inputObj, curErrorMsg);
			}		
			
			if(parseInt(inputObj.value)<parseInt(min))
			{
				errorCount++;
				showErrorMsg(inputObj, curErrorMsg);
			}
		}
		else if(curValidType.indexOf("great-than")==0)//是否大于(用于对象比较)
		{
			var temp= curValidType.split("-");
			var minObjID=(temp[2]);
			var min=document.getElementById(minObjID).value;	
			
			
			if(executeVerifyByValue(min,RegStorage["isDate"]))//日期型
			{
				if(compareDate(min,inputObj.value,true))
				{
					errorCount++;
					showErrorMsg(inputObj, curErrorMsg);
				}
			}
						
			else if(executeVerifyByValue(min,RegStorage["isNumber"]))//数字
			{
				if(parseFloat(inputObj.value)<=parseFloat(min))
				{
					errorCount++;
					showErrorMsg(inputObj, curErrorMsg);
				}
			}
		} 
		else if(curValidType.indexOf("greatEqual-than")==0)//是否大于等于(用于对象比较)
		{			
			var temp= curValidType.split("-");
			var minObjID=(temp[2]);
			var min=document.getElementById(minObjID).value;	
			
			
			if(executeVerifyByValue(min,RegStorage["isDate"]))//日期型
			{
				if(compareDate(min,inputObj.value,false))
				{
					errorCount++;
					showErrorMsg(inputObj, curErrorMsg);
				}
			}
						
			else if(executeVerifyByValue(min,RegStorage["isNumber"]))//数字
			{
				if(parseFloat(inputObj.value)<parseFloat(min))
				{
					errorCount++;
					showErrorMsg(inputObj, curErrorMsg);
				}
			}
		
		}
		
		if(curValidType.indexOf("notPass")==0) //审核不通过时意见不能为空notPass-radio的id号-不通过的值
		{
			var temp= curValidType.split("-");
			var minObjID=(temp[1]);
			var names=document.getElementsByName(minObjID);
			for(var i=0;i<names.length;i++)
			{
			  if(names[i].checked==true && names[i].value==temp[2]&& inputObj.value.trim() == '')
				{
						errorCount++;
						showErrorMsg(inputObj, curErrorMsg);
						break;
				}
			}
		}
		
		
		if(curValidType.indexOf("notEqual-to")==0)//是否大于等于(用于对象比较)
		{			
			var temp= curValidType.split("-");
			var minObjID=(temp[2]);
			var min=document.getElementById(minObjID).value;	
			if(min == inputObj.value)
			{
			  errorCount++;
			  showErrorMsg(inputObj, curErrorMsg);
			}
		}
		
		if(curValidType.indexOf("float-min-value")==0)//限定整形最小值
		{
			var temp= curValidType.split("-");
			var min=(temp[3]);			
			
			if(!executeVerify(inputObj,RegStorage["isNumber"]))///^[-+]?[1-9]\d*$|^0$/))
			{
				errorCount++;
				showErrorMsg(inputObj, curErrorMsg);
			}		
			
			if(parseFloat(inputObj.value)<parseFloat(min))
			{
				errorCount++;
				showErrorMsg(inputObj, curErrorMsg);
			}
		}
		
		if(curValidType.indexOf("float-range")==0)//限定整形范围
		{			
			var temp= curValidType.split("-");
			var min=(temp[2]);
			var max=(temp[3]);
			
			if(!executeVerify(inputObj,RegStorage["isNumber"]))///^[-+]?[1-9]\d*$|^0$/))
			{
				errorCount++;
				showErrorMsg(inputObj, curErrorMsg);
			}		
			
			if(parseFloat(inputObj.value)<parseFloat(min) ||  parseFloat(inputObj.value)>parseFloat(max))
			{
				errorCount++;
				showErrorMsg(inputObj, curErrorMsg);
			}			
		}
		
		switch (curValidType) {			
			case 'isNumber':
			case 'isEmail':
			case 'isPhone':
			case 'isMobile':
			case 'isIdCard':
			case 'isMoney':
			case 'isZip':
			case 'isQQ':
			case 'isInt':
			case 'isEnglish':
			case 'isChinese':
			case 'isUrl':
			case 'isDate':
			case 'isTime':
			case 'isUserName':
				//alert(curValidType +" : "+RegStorage[curValidType]);
				if(!executeVerify(inputObj, RegStorage[curValidType])){
					errorCount++;
					showErrorMsg(inputObj, curErrorMsg);
				}
				break;
			case 'custom':
				//alert(inputObj.getAttribute('rules'));
				if(!executeVerify(inputObj, eval(inputObj.getAttribute('rules')))){
					errorCount++;
					showErrorMsg(inputObj, curErrorMsg);
				}
				break;
			case 'required':
				if(inputObj.value.trim() == ''){
					errorCount++;
					showErrorMsg(inputObj, curErrorMsg);
				}
				break;
			case 'limitEmpty':
				if(inputObj.value.trim() != ''){
					limitEmptyValid(inputObj);
				}
				break;			
				/* 判断下拉列表是否被选择*/
			case 'isSelected':
				if(inputObj.value.trim() == '0'){
					errorCount++;
					showErrorMsg(inputObj, curErrorMsg);
				}
				break;			
			default :
				break;
		}
	}
	catch(e)
	{
		errorCount++;
		alert("验证的javascript发生了错误！(validTypeChoose)错误为："+e.description);		
		return false;
	}
		
		
}
// 显示没通过校验的错误信息
function showErrorMsg(inputObj, errorMsg){
	var newDIV = document.createElement("DIV");
	newDIV.innerHTML = errorMsg;
	newDIV.className = 'divErrorRed';
	newDIV.style.color="#cc0000";
	newDIV.style.fontSize="12px";	
	var _td = getParentEF(inputObj, "TD");
	_td.appendChild(newDIV);
}

// 执行校验，校验成功返回true，否则返回false
function executeVerify(inputObj, regx_){	
	var tmpValue = inputObj.value.trim();
	if(tmpValue=="")
	{
		return true;
	}
	//alert(regx_+".test("+tmpValue+")");
	//alert(eval(regx_+".test("+tmpValue+")"));
	if (regx_.test(tmpValue)){
		return true;
	}
	return false;
}

// 执行校验，校验成功返回true，否则返回false
function executeVerifyByValue(tmpValue, regx_){	
	if(tmpValue=="")
	{
		return true;
	}
	//alert(regx_+".test("+tmpValue+")");
	//alert(eval(regx_+".test("+tmpValue+")"));
	if (regx_.test(tmpValue)){
		return true;
	}
	return false;
}






// 对表单中的每个元素进行校验
function validFormElements(){
	// 取表单的所有元素
	var fm = document.forms[0];
	var fm_els = fm.elements;
	// 初始化错误号
	errorCount = 0;
	
	for(var i=0; i<fm_els.length; i++){
		// 判断指定的域是否需要校验，无需校验时退出本次循环
		if(checkIfNeedValid(fm_els[i])){
			continue;	
		}
		// 对域fm_els[i]进行校验
		if(validAppointElement(fm_els[i])){
			continue;
		}
	}
	//alert(errorCount);
	if(errorCount > 0){
		return false;
	}
	return true;
}



// 以下为一些辅助的函数
//---------------------------------------------------------------------
//一些常用的js正则表达式校验
var RegStorage = {
	isNumber:  /^[-\+]?\d+(\.\d+)?$/,
	isEmail: /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)/,
	isPhone:  /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/,
	isMobile:  /^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$/,
	isIdCard:  /(^\d{15}$)|(^\d{17}[0-9Xx]$)/,
	isMoney:  /^\d+(\.\d+)?$/,
	isZip:  /^[0-9]\d{5}$/,
	isQQ:  /^[1-9]\d{4,10}$/,
	isInt:  /^[-\+]?\d+$/,
	isEnglish:  /^[A-Za-z]+$/,
	isChinese:  /^[\u0391-\uFFE5]+$/,
	isUrl:  /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/,
	isDate:  /^\d{4}-\d{1,2}-\d{1,2}$/,
	isTime:  /^\d{4}-\d{1,2}-\d{1,2}\s\d{1,2}:\d{1,2}:\d{1,2}$/,
	isUserName: /^[a-zA-Z0-9_]{6,16}$/ 
	
};
//取得指定标签的父对象，以Form为上限
function getParentEF(obj, tagName){
	obj = obj.parentNode;
	//alert(obj.tagName + "," + tagName);
	while(obj.tagName != tagName){
		//alert(obj.tagName + "," + tagName);
		if(obj.tagName == "FORM"){
			return null;
		}
		obj = obj.parentNode;
	}
	return obj;
}
// 去字符串两边的空格
String.prototype.trim = function() {
	return this.replace(/^\s*|\s*$/g, "");
}

//***************************************************************************
//以下为输入框长度限制功能
//用法 input 或 textarea 加上 length =  'n' 如果无限制或不需要说明，则不加!
//by chenzhaoyang 2008-07-05
//***************************************************************************
 
String.prototype.len=function(){  
return this.replace(/[^\x00-\xff]/g,"***").length;  
}  
 
//Set maxlength for multiline TextBox  
function setMaxLength(object,length)  
{ 
     
    var result = true;  
    var controlid = document.selection.createRange().parentElement().id;  
    var controlValue = document.selection.createRange().text;  
    var tempString=object.value; 
	
     if(tempString.len()>length){
		var tt="";  
		for(var i=0;i<length;i++)  
			{  
				if(tt.len()<length)  
					tt=tempString.substr(0,i+1);  
				else  
					break;  
			}  
		if(tt.len()>length) 
			tt=tt.substr(0,tt.length-1); 
		object.value=tt;
     
     }
}  
 
//Check maxlength for multiline TextBox when paste  
function limitPaste(object,length)  
{  
        var tempLength = 0;  
        if(document.selection)  
        {  
            if(document.selection.createRange().parentElement().id == object.id)  
            {  
                tempLength = document.selection.createRange().text.len();  
            }  
        }  
        var tempValue = window.clipboardData.getData("Text");  
        tempLength = object.value.len() + tempValue.len() - tempLength;  
 
        if (tempLength > length)  
        {  
            tempLength -= length;  
            var tt="";  
            for(var i=0;i<tempValue.len()-tempLength;i++)  
                {  
                    if(tt.len()<(tempValue.len()-tempLength))  
                        tt=tempValue.substr(0,i+1);  
                    else  
                        break;  
                }  
            if(tt.len()<=0) 
            {     
                window.event.returnValue=false; 
                 
            } 
            else 
            { 
                tempValue=tt;  
                window.clipboardData.setData("Text", tempValue);  
                window.event.returnValue = true;  
            } 
        }  
     
 
}  
 
/*
 * 
 * 比较日期
 * 若startDate大于endDate，返回true
 * containEqual：ture：大于等于   false：大于
 * */
function compareDate(startDate,endDate,containEqual) {    
    var startMonth = startDate.substring(5,startDate.lastIndexOf ("-"));   
    var startDay = startDate.substring(startDate.length,startDate.lastIndexOf ("-")+1);   
    var startYear = startDate.substring(0,startDate.indexOf ("-"));   
  
    var endMonth = endDate.substring(5,endDate.lastIndexOf ("-"));   
    var endDay = endDate.substring(endDate.length,endDate.lastIndexOf ("-")+1);   
    var endYear = endDate.substring(0,endDate.indexOf ("-"));   
       
    if(containEqual)
    {
	    if (Date.parse(startMonth+"/"+startDay+"/"+startYear) >= Date.parse(endMonth+"/"+endDay+"/"+endYear)) 
	    {   
	        return true;
	    }
	    return false;
    }       
    else
    {
    	if (Date.parse(startMonth+"/"+startDay+"/"+startYear) > Date.parse(endMonth+"/"+endDay+"/"+endYear)) 
	    {   
	        return true;
	    }
	    return false;
    	
    }
       
}   
  


function PressLength() 
{ 
     
    if(event.srcElement.type=="text" || event.srcElement.type=="textarea" ) 
    { 
        if(event.srcElement.checkLength!=null) 
            setMaxLength(event.srcElement,event.srcElement.checkLength); 
         
    } 
} 
 
function LimitLength() 
{ 
 
    if(event.srcElement.type=="text" || event.srcElement.type=="textarea" ) 
    { 
        if(event.srcElement.checkLength!=null) 
            limitPaste(event.srcElement,event.srcElement.checkLength); 
    } 
} 
document.documentElement.attachEvent('onkeyup', PressLength);  
document.documentElement.attachEvent('onpaste', LimitLength); 
