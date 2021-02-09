<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台模板管理系统</title>
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/style.css" />
<script type="text/javascript" src="<%=basePath%>js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/menu.js"></script>

</head>



<body style="padding: 0px; margin: 0px;">


	<div id="content">
		<div class="left_menu">
		<a href="<%=basePath%>noticeAdmin/selectNotice" target="main"><h3>通知管理</h3></a>
		<a href="<%=basePath%>admin/hygiene/hygieneList" target="main"><h3>卫生评比</h3></a> 
		<a href="<%=basePath%>admin/discipline/disciplineList" target="main"><h3>纪律考勤</h3></a>
		<a href="<%=basePath%>admin/repair/repairList" target="main"><h3>宿舍报修</h3></a> 
		<a href="<%=basePath%>admin/student" target="main"><h3>学生信息</h3></a>
		<a href="<%=basePath%>feedbackAdmin/selectFeedback" target="main"><h3>建议与投诉</h3></a> 
			
		</div>
		<div class="m-right">
			<div class="right-nav">

				<div class="main"></div>
			</div>
		</div>


		<script>
			navList(12);
		</script>
</body>
</html>
