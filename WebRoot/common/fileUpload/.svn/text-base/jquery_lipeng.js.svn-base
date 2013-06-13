var fileCount=0;
var myitemPath;
// 定义回调函数（一个页面同时支持两处文件上传）
function initUpload(whichUpload,fileQueue,files,auto,multi,fileDesc,fileExt,itemPath)
{
		myitemPath=itemPath;
	$(document).ready(function() {
		$('#'+whichUpload).uploadify({
			'uploader' : itemPath+'/common/fileUpload/uploadify.swf',
			'script' : itemPath+'/servlet/fileUpload',
			'cancelImg' : itemPath+'/common/fileUpload/cancel.png',
			'buttonImg' : itemPath+'/common/fileUpload/browse.png',
			'queueID' : fileQueue,//'fileQueue1',
			'auto' : auto,//false,
			'multi' : multi,//true,
			'buttonText' : 'browse',
			'fileDesc' : fileDesc,//'支持格式:jpg/gif/jpeg/png/bmp.',
			'fileExt' : fileExt,//'*.jpg;*.gif;*.jpeg;*.png;*.bmp',
			'width' : 72,
			'height' : 18,		
			'wmode' : 'transparent',
			onComplete : function(evt, queueID, fileObj, response, data) {
				var form=document.forms[0];
				var result=response.split("*");
				
				var filePath=result[0];
				var fileName=result[1];
				var extName=result[2];
				var fileSize=result[3];
				var input=document.createElement("<input type=\"hidden\">");								
				input.setAttribute("id",filePath+"_hidden_filePath");
				input.setAttribute("name",whichUpload+"["+fileCount+"].filePath");
				input.setAttribute("value",filePath);
				form.appendChild(input);
				
				input=document.createElement("<input type=\"hidden\">");								
				input.setAttribute("id",filePath+"_hidden_fileName");
				input.setAttribute("name",whichUpload+"["+fileCount+"].fileName");
				input.setAttribute("value",fileName);
				form.appendChild(input);
				
				input=document.createElement("<input type=\"hidden\">");								
				input.setAttribute("id",filePath+"_hidden_extName");
				input.setAttribute("name",whichUpload+"["+fileCount+"].extName");
				input.setAttribute("value",extName);
				form.appendChild(input);
				
				input=document.createElement("<input type=\"hidden\">");								
				input.setAttribute("id",filePath+"_hidden_fileSize");
				input.setAttribute("name",whichUpload+"["+fileCount+"].fileSize");
				input.setAttribute("value",fileSize);
				form.appendChild(input);													
				
				fileCount++;				
				
					
				
				$('.'+files).append('<li name='+whichUpload+'_li id=\'' + filePath + '\'>' + fileName + '上传成功'
						+ '&nbsp;&nbsp;'
						+ '<a href="javascript:;" onclick="deleteFile(\''
						+ filePath + '\');">删除</a></li>');						
																
			},
			onError : function(a, b, c, d) {
				alert("文件上传失败");
			}
		});
	});
}

// 删除文件,filePath:文件夹+文件名。
function deleteFile(filePath) {
	$.ajax({
				url : myitemPath+"/servlet/fileDelete",
				type : "POST",
				data :"fileName=" + filePath,
				cache : false,
				async : false,
				
				success : function(result) {
					if (result != null && result == '删除成功') {
						var oDl = document.getElementById(filePath);						
						oDl.parentNode.removeChild(oDl);//删除提示
												
						var ohidden=document.getElementById(filePath+"_hidden_filePath");
						document.forms[0].removeChild(ohidden);//删除隐藏标签
						ohidden=document.getElementById(filePath+"_hidden_fileName");
						document.forms[0].removeChild(ohidden);//删除隐藏标签
						ohidden=document.getElementById(filePath+"_hidden_extName");
						document.forms[0].removeChild(ohidden);//删除隐藏标签
						ohidden=document.getElementById(filePath+"_hidden_fileSize");
						document.forms[0].removeChild(ohidden);//删除隐藏标签
						
						var test=document.getElementsByTagName("input");
					} else {
						alert(result);
					}
				},
				error : function() {
					alert('提交请求失败,删除文件失败!');
				}
			});
}

// 定义上传目录
// category：上传的目录
// whichUpload：整型，目录对应哪个控件。
// isMultiFile
function uploadifyUpload(whichUpload,category,isMultiFile,userID) {	
		var fileCount=document.getElementsByName(whichUpload+"_li");
		if(isMultiFile==false && fileCount>0)//单文件上传，并且已经上传的文件数>0
		{
			alert("只能上传一个文件！若想重新上传，请先删除该文件。");
			return;
		}
		
		$('#'+whichUpload).uploadifySettings('scriptData', {
					'category' : category+"@"+userID
				});
				
		
		$('#'+whichUpload).uploadifyUpload();	
}

//修改上传文件时用。
function deleteFiles(fileID,e,hiddenName)
{
	if(document.getElementsByName(hiddenName).length!=1)
	{				
		alert("没有对应name为"+hiddenName+"struts2的hidden标签，或不止1个");
	}
	if(document.getElementsByName(hiddenName)[0].value=="")
		document.getElementsByName(hiddenName)[0].value=fileID;
	else
		document.getElementsByName(hiddenName)[0].value=document.getElementsByName(hiddenName)[0].value+","+fileID;
	var li=e.parentNode;
	var ul=li.parentNode;
	ul.removeChild(li);								
}

function deleteAllTempFiles(ols)
{		
	var ols=ols.split('|');
	for(var i=0;i<ols.length;i++)
	{
		var ol=document.getElementById(ols[i]);
		if(ol!=null)
		{
			var length=ol.childNodes.length;
			for(var j=0;j<length;j++)
			{
				ol.childNodes[0].childNodes[1].click();
			}	
		}
		
	}
}

function body_onUnload(ols)
{	 
   if(deleteFile==false)
   	return;
   if (window.event.clientX>document.body.clientWidth&&event.clientY<0||event.altKey)
   {   		
     deleteAllTempFiles(ols);
   }
   else
   {  
       deleteAllTempFiles(ols);
   }
} 

