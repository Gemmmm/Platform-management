<%@page import="model.Platforms"%>
<%@page isErrorPage="true"%>
<%@page errorPage="/login.jsp" pageEncoding="UTF-8"%>
<head>
<title>河北省重大技术需求征集系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/menu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css" type="text/css" />
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	font-size: 8px;
	font-family: "Microsoft Yahei", Verdana, Arial, Helvetica, sans-serif
}

.leftMenu {
	min-width: 200px;
	width: 250px;
	margin: 40px auto 0 auto;
}

.menu {
	border: #bdd7f2 1px solid;
	border-top: #0080c4 3px solid;
	border-bottom: #0080c4 3px solid;
	background: #B1D8EA repeat-y right;
	margin-left: 0px;
}

.menu .ListTitle {
	border-bottom: 1px #98c9ee solid;
	display: block;
	text-align: center;
	/*position: relative;*/
	height: 25px;
	line-height: 25px;
	cursor: pointer;
	/*+min-width:220px;*/ +
	width: 100%;
}

.ListTitlePanel {
	position: relative;
}

.leftbgbt {
	position: absolute;
	background: no-repeat;
	width: 11px;
	height: 52px;
	left: -11px;
	top: -4px;
}

.leftbgbt2 {
	position: absolute;
	background: no-repeat;
	width: 11px;
	height: 48px;
	left: -11px;
	top: -1px;
}

.menuList {
	display: block;
	height: auto;
}

.menuList div {
	height: 25px;
	line-height: 24px;
	border-bottom: 1px #98c9ee dotted;
}

.menuList div a {
	display: block;
	background: #fff;
	line-height: 25px;
	height: 25px;
	text-align: center;
	color: #185697;
	text-decoration: none;
}

.menuList div a:hover {
	color: #f30;
	background: #0080c4;
	color: #fff;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/static/js/jquery-1.12.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var menuParent = $('.menu > .ListTitlePanel > div'); //获取menu下的父层的DIV
		var menuList = $('.menuList');
		$('.menu > .menuParent > .ListTitlePanel > .ListTitle').each(function(i) { //获取列表的大标题并遍历
			$(this).click(function() {
				if ($(menuList[i]).css('display') == 'none') {
					$(menuList[i]).slideDown(300);
				} else {
					$(menuList[i]).slideUp(300);
				}
			});
		});
	});
</script>
</head>
<body class="panel" background="#B1D8EA">
<%
Platforms platform=(Platforms)session.getAttribute("platform");
 %>
	<div id="body">
		<div style="background: #3FA0F1;; position: relative; height: 30px;"
			align="center">
			<font color="#ffffff" style="top: 4px; position: relative; font-size: 15px;">系统菜单</font>
		</div>	
 		
		<div class="menu">
		<%
 			if(platform.getPassword().equals("0"))
 			{
 		 %>
			<div class="menuParent">
				<div class="ListTitlePanel">
					<div class="ListTitle">
						<strong >需求管理</strong>
						<div class="leftbgbt"></div>
					</div>
				</div>
				<div class="menuList">
					<div>
						<a target="mainAction"
							href="${pageContext.request.contextPath }/basicinfoinput.jsp">基本信息</a>
					</div>
				</div>
			</div>
			<%
			}
			else
			{
			 %>
			<div class="menuParent">
				<div class="ListTitlePanel">
					<div class="ListTitle">
						<strong>用户管理</strong>
						<div class="leftbgbt2"></div>
					</div>
				</div>
				<div class="menuList">
					<div>
						<a target="mainAction"
							href="list.jsp">用户列表</a>
					</div>	
					<div>
						<a target="mainAction"
							href="manyconlist1.jsp">综合查询</a>
					</div>	
					<div>
						<a target="mainAction"
							href="fenlei.jsp">分类浏览</a>
					</div>	
					<div>
						<a target="mainAction"
							href="tongjiindex.jsp">平台统计</a>
					</div>			
				</div>				
			</div>
		
			<%
			}
			 %>
			
		</div>
	</div>
	<div style="text-align: center;"></div>	
 


</body>
</html>