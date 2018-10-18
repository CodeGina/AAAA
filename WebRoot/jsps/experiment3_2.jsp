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
    
    <title>My JSP 'experiment3_2.jsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>

  	<%!String s1,s2,s3;%>
 	<% s1=request.getParameter("a");
   	   s2=request.getParameter("b");  
       s3=request.getParameter("c");  
	%>

	<body> 
		This is experiment3_2.jsp page<br>
		前台传过来的a=<%=s1%><br>
		前台传过来的b=<%=s2%><br>
		前台传过来的c=<%=s3%><br>
		a+b+c=<%=s1+s2+s3%><br>
		<a href="jsps/experiment3_1.jsp">返回</a><br>
</body>
</html>
  
</html>
