<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"type="text/css"href="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/css/bootstrap.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="${pageContext.request.contextPath}/static/js/jquery-1.12.1.js"type="text/javascript"></script>
	<script
	src="${pageContext.request.contextPath}/static/bootstrap-3.3.5-dist/js/bootstrap.js"type="text/javascript"></script>
	<script
	src="${pageContext.request.contextPath}/static/js/jquery.validate.js"type="text/javascript"></script>
	<script
	src="${pageContext.request.contextPath}/static/js/myValidate.js"type="text/javascript">
	</script>
</head>
<body >
<div class="row-fluid" style="margin-top: 80px;">
		<div class="col-md-4"></div>
		<div class="col-md-4">
	<form role="form" class="form-horizontal" action="" method="post" id="checkForm">
		
			<div class="form-group">
				<label class="col-md-3 control-label"for="old">旧密码</label>
				<div class="col-md-9">
					<input class="form-control"name="old"type="password" id="old" placeholder="旧密码" />
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label"for="inputPassword">新密码</label>
				<div class="col-md-9">
					<input type="password"name="new1"class="form-control"id="password"placeholder="新密码" >
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label"for="password2">确认密码</label>
				<div class="col-md-9">
					<input type="password"name="new2"class="form-control"id="password2"placeholder="conformPassword">
				</div>
			</div>
			<div class="form-group">
				<div class="col-md-offset-3 col-md-9">
					<button type="submit"class="btn btn-primary btn-block">修改</button>
				</div>
			</div>
	
			<c:if test="${param.status.equals('0')}">
				<script type="text/javascript">
					alert("旧密码错误")
				</script>
			</c:if>
			<c:if test="${param.status.equals('1')}">
				<script type="text/javascript">
					alert("修改成功")
				</script>
			</c:if>
			<c:if test="${param.status.equals('2')}">
				<script type="text/javascript">
					alert("修改失败")
				</script>
			</c:if>
	</form>
</body>
</html>