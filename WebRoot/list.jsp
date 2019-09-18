<%@page import="dao.IPlatformDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Platform"%>
<%@page import="dao.PlatformDaoImpl"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>平台列表</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>  
<%
	IPlatformDao platformDao = new PlatformDaoImpl();
	List<Platform> platforms = platformDao.load();
	
	//获取登录用户
%>

 
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
 
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail" >查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" >删除</a>
</script>
               
          
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
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
} );
</script>

</body>
</html>