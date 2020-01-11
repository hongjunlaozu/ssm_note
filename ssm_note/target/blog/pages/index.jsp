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

		<%@ include file="/pages/header.jsp" %>
		<div class="container">
			<div class="row">
				<div class="col-md-8">
					<div class="list-content">
						<h4><span class="glyphicon glyphicon-th-list"></span>日记列表</h4>
						<hr/>
						<div class="padding-content">
							<table class="table table-condensed content-table">
								<tbody>
									<c:forEach items="${page.list }" var="item">
										<tr>
											<td width="30%">[${item.ddate }]</td>
											<td width="50%"><a href="/blog/info.do?id=${item.id }">${item.title }</a></td>
											<td width="20%">${item.username }</td>
										</tr>
									</c:forEach>
									
									
								</tbody>
							</table>
							<ul class="pagination pages">
							    
								<li <c:if test="${page.pageNum-1<1}">class="disabled"</c:if>>
									<a href="javascript:void(0)" onclick="page(${page.pageNum-1})">&laquo;</a>
								</li>
								
								<c:forEach begin="1" end="${page.pages }" var="n">
									<li><a href="javascript:void(0)" onclick="page(${n})">${n}</a>
									</li>
								</c:forEach>
								
								<li <c:if test="${page.pageNum+1>page.pages}">class="disabled"</c:if>>
								<a href="javascript:void(0)" onclick="page(${page.pageNum+1})">&raquo;</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<%@ include file="/pages/right.jsp" %>

			</div>
		</div>

		<%@ include file="/pages/footer.jsp" %>

	</body>
	<script type="text/javascript">
		function page(n){
			
			var url="/blog/selectBlog.do?cp="+n;
			var tid = $("#tid").val();
			var ddate = $("#ddate").val();
			
			if(tid!=null && tid!=''){
				url+="&tid="+tid;
			}
			if(ddate!=null && ddate!=''){
				url+="&ddate="+ddate;
			}
			
			window.location.href=url;
			
		}
	
	
	</script>

</html>