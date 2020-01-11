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

		<%@ include file="/pages/header.jsp" %>
		
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="list-content">
						<h4><span class="glyphicon glyphicon-th-large"></span>日记信息</h4>
						<hr/>
						<div class="padding-content">
							${blog.content }
						</div>
					</div>
				</div>
				<%@ include file="/pages/right.jsp" %>

			</div>
		</div>

		<%@ include file="/pages/footer.jsp" %>

	</body>

</html>