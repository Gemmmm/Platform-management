<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
	<link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1">

      <script src="http://cdn.hcharts.cn/highcharts/highcharts.js"></script>
<title>Insert title here</title>
</head>
<body>
 
<div class="layui-tab">
  <ul class="layui-tab-title">
    <li><a href="tongjiindex.jsp">地区分布</a></li>
    <li><a href="tongjizhu.jsp">柱状图</a></li>
    <li><a href="tongjishan.jsp">扇形图</a></li>
    <li  class="layui-this"><a href="tongjizhe.jsp">折线图</a></li>
    <li><a href="tongjishan1.jsp">扇形图1</a></li>
    
  </ul>
  </div>
   <div id="container" style="width: 600px;height:400px;"></div>
</body>
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use('element', function(){
  var $ = layui.jquery
  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
  
  //触发事件
  var active = {
    tabAdd: function(){
      //新增一个Tab项
      element.tabAdd('demo', {
        title: '新选项'+ (Math.random()*1000|0) //用于演示
        ,content: '内容'+ (Math.random()*1000|0)
        ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
      })
    }
    ,tabDelete: function(othis){
      //删除指定Tab项
      element.tabDelete('demo', '44'); //删除：“商品管理”
      
      
      othis.addClass('layui-btn-disabled');
    }
    ,tabChange: function(){
      //切换到指定Tab项
      element.tabChange('demo', '22'); //切换到：用户管理
    }
  };
  
  $('.site-demo-active').on('click', function(){
    var othis = $(this), type = othis.data('type');
    active[type] ? active[type].call(this, othis) : '';
  });
  
  //Hash地址的定位
  var layid = location.hash.replace(/^#test=/, '');
  element.tabChange('test', layid);
  
  element.on('tab(test)', function(elem){
    location.hash = 'test='+ $(this).attr('lay-id');
  });
  
});
</script>

 <script>
        // 图表配置
        var options = {
            chart: {
                type: 'line'                          //指定图表的类型，默认是折线图（line）
            },
            title: {
                text: '近5年河北各市创新平台数量变化折线图'                 // 标题
            },
           
            yAxis: {
                title: {
                    text: '平台数量'                // y 轴标题
                }
            }, xAxis: {
                categories: ['2014','2015', '2016', '2017', '2018']   // x 轴分类
            },
          series: [{                              // 数据列
                name: '石家庄',                        // 数据列名
                data: [2,4 , 8,16,31]                     // 数据
            },{   
           		 name: '保定',                           // 数据列
                data: [1,2 , 4,10,20]                     // 数据
            },{   
           		 name: '雄安',                           // 数据列
                data: [0,1 , 3,12,25]                     // 数据
            }]
        };
        // 图表初始化函数
        var chart = Highcharts.chart('container', options);
    </script>
</html>