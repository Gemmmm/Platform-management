<%@page import="java.net.URLEncoder"%>
<%@page import="dao.IPlatformDao"%>
<%@page import="java.util.List"%>
<%@page import="model.Platform"%>
<%@page import="dao.PlatformDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
<title>Insert title here</title>
</head>
<%
 String addr1=URLEncoder.encode("北京市北京辖区东城区");
 String addr2=URLEncoder.encode("北京市北京辖区西城区");
 String addr3=URLEncoder.encode("北京市北京辖县密云县");
 String addr4=URLEncoder.encode("北京市北京辖县延庆县");
 String addr5=URLEncoder.encode("河南省郑州市中原区");
 String addr6=URLEncoder.encode("河南省郑州市二七区");
 String addr7=URLEncoder.encode("河南省新乡市牧野区");
 String addr8=URLEncoder.encode("河南省新乡市凤泉区");
   String platformadress=request.getParameter("platformadress");
   if(platformadress!=null){
	String newStr=new String(platformadress.getBytes("GBK"),"iso-8859-1"); 

   }
      System.out.println(platformadress);
	IPlatformDao platformDao = new PlatformDaoImpl();
	List<Platform> platforms = platformDao.load3(platformadress);
	
	//获取登录用户
%>
<body>
<div style="width:100%; margin:0 auto; overflow:auto; _display:inline-block;">
<div style="width:85%; float:right">

<table class="layui-table" lay-data="{width: 878, height:472,  page:true, id:'idTest'}" lay-filter="demo">
  <thead>
    <tr>
      <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
      <th lay-data="{field:'id', width:80, sort: true, fixed: true}">ID</th>
      <th lay-data="{field:'platformid', width:110}">平台编号</th>
       <th lay-data="{field:'password', width:80}">密码</th>
      <th lay-data="{field:'platformname, width:120, sort: true}">平台名称</th>
      <th lay-data="{field:'platformdate', width:120}">批准年号</th>
      <th lay-data="{field:'platformpizhunnum', width:120}">批准文号</th>
      <th lay-data="{field:'platformtechnology', width:130, sort: true}">技术领域</th>
      <th lay-data="{fixed: 'right', width:180, align:'center', toolbar: '#barDemo'}">操作</th>
    </tr>  
  </thead>
	<tbody>
</tr>
		<%
			for( Platform platform : platforms ){
		%>
		<tr>
			<td> <%=platform.getId() %></td>
			<td> <%=platform.getPlatformid() %></td>
			<td> <%=platform.getPassword() %></td>
			<td> <%=platform.getPlatformname() %></td>
			<td><%=platform.getPlatformdate() %></td>
			<td><%=platform.getPlatformpizhunnum() %></td>
			<td><%=platform.getPlatformtechnology() %></td>
			<%
			}
			 %>
</tr>
	</tbody>
</table>
</div>

<div style=" margin-right:210px">
<h4>分类目录</h4>
<br>
<ul id="demo"></ul></div>
</div>
</body>
<script src="layui/layui.js" charset="utf-8"></script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" >查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >删除</a>
</script>
<script>
layui.use('tree', function(){
	layui.tree({
  elem: '#demo' 
  ,nodes: [{ 
    name: '北京市'
    ,children: [{
      name: '北京辖区'
	,children: [{
        name: '东城区'
        ,href:'fenlei.jsp?platformadress=<%=addr1%>'
      },{
        name: '西城区'
        ,href:'fenlei.jsp?platformadress=<%=addr2%>'
      }]
    },{
      name: '北京辖县'
      ,children: [{
        name: '密云县'
        ,href:'fenlei.jsp?platformadress=<%=addr3%>'
      },{
        name: '延庆县'
        ,href:'fenlei.jsp?platformadress=<%=addr4%>'
      }]
      
    }]
  },{
    name: '河南省'
    ,children: [{
      name: '郑州市'
	,children: [{
        name: '中原区'
        ,href:'fenlei.jsp?platformadress=<%=addr5%>'
      },{
      name: '二七区'
      ,href:'fenlei.jsp?platformadress=<%=addr6%>'
      }]
    },{
      name: '新乡市'
      ,children: [{
        name: '凤泉区'
        ,href:'fenlei.jsp?platformadress=<%=addr7%>'
      },{
        name: '牧野区'
        ,href:'fenlei.jsp?platformadress=<%=addr8%>'
      }]
      
    }]
  },{
    name: '河北省'
    ,children: [{
      name: '石家庄市'
	,children: [{
        name: '长安区'
        ,href:'fenlei.jsp?platformadress=<%=addr5%>'
      },{
      name: '二七区'
      ,href:'fenlei.jsp?platformadress=<%=addr6%>'
      }]
    },{
      name: '邯郸市'
      ,children: [{
        name: '武安县'
        ,href:'fenlei.jsp?platformadress=<%=addr7%>'
      },{
        name: '牧野区'
        ,href:'fenlei.jsp?platformadress=<%=addr8%>'
      }]
      
    }]
  },{
    name: '山东省'
    ,children: [{
      name: '济南'
	,children: [{
        name: '中原区'
        ,href:'fenlei.jsp?platformadress=<%=addr5%>'
      },{
      name: '二七区'
      ,href:'fenlei.jsp?platformadress=<%=addr6%>'
      }]
    },{
      name: '新乡市'
      ,children: [{
        name: '凤泉区'
        ,href:'fenlei.jsp?platformadress=<%=addr7%>'
      },{
        name: '牧野区'
        ,href:'fenlei.jsp?platformadress=<%=addr8%>'
      }]
      
    }]
  }]
});
} );
</script>
<script>
layui.use('table', function(){
  var table = layui.table;
  //监听表格复选框选择
  table.on('checkbox(demo)', function(obj){
    console.log(obj)
  });
  //监听工具条
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    if(obj.event === 'detail'){
      layer.msg('ID：'+ data.id + ' 的查看操作');
    } else if(obj.event === 'del'){
      layer.confirm('真的删除行么', function(index){
        obj.del();
        layer.close(index);
      });
    } else if(obj.event === 'edit'){
      layer.alert('编辑行：<br>'+ JSON.stringify(data))
    }
  });
  
  var $ = layui.$, active = {
    getCheckData: function(){ //获取选中数据
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.alert(JSON.stringify(data));
    }
    ,getCheckLength: function(){ //获取选中数目
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.msg('选中了：'+ data.length + ' 个');
    }
    ,isAll: function(){ //验证是否全选
      var checkStatus = table.checkStatus('idTest');
      layer.msg(checkStatus.isAll ? '全选': '未全选')
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});
</script>
</html>