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
    <title>My JSP 'experiment3_7.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>留言板</title>

	<!-- Bootstrap -->
	<link href="css/bootstrap.css" rel="stylesheet">
	<style>
		.container {
			margin-top: 50px;
		}
	</style>

  </head>
  
  <body>
 		<div class="container">
			<form class="form-horizontal" method="post" action="jsps/experiment3_8.jsp">
				<div class="form-group">
					<label for="username" class="col-sm-2 control-label">输入您的名字</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="username" name="username" placeholder="Name">
					</div>
				</div>
				<div class="form-group">
					<label for="headtitle" class="col-sm-2 control-label">输入您的留言标题</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" id="headtitle" name="headtitle" placeholder="title">
					</div>
				</div>
				<div class="form-group">
					<label for="msg" class="col-sm-2 control-label">输入您的留言</label>
					<div class="col-sm-5">
					<textarea class="form-control" id="msg" name="msg" rows="3" placeholder="say.."></textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">提交信息</button>
					</div>
				</div>
			</form>
		</div>

		<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
		<script src="js/jquery.js"></script>
		<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
		<script src="js/bootstrap.js"></script>
 
  </body>
</html>
