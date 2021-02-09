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
						<label for=""><h1 style="font-weight: bold; color: #999999;">维修管理</h1></label> 
						
					</div>
                 
				   </div>
				  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#RepairNewDialog">
				 	发布维修信息
				</button>
			</div>
			<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>维修编号</th>
								<th>维修类型</th>
								<th>状态</th>
								<th>备注</th>
								<th>操作</th>
						
								
								
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${maplist}" var="row">
								<tr>
									<td>${row.repair_id}</td>
									<td>${row.type}</td>
									<td>${row.state}</td>
								    <td>${row.remark}</td>
								
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
										 data-target="#RepairEditDialog" onclick= "edit_repair(${row.repair_id})">修改</a>
									
									
										<a href="#" class="btn btn-danger btn-xs" onclick= "deleteRepair(${row.repair_id})">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

	</div>
	
<!-- 修改模态框（Modal） -->
<div class="modal fade" id="RepairEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
			   <form class="form-horizontal" id="edit_repair_form">
			   		
			   		<input type="hidden" id="repair_id" name="repair_id" value="${row.repair_id}"/>
				 <div class="form-group">
						<label for="edit_type" class="col-sm-2 control-label">
						  维修类型
						</label>
						<div class="col-sm-10">
							<textarea  rows="2" cols="20" class="form-control" id="edit_type" placeholder="输入新的维修类型" name="edit_type" ></textarea>
						</div>	
				 </div>
				 
				  <div class="form-group">
						<label for="edit_state" class="col-sm-2 control-label">
						  状态
						</label>
						<div class="col-sm-10">
							<textarea  rows="1" cols="20" class="form-control" id="edit_state" placeholder="输入新的维修类型" name="edit_state" ></textarea>
						</div>	
				 </div>
				 <div class="form-group">
						<label for="edit_remark" class="col-sm-2 control-label">
						  备注
						</label>
						<div class="col-sm-10">
							<textarea  rows="3" cols="20" class="form-control" id="edit_remark" placeholder="输入新的备注" name="edit_remark" ></textarea>
						</div>	
				 </div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" onclick= "editRepair(${row.repair_id})">
					提交更改
				</button>
			</div>
			</form>
		</div>
	</div>
</div>
</div>	

  <nav aria-label="Page navigation" style="text-align: center">
        <ul class="pagination">
            <%--首页--%>
            <li><a href="<%=basePath%>admin/repair/repairList?pn=1">首页</a></li>
                
            <%--下一页--%>
            <c:if test="${PageInfo.hasPreviousPage}">
                <li>
                    <a href="<%=basePath%>admin/repair/repairList?pn=${PageInfo.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
                
                <%--页码--%>
            <c:forEach items="${PageInfo.navigatepageNums}" var="pageshow">
                <c:if test="${pageshow == PageInfo.pageNum}">
                    <li class="active"><a href="<%=basePath%>admin/repair/repairList?pn=${pageshow}">${pageshow}</a></li>
                </c:if>
                <c:if test="${pageshow != PageInfo.pageNum}">
                    <li><a href="<%=basePath%>admin/repair/repairList?pn=${pageshow}">${pageshow}</a></li>
                </c:if>
            </c:forEach>
                
            <%--上一页--%>
            <c:if test="${PageInfo.hasNextPage}">
                <li>
                    <a href="<%=basePath%>admin/repair/repairList?pn=${PageInfo.pageNum+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
                
            <%--尾页--%>
            <li><a href="<%=basePath%>admin/repair/repairList?pn=${PageInfo.pages}">尾页</a></li>
                
          
                
        
            
        </ul>
    </nav>
    
    
	<!--新建模态框	-->		
<div class="modal fade" id="RepairNewDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
			<form class="form-horizontal" id="new_repair_form">
				 <div class="form-group">
						<label for="new_type_id" class="col-sm-2 control-label">
						  维修类型
						</label>
						<div class="col-sm-10">
							<textarea  rows="3" cols="20" class="form-control" id="new_type" placeholder="输入新的维修类型" name="new_type" ></textarea>
						</div>	
				 </div>
				 <div class="form-group">
						<label for="new_remark" class="col-sm-2 control-label">
						  备注
						</label>
						<div class="col-sm-10">
							<textarea  rows="3" cols="20" class="form-control" id="new_remark" placeholder="输入新的备注" name="new_remark" ></textarea>
						</div>	
				 </div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary"  onclick= "createRepair()">
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
	function clearRepair() {
		$("#repair_id").val();
        $("#type").val();
        $("#remark").val();
    }

    
	// 新建通知
	function createRepair() {
	$.post("<%=basePath%>admin/repair/newRepair",
	$("#new_repair_form").serialize(),function(data){
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
	function edit_repair(id) {
	    $.ajax({
	        type:"get",
	        url:"<%=basePath%>admin/repair/selectById",
	        data:{"repair_id":id},
	        success:function(data) {
	           var json=JSON.parse(data);
	            $("#repair_id").val(json.repair_id);
	            $("#edit_type").val(json.type);
	            $("#edit_state").val(json.state);
	            $("#edit_remark").val(json.remark);
	         }
	    });
	}

	



	// 执行修改客户操作
	function editRepair() {
		console.log($("#edit_repair_form").serialize());
		$.post("<%=basePath%>admin/repair/updateRepair",
		$("#edit_repair_form").serialize(),function(data){
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
	function deleteRepair(id) {
	    if(confirm('确实要删除该通知吗?')) {
	$.post("<%=basePath%>admin/repair/DelRepair",{"repair_id":id},
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