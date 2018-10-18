<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.Vector"%>
<%
	request.setCharacterEncoding("UTF-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
		Vector vector = (Vector) application.getAttribute("mess");
		//因为任何对象都可以添加到application中，取回对象时，
		//所以要强制转回原来的类型。
		for (int i = 0; i < vector.size(); i++) {
			//vector的长度就是vector.size();
			String message = (String) vector.elementAt(i);
			//Vector就是一个放数据的地方啊。elementat(i)就是取出数据的作用
			String str[] = message.split("#");

			out.print("留言人:" + (str[0]) + "<br>");
			out.print("标题:" + (str[1]) + "<br>");
			out.print("留言内容:" + "<br>" + (str[2]) + "<br>" + "<br>");
		}
	%>
	<a href="experiment3_7.jsp">返回主界面</a>
</body>
</html>
