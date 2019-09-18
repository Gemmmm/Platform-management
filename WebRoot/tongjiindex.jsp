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
        <script src="https://img.hcharts.cn/highmaps/highmaps.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/drilldown.js"></script>
        <script src="https://img.hcharts.cn/highcharts/modules/exporting.js"></script>
<title>Insert title here</title>
</head>
<body>
 
<div class="layui-tab">
  <ul class="layui-tab-title">
  <li class="layui-this"><a href="tongjiindex.jsp">地区分布</a></li>
    <li><a href="tongjizhu.jsp">柱状图</a></li>
    <li><a href="tongjishan.jsp">扇形图</a></li>
    <li><a href="tongjizhe.jsp">折线图</a></li>
      <li><a href="tongjishan1.jsp">扇形图1</a></li>
  </ul>
  </div>
   <div id="container1" style="width: 600px;height:400px;"></div>
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
   Highcharts.setOptions({
		lang: {
				drillUpText: '< 返回 “{series.name}”'
		}
	});
		var map = null,
		geochina = 'https://data.jianshukeji.com/jsonp?filename=geochina/';
		$.getJSON(geochina + 'china.json&callback=?', function(mapdata) {
		var data = [];
		// 随机数据
		Highcharts.each(mapdata.features, function(md, index) {
				var tmp = {
						name: md.properties.name,
						value: Math.floor((Math.random() * 100) + 1) // 生成 1 ~ 100 随机值
				};
				if(md.properties.drilldown) {
						tmp.drilldown = md.properties.drilldown;
				}
				data.push(tmp);
		});
		map = new Highcharts.Map('container1', {
				chart: {
						events: {
								drilldown: function(e) {
										this.tooltip.hide();
										console.log(e);
										// 异步下钻
										if (e.point.drilldown) {
												var pointName = e.point.properties.fullname;
												map.showLoading('下钻中，请稍后...');
												// 获取二级行政地区数据并更新图表
												$.getJSON(geochina +   e.point.drilldown + '.json&callback=?', function(data) {
														data = Highcharts.geojson(data);
														Highcharts.each(data, function(d) {
																if(d.properties.drilldown) {
																		d.drilldown = d.properties.drilldown;
																}
																d.value = Math.floor((Math.random() * 100) + 1); // 生成 1 ~ 100 随机值
														});
														map.hideLoading();
														map.addSeriesAsDrilldown(e.point, {
																name: e.point.name,
																data: data,
																dataLabels: {
																		enabled: true,
																		format: '{point.name}'
																}
														});
														map.setTitle({
																text: pointName
														});
												});
										}
								},
								drillup: function() {
										map.setTitle({
												text: '中国'
										});
								}
						}
				},
				title: {
						text: '各地区创新平台数量分布'
				},
				mapNavigation: {
						enabled: true,
						buttonOptions: {
								verticalAlign: 'bottom'
						}
				},
				tooltip: {
						useHTML: true,
						headerFormat: '<table><tr><td>{point.name}</td></tr>',
						pointFormat: '<tr><td>全称</td><td>{point.properties.fullname}</td></tr>' +
						'<tr><td>平台数量</td><td>{point.properties.data}</td></tr>',
						footerFormat: '</table>'
				},
			 	 colorAxis: {
				    min: 0,
				     minColor: '#fff',
				     maxColor: '#006cee',
				    labels:{
				         style:{
				            "color":"red","fontWeight":"bold"
				         }
				     }
				 },
				series: [{
						data: data,
						mapData: mapdata,
						joinBy: 'name',
						name: '中国地图',
						states: {
								hover: {
										color: '#a4edba'
								}
						}
				}]
		});
});

        // 图表初始化函数
        var chart = Highcharts.chart('container1', options);
    </script>
</html>