//打开修改对话框,关闭后刷新
function ShowModal(url,height,width){
    var sFeatures = "dialogHeight:"+height+";dialogWidth:"+width+";";
    sFeatures = sFeatures + "center:yes;edge:raised;help:no;scroll:yes;status:no;unadorned:yes;resizable:no";
    var result= window.showModalDialog(url,null,sFeatures);
    if(result == "true")
    {
        parent.location.reload();
    }
}

function ShowModalWithResult(url,height,width){
    var sFeatures = "dialogHeight:"+height+";dialogWidth:"+width+";";
    sFeatures = sFeatures + "center:yes;help:no;scroll:no;status:no;resizable:no";
    var result= window.showModalDialog(url,null,sFeatures);
    return result;
}