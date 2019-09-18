<%@page import="model.Platforms"%>
<%@page import="util.UserException"%>
<%@page import="model.Platform"%>
<%@page import="util.DaoFactory"%>
<%@page import="dao.IPlatformDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	//获取客户端传递过来的参数
	String platid = request.getParameter("platid");
	String password = request.getParameter("password");
	try{
	IPlatformDao platformDao = DaoFactory.getDaoImpl();
	Platform platform = platformDao.load(platid,password);	
	
	Platforms platforms=new Platforms();
	
	platforms.setId(platform.getId());
	platforms.setPlatformname(platform.getPlatformname());
	platforms.setPassword(platform.getPassword());
	platforms.setPlatformid(platform.getPlatformid());
	platforms.setPlatformpizhunnum(platform.getPlatformpizhunnum());
	platforms.setPlatformdate(platform.getPlatformdate());
	platforms.setPlatformtechnology(platform.getPlatformtechnology());
	session.setAttribute("platform", platforms);
		if(session.getAttribute("platform")==null)
	{
%>
	<jsp:forward page="logininput.jsp"></jsp:forward>
<%
 	}
	response.sendRedirect(request.getContextPath() +"/index.jsp");
	}catch(UserException e){
		//验证出错
		out.println(e.getMessage());
%>
	<jsp:forward page="logininput.jsp"></jsp:forward>
<%
	}
%>