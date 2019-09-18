<%@page import="dao.IPlatformDao"%>
<%@page import="dao.PlatformDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>layui</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
   <%
 String s1="重点实验室";
 String s2="工程技术研究中心";
 String s3="产业技术研究院";
  %>           
  <a href="<%=request.getContextPath()%>/fenlei.jsp?platformtech=<%=s1%>">重点实验室</a> 
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>重点实验室</legend>
</fieldset>
 <div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo1">
  <a href="<%=request.getContextPath()%>/fenlei.jsp?platformtech=<%=s1%>"><div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div></a>
</div>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>工程技术研究中心</legend>
</fieldset>

 <div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo2">
   <a href="<%=request.getContextPath()%>/fenlei.jsp?platformtech=<%=s2%>"><div  class="layui-progress-bar layui-bg-red" lay-percent="0%"></div></a>
</div>

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>产业技术研究院</legend>
</fieldset>
 
<div class="layui-progress layui-progress-big" lay-showpercent="true" lay-filter="demo3">
  <a href="<%=request.getContextPath()%>/fenlei.jsp?platformtech=<%=s3%>"> <div class="layui-progress-bar layui-bg-red" lay-percent="0%"></div></a>
</div>
 
<div class="site-demo-button" style="margin-top: 20px; margin-bottom: 0;">
&nbsp;&nbsp;&nbsp;&nbsp;
  <button class="layui-btn site-demo-active" data-type="setPercent">查询</button>
</div>
 <% 

 		IPlatformDao platformDao = new PlatformDaoImpl();
 	int n1= platformDao.load1(s1);
 	int n2= platformDao.load1(s2);
 	int n3= platformDao.load1(s3);
 	n1=(n1*100)/(n1+n2+n3);
 	 n2=(n2*100)/(n1+n2+n3);
 	n3=(n3*100)/(n1+n2+n3);
 %>
          
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('element', function(){

  var $ = layui.jquery
  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
  
  //触发事件
  var active = {
    setPercent: function(){
      //设置50%进度
      element.progress('demo1', '<%=n1%>'+'%');
      element.progress('demo2', '<%=n2%>'+'%');
      element.progress('demo3', '<%=n3%>'+'%');
    }
    ,loading: function(othis){
      var DISABLED = 'layui-btn-disabled';
      if(othis.hasClass(DISABLED)) return;
    
      //模拟loading
      var n = 0, timer = setInterval(function(){
        n = n + Math.random()*10|0;  
        if(n>100){
          n = 100;
          clearInterval(timer);
          othis.removeClass(DISABLED);
        }
        
        element.progress('demo', n+'%');
      }, 300+Math.random()*1000);
      
      othis.addClass(DISABLED);
    }
  };
  
  $('.site-demo-active').on('click', function(){
    var othis = $(this), type = $(this).data('type');
    active[type] ? active[type].call(this, othis) : '';
  });
});
</script>

</body>
</html>