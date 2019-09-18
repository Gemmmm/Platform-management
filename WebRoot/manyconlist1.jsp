
<%@page import="dao.IPlatformDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Platform"%>
<%@page import="dao.PlatformDaoImpl"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
<title>Insert title here</title>
</head>
<body>
<form action="manyconlist1.jsp" method="get">
<table id="optionlist" class="layui-table"> 
<tr>
	<td>
		<input type="button" class="layui-btn  layui-btn-xs" id="bt1" value="+" onClick="addrows();">  
		<input type="button" class="layui-btn  layui-btn-xs" id="bt2" value="-" onClick="deleterow();"> 
		&nbsp;&nbsp;&nbsp;
	 <select name="colname">
          <option value="platformtechnology">技术类型</option>
          <option value="platformjibie">平台级别</option>
           <option value="gongjiandujian">共建独建</option>
          <option value="jingjinji">京津冀共建</option>  
        </select>
	
	<input type=text name="cond" size=28>
	
	<select name="jibie">
          <option value="=">精确</option>
          <option value="like">模糊</option>
       </select>
       
	</td>
</tr>
</table>

<table class="layui-table">
    <tr>
    	<td>日期:
    		从&nbsp;<input type="text" id="test1" name="datemin" >
    		到&nbsp;<input type="text" id="test2" name="datemax">
    		<input type="submit" class="layui-btn  layui-btn-sm" value=提交>
    	</td>
    </tr>
</table>
 </form>
 
 <%
 	String sql=null;
 	String[] colname=request.getParameterValues("colname");
 	String[] cond=request.getParameterValues("cond");
 	String[] jibie=request.getParameterValues("jibie");
 	 String[] relation=request.getParameterValues("relation");
 	 String datemin=request.getParameter("datemin");
 	 String datemax=request.getParameter("datemax");
 	if(colname!=null&&cond!=null&&jibie!=null)
 	{	
 		if(jibie[0].equals("like"))
 		cond[0]="%"+cond[0]+"%";		
 		sql=colname[0]+" "+jibie[0]+" '"+cond[0]+"' ";
 		if((cond[0]==null)||("".equals(cond[0])==true))
 		sql="";
 		if(relation!=null)
 		{
 			for(int i=1;i<colname.length;i++)
 			{
 				if(relation[i-1].equals("not"))
 				{
 					if(jibie[i].equals("like"))
 					{
 						jibie[i]=" not "+jibie[i];
 						cond[i]="%"+cond[i]+"%";
 					}
 					if(jibie[i].equals("="))
 					{
 						jibie[i]=" !"+jibie[i];
 					}
 					relation[i-1]=" and ";
 				}
 				
 				sql=sql+" "+relation[i-1]+" "+colname[i]+" "+jibie[i]+" '"+cond[i]+"'";
 			}
 		}
 	}
 	System.out.println("!"+datemin+"!"+datemax);
 	if(((datemin!=null)&&("".equals(datemin)==false))&&((datemax!=null)&&("".equals(datemax)==false)))
 	{
 		System.out.println("sql:"+sql);
 		if((sql==null)||("".equals(sql)==true))
 			sql=" platformdate between '"+datemin+"' and '"+datemax+"'";
 		else
 			sql=sql+"and platformdate between '"+datemin+"' and '"+datemax+"'";
 	}
	System.out.println(sql);

	IPlatformDao platformDao = new PlatformDaoImpl();
	List<Platform> platforms =null;
	 if(sql!=null)
	 platforms=platformDao.load4(sql); 
	
%>

<table class="layui-table" lay-data="{width: 1000, height:472,  page:true, id:'idTest'}" lay-filter="demo">
  <thead>
    <tr>
      <th lay-data="{type:'checkbox', fixed: 'left'}"></th>
      <th lay-data="{field:'platformid', width:110}">平台编号</th>
      <th lay-data="{field:'password', width:100}">密码</th>
      <th lay-data="{field:'platformname', width:100}">平台名称</th>
      <th lay-data="{field:'platformdate', width:120}">批准年号</th>
      <th lay-data="{field:'platformjibie', width:120}">平台级别</th>
      <th lay-data="{field:'platformtechnology', width:130}">技术领域</th>
      <th lay-data="{field:'gongjiandujian', width:130 }">共建独建</th>
      <th lay-data="{field:'jingjinji', width:130 }">京津冀共建</th>
      <th lay-data="{fixed: 'right', width:180, align:'center', toolbar: '#barDemo'}">操作</th>
    </tr>  
  </thead>
	<tbody>
		<%
		   if(platforms!=null)
			for( Platform platform : platforms ){
		%>
		<tr>
			<td></td>
			<td> <%=platform.getPlatformid() %></td>
			<td> <%=platform.getPassword() %></td>
			<td> <%=platform.getPlatformname() %></td>
			<td><%=platform.getPlatformdate() %></td>
			<td><%=platform.getPlatformjibie()%></td>
			<td><%=platform.getPlatformtechnology() %></td>
			<td><%=platform.getGongjiandujian() %></td>
			<td><%=platform.getJingjinji() %></td>
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
<script language="javascript">  

        function addrows(){  
            var len = optionlist.rows.length; //得到table的行数  
            var obj = optionlist.insertRow(len);//在最后一行插入  
            /**插入第一列**/  
            obj.insertCell(0);            
            obj.cells(0).innerHTML= "<select name='relation'><option value='and'>并且</option><option value='or'>或者</option><option value='not'>不含</option></select>&nbsp;&nbsp;&nbsp;"+
            "<select name='colname'><option value='platformtechnology'>技术类型</option><option value='platformjibie'>平台级别</option><option value='gongjiandujian'>共建独建</option><option value='jingjinji'>京津冀共建</option></select>&nbsp;"+
            "<input type=text name='cond' size=28> "+
            " <select name='jibie'><option value='='>精确</option><option value='like'>模糊</option></select>";  

         }  
        function deleterow(){  
            var len = optionlist.rows.length;     
            if(len <= 1) {  
                alert("至少要有一个选项");  
            }  
            else {  
                optionlist.deleteRow(len-1);//删除最后一项      
            }             
         }  
        function getOptionCount(){  
            return optionlist.rows.length;  
        }  
    </script> 
 <script>
layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  //常规用法
  laydate.render({
    elem: '#test1'
  });
  
   laydate.render({
    elem: '#test2'
  });
  
});
</script>
</html>