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
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>


	<div style="margin: 50px;">
		<div class="panel panel-default">
			<div class="panel-body text-center">

				<div class="form-group">
					<label for=""><h1
							style="font-weight: bold; color: #999999;">纪律考勤管理</h1></label>

				</div>

			</div>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#DisciplineNewDialog">发布通知</button>
		</div>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>编号</th>
					<th>考勤状态</th>
					<th>备注</th>
					<th>时间</th>
					<th>操作</th>



				</tr>
			</thead>
			<tbody>
				<c:forEach items="${maplist}" var="row">
					<tr>
						<td>${row.discipline_id}</td>
						<td>${row.discipline_state}</td>
						<td>${row.discipline_remark}</td>
						<td>${row.time}</td>

						<td><a href="#" class="btn btn-primary btn-xs"
							data-toggle="modal" data-target="#DisciplineEditDialog"
							onclick="editDiscipline(${row.discipline_id})">修改</a> <a href="#"
							class="btn btn-danger btn-xs"
							onclick="deleteDiscipline(${row.discipline_id})">删除</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

	</div>

	<!-- 修改模态框（Modal） -->
	<div class="modal fade" id="DisciplineEditDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">修改信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_discipline_form">

						<input type="hidden" id="discipline_id" name="discipline_id"
							value="${row.discipline_id}" />

						<div class="form-group">
							<label for="edit_discipline_state" class="col-sm-2 control-label">
								状态 </label>
							<div class="col-sm-10">
								<textarea rows="1" cols="20" class="form-control"
									id="edit_discipline_state" placeholder="输入新的状态"
									name="edit_discipline_state"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_discipline_remark"
								class="col-sm-2 control-label"> 备注 </label>
							<div class="col-sm-10">
								<textarea rows="3" cols="20" class="form-control"
									id="edit_discipline_remark" placeholder="输入新的备注"
									name="edit_discipline_remark"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary"
								onclick="updateDiscipline(${row.discipline_id})">提交更改</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--新建模态框	-->
	<div class="modal fade" id="DisciplineNewDialog" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">发布通知</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="new_discipline_form">
						<div class="form-group">
							<label for="discipline_state" class="col-sm-2 control-label">
								状态 </label>
							<div class="col-sm-10">
								<textarea rows="1" cols="20" class="form-control"
									id="discipline_state" placeholder="输入新的状态"
									name="discipline_state"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="discipline_remark" class="col-sm-2 control-label">
								备注 </label>
							<div class="col-sm-10">
								<textarea rows="3" cols="20" class="form-control"
									id="discipline_remark" placeholder="输入新的备注"
									name="discipline_remark"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">关闭</button>
							<button type="button" class="btn btn-primary"
								onclick="createDiscipline()">提交</button>
						</div>
				</div>
			</div>
		</div>
	</div>
	<nav aria-label="Page navigation" style="text-align: center">
		<ul class="pagination">
			<%--首页--%>
			<li><a href="<%=basePath%>admin/discipline/disciplineList?pn=1">首页</a></li>

			<%--下一页--%>
			<c:if test="${PageInfo.hasPreviousPage}">
				<li><a
					href="<%=basePath%>admin/discipline/disciplineList?pn=${PageInfo.pageNum-1}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<%--页码--%>
			<c:forEach items="${PageInfo.navigatepageNums}" var="pageshow">
				<c:if test="${pageshow == PageInfo.pageNum}">
					<li class="active"><a
						href="<%=basePath%>admin/discipline/disciplineList?pn=${pageshow}">${pageshow}</a></li>
				</c:if>
				<c:if test="${pageshow != PageInfo.pageNum}">
					<li><a
						href="<%=basePath%>admin/discipline/disciplineList?pn=${pageshow}">${pageshow}</a></li>
				</c:if>
			</c:forEach>

			<%--上一页--%>
			<c:if test="${PageInfo.hasNextPage}">
				<li><a
					href="<%=basePath%>admin/discipline/disciplineList?pn=${PageInfo.pageNum+1}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>

			<%--尾页--%>
			<li><a
				href="<%=basePath%>admin/discipline/disciplineList?pn=${PageInfo.pages}">尾页</a></li>





		</ul>
	</nav>




</body>
<script type="text/javascript">


    
	// 新建
	function createDiscipline() {
	$.post("<%=basePath%>admin/discipline/newdiscipline",
	$("#new_discipline_form").serialize(),function(data){
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
		// 通过id获取修改的客户信息
	function editDiscipline(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>admin/discipline/selectById",
	        data:{"discipline_id":id},
	        success:function(data) {
	           
	            var json=JSON.parse(data);
	            $("#discipline_id").val(json.discipline_id);
	            $("#edit_discipline_state").val(json.discipline_state);
	            $("#edit_discipline_remark").val(json.discipline_remake);
	         
	           
	        }
	    });
	}

	



	// 执行修改客户操作
	function updateDiscipline() {
		console.log($("#edit_discipline_form").serialize());
		$.post("<%=basePath%>admin/discipline/updateDiscipline",
		$("#edit_discipline_form").serialize(),function(data){
			console.log(data);
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
	function deleteDiscipline(id) {
	    if(confirm('确实要删除该条数据吗?')) {
	$.post("<%=basePath%>admin/repair/DelRepair",{"discipline_id":id},
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