<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
			<div class="panel-body">
			<div class="form-group">
						<label for=""><h1 style="font-weight: bold; color: #999999;">学生信息管理</h1></label> 
						
					</div>
				<form class="form-inline" method="get" action="">
					<div class="form-group">
						<label for="">宿舍楼</label> <input type="text" class="form-control"
							id="" value="" name="" />
					</div>

					<button type="submit" class="btn btn-primary">查询</button>
			</div>

			</form>
		</div>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>

					<th>学号</th>
					<th>宿舍号</th>
					<th>所属专业</th>
					<th>床位</th>
					<th>操作</th>


				</tr>
			</thead>
			<tbody>
				<c:forEach items="${maplist}" var="row">
					<tr>
						<td>${row.stu_id}</td>						
						<td>${row.stu_home}</td>
						<td>${row.major}</td>
						<td>${row.bad}</td>

						<td><a href="#" class="btn btn-primary btn-xs"
							data-toggle="modal" data-target="#adminEditDialog"
							onclick="selectById(${row.stu_id})">修改</a> <a href="#"
							class="btn btn-danger btn-xs"
							onclick="delete_student(${row.stu_id})">删除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		
		
		   <nav aria-label="Page navigation" style="text-align: center">
        <ul class="pagination">
            <%--首页--%>
            <li><a href="<%=basePath%>admin/student?pn=1">首页</a></li>
                
            <%--下一页--%>
            <c:if test="${PageInfo.hasPreviousPage}">
                <li>
                    <a href="<%=basePath%>admin/student?pn=${PageInfo.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
                
                <%--页码--%>
            <c:forEach items="${PageInfo.navigatepageNums}" var="pageshow">
                <c:if test="${pageshow == PageInfo.pageNum}">
                    <li class="active"><a href="<%=basePath%>admin/student?pn=${pageshow}">${pageshow}</a></li>
                </c:if>
                <c:if test="${pageshow != PageInfo.pageNum}">
                    <li><a href="<%=basePath%>admin/student?pn=${pageshow}">${pageshow}</a></li>
                </c:if>
            </c:forEach>
                
            <%--上一页--%>
            <c:if test="${PageInfo.hasNextPage}">
                <li>
                    <a href="<%=basePath%>admin/student?pn=${PageInfo.pageNum+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
                
            <%--尾页--%>
            <li><a href="<%=basePath%>admin/student?pn=${PageInfo.pages}">尾页</a></li>
                
          
                
        
            
        </ul>
    </nav>
		
		
		
		
		
	</div>





	</button>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="adminEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">修改学生</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_student_form">
						<input type="hidden" id="stu_id" name="stu_id"
							value="${row.stu_id}" />
						
						</div>
						<div class="form-group">
							<label for="edit_stu_home" class="col-sm-2 control-label">
								宿舍号 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_stu_home"
									placeholder="宿舍号" name="edit_stu_home" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_major" class="col-sm-2 control-label">
								所属专业 </label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_major"
									placeholder="所属专业" name="edit_major" />
							</div>
						</div>
						<div class="form-group">
							<label for="edit_bad" class="col-sm-2 control-label"> 床位号
							</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_bad"
									placeholder="床位号" name="edit_bad" />
							</div>
						</div>

					</form>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="button" class="btn btn-primary"
							onclick="editStudent(${row.notice_id})">提交更改</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</div>
</body>




<script type="text/javascript">




	// 通过id获取修改的客户信息
	function selectById(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>StuAdmin/selectById",
	        data:{"stu_id":id},
	        success:function(data) {
	           
	            var json=JSON.parse(data);
	            $("#stu_id").val(json.stu_id);
	            $("#edit_stu_home").val(json.stu_home);
	            $("#edit_major").val(json.major);
	            $("#edit_bad").val(json.bad);
	           
	        }
	    });
	}
// 执行修改客户操作
	function editStudent() {
		console.log($("#edit_student_form").serialize());
		$.post("<%=basePath%>StuAdmin/updateStu",
		$("#edit_student_form").serialize(),function(data){
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
	function delete_student(id) {
	    if(confirm('确实要删除该通知吗?')) {
	$.post("<%=basePath%>/StuAdmin/delStu",{"stu_id":id},
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