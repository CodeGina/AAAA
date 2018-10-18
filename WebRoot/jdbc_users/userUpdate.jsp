<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userUpdate.jsp' starting page</title>
    
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
  	<h4>修改用户信息</h4>
    <form action="<c:url value='/UserServlet'/>" method="post">
		<input type="hidden" name="method" value="update" />
		<input type="hidden" name="uid" value="${update.uid }" />
		<table>
			<tr>
				<td>用户名</td>
				<td><input name="username" type="text" id="txtUser" id="username"
					onblur="return checkUser()" value="${update.username }"></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input name="password" type="password" id="password"
					onblur="return checkPassword()" value="${update.password }"></td>
			</tr>
			<tr>
				<td>用户类型</td>
				<td><select name="usertype" id="usertype"
					onblur="return checkUserType()">
						<option value="0">请选择用户类型</option>
						<option value="1" <c:if test="${update.usertype eq '1' }">selected</c:if>>管理员</option>
						<option value="2" <c:if test="${update.usertype eq '2' }">selected</c:if>>普通用户</option>
				</select></td>
			</tr>

			<tr>
				<td>性别</td>
				<td><input name="gender" type="radio" value="male" onchange="return checkGender()" <c:if test="${update.gender == 'male' }">checked="checked"</c:if>>男 
					<input name="gender" type="radio" value="female" onchange="return checkGender()" <c:if test="${update.gender == 'female' }">checked="checked"</c:if>>女
				</td>
			</tr>

			<tr>
				<td>出生日期</td>
				<td><input name="birthday" type="date" id="birthday" onblur="return checkBirthdy()" value="${update.birthday }"></td>
			</tr>
			<tr>
				<td>兴趣爱好</td>
				<td>
					<input name="hobby" type="checkbox" value="1" onchange="return checkHobby()" <c:if test="${fn:contains(update.hobby,'1')}">checked="checked"</c:if>>阅读 
					<input name="hobby" type="checkbox" value="2" onchange="return checkHobby()" <c:if test="${fn:contains(update.hobby,'2')}">checked="checked"</c:if>>音乐
					<input name="hobby" type="checkbox" value="3" onchange="return checkHobby()" <c:if test="${fn:contains(update.hobby,'3')}">checked="checked"</c:if>>运动
				</td>
			</tr>
			<tr>
				<td>电子邮件</td>
				<td><input name="email" type="email" id="email"
					onblur="return checkEmail()" value="${update.email }"></td>
			</tr>
			<tr>
				<td>自我介绍</td>
				<td><textarea name="introduction" cols="40" rows="5"
						id="introduction" onblur="return checkIntroduction()" value="${update.introduction }">${update.introduction }</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" name="submit" value="提交">
					<input type="reset" name="reset" value="重置"></td>
			</tr>
		</table>
	</form>
  </body>
</html>
