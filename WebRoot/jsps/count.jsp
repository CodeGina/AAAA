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
    
    <title>My JSP 'count.jsp' starting page</title>
    
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
    String name = request.getParameter("uname");
  	String[] book = request.getParameterValues("book");
   %>
  
  <body>
	这里是结账处，您的姓名以及选择的书籍:
	<br>
	您的姓名:<%=name %><br>
  	购物车中的商品:
  	<%
  		if(book == null){
  			out.write("<p>您还没选择要购买的书籍</p>");
  		}else{
  	 %>
  	<%
  		for(int i=0;i<book.length;i++){
    %>
  			<%=book[i] %>
  	<%
  			}
  		}
  	%>
  	<br>
  	连接到book.jsp页面，继续购买书籍
  	<a href="jsps/book.jsp">欢迎去book.jsp</a>
  	<br>
  	连接到main.jsp页面，去修改姓名
  	<a href="jsps/book.jsp">欢迎去main.jsp</a>
  	
  </body>
</html>
