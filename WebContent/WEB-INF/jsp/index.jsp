<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>首页</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/materialize.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/tooplate.css">
</head>

<body id="home">
    <div class="container tm-home-mt tm-home-container">
        <div class="row">
            <div class="col-12">
                <div class="tm-home-left">
                    <h3 class="tm-site-title">宿舍管理</h3>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                <div class="tm-home-left mt-3 font-weight-light">
                    <p class="tm-mb-35">专注学生宿舍管理</p>
                    <p class="tm-mb-35">让宿舍生活更方便</p>
                    <p style="color: #009688; font-size: 18px;">制作：陈涛</p>
                </div>
            </div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                <ul class="list-group tm-home-list tm-bg-black font-weight-light">
                  
                    <li class="d-flex justify-content-between align-items-center">
                        <a href="${pageContext.request.contextPath}/signup" class="tm-white-text">01. 注册</a>
                    </li>
                    <li class="d-flex justify-content-between align-items-center">
                        <a href="${pageContext.request.contextPath}/tologin" class="tm-white-text">02. 登录</a>
                    </li>
                    <li class="d-flex justify-content-between align-items-center">
                        <a href="${pageContext.request.contextPath}/toAdminLogin" class="tm-white-text">03. 管理后台</a>
                    </li>

                </ul>
            </div>
        </div>
    </div>
   
</body>

</html>