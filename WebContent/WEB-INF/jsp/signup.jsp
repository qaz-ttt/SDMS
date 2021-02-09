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
    <title>Sign Up Form by Tooplate</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
    <link rel="stylesheet" href="<%=basePath%>css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/materialize.min.css">
    <link rel="stylesheet" href="<%=basePath%>css/tooplate.css">
</head>
 

<body id="register">
    <div class="container">
        <div class="row">
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                <header class="mb-5">
                    <h3 class="mt-0 white-text">用户注册</h3>
                    <p class="grey-text mb-4"></p>
                    <p class="grey-text">密码请务必牢记，否则联系宿管阿姨修改会很麻烦
                    </p>
                </header>
            </div>
            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                <form action="${pageContext.request.contextPath}/NewUser" method="post" class="tm-signup-form">
                    <div class="input-field">
                        <input placeholder="学号" id="stu_id" name="stu_id" type="text" class="validate" style="color: #C0C0C0;">
                    </div>
                    <div class="input-field">
                        <input placeholder="姓名" id="user_name" name="user_name" type="text" class="validate" style="color: #C0C0C0;">
                    </div>
                    <div class="input-field">
                        <input placeholder="密码" id="password" name="password" type="password" class="validate" style="color: #C0C0C0;">
                    </div>
            
                   
                    <div class="text-right mt-4">
                        <button type="submit" class="waves-effect btn-large btn-large-white px-4 tm-border-radius-0">注册</button>
                    </div>
                </form>
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