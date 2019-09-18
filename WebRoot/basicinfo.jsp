<%@page import="model.Platforms"%>
<%@page import="model.Platform"%>
<%@page import="util.DaoFactory"%>
<%@page import="dao.IPlatformDao"%>
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

 	Platforms p=(Platforms)session.getAttribute("platform");
 	IPlatformDao platformDao=DaoFactory.getDaoImpl();
 	
 	
 	String platformid=request.getParameter("platformid");
 	String platformname=request.getParameter("platformname");
 	String platformdate=request.getParameter("platformdate");
 	String platformpizhunnum=request.getParameter("platformpizhunnum");
 	String platformtechnology=request.getParameter("platformtechnology");
 	String platformjibie=request.getParameter("platformjibie");
 	if(platformjibie==null)
 	{
 		platformjibie="";
 	}
 	String Select1=request.getParameter("Select1");
 	String Select2=request.getParameter("Select2");
 	String Select3=request.getParameter("Select3");
 	String platformadress=Select1+Select2+Select3;
 	String platformxingtai=request.getParameter("platformxingtai");
 	if(platformxingtai==null)
 	{
 		platformxingtai="";
 	}
 	String gongjiandujian=request.getParameter("gongjiandujian");
 	if(gongjiandujian==null)
 	{
 		gongjiandujian="";
 	}
 	String jingjinji=request.getParameter("jingjinji");
 	if(jingjinji==null)
 	{
 		jingjinji="";
 	}
 	String Select4=request.getParameter("Select4");
 	String Select5=request.getParameter("Select5");
 	String Select6=request.getParameter("Select6");
 	String jingjihangye=Select4+Select5+Select6;
 	
 	String Select7=request.getParameter("Select7");
 	String Select8=request.getParameter("Select8");
 	String Select9=request.getParameter("Select9");
 	
 	String mainxueku=Select7+Select8+Select9;
 	String danweiname=request.getParameter("danweiname");
 	if(danweiname==null)
 	{
 		danweiname="";
 	}
 	String danweidaima=request.getParameter("danweidaima");
 	if(danweidaima==null)
 	{
 		danweidaima="";
 	}
 	String danweifaren=request.getParameter("danweifaren");
 	if(danweifaren==null)
 	{
 		danweifaren="";
 	}
 	String danweiphone=request.getParameter("danweiphone");
 	if(danweiphone==null)
 	{
 		danweiphone="";
 	}
 	String danweileixing0=request.getParameter("danweileixing");
 	if(danweileixing0==null)
 	{
 		danweileixing0="";
 	}
 	String danweileixing1=request.getParameter("danweileixing1");
 	if(danweileixing1==null)
 	{
 		danweileixing1="";
 	}
 	String danweileixing=danweileixing0+danweileixing1;
 	
 	String gongjiandanwei=request.getParameter("gongjiandanwei");
 	if(gongjiandanwei==null)
 	{
 		gongjiandanwei="";
 	}
 	String yzname=request.getParameter("yzname");
 	if(yzname==null)
 	{
 		yzname="";
 	}
 	String yzsex=request.getParameter("yzsex");
 	if(yzsex==null)
 	{
 		yzsex="";
 	}
 	String yzbirth=request.getParameter("yzbirth");
 	if(yzbirth==null)
 	{
 		yzbirth="";
 	}
 	String yzzhicheng=request.getParameter("yzzhicheng");
 	if(yzzhicheng==null)
 	{
 		yzzhicheng="";
 	}
 	String yzzhuanye=request.getParameter("yzzhuanye");
 	if(yzzhuanye==null)
 	{
 		yzzhuanye="";
 	}
 	String yzxueli=request.getParameter("yzxueli");
 	if(yzxueli==null)
 	{
 		yzxueli="";
 	}
 	String yzxuewei=request.getParameter("yzxuewei");
 	if(yzxuewei==null)
 	{
 		yzxuewei="";
 	}
 	String yzofficialnum=request.getParameter("yzofficialnum");
 	if(yzofficialnum==null)
 	{
 		yzofficialnum="";
 	}
 	String yzphonenum=request.getParameter("yzphonenum");
 	if(yzphonenum==null)
 	{
 		yzphonenum="";
 	}
 	String yzemail=request.getParameter("yzemail");
 	if(yzemail==null)
 	{
 		yzemail="";
 	}
 	String platwebname=request.getParameter("platwebname");
 	if(platwebname==null)
 	{
 		platwebname="";
 	}
 	String webadress=request.getParameter("webadress");
 	if(webadress==null)
 	{
 		webadress="";
 	}
 	String tongxunadress=request.getParameter("tongxunadress");
 	if(tongxunadress==null)
 	{
 		tongxunadress="";
 	}
 	String youbian=request.getParameter("youbian");
 	if(youbian==null)
 	{
 		youbian="";
 	}
 	
 	
 	Platform platform=new Platform();
 	platform.setId(p.getId());
 	platform.setPlatformname(platformname);
 	platform.setPlatformid(p.getPlatformid());
 	platform.setPassword(p.getPassword());
 	platform.setPlatformdate(platformdate);
 	platform.setPlatformpizhunnum(platformpizhunnum);
 	platform.setPlatformtechnology(platformtechnology);
 	platform.setPlatformjibie(platformjibie);
 	platform.setPlatformadress(platformadress);
 	platform.setPlatformxingtai(platformxingtai);
 	platform.setGongjiandujian(gongjiandujian);
 	platform.setJingjinji(jingjinji);
 	platform.setJingjihangye(jingjihangye);
 	platform.setMainxueku(mainxueku);
 	platform.setDanweiname(danweiname);
 	platform.setDanweidaima(danweidaima);
 	platform.setDanweifaren(danweifaren);
 	platform.setDanweiphone(danweiphone);
 	platform.setDanweileixing(danweileixing);
 	platform.setGongjiandanwei(gongjiandanwei);
 	platform.setYzname(yzname);
 	platform.setYzsex(yzsex);
 	platform.setYzbirth(yzbirth);
 	platform.setYzzhicheng(yzzhicheng);
 	platform.setYzzhuanye(yzzhuanye);
 	platform.setYzxueli(yzxueli);
 	platform.setYzxuewei(yzxuewei);
 	platform.setYzofficialnum(yzofficialnum);
 	platform.setYzphonenum(yzphonenum);
 	platform.setYzemail(yzemail);
 	platform.setPlatwebname(platwebname);
 	platform.setWebadress(webadress);
 	platform.setTongxunadress(tongxunadress);
 	platform.setYoubian(youbian);	
 	platformDao.update(platform);
 	
 	Platforms platforms=new Platforms();
	platforms.setPlatformname(platform.getPlatformname());
	platforms.setPlatformid(platform.getPlatformid());
	platforms.setPlatformpizhunnum(platform.getPlatformpizhunnum());
	platforms.setPlatformdate(platform.getPlatformdate());
	platforms.setPlatformtechnology(platform.getPlatformtechnology());
	session.setAttribute("platform", platforms);


 	
%>


<h1 style="color: green" >输入成功，perfect!</h1>
</body>
</html>