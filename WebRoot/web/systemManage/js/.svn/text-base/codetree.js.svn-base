var codedata = new Array(300);
function   codetreedata(){
		this.NodeID="";
		this.NodeName="";
		this.ParentID="";
}
//处理树节点
String.prototype.dealstr= function()
{
 var str=this.replace(/(^\s*)|(\s*$)/g,"");
 str=str.replace(/\s+/g," ");
 return str;
}

//将代码库树数据写入内存
function   setcodedata(name,index){
		codedata[index] = new codetreedata();
		codedata[index].NodeID =
			 XMLHttpReq.responseXML.getElementsByTagName(name[0])[index].firstChild.nodeValue;
		codedata[index].NodeName = 
			XMLHttpReq.responseXML.getElementsByTagName(name[1])[index].firstChild.nodeValue;
		codedata[index].ParentID = 
			XMLHttpReq.responseXML.getElementsByTagName(name[2])[index].firstChild.nodeValue;
}

//初始化代码库数结构函数
function Initdata(){
    createXMLHttpRequest();
    var url="listcodetree.action";
    XMLHttpReq.open("POST",url,true);
    XMLHttpReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    XMLHttpReq.onreadystatechange=initDataCallBack;
    XMLHttpReq.send(null);
}

//初始化代码库数结构回调函数
function initDataCallBack(){
    if(XMLHttpReq.readyState==4)
    {
        if(XMLHttpReq.status==200)
        {
        	loadXMLDoc(XMLHttpReq.responseText);
        	alert(XMLHttpReq.responseText);
        	var recordnum = xmlDoc.getElementsByTagName("recordnum")[0].firstChild.nodeValue;
            var fieldname = new Array(3);
            fieldname[0] = "NodeID";
            fieldname[1] = "NodeName";
            fieldname[2] = "ParentID";
            for(var i = 0;i<recordnum;i++)
            {
        	//根据编号生成树            setcodedata(fieldname,i);
        	//根据编号生成树        	totree(i);
            }
            tree.closeAllItems('1000000000');
        }
    }
}

//生成树
function  totree(index){
  var Parentid = codedata[index].ParentID;
  tree.insertNewItem(codedata[index].ParentID,codedata[index].NodeID,codedata[index].NodeName,0,"","","","select");
}

//添加树节点函数
function addnode(){
    if(document.getElementById("textfield").value=="")
    {
   	 	alert("请在文本框中输入节点名称！");
    	return;
    }
    var parentid="";
    var nowparentid=tree.getSelectedItemId();
    var nowselectednodeid="";
    if(nowparentid !="")
    {
      nowselectednodeid=tree.getSelectedItemId();
      while(nowparentid !="1000000000")
      {
       parentid = parentid+nowparentid+",";
       nowparentid=tree.getParentId(nowparentid);
      }
    }
    else
    {
    nowselectednodeid="1000000000";
    parentid="1000000000,";
    }
    //屏蔽同级下相同节点的插入
    var node=tree._globalIdStorageFind(nowselectednodeid);
    for(var i=0;i<node.childNodes.length;i++)
    {
       if(node.childNodes[i].label==document.getElementById("textfield").value)
       {
       		alert("该名称已在树中存在！");
       		return;
       	}
    }
    var obj=confirm("确定要添加新节点吗？");
    if(obj){
    createXMLHttpRequest();
    //转换树节点名字
    var treename=document.getElementById("textfield").value;
    treename=treename.dealstr();
    var url="addcodetree.action";
    var params="nodename="+treename+"&parentid="+parentid;
    XMLHttpReq.open("POST",url,true);
    XMLHttpReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    XMLHttpReq.onreadystatechange=addnodeCallBack;
    XMLHttpReq.send(params);
    }
}

//添加树节点回调函数
function addnodeCallBack(){
    if(XMLHttpReq.readyState==4)
    {
        if(XMLHttpReq.status==200)
        {
        	loadXMLDoc(XMLHttpReq.responseText);
        	alert(xmlDoc.getElementsByTagName("result")[0].firstChild.nodeValue);
            window.close();
//        	alert(XMLHttpReq.responseText);
//            status = XMLHttpReq.responseXML.getElementsByTagName("status")[0].firstChild.nodeValue;
//            if(status=="true")
//            {
//            parentid = XMLHttpReq.responseXML.getElementsByTagName("ParentID")[0].firstChild.nodeValue;
//            nodeid = XMLHttpReq.responseXML.getElementsByTagName("NodeID")[0].firstChild.nodeValue;
//            nodename = XMLHttpReq.responseXML.getElementsByTagName("NodeName")[0].firstChild.nodeValue;
//            node = tree.insertNewItem(parentid,nodeid,nodename,0,0,0,0,'SELECT');
            //fixImage(nodeid);
//            alert("添加节点成功！");
//            }
//            else
//            {
//            alert("添加节点失败！");
//            }
			  
        }
    }
}

//更新树节点函数
function updatenode(){
    if(document.getElementById("textfield").value==""){alert("请在文本框中输入节点名称！");return;}
    if(tree.getSelectedItemId()==""){alert("请选择一个节点！");return;}
    var obj=confirm("确定要修改节点吗？");
    if(obj){
    createXMLHttpRequest();
    //转换树节点名字
    var treename=document.getElementById("textfield").value;
    treename=treename.dealstr();
    var url="updatecodetree.action";
    var params="nodename="+treename+"&nodeid="+tree.getSelectedItemId();
    XMLHttpReq.open("POST",url,true);
    XMLHttpReq.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    XMLHttpReq.onreadystatechange=updatenodeCallBack;
    XMLHttpReq.send(params);
    }
}

//更新树节点回调函数
function updatenodeCallBack(){
if(XMLHttpReq.readyState==4)
    {
        if(XMLHttpReq.status==200)
        {
//        	loadXMLDoc(XMLHttpReq.responseText);
//        	alert(XMLHttpReq.responseText);
//            status = XMLHttpReq.responseXML.getElementsByTagName("status")[0].firstChild.nodeValue;
//            if(status=="true")
//            {
//            nodeid = XMLHttpReq.responseXML.getElementsByTagName("nodeid")[0].firstChild.nodeValue;
//            nodename = XMLHttpReq.responseXML.getElementsByTagName("nodename")[0].firstChild.nodeValue;
//            tree.setItemText(nodeid,nodename,'');
//            alert("修改节点成功！");
//            }
//            else
//            {
//            alert("修改节点失败.");
//            }
  			loadXMLDoc(XMLHttpReq.responseText);
            alert(xmlDoc.getElementsByTagName("result")[0].firstChild.nodeValue);
            window.close();
        }
    }
}

//删除树节点函数
function deletenode(){
    if(tree.getSelectedItemId()==""){alert("请选择一个节点！");return;}
    if(tree.hasChildren(tree.getSelectedItemId()) >0){
	alert("该节点下还有子节点,不能删除此节点！");
	return;
    }
    var obj=confirm("确定要删除节点吗？");
    if(obj){
    createXMLHttpRequest();
    var url="dealcodetree.jsp?type=delete&nodeid="+tree.getSelectedItemId();
    XMLHttpReq.open("GET",url,true);
    XMLHttpReq.onreadystatechange=deletenodeCallBack;
    XMLHttpReq.send(null);}
}

//删除树节点回调函数
function deletenodeCallBack(){
if(XMLHttpReq.readyState==4)
    {
        if(XMLHttpReq.status==200)
        {
            status = XMLHttpReq.responseXML.getElementsByTagName("status")[0].firstChild.nodeValue;
            if(status=="true")
            {
            nodeid = XMLHttpReq.responseXML.getElementsByTagName("nodeid")[0].firstChild.nodeValue;
            tree.deleteItem(nodeid);
            alert("删除节点成功.");
            }
            else
            {
            alert("删除节点失败.");
            }
        }
    }
}
