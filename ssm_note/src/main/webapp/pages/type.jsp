<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

	<head>
		<base href="/">
		<meta charset="utf-8" />
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css" />
		<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
		<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="css/main.css" />
	</head>

	<body>

		<%@include file="/pages/header.jsp" %>
		
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="list-content">
						<h4>
							<span class="glyphicon glyphicon-th-list"></span>日志类别
							<a href="/pages/addType.jsp" class="btn btn-danger float-right">添加类别</a>
						</h4>
						
						<hr/>
						<div class="padding-content">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>编号</th>
										<th>名称</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${types}" var="item">
										<tr>
											<td>${item.seq }</td>
											<td>${item.name }</td>
											<td>
												<a href="/type/delete.do?id=${item.id}"  class="btn btn-danger">删除</a>
												<a href="/type/toupdate.do?id=${item.id}" class="btn btn-primary">修改</a>
											</td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<%@include file="/pages/right.jsp" %>

			</div>
		</div>

		<%@include file="/pages/footer.jsp" %>

	</body>

</html>