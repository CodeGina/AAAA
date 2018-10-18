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
    
    <title>My JSP 'book.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <%
  	String name = request.getParameter("username");
   %>
  
  <body>
  	 欢迎<%=name %>来到购书页面<br>
  	点击超链接，连接到main.jsp的页面，去修改姓名
  	<a href="jsps/main.jsp">欢迎去main.jsp</a>
  	<br>
  	请选择您要购买的书籍
  	<form action="jsps/count.jsp" method="post">
  		<label><input name="book" type="checkbox" value="Java教程">Java教程</label>
  		<label><input name="book" type="checkbox" value="数据库原理">数据库原理</label>
  		<label><input name="book" type="checkbox" value="操作系统">操作系统</label>
  		<label><input name="book" type="checkbox" value="C语言教程">C语言教程</label>
  		<input type="hidden" name="uname" value="<%=name %>"></input>
  		<input type="submit" value="结账">
  	</form>
  </body>
</html>
