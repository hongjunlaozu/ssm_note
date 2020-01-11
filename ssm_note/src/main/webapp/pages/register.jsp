<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <base href="/">
		<meta charset="UTF-8">
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="bootstrap-3.3.7/css/bootstrap.min.css" />
		<script type="text/javascript" src="js/jquery-2.2.3.min.js"></script>
		<script type="text/javascript" src="bootstrap-3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="container" >
			<div class="row clearfix">
				<div class="col-md-12 column" >
					<a id="modal-930441" href="#modal-container-930441" role="button" class="btn" data-toggle="modal"></a>
					<div class="modal fade" style="background-image: url(img/bg.jpg);" id="modal-container-930441" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" style="width: 500px;margin-top: 130px;">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">
										用户注册 <font id="mess" style="color: red"></font>
									</h4>
								</div>
								<div class="modal-body">
									<form action="/user/register.do" class="form-horizontal" role="form">
										<div class="form-group">
											<label for="title" class="col-sm-3 control-label">用户名</label>
											<div class="col-sm-7">
												<input type="text" class="form-control" name="username" id="username" 
													   placeholder="请输入用户名" required pattern="[A-z0-9]{6,16}" title="必须是6-16位字母或数字">
											</div>
										</div>
										<div class="form-group">
											<label for="title" class="col-sm-3 control-label">密码</label>
											<div class="col-sm-7">
												<input type="text" class="form-control" name="password" id="title" 
													   placeholder="请输入密码" required>
											</div>
										</div>
									
										<div class="form-group">
											<label for="title" class="col-sm-3 control-label">邮箱</label>
											<div class="col-sm-7">
												<input type="text" class="form-control" name="email" id="title" 
													   placeholder="请输入邮箱" required >
											</div>
										</div>
										
										<div class="form-group">
											<div class="col-sm-offset-3 col-sm-10">
												<input type="submit" id="sub"  class="btn btn-default" value="注册" />
											</div>
										</div>
									</form>
								</div>
							</div>
							
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</body>
	<script>
		//window.location.href="#modal-container-930441";
		$(function(){
		      //$("#modal-930441").click();
		      $('#modal-container-930441').modal({  
		    	  keyboard: false  ,
		    	  backdrop:false
		      }) 
		      
		      $("#username").blur(function(){
		    	  
		    	  $.ajax({
		    		  url:"/user/validate.do",
		    	  	  data:{"username":$("#username").val()},
		    	  	  dataType:"json",
		    	  	  success:function(result){
		    	  		  if(result!='0'){
		    	  			 $("#mess").html("用户名可用");
		    	  			 $("#sub").removeAttr("disabled");
		    	  		  }else{
		    	  			 $("#mess").html("用户名已存在");
		    	  			 $("#sub").attr("disabled","disabled");
		    	  		  }
		    	  		 
		    	  	  },
		    	  	  error:function(){
		    	  		  alert("校验失败");
		    	  	  }
		    		  
		    	  })
		    	  
		    	  
		    	  
		      })
		      
		});
	</script>
</html>
