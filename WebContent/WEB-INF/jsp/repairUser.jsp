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
                          </tr>
						</thead>
						<tbody>
							<c:forEach items="${maplist}" var="row">
								<tr>
									<td>${row.repair_id}</td>
									<td>${row.type}</td>
									<td>${row.state}</td>
								    <td>${row.remark}</td>
								
									
								</tr>
							</c:forEach>
						</tbody>
					</table>

	</div>
	

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
	  <nav aria-label="Page navigation" style="text-align: center">
        <ul class="pagination">
            <%--首页--%>
            <li><a href="<%=basePath%>user/repair/repairList?pn=1">首页</a></li>
                
            <%--下一页--%>
            <c:if test="${PageInfo.hasPreviousPage}">
                <li>
                    <a href="<%=basePath%>user/repair/repairList?pn=${PageInfo.pageNum-1}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
            </c:if>
                
                <%--页码--%>
            <c:forEach items="${PageInfo.navigatepageNums}" var="pageshow">
                <c:if test="${pageshow == PageInfo.pageNum}">
                    <li class="active"><a href="<%=basePath%>user/repair/repairList?pn=${pageshow}">${pageshow}</a></li>
                </c:if>
                <c:if test="${pageshow != PageInfo.pageNum}">
                    <li><a href="<%=basePath%>user/repair/repairList?pn=${pageshow}">${pageshow}</a></li>
                </c:if>
            </c:forEach>
                
            <%--上一页--%>
            <c:if test="${PageInfo.hasNextPage}">
                <li>
                    <a href="<%=basePath%>user/repair/repairList?pn=${PageInfo.pageNum+1}" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </c:if>
                
            <%--尾页--%>
            <li><a href="<%=basePath%>user/repair/repairList?pn=${PageInfo.pages}">尾页</a></li>
                
          
                
        
            
        </ul>
    </nav>
	



</body>
<script type="text/javascript">

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


</script>
</html>