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
						<label for=""><h1 style="font-weight: bold; color: #999999;">反馈管理</h1></label> 
						
					</div>
                 
				   </div>
				  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#FeedbackNewDialog">
				 	发布反馈
				</button>
			</div>
			<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>反馈编号</th>
								<th>反馈内容</th>
								<th>时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${maplist}" var="row">
								<tr>
									<td>${row.feedback_id}</td>
									<td>${row.feedback_msg}</td>
									<td>${row.time}</td>
									<td>
									<a href="#" class="btn btn-primary btn-xs"  data-toggle="modal" data-target="#FeedbackEditDialog"	onclick="selectById(${row.feedback_id})">修改</a> 
										<a href="#" class="btn btn-danger btn-xs" onclick= "deleteFeedback(${row.feedback_id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					 <nav aria-label="Page navigation" style="text-align: center">
        <ul class="pagination">
            <%--首页--%>
            <li><a href="<%=basePath%>feedbackAdmin/selectFeedback?pn=1">首页</a></li>
                
            <%--下一页--%>
            <c:if test="${PageInfo.hasPreviousPage}">
                <li>
                    <a href="<%=basePath%>feedbackAdmin/selectFeedback?pn=${PageInfo.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
                
                <%--页码--%>
            <c:forEach items="${PageInfo.navigatepageNums}" var="pageshow">
                <c:if test="${pageshow == PageInfo.pageNum}">
                    <li class="active"><a href="<%=basePath%>feedbackAdmin/selectFeedback?pn=${pageshow}">${pageshow}</a></li>
                </c:if>
                <c:if test="${pageshow != PageInfo.pageNum}">
                    <li><a href="<%=basePath%>feedbackAdmin/selectFeedback?pn=${pageshow}">${pageshow}</a></li>
                </c:if>
            </c:forEach>
                
            <%--上一页--%>
            <c:if test="${PageInfo.hasNextPage}">
                <li>
                    <a href="<%=basePath%>feedbackAdmin/selectFeedback?pn=${PageInfo.pageNum+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
                
            <%--尾页--%>
            <li><a href="<%=basePath%>feedbackAdmin/selectFeedback?pn=${PageInfo.pages}">尾页</a></li>
                
          
                
        
            
        </ul>
    </nav>

	</div>
	
	<!--修改模态框	-->	
<div class="modal fade" id=FeedbackEditDialog tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					修改通知
				</h4>
			</div>
			<div class="modal-body">
			<form class="form-horizontal" id="edit_feedback_form">
			<input type="hidden" id="feedback_id" name="feedback_id"
							value="${row.feedback_id}" />
				 <div class="form-group">
						<label for="edit_feedback_msg" class="col-sm-2 control-label">
						 反馈内容
						</label>
						<div class="col-sm-10">
							<textarea  rows="3" cols="20" class="form-control" id="edit_feedback_msg" placeholder="请输入反馈内容" name="edit_feedback_msg" ></textarea>
						</div>	
				 </div>
				 </form>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary"  onclick= "editFeedback()">
					提交
				</button>
			</div>
		</div>
	</div>
</div>
</div>	

	
	<!--新建模态框	-->		
<div class="modal fade" id="FeedbackNewDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
			<form class="form-horizontal" id="new_feedback_form">
				 <div class="form-group">
						<label for="new_feedback_msg" class="col-sm-2 control-label">
						 反馈内容
						</label>
						<div class="col-sm-10">
							<textarea  rows="3" cols="20" class="form-control" id="new_feedback_msg" placeholder="输入新的反馈内容" name="new_feedback_msg" ></textarea>
						</div>	
				 </div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary"  onclick= "createFeedback()">
					提交
				</button>
			</div>
		</div>
	</div>
</div>
</div>	
	

</body>
<script type="text/javascript">


    
	// 新建通知
	function createFeedback() {
	$.post("<%=basePath%>feedbackAdmin/newFeedback",
	$("#new_feedback_form").serialize(),function(data){
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
	function selectById(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>feedbackAdmin/selectById",
	        data:{"feedback_id":id},
	        success:function(data) {
	           
	            var json=JSON.parse(data);
	            console.log(json);
	            $("#feedback_id").val(json.feedback_id);
	            $("#edit_feedback_msg").val(json.feedback_msg);
	            
	           
	        }
	    });
	}
// 执行修改客户操作
	function editFeedback() {
		console.log($("#edit_feedback_form").serialize());
		$.post("<%=basePath%>feedbackAdmin/updateFeedback",
		$("#edit_feedback_form").serialize(),function(data){
			if(data =="OK"){
				alert("更新成功！");
				window.location.reload();
			}else{
				alert("更新失败！");
				window.location.reload();
			}
			console.log('data'+data);
		});
	}

	
	// 删除客户
	function deleteFeedback(id) {
	    if(confirm('确实要删除该通知吗?')) {
	$.post("<%=basePath%>/feedbackAdmin/delFeedback",{"feedback_id":id},
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