<%@page import="model.Platforms"%>
<%@page import="model.Platform"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基本信息表</title>
</head>
<body onload="Init();Init1();Init2()" style="background-color:#dceefc">
<%	
	
	if(session.getAttribute("platform")==null)
	{
%>
	<jsp:forward page="logininput.jsp"></jsp:forward>
<%
 	}
Platforms platform=(Platforms)session.getAttribute("platform");
 %>
<form action="basicinfo.jsp">
<table border="1" width="50%" align="center" >
<tr>
	<td colspan="2">平台名称</td>
	<td colspan="4"><input type="text" name="platformname" value="<%=platform.getPlatformname()%>"></td>
	<td >平台编号</td>
	<td colspan="4"><input type="text" disabled name="platformid" value="<%=platform.getPlatformid()%>"></td>
</tr>
<tr>
	<td colspan="2">批准年月</td>
	<td colspan="4"><input type="text" name="platformdate" value="<%=platform.getPlatformdate()%>"></td>
	<td colspan="2">批准文号</td>
	<td colspan="2"><input type="text" name="platformpizhunnum" value="<%=platform.getPlatformpizhunnum()%>"></td>
</tr>
<tr>
	<td colspan="2">技术领域</td>
	<td colspan="8"><input type="text" name="platformtechnology" value="<%=platform.getPlatformtechnology()%>" style="width: 99%"></td>
</tr>
<tr>
	<td colspan="2"  align="center">平台级别</td>
	<td colspan="2"><input type="radio" name="platformjibie" value="guojiaji">国家级&nbsp;
	<input type="radio" name="platformjibie" value="shengji">省级</td>
	<td  align="center">所在市县（区）</td>
	<td colspan="5">
	  <div  >
    <select id="Select1" name="Select1" runat="server" onchange="selectCity();">
		 <option value="" selected="true">省/直辖市</option>
	</select>
    <select id="Select2" name="Select2" runat="server" onchange="selectCountry()">
		<option value="" selected="true">请选择</option>
	</select>
    <select id="Select3" name="Select3" runat="server" >
		<option value="" selected="true">请选择</option>
	</select>
    </div>
	</td>
</tr>
<tr>
	<td rowspan="2" colspan="2">平台组织形态</td>
	<td rowspan="2" colspan="2"><input type="radio" name="platformxingtai"  value="wufaren">内设机构相对独立(无法人资格)</td>
	<td rowspan="2" colspan="2">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" id="accept" name="platformxingtai" disabled="true" value="qiyefaren">企业法人<br>
		<input type="radio" name="platformxingtai" value="dulifaren" onclick="if (this.checked) {enable();enable1();enable2()} else {disable();disable1();disable2()}">独立法人		
		<input type="radio" id="accept1" name="platformxingtai"  disabled="true" value="shiyefaren">事业法人<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" id="accept2" name="platformxingtai"  disabled="true" value="shetuanfaren">社团法人
	</td>
	<td colspan="3"><input type="radio"  name="gongjiandujian" value="lianhe">多单位联合共建<br>
	<input type="radio"  name="gongjiandujian" value="duli">依托单位独自建设</td>
</tr>
<tr>
	<td >京津冀共建</td>
	<td colspan="2"><input type="radio"  name="jingjinji" value="shi">是<input type="radio" name="jingjinji" value="fou">否</td>
</tr>
<tr>
	<td colspan="3" align="center">服务的主要国民经济行业</td>
	<td colspan="7">
	        <div>
    <select id="Select4" name="Select4" runat="server" onchange="selectCity1();">
		 <option value="" selected="true">经济行业</option>
	</select>
    <select id="Select5" name="Select5" runat="server" onchange="selectCountry1()">
		<option value="" selected="true">请选择</option>
	</select>
    <select id="Select6" name="Select6" runat="server" >
		<option value="" selected="true">请选择</option>
	</select>
    </div>
	</td>
</tr>
<tr>
	<td colspan="3" align="center">所属的主要学科</td>
	<td colspan="9">
	    <div>
    <select id="Select7" name="Select7" runat="server" onchange="selectCity2();">
		 <option value="" selected="true">学科</option>
	</select>
    <select id="Select8" name="Select8" runat="server" onchange="selectCountry2()">
		<option value="" selected="true">请选择</option>
	</select>
    <select id="Select9" name="Select9" runat="server" >
		<option value="" selected="true">请选择</option>
	</select>
    </div>
	</td>
</tr>
<tr>
	<td colspan="3" align="center" >依托单位名称</td>
	<td colspan="2"> <input type="text" name="danweiname" width="100%"></td>
	<td colspan="2" align="center">依托单位组织机构代码(社会信用代码)</td>
	<td colspan="2"> <input type="text" name="danweidaima"></td>
</tr>
<tr>
	<td colspan="3" align="center" >依托单位法人代表姓名</td>
	<td colspan="3"> <input type="text" name="dawenfaren"></td>
	<td  align="center" >办公电话</td>
	<td colspan="4"> <input type="text" name="dawenphone"></td>
</tr>
<tr>
	<td colspan="2" align="center">依托单位类型</td>
	<td colspan="9">
		 <input type="radio" name="danweileixing" value="qiye">企业
		 <input type="radio" name="danweileixing" value="keyan">科研机构
		 <input type="radio" name="danweileixing" value="yuanxiao">高等院校
		 <input type="radio" name="danweileixing" value="jiance">检测机构 
		 <input type="radio" name="danweileixing" value="yiliao">医疗机构
		 <input type="radio" name="danweileixing" value="zhengfu">政府机构
		 <input type="radio" name="danweileixing" value="shetuan">社团组织
		 <input type="radio" name="danweileixing" value="qita" onclick="if (this.checked) {enable3();} else {disable3();}">其他
		 <input type="text" name="danweileixing1" id="accept3" disabled="true">
	</td>
</tr>
<tr>
	<td colspan="2" align="center">共建单位</td>
	<td colspan="9" id="imgTd">
   
       <input name="gongjiandanwei" type="text" value="第1个" />
       <input type="button" id="imgBtn"  value="添加" onClick="addImage()" />
    
     </td>
</tr>
<tr>
	<td rowspan="3" >平台主任(院长)</td>
	<td  align="center">姓名</td>
	<td> <input type="text" name="yname"></td>
	<td align="center" >性别</td>
	<td> <input type="text" name="yzsex"></td>
	<td align="center" >生日</td>
	<td> <input type="text" name="yzbirth"></td>
	<td align="center">职称</td>
	<td> <input type="text" name="yzzhicheng"></td>
</tr>
<tr>
	<td colspan="2" align="center">所学专业</td>
	<td > <input type="text" name="yzzhuanye"></td>
	<td align="center" >学历</td>
	<td colspan="2"> <input type="text" name="yzxueli"></td>
	<td align="center">学位</td>
	<td colspan="2"> <input type="text" name="yzxuewei"></td>
</tr>
<tr>
	<td colspan="2" align="center">办公电话</td>
	<td> <input type="text" name="yzofficialnum"></td>
	<td align="center">手机</td>
	<td colspan="2"> <input type="text" name="yzphonenum"></td>
	<td align="center">E-mail</td>
	<td colspan="2"> <input type="text" name="yzemail"></td>
</tr>
<tr>
	<td colspan="3" align="center">平台网站名称</td>
	<td colspan="3"> <input type="text" name="platwebname"></td>
	<td colspan="1" align="center">网址</td>
	<td colspan="2"> <input type="text" name="webadress"></td>
</tr>

<tr >
	<td colspan="3" align="center">平台通讯地址</td>
	<td colspan="3"> <input type="text" name="tongxunadress"></td>
	<td colspan="1" align="center">邮编</td>
	<td colspan="2"> <input type="text" name="youbian"></td>
</tr>
<tr>
	<td colspan="9" align="center">I</td>
</tr>
<tr>
	<td colspan="9" align="center"><input type="submit" style="size: 50px;height: 30px;width: 130px"></td>
</tr>
</table>
</form>
</body>
<script type="text/javascript">
function disable()
  {
  document.getElementById("accept").disabled=true
  }
function enable()
  {
  document.getElementById("accept").disabled=false
  }
function disable1()
  {
  document.getElementById("accept1").disabled=true
  }
function enable1()
  {
  document.getElementById("accept1").disabled=false
  }

function disable2()
  {
  document.getElementById("accept2").disabled=true
  }
function enable2()
  {
  document.getElementById("accept2").disabled=false
  }
</script>
<script   language="javascript"   type="text/javascript">
  var   xmlDoc;   
  var   nodeIndex; 
  function   getxmlDoc()   
  {   
      xmlDoc=new   ActiveXObject("Microsoft.XMLDOM");   
          var   currNode;   
          xmlDoc.async=false;   
          xmlDoc.load("Area.xml");   
          if(xmlDoc.parseError.errorCode!=0)   
          {   
                  var   myErr=xmlDoc.parseError;   
                  alert("出错！"+myErr.reason);   
          }           
  }
  function Init()
  {
    //打开xlmdocm文档
    getxmlDoc();
    var   dropElement1=document.getElementById("Select1"); 
    var   dropElement2=document.getElementById("Select2"); 
    var   dropElement3=document.getElementById("Select3");   
    RemoveDropDownList(dropElement1);
    RemoveDropDownList(dropElement2);
    RemoveDropDownList(dropElement3);
    var  TopnodeList=xmlDoc.selectSingleNode("address").childNodes;
    if(TopnodeList.length>0)
    {
        //省份列表
        var country;
        var province;
        var city;
        for(var   i=0; i<TopnodeList.length;   i++)
        {
              //添加列表项目
              country=TopnodeList[i];       
              var   eOption=document.createElement("option");   
              eOption.value=country.getAttribute("name");
              eOption.text=country.getAttribute("name");
              dropElement1.add(eOption);
        }
        if(TopnodeList[0].childNodes.length>0)
        {
            //城市列表
            for(var i=0;i<TopnodeList[0].childNodes.length;i++)
            {
               var   id=dropElement1.options[0].value;
               //默认为第一个省份的城市
               province=TopnodeList[0]; 
               var   eOption=document.createElement("option");  
               eOption.value=province.childNodes[i].getAttribute("name");   
               eOption.text=province.childNodes[i].getAttribute("name");   
               dropElement2.add(eOption);
            }
            if(TopnodeList[0].childNodes[0].childNodes.length>0)
            {
               //县列表
               for(var i=0;i<TopnodeList[0].childNodes[0].childNodes.length;i++)
               {
                  var   id=dropElement2.options[0].value;
                  //默认为第一个城市的第一个县列表
                  city=TopnodeList[0].childNodes[0];  
                  var   eOption=document.createElement("option");  
                  eOption.value=city.childNodes[i].getAttribute("name");   
                  eOption.text=city.childNodes[i].getAttribute("name");   
                  this.document.getElementById("Select3").add(eOption);
               }
            }
        }
    }
  }   
  function   selectCity()   
  {       var   dropElement1=document.getElementById("Select1"); 
          var   name=dropElement1.options[dropElement1.selectedIndex].value;
          //alert(id);
          var   countryNodes=xmlDoc.selectSingleNode('//address/province [@name="'+name+'"]');   
          //alert(countryNodes.childNodes.length); 
          var   province=document.getElementById("Select2");       
          var   city=document.getElementById("Select3");       
          RemoveDropDownList(province);   
          RemoveDropDownList(city);
          if(countryNodes.childNodes.length>0)
          {
               //填充城市          
               for(var   i=0;   i<countryNodes.childNodes.length;   i++)   
               {   
                  var   provinceNode=countryNodes.childNodes[i];     
                  var   eOption=document.createElement("option");   
                  eOption.value=provinceNode.getAttribute("name");   
                  eOption.text=provinceNode.getAttribute("name");   
                  province.add(eOption);   
               }
               if(countryNodes.childNodes[0].childNodes.length>0)
               {
                  //填充选择省份的第一个城市的县列表
                  for(var i=0;i<countryNodes.childNodes[0].childNodes.length;i++)
                  {
                      //alert("i="+i+"\r\n"+"length="+countryNodes.childNodes[0].childNodes.length+"\r\n");
                      var   dropElement2=document.getElementById("Select2"); 
                      var   dropElement3=document.getElementById("Select3"); 
                      //取当天省份下第一个城市列表
                      var cityNode=countryNodes.childNodes[0];
                      //alert(cityNode.childNodes.length); 
                      var   eOption=document.createElement("option");  
                      eOption.value=cityNode.childNodes[i].getAttribute("name");   
                      eOption.text=cityNode.childNodes[i].getAttribute("name");   
                      dropElement3.add(eOption);
                  }
               }
          }
  }   
  function   selectCountry()   
  {   
          var   dropElement2=document.getElementById("Select2");   
          var   name=dropElement2.options[dropElement2.selectedIndex].value;   
          var   provinceNode=xmlDoc.selectSingleNode('//address/province/city[@name="'+name+'"]');   
          var   city=document.getElementById("Select3");       
          RemoveDropDownList(city);   
          for(var   i=0;   i<provinceNode.childNodes.length;   i++)   
          {   
                  var   cityNode=provinceNode.childNodes[i];     
                  var   eOption=document.createElement("option");   
                  eOption.value=cityNode.getAttribute("name");   
                  eOption.text=cityNode.getAttribute("name");   
                  city.add(eOption);   
          }   
  }   
  function   RemoveDropDownList(obj)   
  {   
      if(obj)
      {
          var   len=obj.options.length;   
          if(len>0)
          {
            //alert(len);   
            for(var   i=len;i>=0;i--)   
            {   
                  obj.remove(i);   
            }
          }
       }
            
  }   
      var fileId=2;
   function addImage(){
    var imgBtn=document.getElementById("imgBtn");
    imgBtn.parentNode.removeChild(imgBtn);
    var imgBtn1=document.createElement("input")
    imgBtn1.type="button";
    imgBtn1.value = "添加";
    imgBtn1.id = "imgBtn";
    imgBtn1.onclick=addImage;
    
       var imgTd=document.getElementById("imgTd");
       var imgDiv=document.createElement("div");
    var fileInput= document.createElement("input");
    fileInput.type="text";
    fileInput.value="第"+fileId+"个";
    fileInput.id=fileId;
    fileInput.name="gongjiandanwei";
    imgDiv.appendChild(fileInput);
    imgDiv.appendChild(imgBtn1);
    imgTd.appendChild(imgDiv);
    fileId=fileId+1;
    
    
   }
  </script> 
<script   language="javascript"   type="text/javascript">
  var   xmlDoc2;   
  var   nodeIndex2; 
  function   getxmlDoc2()   
  {   
      xmlDoc2=new   ActiveXObject("Microsoft.XMLDOM");   
          var   currNode2;   
          xmlDoc2.async=false;   
          xmlDoc2.load("Xueke.xml");   
          if(xmlDoc2.parseError.errorCode!=0)   
          {   
                  var   myErr2=xmlDoc2.parseError;   
                  alert("出错！"+myErr2.reason);   
          }           
  }
  function Init2()
  {
    //打开xlmdocm文档
    getxmlDoc2();
    var   dropElement7=document.getElementById("Select7"); 
    var   dropElement8=document.getElementById("Select8"); 
    var   dropElement9=document.getElementById("Select9");   
    RemoveDropDownList2(dropElement7);
    RemoveDropDownList2(dropElement8);
    RemoveDropDownList2(dropElement9);
    var  TopnodeList2=xmlDoc2.selectSingleNode("fenlei").childNodes;
    if(TopnodeList2.length>0)
    {
        //省份列表
        var country2;
        var province2;
        var city2;
        for(var   i=0; i<TopnodeList2.length;   i++)
        {
              //添加列表项目
              country2=TopnodeList2[i];       
              var   eOption2=document.createElement("option");   
              eOption2.value=country2.getAttribute("name");
              eOption2.text=country2.getAttribute("name");
              dropElement7.add(eOption2);
        }
        if(TopnodeList2[0].childNodes.length>0)
        {
            //城市列表
            for(var i=0;i<TopnodeList2[0].childNodes.length;i++)
            {
               var   id2=dropElement7.options[0].value;
               //默认为第一个省份的城市
               province2=TopnodeList2[0]; 
               var   eOption2=document.createElement("option");  
               eOption2.value=province2.childNodes[i].getAttribute("name");   
               eOption2.text=province2.childNodes[i].getAttribute("name");   
               dropElement8.add(eOption2);
            }
            if(TopnodeList2[0].childNodes[0].childNodes.length>0)
            {
               //县列表
               for(var i=0;i<TopnodeList2[0].childNodes[0].childNodes.length;i++)
               {
                  var   id2=dropElement8.options[0].value;
                  //默认为第一个城市的第一个县列表
                  city2=TopnodeList2[0].childNodes[0];  
                  var   eOption2=document.createElement("option");  
                  eOption2.value=city2.childNodes[i].getAttribute("name");   
                  eOption2.text=city2.childNodes[i].getAttribute("name");   
                  this.document.getElementById("Select9").add(eOption2);
               }
            }
        }
    }
  }   
  function   selectCity2()   
  {       var   dropElement7=document.getElementById("Select7"); 
          var   name2=dropElement7.options[dropElement7.selectedIndex].value;
          //alert(id);
          var   countryNodes2=xmlDoc2.selectSingleNode('//fenlei/menlei [@name="'+name2+'"]');   
          //alert(countryNodes.childNodes.length); 
          var   province2=document.getElementById("Select8");       
          var   city2=document.getElementById("Select9");       
          RemoveDropDownList2(province2);   
          RemoveDropDownList2(city2);
          if(countryNodes2.childNodes.length>0)
          {
               //填充城市          
               for(var   i=0;   i<countryNodes2.childNodes.length;   i++)   
               {   
                  var   provinceNode2=countryNodes2.childNodes[i];     
                  var   eOption2=document.createElement("option");   
                  eOption2.value=provinceNode2.getAttribute("name");   
                  eOption2.text=provinceNode2.getAttribute("name");   
                  province2.add(eOption2);   
               }
               if(countryNodes2.childNodes[0].childNodes.length>0)
               {
                  //填充选择省份的第一个城市的县列表
                  for(var i=0;i<countryNodes2.childNodes[0].childNodes.length;i++)
                  {
                      //alert("i="+i+"\r\n"+"length="+countryNodes.childNodes[0].childNodes.length+"\r\n");
                      var   dropElement8=document.getElementById("Select8"); 
                      var   dropElement9=document.getElementById("Select9"); 
                      //取当天省份下第一个城市列表
                      var cityNode2=countryNodes2.childNodes[0];
                      //alert(cityNode.childNodes.length); 
                      var   eOption2=document.createElement("option");  
                      eOption2.value=cityNode2.childNodes[i].getAttribute("name");   
                      eOption2.text=cityNode2.childNodes[i].getAttribute("name");   
                      dropElement9.add(eOption2);
                  }
               }
          }
  }   
  function   selectCountry2()   
  {   
          var   dropElement8=document.getElementById("Select8");   
          var   name2=dropElement8.options[dropElement8.selectedIndex].value;   
          var   provinceNode2=xmlDoc2.selectSingleNode('//fenlei/menlei/dalei[@name="'+name2+'"]');   
          var   city2=document.getElementById("Select9");       
          RemoveDropDownList2(city2);   
          for(var   i=0;   i<provinceNode2.childNodes.length;   i++)   
          {   
                  var   cityNode2=provinceNode2.childNodes[i];     
                  var   eOption2=document.createElement("option");   
                  eOption2.value=cityNode2.getAttribute("name");   
                  eOption2.text=cityNode2.getAttribute("name");   
                  city2.add(eOption2);   
          }   
  }   
  function   RemoveDropDownList2(obj)   
  {   
      if(obj)
      {
          var   len=obj.options.length;   
          if(len>0)
          {
            //alert(len);   
            for(var   i=len;i>=0;i--)   
            {   
                  obj.remove(i);   
            }
          }
       }
            
  }   
  </script>  
<script   language="javascript"   type="text/javascript">
  var   xmlDoc1;   
  var   nodeIndex1; 
  function   getxmlDoc1()   
  {   
      xmlDoc1=new   ActiveXObject("Microsoft.XMLDOM");   
          var   currNode1;   
          xmlDoc1.async=false;   
          xmlDoc1.load("Jingji.xml");   
          if(xmlDoc1.parseError.errorCode!=0)   
          {   
                  var   myErr1=xmlDoc1.parseError;   
                  alert("出错！"+myErr.reason);   
          }           
  }
  function Init1()
  {
    //打开xlmdocm文档
    getxmlDoc1();
    var   dropElement4=document.getElementById("Select4"); 
    var   dropElement5=document.getElementById("Select5"); 
    var   dropElement6=document.getElementById("Select6");   
    RemoveDropDownList1(dropElement4);
    RemoveDropDownList1(dropElement5);
    RemoveDropDownList1(dropElement6);
    var  TopnodeList1=xmlDoc1.selectSingleNode("fenlei").childNodes;
    if(TopnodeList1.length>0)
    {
        //省份列表
        var country1;
        var province1;
        var city1;
        for(var   i=0; i<TopnodeList1.length;   i++)
        {
              //添加列表项目
              country1=TopnodeList1[i];       
              var   eOption1=document.createElement("option");   
              eOption1.value=country1.getAttribute("name");
              eOption1.text=country1.getAttribute("name");
              dropElement4.add(eOption1);
        }
        if(TopnodeList1[0].childNodes.length>0)
        {
            //城市列表
            for(var i=0;i<TopnodeList1[0].childNodes.length;i++)
            {
               var   id1=dropElement4.options[0].value;
               //默认为第一个省份的城市
               province1=TopnodeList1[0]; 
               var   eOption1=document.createElement("option");  
               eOption1.value=province1.childNodes[i].getAttribute("name");   
               eOption1.text=province1.childNodes[i].getAttribute("name");   
               dropElement5.add(eOption1);
            }
            if(TopnodeList1[0].childNodes[0].childNodes.length>0)
            {
               //县列表
               for(var i=0;i<TopnodeList1[0].childNodes[0].childNodes.length;i++)
               {
                  var   id1=dropElement5.options[0].value;
                  //默认为第一个城市的第一个县列表
                  city1=TopnodeList1[0].childNodes[0];  
                  var   eOption1=document.createElement("option");  
                  eOption1.value=city1.childNodes[i].getAttribute("name");   
                  eOption1.text=city1.childNodes[i].getAttribute("name");   
                  this.document.getElementById("Select6").add(eOption1);
               }
            }
        }
    }
  }   
  function   selectCity1()   
  {       var   dropElement4=document.getElementById("Select4"); 
          var   name1=dropElement4.options[dropElement1.selectedIndex].value;
          //alert(id);
          var   countryNodes1=xmlDoc1.selectSingleNode('//fenlei/menlei [@name="'+name1+'"]');   
          //alert(countryNodes.childNodes.length); 
          var   province1=document.getElementById("Select5");       
          var   city1=document.getElementById("Select6");       
          RemoveDropDownList1(province1);   
          RemoveDropDownList1(city1);
          if(countryNodes1.childNodes.length>0)
          {
               //填充城市          
               for(var   i=0;   i<countryNodes1.childNodes.length;   i++)   
               {   
                  var   provinceNode1=countryNodes1.childNodes[i];     
                  var   eOption1=document.createElement("option");   
                  eOption1.value=provinceNode1.getAttribute("name");   
                  eOption1.text=provinceNode1.getAttribute("name");   
                  province1.add(eOption1);   
               }
               if(countryNodes1.childNodes[0].childNodes.length>0)
               {
                  //填充选择省份的第一个城市的县列表
                  for(var i=0;i<countryNodes1.childNodes[0].childNodes.length;i++)
                  {
                      //alert("i="+i+"\r\n"+"length="+countryNodes.childNodes[0].childNodes.length+"\r\n");
                      var   dropElement5=document.getElementById("Select5"); 
                      var   dropElement6=document.getElementById("Select6"); 
                      //取当天省份下第一个城市列表
                      var cityNod1e=countryNodes1.childNodes[0];
                      //alert(cityNode.childNodes.length); 
                      var   eOption1=document.createElement("option");  
                      eOption1.value=cityNode1.childNodes[i].getAttribute("name");   
                      eOption1.text=cityNode1.childNodes[i].getAttribute("name");   
                      dropElement6.add(eOption1);
                  }
               }
          }
  }   
  function   selectCountry1()   
  {   
          var   dropElement5=document.getElementById("Select5");   
          var   name1=dropElement5.options[dropElement5.selectedIndex].value;   
          var   provinceNode1=xmlDoc1.selectSingleNode('//fenlei/menlei/dalei[@name="'+name1+'"]');   
          var   city1=document.getElementById("Select6");       
          RemoveDropDownList1(city1);   
          for(var   i=0;   i<provinceNode1.childNodes.length;   i++)   
          {   
                  var   cityNode1=provinceNode1.childNodes[i];     
                  var   eOption1=document.createElement("option");   
                  eOption1.value=cityNode1.getAttribute("name");   
                  eOption1.text=cityNode1.getAttribute("name");   
                  city1.add(eOption1);   
          }   
  }   
  function   RemoveDropDownList1(obj)   
  {   
      if(obj)
      {
          var   len=obj.options.length;   
          if(len>0)
          {
            //alert(len);   
            for(var   i=len;i>=0;i--)   
            {   
                  obj.remove(i);   
            }
          }
       }
            
  }   
  </script> 
  <script type="text/javascript">
function disable3()
  {
  document.getElementById("accept3").disabled=true
  }
function enable3()
  {
  document.getElementById("accept3").disabled=false
  }
</script>
</html>