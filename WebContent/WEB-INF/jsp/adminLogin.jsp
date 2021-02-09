<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
    <meta charset="utf-8" />
    <title>后台登录页面</title>
    <meta name="description" content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <link rel="stylesheet" href="css/bootstrap.min.css">
     <link rel="stylesheet" href="css/app.css" type="text/css" />
     <script src="js/jquery-3.2.1.min.js"></script>

     <script>
     $(function(){
    	 var msg = "<%=request.getAttribute("msg")%>";
      	console.log(msg)
      	  if(msg != 'null') {
      		 alert(msg);
        	}   
          })
     
     
 </script>
 
</head>
<body background="img/bodybg.jpg">
<section id="content" class="m-t-lg wrapper-md animated fadeInUp ">
    <div class="container aside-xl" style="margin-top: 48px;">
        <a class="navbar-brand block"><span class="h1 font-bold" style="color: #ffffff">管理员后台登录</span></a>
        <section class="m-b-lg">
            <header class="wrapper text-center">
                <strong class="text-sucess">管理员登录</strong>
            </header>
            <form action="${pageContext.request.contextPath}/adminLogin" method="post" >
                <div class="form-group">
                    <input type="username" name="admin_id" placeholder="账号" class="form-control  input-lg text-center no-border">
                </div>
                <div class="form-group">
                    <input type="password" name="admin_password" placeholder="密码" class="form-control  input-lg text-center no-border">
                </div>

                <button type="submit" class="btn btn-lg btn-danger lt b-white b-2x btn-block" id="validate-submit">
                    <i class="icon-arrow-right pull-right"></i><span class="m-r-n-lg">登录</span></button>
            </form>
        </section>
    </div>
</section>

</div>
</body>
</html>
