<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
	<link rel="icon" href="https://static.jianshukeji.com/highcharts/images/favicon.ico">
        <meta name="viewport" content="width=device-width, initial-scale=1">

       <script src="https://img.hcharts.cn/jquery/jquery-1.8.3.min.js"></script>
        <script src="https://img.hcharts.cn/highcharts/highcharts.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/data.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/drilldown.js"></script>
<title>Insert title here</title>
</head>
<body>
 
<div class="layui-tab">
  <ul class="layui-tab-title">
    <li ><a href="tongjiindex.jsp">地区分布</a></li>
    <li><a href="tongjizhu.jsp">柱状图</a></li>
    <li><a href="tongjishan.jsp">扇形图</a></li>
    <li><a href="tongjizhe.jsp">折线图</a></li>
     <li class="layui-this"><a href="tongjishan1.jsp">扇形图1</a></li>
  </ul>
  </div>
   <div id="container" style="width: 600px;height:400px;"></div>
        <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
          <pre id="tsv" style="display:none">Browser Version	Total Market Share
北京 8.0	26.61%
北京 9.0	16.96%
河北 18.0	18.01%
河北 19.0	7.73%
河南 12	6.72%
北京 6.0	6.40%
河南 11	4.72%
北京 7.0	3.55%
河南 13	2.16%
河南 3.6	1.87%
河北 17.0	1.13%
河南 10	0.90%
河北 16.0	0.45%
</pre>
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
   Highcharts.data({
    csv: document.getElementById('tsv').innerHTML,
    itemDelimiter: '\t',
    parsed: function (columns) {
        var brands = {},
            brandsData = [],
            versions = {},
            drilldownSeries = [];
        // 解析百分比字符串
        columns[1] = Highcharts.map(columns[1], function (value) {
            if (value.indexOf('%') === value.length - 1) {
                value = parseFloat(value);
            }
            return value;
        });
        $.each(columns[0], function (i, name) {
            var brand,
                version;
            if (i > 0) {
                // Remove special edition notes
                name = name.split(' -')[0];
                // 拆分
                version = name.match(/([0-9]+[\.0-9x]*)/);
                if (version) {
                    version = version[0];
                }
                brand = name.replace(version, '');
                //创建主数据
                if (!brands[brand]) {
                    brands[brand] = columns[1][i];
                } else {
                    brands[brand] += columns[1][i];
                }
                // 创建版本数据
                if (version !== null) {
                    if (!versions[brand]) {
                        versions[brand] = [];
                    }
                    versions[brand].push([ version, columns[1][i]]);
                }
            }
        });
        $.each(brands, function (name, y) {
            brandsData.push({
                name: name,
                y: y,
                drilldown: versions[name] ? name : null
            });
        });
        $.each(versions, function (key, value) {
            drilldownSeries.push({
                name: key,
                id: key,
                data: value
            });
        });
        // 创建图例
        var chart = Highcharts.chart('container',{
            chart: {
                type: 'pie'
            },
            title: {
                text: '2018年各省市创新平台所占份额'
            },
            subtitle: {
                text: '单击每个省份获得不同省份的具体信息'
            },
            plotOptions: {
                series: {
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}: {point.y:.1f}%'
                    }
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
            },
            series: [{
                name: '省份',
                colorByPoint: true,
                data: brandsData
            }],
            drilldown: {
                series: drilldownSeries
            }
        });
    }
});
    </script>
</html>