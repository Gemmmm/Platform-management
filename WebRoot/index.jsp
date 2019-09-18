<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>河北省创新年报统计系统</title>
<%
	if(session.getAttribute("platform")==null)
	{
%>
	<jsp:forward page="logininput.jsp"></jsp:forward>
<%
 	}
%>
</head>
<frameset rows="70,*" cols="*" frameborder="no" border="0" framespacing="0" bordercolor="#B1D8EA">
  <frame src="head.jsp" name="topFrame" frameborder="no" scrolling="no"  id="topFrame" title="topFrame" />
  <frameset name="myFrame" cols="220,*" frameborder="no" border="0" framespacing="0">
    <frame src="left.jsp" name="leftFrame" style="padding-left: 0px; padding-top: 0px;" frameborder="no" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
		<frameset name="myFrame" rows="40,*" frameborder="no" border="0" framespacing="0">
			<frame src="navframe.jsp" name="navFrame" frameborder="no" id="navFrame" style="margin-top: 0px;" title="manFrame" />
			
        	<frame  name="mainAction" frameborder="no" id="manFrame" style="padding-left: 2px" title="manFrame" />
		</frameset>
  </frameset>
</frameset>
<body>
</body>
</html>