<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<%@ include file="../include/head.jsp" %>

<body class="sb-nav-fixed">

<%@ include file="../include/main_header.jsp" %>

<div id="layoutSidenav">
	<%@ include file="../include/left_column.jsp" %>
	
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<h1 class="mt-4">영화리뷰</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="/board/list">영화리뷰</a></li>
					<li class="breadcrumb-item active">영화리뷰</li>
				</ol>
				<div class="mb-4">
					<div class="table-responsive">
						<table class="table table-bordered" id="" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var = "list">
								<tr>
									<td><c:out value="${list.bno}" /></td>
									<td>
										<a href="/board/readView?bno=${list.bno}"><c:out value="${list.title}" /></a>
									</td>
									<td><c:out value="${list.writer}" /></td>
									<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
								<a class="btn btn-primary"  href="/board/writeView">글쓰기</a>
						</div>
					</div>
				</div>
			</div>
		</main>
		<%@ include file="../include/main_footer.jsp" %>
	</div>
</div>

<%@ include file="../include/plugin_js.jsp" %>

</body>
</html>