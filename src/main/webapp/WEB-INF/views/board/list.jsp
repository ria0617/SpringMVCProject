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
					<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
						<!-- 페이징 시작 -->
						<div class="row">
							<div class="col-sm-12 col-md-5">
								<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">
									total: ${pageMaker.totalCount}
								</div>
							</div>
							<div class="col-sm-12 col-md-7">
								<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
									<ul class="pagination">
										<c:if test="${pageMaker.prev}">
											<li class="paginate_button page-item previous" id="dataTable_previous">
												<a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}" aria-controls="dataTable" data-dt-idx="${pageMaker.startPage}" tabindex="0" class="page-link">
													<i class="fas fa-angle-double-left"></i>
												</a>
											</li>
										</c:if>
										<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
											<c:choose>
												<c:when test="${pageMaker.cri.page == idx}">
													<li class="paginate_button page-item active">
														<a href="list${pageMaker.makeQuery(idx)}" aria-controls="dataTable" tabindex="0" data-dt-idx="${idx}" class="page-link">${idx}</a>
													</li>
												</c:when>
												<c:when test="${pageMaker.cri.page != idx}">
													<li class="paginate_button page-item">
														<a href="list${pageMaker.makeQuery(idx)}" aria-controls="dataTable" tabindex="0" data-dt-idx="${idx}" class="page-link">${idx}</a>
													</li>
												</c:when>
											</c:choose>
										</c:forEach>
										<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
											<li class="paginate_button page-item next" id="dataTable_next">
												<a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}" aria-controls="dataTable" data-dt-idx="${pageMaker.endPage}" tabindex="0"  class="page-link" onclick="addClassName()">
													<i class="fas fa-angle-double-right"></i>
												</a>
											</li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
						<!-- 페이징 끝 -->
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