<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
	<link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/drilldown.js"></script>
        <script src="https://img.hcharts.cn/highcharts-plugins/highcharts-zh_CN.js"></script>
<title>Insert title here</title>
</head>
<body>
 
<div class="layui-tab">
  <ul class="layui-tab-title">
  <li><a href="tongjiindex.jsp">地区分布</a></li>
    <li  class="layui-this"><a href="tongjizhu.jsp">柱状图</a></li>
    <li><a href="tongjishan.jsp">扇形图</a></li>
    <li><a href="tongjizhe.jsp">折线图</a></li>
    <li><a href="tongjishan1.jsp">扇形图</a></li>
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

<script type="text/javascript">
    Highcharts.chart('container', {
    chart: {
        type: 'column'
    },
    title: {
        text: '各地区平台数量柱状图'
    },
 
    xAxis: {
        type: 'category'
    },
    yAxis: {
        title: {
            text: '平台数量'
        }
    },
    legend: {
        enabled: false
    },
    plotOptions: {
        series: {
            borderWidth: 0,
            dataLabels: {
                enabled: true,
                format: '{point.y:.1f}'
            }
        }
    },
    tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}</b><br/>'
    },
    series: [{
        name: '省级',
        colorByPoint: true,
        data: [{
            name: '北京',
            y: 56,
            drilldown: '北京'
        }, {
            name: '河北',
            y: 24,
            drilldown: '河北'
        }, {
            name: '河南',
            y: 10,
            drilldown: '河南'
        }, {
            name: '其他',
            y: 4,
            drilldown: '其他'
        }]
    }],
    drilldown: {
        series: [{
            name: '北京',
            id: '北京',
            data: [
                [
                    '海淀区',
                    24
                ],
                [
                    '东城区',
                    17
                ],
                [
                    '西城区',
                    8
                ]
                ,
                [
                    '朝阳区',
                    7
                ]
            ]
        }, {
            name: '河北',
            id: '河北',
            data: [
                [
                    '石家庄',
                    10
                ],
                [
                    '邯郸',
                    7
                ],
                [
                    '邢台',
                    4
                ]
                ,
                [
                    '保定',
                    3
                ]
            ]
        }, {
            name: '河南',
            id: '河南',
            data: [
                [
                    '郑州',
                    5
                ],
                [
                    '新乡',
                    3
                ],
                [
                    '洛阳',
                    2
                ]
            ]
        }]
    }
});
    </script>
</html>