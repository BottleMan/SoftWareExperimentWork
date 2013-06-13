﻿function showsysMenu(models)
{
   var t;
   var EndIndex = 0;
   var DisplayModels = models.substring(5,models.length);
   var CurrentModel = "";
   var Type = "";
   var ModelName = "";
   var CurrentModelIndex = 0;
   var TitleNum = 0;
   while(DisplayModels != ""){
      EndIndex = DisplayModels.indexOf("SPLIT");
      if(EndIndex<0)
      	EndIndex=DisplayModels.length;
      CurrentModel = DisplayModels.substring(0,EndIndex);
      DisplayModels = DisplayModels.substring(EndIndex + 5,DisplayModels.length);
      CurrentModelIndex = CurrentModel.indexOf("=");
      Type = CurrentModel.substring(0,CurrentModelIndex);
      if(Type == "TiTlE"){
         TitleNum ++;
         t=outlookbar.addtitle(CurrentModel.substring(CurrentModelIndex+1,
                               CurrentModel.length));
      }
      if(Type == "ItEm"){
         ModelName = CurrentModel.substring(CurrentModelIndex+1,
                               CurrentModel.length)
      }
      if(Type == "UrL"){
         outlookbar.additem(ModelName,t,
                            CurrentModel.substring(CurrentModelIndex+1,
                               CurrentModel.length));
      }

   }
   // 显示菜单栏大小
   var MenuHeight =590;// 560+26*TitleNum; //780 - 26 * (TitleNum - 1);
   MenuHeight = MenuHeight + "px";
   document.getElementById("mnuList").style.height = MenuHeight;
}

