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
    <title>登录</title>
	<!--
    Template 2105 Input
	http://www.tooplate.com/view/2105-input
	-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/tooplate.css">
</head>

<body id="login">
    <div class="container">
        <div class="row tm-register-row tm-mb-35">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-login-l">
                <form action="${pageContext.request.contextPath}/save" method="post" class="tm-bg-black p-5 h-100">
                    <div class="input-field">
                        <input placeholder="账号" id="user_id" name="user_id" type="text" class="validate">
                    </div>
                    <div class="input-field mb-5">
                        <input placeholder="密码" id="password" name="password" type="password" class="validate">
                    </div>
                    <div class="tm-flex-lr">
                        <button type="reset" class="waves-effect btn-large btn-large-white px-4 black-text rounded-0">重置</button>
                        <button type="submit" class="waves-effect btn-large btn-large-white px-4 black-text rounded-0">登录</button>
                    </div>
                </form>
            </div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 tm-login-r">
                <header class="font-weight-light tm-bg-black p-5 h-100">
                    <h3 class="mt-0 text-white font-weight-light">关于登录失败</h3>
                    <p>在登录过程中如果有问题请及时联系宿管阿姨</p>
                    <p class="mb-0">其他问题请联系QQ：1985694928</p>
                </header>
            </div>
        </div>
     
       
    </div>

    <script src="<%=basePath%>js/jquery-3.2.1.slim.min.js"></script>
    <script src="<%=basePath%>js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            $('select').formSelect();
        });
    </script>
</body>

</html>