<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'experiment3_3.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    This is my JSP page. <br>
	<%!int x,y,z;%>
	<%x=Integer.valueOf(request.getParameter("a")).intValue();
 	  y=Integer.valueOf(request.getParameter("b")).intValue();
      z=Integer.valueOf(request.getParameter("c")).intValue();
	%>

	从experiment3_1.jsp传过来的参数求得体积： <br>
  	用request:<%=x*y*z%><br>
	<a href="jsps/experiment3_1.jsp">返回</a><br>

  </body>
</html>
