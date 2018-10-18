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
    
    <title>My JSP 'experiment3_1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<title>这是第一个JSP</title>
	
  </head>
  
  <body>
    大家好！恭喜你的第一个JSP<br>
  <form name="submit" action="jsps/experiment3_3.jsp" method="post">
  	第一个数：<input type="text" name="a" value="0" ><br>
        第二个数：<input type="text" name="b" value="0" ><br>
        第三个数：<input type="text" name="c" value="0" ><br>
	<input type="submit" value="提交">
	<input type="reset" value="重置">
  </form>
  </body>
</html>
