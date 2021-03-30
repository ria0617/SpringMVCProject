<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>

<script type="text/javascript">
// 수정 
function updateClick(){
	var formObj = $("form[name='mreadForm']");
	formObj.attr("action", "/board/updateView");
	formObj.attr("method", "get");
	formObj.submit();				
}
//삭제 
function deleteClick(){
	var formObj = $("form[name='mreadForm']");
	formObj.attr("action", "/board/delete");
	formObj.attr("method", "post");
	formObj.submit();
}
//페이징 목록 유지
function pageListClick(){
	location.href = "/movie/M_list?page=${scri.page}"
	+"&perPageNum=${scri.perPageNum}"
	+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
}
</script>

<body class="sb-nav-fixed">
<%@ include file="../include/main_header.jsp" %>
<div id="layoutSidenav">
	<%@ include file="../include/left_column.jsp" %>
	
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid">
				<h1 class="mt-4">영화소개 읽기</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="/movie/M_list">영화소개</a></li>
					<li class="breadcrumb-item active">영화소개 읽기</li>
				</ol>
				<div class="card shadow-lg border-0 rounded-lg">
					<div class="card-body">
						<form name="mreadForm" role="form" method="post" >
							<input id="bno" name="bno" type="hidden" value="${mmread.movie_id}"/>
							<input type="hidden" id="page" name="page" value="${scri.page}"> 
							<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
							<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
							<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
						</form>
						<div class="form-group">
							<label class="small mb-1" for="bno">글 번호</label>
							${mread.movie_id}&nbsp;&nbsp;|&nbsp;&nbsp;
							<label class="small mb-1" for="writer">작성자</label>
							<input class="form-control py-4" id="writer" name="writer" type="hidden" value="${mread.m_writer}"/>
							${mread.m_writer}&nbsp;&nbsp;|&nbsp;&nbsp;
							<label class="small mb-1"  for="regdate">작성일</label>
							<fmt:formatDate value="${mread.m_date}" pattern="yyyy-MM-dd"/>
						</div>
						<div class="form-group">
							<label class="small mb-1" for="title">제목: </label>
							<input class="form-control py-4" id="title" name="title" type="hidden" value="${mread.m_title}"/>
							${mread.m_title}
						</div>
						<div class="form-group">
							${mread.m_content}
						</div>
						<div class="form-group align-items-center justify-content-between mt-4 mb-0">
							<div class="float-left">
								<c:if test="${login.userId == mread.m_writer}">
								<button class="btn btn-primary" type="submit" onclick="updateClick()">수정</button>
								<button class="btn btn-primary" type="submit" onclick="deleteClick()">삭제</button>
								</c:if>
							</div>
							<div class="float-right">
								<button class="btn btn-primary " type="submit" onclick="pageListClick()">목록으로</button>
							</div>
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