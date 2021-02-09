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
	<meta charset="utf-8"> 
	<title></title>
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>


	<div style="margin: 50px;">
		 <div class="panel panel-default">
			<div class="panel-body text-center">
			
					<div class="form-group">
						<label for=""><h1 style="font-weight: bold; color: #999999;">消息管理</h1></label> 
						
					</div>
                 
				   </div>
				  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#NoticeNewDialog" 
				>
				 	发布通知
				</button>
			</div>
			<table class="table table-bordered table-striped">
						<thead>
							<tr>
								
								<th>消息编号</th>
								<th>信息内容</th>
								<th>时间</th>
								<th>操作</th>
						
								
								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${maplist}" var="row">
								<tr>
									<td>${row.notice_id}</td>
									<td>${row.notice_msg}</td>
									<td>${row.time}</td>
								
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
										 data-target="#NoticeEditDialog" onclick= "edit_notice(${row.notice_id})">修改</a>
									
									
										<a href="#" class="btn btn-danger btn-xs" onclick= "delete_notice(${row.notice_id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
							   <nav aria-label="Page navigation" style="text-align: center">
         <nav aria-label="Page navigation" style="text-align: center">
        <ul class="pagination">
            <%--首页--%>
            <li><a href="<%=basePath%>noticeAdmin/selectNotice?pn=1">首页</a></li>
                
            <%--下一页--%>
            <c:if test="${PageInfo.hasPreviousPage}">
                <li>
                    <a href="<%=basePath%>noticeAdmin/selectNotice?pn=${PageInfo.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
                
                <%--页码--%>
            <c:forEach items="${PageInfo.navigatepageNums}" var="pageshow">
                <c:if test="${pageshow == PageInfo.pageNum}">
                    <li class="active"><a href="<%=basePath%>noticeAdmin/selectNotice?pn=${pageshow}">${pageshow}</a></li>
                </c:if>
                <c:if test="${pageshow != PageInfo.pageNum}">
                    <li><a href="<%=basePath%>noticeAdmin/selectNotice?pn=${pageshow}">${pageshow}</a></li>
                </c:if>
            </c:forEach>
                
            <%--上一页--%>
            <c:if test="${PageInfo.hasNextPage}">
                <li>
                    <a href="<%=basePath%>noticeAdmin/selectNotice?pn=${PageInfo.pageNum+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
                
            <%--尾页--%>
            <li><a href="<%=basePath%>noticeAdmin/selectNotice?pn=${PageInfo.pages}">尾页</a></li>
                
          
                
        
            
        </ul>
    </nav>

	</div>
	
<!-- 修改模态框（Modal） -->
<div class="modal fade" id="NoticeEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
</div>	
	<!--新建模态框	-->		
<div class="modal fade" id="NoticeNewDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					发布通知
				</h4>
			</div>
			<div class="modal-body">
			<form class="form-horizontal" id="new_notice_form">
				 <div class="form-group">
						<label for="edit_notice_msg" class="col-sm-2 control-label">
						  信息内容
						</label>
						<div class="col-sm-10">
							<textarea  rows="3" cols="20" class="form-control" id="new_notice_msg" placeholder="输入新的消息" name="new_notice_msg" ></textarea>
						</div>	
				 </div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary"  onclick= "createNotice()">
					提交
				</button>
			</div>
		</div>
	</div>
</div>
</div>	
	
	



</body>
<script type="text/javascript">
//清空新建客户窗口中的数据
	function clearNotice() {
		$("#notice_id").val();
        $("#notice_msg").val();
    }

    
	// 新建通知
	function createNotice() {
	$.post("<%=basePath%>noticeAdmin/newNotice",
	$("#new_notice_form").serialize(),function(data){
	        if(data =="OK"){
	            alert("发布成功！");
	            console.log(data)
	            window.location.reload();
	        }else{
	            alert("发布失败！");
	            window.location.reload();
	        }
	    });
	}

	// 通过id获取修改的客户信息
	function edit_notice(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>noticeAdmin/selectById",
	        data:{"notice_id":id},
	        success:function(data) {
	           
	            var json=JSON.parse(data);
	            $("#edit_notice_msg").val(json.notice_msg);
	            $("#notice_id").val(id);
	           
	        }
	    });
	}
// 执行修改客户操作
	function editNotice() {
		console.log($("#edit_notice_form").serialize());
		$.post("<%=basePath%>noticeAdmin/updateNotice",
		$("#edit_notice_form").serialize(),function(data){
			if(data =="OK"){
				alert("更新成功！");
				window.location.reload();
			}else{
				alert("更新失败！");
				window.location.reload();
			}
		});
	}
	// 删除客户
	function delete_notice(id) {
	    if(confirm('确实要删除该通知吗?')) {
	$.post("<%=basePath%>/noticeAdmin/delNotice",{"notice_id":id},
	function(data){
		//alert("data:"+data);
	            if(data =="OK"){
		            console.log(data);
	                alert("删除成功！");
	                window.location.reload();
	            }else{
	                alert("删除失败！");
	                window.location.reload();
	            }
	        });
	    }
	}

</script>
</html>