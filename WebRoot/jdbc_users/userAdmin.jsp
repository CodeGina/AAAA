<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'userAdmin.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="js/jquery.js"></script>
<!--  
<script type="text/javascript">
	$(function() {
		$("#search").on("change", function() {
			var option = $("#search option:selected");
			find(option);
			//console.log(option);
		}).trigger('change');
	});

	//按用户名模糊查找，执行本函数
	function find(option) {
		if(option.index == 0 ){
			$("#method").val("searchUserName");
			console.log("0000");
		}
		if(option.index == 1 ){
			$("#method").val("searchUserName");
			console.log("1111");
		}
		if(option.index == 2 ){
			$("#method").val("searchUserName");
			console.log("2222");
		}
		if(option.index == 3 ){
			$("#method").val("searchUserName");
			console.log("3333");
		}
	
	}

	function deleteForm() {
		$("#method").val("delete");
		$("#form").submit();
	}
</script>
-->

</head>

<body>
	<form action="<c:url value='/UserServlet'/>" method="post" id="form">
		<input type="hidden" name="method" id="method" value="searchUserType"/>
		<div id="search">
			查询方式：<select name="key" onchange="find()">
				<option value="fd_username" id="uname">用户名</option>
				<option value="fd_usertype" id="utype">用户类型</option>
				<option value="fd_hobby" id="uhobby">爱好</option>
				<option value="fd_gender" id="ugender">性别</option>
			</select> 关键字：<input type="text" name="value" id="keyword" value="" /> <input
				type="submit" value="查询"> <a href="jdbc_users/userAdd.jsp"
				target="main">添加用户信息</a>
		</div>
	</form>

	<table width="1000" border="1" cellpadding="0">
		<tr>
			<th>用户名</th>
			<th>用户类型</th>
			<th>性别</th>
			<th>爱好</th>
			<th>出生日期</th>
			<th>电子邮箱</th>
			<th>自我介绍</th>
			<th>操作</th>
			<th>id</th>
		</tr>

		<c:forEach items="${list }" var="user">
			<tr>
				<td>${user.username }</td>
				<td><c:if test="${user.usertype == 1}">管理员</c:if> <c:if
						test="${user.usertype == 2}">普通用户</c:if></td>
				<td>${user.gender }</td>
				<td><c:forEach items="${user.hobby }" var="hobby" varStatus="status">
					<c:choose>  
						<c:when test="${status.last}">${hobby.hobby }
   						</c:when>
   						<c:otherwise>${hobby.hobby },
   						</c:otherwise>  
					</c:choose>
				</c:forEach>
				</td>
				<td>${user.birthday }</td>
				<td>${user.email }</td>
				<td>${user.introduction }</td>
				<td><a
					href="<c:url value='/UserServlet?method=updatepre&uid=${user.uid }'/>">修改</a>
					<a
					href="<c:url value='/UserServlet?method=delete&uid=${user.uid }'/>">删除</a></td>
				<td>${user.uid }</td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>



