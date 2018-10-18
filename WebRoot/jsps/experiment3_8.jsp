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
    
    <title>My JSP 'experiment3_8.jsp' starting page</title>
    
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
    <%
		String name = request.getParameter("username");
		String title = request.getParameter("headtitle");
		String text = request.getParameter("msg");
		if (name == null || name.length() == 0)
			name = "";
		if (title == null || title.length() == 0)
			title = "";
		if (text == null || text.length() == 0)
			text = "";
		String s = name + "#" + title + "#" + text;
		add(s);
	%>

	<%!
		Vector vector = new Vector();
		ServletContext application;
		//有些服务器不直接支持application对象，
		//必须用ServletContext 类类声明这个对象，
		//再使用getServletContext方法
		//对application对象初始化
		int i = 0;

		synchronized void add(String s) {

			application = getServletContext();
			i++;
			vector.add("NO." + i + "," + s);
			application.setAttribute("mess", vector);
			//如果添加的2个对象的关键字相同，则先前的关键字被清除,mess叫索引关键字
	}%>
	<a href="jsps/experiment3_9.jsp">返回留言界面</a>
  </body>
</html>
