<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-md-4">
		<div class="row right-content">
			<div class="col-md-12 text-center">
				<h4 class="text-left"><span class="glyphicon glyphicon-user"></span>个人中心</h4>
				<hr />
				<img src="${tbuser.image}"  width="300px" height="300px"/>
				<p >${tbuser.username }</p>
				<p >(${tbuser.motto })</p>
			</div>
			<div class="col-md-12 rz-class">
				<h4><span class="glyphicon glyphicon-th-list"></span>日志类别</h4>
				<hr />
				<div>
					<c:forEach items="${types }" var="item">
						<a href="/blog/selectBlog.do?tid=${item.id}">${item.name}(${item.num==null?0:item.num})</a><br>
					</c:forEach>
					
				</div>
			</div>
			<div class="col-md-12 rz-class">
				<h4><span class="glyphicon glyphicon-th-list"></span>日志日期</h4>
				<hr />
				<div>
					<c:forEach items="${dates }" var="item">
						<a href="/blog/selectBlog.do?ddate=${item.ddate}">${item.ddate}(${item.num})</a><br>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>