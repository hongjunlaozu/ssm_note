<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="utf8-jsp/ueditor.all.min.js"> </script>
	    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
	    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
	    <script type="text/javascript" charset="utf-8" src="utf8-jsp/lang/zh-cn/zh-cn.js"></script>
	</head>

	<body>

		<%@include file="/pages/header.jsp" %>
		
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="/blog/addBlog.do" method="post" class="form-horizontal" role="form">
						<div class="form-group">
							<label for="title" class="col-sm-1 control-label">标题</label>
							<div class="col-sm-5">
								<input type="text" name="title" class="form-control" id="title" 
									   placeholder="请输入标题">
							</div>
						</div>
						<div class="form-group">
							<label for="lastname" class="col-sm-1 control-label">日志类别</label>
							<div class="col-sm-3">
								<select class="form-control" name="tid">
									<c:forEach items="${types}" var="item">
										<option value="${item.id}">${item.name} </option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="title" class="col-sm-1 control-label">日志内容</label>
							<div class="col-sm-7">
								<!--<textarea class=" form-control" rows="15"></textarea>-->
								<div>
								    <script id="editor" type="text/plain" style="width:900px;height:500px;"></script>
								</div>
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

		<%@include file="/pages/footer.jsp" %>
	</body>
	<script type="text/javascript">

	    //实例化编辑器
	    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	    var ue = UE.getEditor('editor');
	    
	</script>
</html>