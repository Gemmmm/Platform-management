<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>河北省科技创新平台年报统计系统</title>
</head>
<body background="images/background1.jpg">
<center><img  alt="images/index_01.jpg" src="images/index_01.jpg"></center>
<br>
<h1 align="center" >注册页面</h1>
<hr size="2" width="70%" color="red">
<form action="register.jsp" method="get">
<table align="center" border="1">

<tr>
	<td>平台编号：</td>
	<td><input type="text" name="platid" value="(字母或加数字)" onclick="this.value=''" style="color:#888" onblur="if(/[^0-9a-zA-Z]/g.test(value)||this.value.replace(/^ +| +$/g,'')=='')alert('有错!')"></td>
</tr>
<tr>
	<td>密码：</td>
	<td><input type="password" name="password" onblur="if(/[^0-9a-zA-Z]/g.test(value)||this.value.replace(/^ +| +$/g,'')=='')alert('有错!')"></td>
</tr>
<tr>
	<td>平台类型：</td>
	<td><input type="radio" name="leixing"  value="重点实验室" checked>重点实验室<br>
	<input type="radio" name="leixing" value="工程技术研究中心">工程技术研究中心<br>
	<input type="radio" name="leixing" value="产业技术研究院">产业技术研究院</td>
</tr>
<tr>
	<td>平台名称：</td>
	<td><input type="text" name="platname" value="(字母或加数字)" onclick="this.value=''" style="color:#888" onblur="if(/[^0-9a-zA-Z]/g.test(value)||this.value.replace(/^ +| +$/g,'')=='')alert('有错!')"></td>
</tr>
<tr>
	<td>批准文号：</td>
	<td><input type="text" name="appnum" value="(字母或加数字)" onclick="this.value=''" style="color:#888" onblur="if(/[^0-9a-zA-Z]/g.test(value)||this.value.replace(/^ +| +$/g,'')=='')alert('有错!')"></td>
</tr>
<tr>
<td colspan="2" align="center"><input  type="submit" value="提交"></td>
</tr>
</table>
</form>
</body>
</html>