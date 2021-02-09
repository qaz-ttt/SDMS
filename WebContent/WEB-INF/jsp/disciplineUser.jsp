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
			
		</div>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>编号</th>
					<th>考勤状态</th>
					<th>备注</th>
					<th>时间</th>
					

	

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${maplist}" var="row">
					<tr>
						<td>${row.discipline_id}</td>
						<td>${row.discipline_state}</td>
						<td>${row.discipline_remark}</td>
						<td>${row.time}</td>

						
					</tr>
				</c:forEach>	
			</tbody>
		</table>

	</div>
	<nav aria-label="Page navigation" style="text-align: center">
		<ul class="pagination">
			<%--首页--%>
			<li><a href="<%=basePath%>user/discipline/disciplineList?pn=1">首页</a></li>

			<%--下一页--%>
			<c:if test="${PageInfo.hasPreviousPage}">
				<li><a
					href="<%=basePath%>user/discipline/disciplineList?pn=${PageInfo.pageNum-1}"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
			</c:if>

			<%--页码--%>
			<c:forEach items="${PageInfo.navigatepageNums}" var="pageshow">
				<c:if test="${pageshow == PageInfo.pageNum}">
					<li class="active"><a
						href="<%=basePath%>user/discipline/disciplineList?pn=${pageshow}">${pageshow}</a></li>
				</c:if>
				<c:if test="${pageshow != PageInfo.pageNum}">
					<li><a
						href="<%=basePath%>user/discipline/disciplineList?pn=${pageshow}">${pageshow}</a></li>
				</c:if>
			</c:forEach>

			<%--上一页--%>
			<c:if test="${PageInfo.hasNextPage}">
				<li><a
					href="<%=basePath%>user/discipline/disciplineList?pn=${PageInfo.pageNum+1}"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</c:if>

			<%--尾页--%>
			<li><a
				href="<%=basePath%>user/discipline/disciplineList?pn=${PageInfo.pages}">尾页</a></li>





		</ul>
	</nav>





</body>

</html>