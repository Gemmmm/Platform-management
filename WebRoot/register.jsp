<%@page import="util.UserException"%>
<%@page import="dao.PlatformDaoImpl"%>
<%@page import="riqi.NowTime"%>
<%@page import="model.Platform"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String platid=request.getParameter("platid");
	String password=request.getParameter("password");
	String leixing=request.getParameter("leixing");
	String platname=request.getParameter("platname");
	String appnum=request.getParameter("appnum");
	
	Platform platform =new Platform();
	platform.setPlatformid(platid);
	platform.setPassword(password);
	platform.setPlatformtechnology(leixing);
	platform.setPlatformname(platname);
	platform.setPlatformpizhunnum(appnum);
	platform.setPlatformdate(NowTime.nowtime());
	
	PlatformDaoImpl platformDaoImpl=new PlatformDaoImpl();
	try{
		
	platformDaoImpl.add(platform);
	System.out.println("注册成功");
	response.sendRedirect("logininput.jsp");
%>

	
	
<%
	}catch(UserException e){
%>
	<h2 style="color:red ; font-size:50px">发生错误 : <%=e.getMessage() %></h2>
	<%
	}
	%>


</body>
</html>