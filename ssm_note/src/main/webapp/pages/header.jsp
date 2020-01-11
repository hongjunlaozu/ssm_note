<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse" role="navigation">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">牛掰日记本</a>
		</div>
		<div>
			<ul class="nav navbar-nav">
				<li class="active">
					<a href="/blog/selectBlog.do">
						<span class="glyphicon glyphicon-home"></span> 首页
					</a>
				</li>
				<li>
					<a href="/pages/write.jsp">
						<span class="glyphicon glyphicon-pencil"></span> 写日记
					</a>
				</li>
				<li>
					<a href="/type/typelist.do">
						<span class="glyphicon glyphicon-edit"></span> 日记分类管理
					</a>
				</li>
				<li>
					<a href="/pages/person.jsp">
						<span class="glyphicon glyphicon-user"></span> 个人中心
					</a>
				</li>
			</ul>
			<form action="/blog/selectBlog.do" method="post" class="navbar-form navbar-right" role="search">
				<div class="form-group">
				    <input type="hidden" id="tid" name="tid" value="${blog.tid }">
				    <input type="hidden" id="ddate" name="ddate" value="${blog.ddate }">
					<input name="title" type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">
	            	<span class="glyphicon glyphicon-search"></span>搜索
	            </button>
			</form>
		</div>
	</div>
</nav>