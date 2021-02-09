<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() 
	                   + ":" + request.getServerPort() + path + "/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<title></title>
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<script src="/js/jquery-3.2.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
</head>
<body>
   	<!-- 修改密码（Modal） -->
<div class="modal fade" id="Editpassword" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title">
					修改信息
				</h4>
			</div>
			<div class="modal-body">
			   <form class="form-horizontal" id="edit_notice_form">
			   		<input type="hidden" id="notice_id" name="notice_id" value="${row.notice_id}"/>
				 <div class="form-group">
						<label for="edit_notice_msg" class="col-sm-2 control-label">
						  信息内容
						</label>
						<div class="col-sm-10">
							<textarea  rows="3" cols="20" class="form-control" id="edit_notice_msg" placeholder="输入新的消息" name="edit_notice_msg" ></textarea>
						</div>	
				 </div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick= "editNotice(${row.notice_id})">
					提交更改
				</button>
			</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>