<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
						</h4>
						
						<hr/>
						<div class="padding-content">
							<form action="/type/addtype.do" method="post" class="form-inline" role="form">
							  <div class="form-group">
							    <input type="text" name="seq" required="required" class="form-control" id="seq" placeholder="请输入编号">
							    <input type="text" name="name" required="required" class="form-control" id="name" placeholder="请输入名称">
							  </div>
							  
							  <button type="submit" class="btn btn-default">保存</button>
							  <a onclick="javascript:history.go(-1)" class="btn btn-default">返回</a>
							</form>
						</div>
					</div>
				</div>
				<%@include file="/pages/right.jsp" %>

			</div>
		</div>

		<%@include file="/pages/footer.jsp" %>

	</body>

</html>