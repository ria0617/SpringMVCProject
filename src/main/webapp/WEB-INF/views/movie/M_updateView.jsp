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
				<h1 class="mt-5">영화소개 읽기</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="/movie/M_list">영화소개</a></li>
					<li class="breadcrumb-item active">영화소개 읽기</li>
				</ol>
				
				<div class="card shadow-lg border-0 rounded-lg">
					<div class="card-body">
						<form role="readForm" action="/movie/M_update" role="form" method="post" >
							<input class="form-control py-4" id="movie_id" name="movie_id" type="hidden" value="${mupdate.movie_id}"/>
							<input type="hidden" id="page" name="page" value="${scri.page}"> 
							<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
							<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
							<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
							<div class="form-group">
								<label class="small mb-1" for="movie_id">글 번호</label>
								${mupdate.movie_id}&nbsp;&nbsp;|&nbsp;&nbsp;
								<label class="small mb-1" for="m_writer">작성자</label>
								<input class="form-control py-4" id="m_writer" name="m_writer" type="hidden" value="${mupdate.m_writer}"/>
								${mupdate.m_writer}&nbsp;&nbsp;|&nbsp;&nbsp;
								<label class="small mb-1"  for="m_date">작성일</label>
								<fmt:formatDate value="${mupdate.m_date}" pattern="yyyy-MM-dd"/>
							</div>
							<div class="form-group">
								<input class="form-control py-4" id="m_title" name="m_title" type="text" value="${mupdate.m_title}"/>
							</div>
							<div class="form-group">
								<textarea class="hidden form-control py-4"  id="m_content" name="m_content" ><c:out value="${mupdate.m_content}" /></textarea>
							</div>
							<div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
									<button class="btn btn-success" type="submit" class="mupdate_btn">수정</button>
									<a class="btn btn-dark"  href="/movie/M_list">목록으로</a>
							</div>
						</form>
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