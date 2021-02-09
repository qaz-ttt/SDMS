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

  <link rel="stylesheet" href="<%=basePath%>css/style.css">
    

</head>

<body>

<div id="header">
	<div class="logo">宿舍后台管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>用户</li>
			<li><a href="#" onclick="updateadmin()">修改密码</a></li>
			<li><a href="#">设置</a></li>
			<li><a href="<%=basePath%>">退出</a></li>
		</ul>
	</div>
</div>
    <p style="text-align: right; font-weight: bold; font-size: 25px; margin-right: 50px;">欢迎您！</p>
	<p style="text-align: right; font-weight: bold; font-size: 25px; color: red;margin-right: 50px;">名字</p>
</body>
</html>