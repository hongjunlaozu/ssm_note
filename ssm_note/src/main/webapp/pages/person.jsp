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
						<h4><span class="glyphicon glyphicon-th-list"></span>日记列表</h4>
						<hr/>
						<div class="padding-content">
							<form action="/user/update.do" method="post" class="form-horizontal" 
							role="form" enctype="multipart/form-data">
								<div class="form-group">
									<label for="file" class="col-sm-2 control-label">头像</label>
									<div class="col-sm-5">
										<input type="file" name="file" id="file"/>
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="col-sm-2 control-label">用户名</label>
									<div class="col-sm-5">
										<input type="text" name="username" readonly="readonly" value="${tbuser.username }" class="form-control" id="name" >
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="col-sm-2 control-label">密码</label>
									<div class="col-sm-5">
										<input type="text" name="password" required="required" value="${tbuser.password }" class="form-control" id="name" >
									</div>
								</div>
								<div class="form-group">
									<label for="name" class="col-sm-2 control-label">邮箱</label>
									<div class="col-sm-5">
										<input type="text" name="email" readonly="readonly" value="${tbuser.email }" class="form-control" id="name" >
									</div>
								</div>
								<div class="form-group">
									<label for="flag" class="col-sm-2 control-label">座右铭</label>
									<div class="col-sm-7">
										<textarea id="flag" name="motto" required="required" class=" form-control" rows="3">${tbuser.motto }</textarea>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="submit" class="btn btn-default">提交</button>
									</div>
								</div>
							</form>
							
						</div>
					</div>
				</div>
				
				<%@ include file="/pages/right.jsp" %>

			</div>
		</div>

		<%@include file="/pages/footer.jsp" %>

	</body>

</html>