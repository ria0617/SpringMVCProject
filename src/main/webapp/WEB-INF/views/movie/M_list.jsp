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
				<h1 class="mt-4">영화 소개</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="/movie/M_list">영화 소개</a></li>
					<li class="breadcrumb-item active">영화 소개</li>
				</ol>
				
				<div class="form-row">
					<div class="col-md-6">
						<div class="form-group">
							페이지: ${pageMaker.cri.page} / ${pageMaker.endPage}&nbsp;&nbsp;
							총 게시물: ${pageMaker.totalCount}
						</div>
					</div>
					<c:if test="${not empty login}">
					<div class="col-md-6">
						<div class="form-group float-right">
							<a class="btn btn-primary"  href="/movie/M_writeView">글쓰기</a>
						</div>
					</div>
					</c:if>
				</div>
				<div class="mb-4">
					<div class="table-responsive">
						<table class="table table-bordered" id="" width="100%" cellspacing="0">
							<colgroup>
								<col width="5%">
								<col width="*">
								<col width="10%">
								<col width="5%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>조회수</th>
									<th>등록일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${mlist}" var = "mlist">
								<tr>
									<td><c:out value="${mlist.movie_id}" /></td>
									<td>
										<a href="/movie/M_readView?
											movie_id=${mlist.movie_id}&
											page=${scri.page}&
											perPageNum=${scri.perPageNum}&
											searchType=${scri.searchType}&
											keyword=${scri.keyword}"><c:out value="${mlist.m_title}" />
										</a>
									</td>
									<td><c:out value="${mlist.m_writer}" /></td>
									<td><c:out value="${mlist.m_hit}" /></td>
									<td><fmt:formatDate value="${mlist.m_date}" pattern="yyyy-MM-dd"/></td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
						<!-- 검색 시작 -->
						<div class="row">
							<div class="col-sm-12 col-md-6">
								<div class="search">
									<select class="custom-select float-left mr-1" name="searchType" style="display:inline-block; width:30%;">
										<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>검색</option>
										<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
										<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
										<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
										<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
									</select>
									<div class="input-group float-left" style="width:50%;">
											<input class="form-control form-control-sm"  type="text" name="keyword" id="keywordInput" value="${scri.keyword}" placeholder="검색" aria-label="Search" aria-describedby="basic-addon2" />
											<div class="input-group-append">
												<button class="btn btn-primary" id="searchBtn"  type="button">
													<i class="fas fa-search"></i>
												</button>
											</div>
										</div>

									<script>
									$(function(){
										$('#searchBtn').click(function() {
											self.location = "M_list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
										});
									}); 
									</script>
								</div>
							</div>
							<!-- 검색 끝 -->
							<!-- 페이징 시작 -->
							<div class="col-sm-12 col-md-6">
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
							<!-- 페이징 끝 -->
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