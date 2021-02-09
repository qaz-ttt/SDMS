<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台模板管理系统</title>


 <link type="text/css" rel="stylesheet" href="<%=basePath%>css/style.css" />
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
</head>

<body>

<div id="header">
	<div class="logo">宿舍后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>管理员</li>
			<li><a href="#"  data-target="#Editpassword"   onclick="updateadmin()" >修改密码</a></li>
			<li><a href="#">设置</a></li>
			<li><a href="<%=basePath%>" target="_top">退出</a></li>
		</ul>
	</div>
</div>

</body>
</html>