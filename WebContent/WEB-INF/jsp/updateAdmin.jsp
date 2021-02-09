<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>		
	
	
				<div class="modal-content modal-info">
					<div class="modal-header">
						<h3>修改密码</h3>	
					</div>
					<div class="modal-body modal-spa">
						<div class="login-form">			
							<form action="#" method="post">
								<input type="password" class="lock" id="password" name="password" placeholder="新密码" required="" />
								<input type="password" class="lock"  id="respassword" name="password" placeholder="确定密码" required="" />
								
								<input type="submit" value="提交">
							</form>	
						</div>								
					</div>
				</div>
			
				 
			
			
</body>
</html>