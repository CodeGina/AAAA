<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>My JSP 'userAdd.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="js/jquery.js"></script>
<script src="js/index.js"></script>
<style>
em {
	color: red;
}
</style>
</head>

<body>
	<form action="<c:url value='/UserServlet'/>" method="post">
		<input type="hidden" name="method" value="add" />
		<table>
			<tr>
				<td>用户名</td>
				<td><input name="username" type="text" id="txtUser" id="username"
					onblur="return checkUser()" value="${form.username }"></td>
				<td><span id="tip_username"> 用户名由6-18位字符组成 </span></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input name="password" type="password" id="password"
					onblur="return checkPassword()" value="${form.password }"></td>
				<td id="tip_password"><span> 密码由6-18位字符组成 </span></td>
			</tr>
			<tr>
				<td>确认密码</td>
				<td><input name="pwdrepeat" type="password" id="pwdrepeat"
					onblur="return checkpwdrepeat()" value="${form.pwdrepeat }"></td>
				<td id="tip_pwdrepeat"><span> 请重新输入密码 </span></td>
			</tr>
			<tr>
				<td>用户类型</td>
				<td><select name="usertype" id="usertype"
					onblur="return checkUserType()">
						<option value="0">请选择用户类型</option>
						<option value="1">管理员</option>
						<option value="2">普通用户</option>
				</select></td>
				<td id="tip_usertype"><span> 请选择用户类型 </span></td>
			</tr>

			<tr>
				<td>性别</td>
				<td><input name="gender" type="radio" value="male" onchange="return checkGender()">男 
				<input name="gender" type="radio" value="female" onchange="return checkGender()">女
				</td>
				<td id="tip_gender"><span> 请选择你的性别 </span></td>
			</tr>

			<tr>
				<td>出生日期</td>
				<td><input name="birthday" type="date" id="birthday" onblur="return checkBirthdy()" value="${form.birthday }"></td>
				<td id="tip_birthday"><span> 请输入出生日期 </span></td>
			</tr>
			<tr>
				<td>兴趣爱好</td>
				<td>
					<input name="hobby" type="checkbox" value="1" onchange="return checkHobby()">阅读 
					<input name="hobby" type="checkbox" value="2" onchange="return checkHobby()">音乐
					<input name="hobby" type="checkbox" value="3" onchange="return checkHobby()">运动
					
					<!-- <c:forEach var="pre" items="${hobby }">
    					<input type="checkbox" name="hobby" value="${pre }">
    				</c:forEach> -->
				</td>
				
				
				<td id="tip_hobby"><span> 请选择爱好 </span></td>
			</tr>
			<tr>
				<td>电子邮件</td>
				<td><input name="email" type="email" id="email"
					onblur="return checkEmail()" value="${form.email }"></td>
				<td id="tip_email"><span> 请输入Email </span></td>
			</tr>
			<tr>
				<td>自我介绍</td>
				<td><textarea name="introduction" cols="40" rows="5"
						id="introduction" onblur="return checkIntroduction()" value="${form.introduction }"></textarea>
				</td>
				<td id="tip_introduction"><span> 请输入自我介绍 </span></td>
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
