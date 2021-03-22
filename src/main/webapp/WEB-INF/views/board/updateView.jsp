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
				<h1 class="mt-4">영화리뷰 읽기</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="/board/list">영화리뷰</a></li>
					<li class="breadcrumb-item active">영화리뷰 읽기</li>
				</ol>
				
				<div class="card shadow-lg border-0 rounded-lg">
					<div class="card-body">
						<form role="readForm" action="/board/update" role="form" method="post" >
							<input class="form-control py-4" id="bno" name="bno" type="hidden" value="${update.bno}"/>
							<div class="form-group">
								<label class="small mb-1" for="bno">글 번호</label>
								${read.bno}&nbsp;&nbsp;|&nbsp;&nbsp;
								<label class="small mb-1" for="writer">작성자</label>
								<input class="form-control py-4" id="writer" name="writer" type="hidden" value="${update.writer}"/>
								${read.writer}&nbsp;&nbsp;|&nbsp;&nbsp;
								<label class="small mb-1"  for="regdate">작성일</label>
								<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>
							</div>
							<div class="form-group">
								<label class="small mb-1" for="title">제목: </label>
								<input class="form-control py-4" id="title" name="title" type="text" value="${update.title}"/>
							</div>
							<div class="form-group">
								<label class="small mb-1" for="content" >내용</label>
								<textarea class="hidden form-control py-4"  id="content" name="content" ><c:out value="${update.content}" /></textarea>
							</div>
							<div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
									<button class="btn btn-primary" type="submit" class="update_btn">수정</button>
									<a class="small"  href="/board/list">목록으로</a>
							</div>
						</form>
					</div>
					<div class="card-footer text-center">
						<div class="small">
							<a href="#">계정이 있으면 로그인 해주세요</a>
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