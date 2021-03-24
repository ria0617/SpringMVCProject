<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<script type="text/javascript">
// 수정 
function updateClick(){
	var formObj = $("form[name='readForm']");
	formObj.attr("action", "/board/updateView");
	formObj.attr("method", "get");
	formObj.submit();				
}
//삭제 
function deleteClick(){
	var formObj = $("form[name='readForm']");
	formObj.attr("action", "/board/delete");
	formObj.attr("method", "post");
	formObj.submit();
}
//페이징 목록 유지
function pageListClick(){
	location.href = "/board/list?page=${scri.page}"
	+"&perPageNum=${scri.perPageNum}"
	+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
}
//댓글 작성
function replyWriteBtn(){
	var formObj = $("form[name='replyForm']");
	formObj.attr("action", "/board/replyWrite");
	formObj.submit();
}
//댓글 수정
function replyUpdateClick(){
	var formObj = $("form[name='replyForm2']");
	formObj.attr("action", "/board/replyUpdate");
	formObj.attr("method", "post");
	formObj.submit();
	document.getElementById('reply_content').classList.remove('hide');
	document.getElementById('replyUpdateBtn').classList.remove('hide');
	document.getElementById('reply_update').classList.add('hide');
	document.getElementById('replyUpdateClick').classList.add('hide');
}
//댓글 삭제
function replyDeleteClick(){
	var formObj = $("form[name='replyForm2']");
	formObj.attr("action", "/board/replyDelete");
	formObj.attr("method", "post");
	formObj.submit();
}
//수정 버튼 on off
function replyUpdateBtn(){
	document.getElementById('reply_content').classList.add('hide');
	document.getElementById('replyUpdateBtn').classList.add('hide');
	document.getElementById('reply_update').classList.remove('hide');
	document.getElementById('replyUpdateClick').classList.remove('hide');
}
</script>

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
						<form name="readForm" role="form" method="post" >
							<input id="bno" name="bno" type="hidden" value="${read.bno}"/>
							<input type="hidden" id="page" name="page" value="${scri.page}"> 
							<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
							<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
							<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
						</form>
						<div class="form-group">
							<label class="small mb-1" for="bno">글 번호</label>
							${read.bno}&nbsp;&nbsp;|&nbsp;&nbsp;
							<label class="small mb-1" for="writer">작성자</label>
							<input class="form-control py-4" id="writer" name="writer" type="hidden" value="${read.writer}"/>
							${read.writer}&nbsp;&nbsp;|&nbsp;&nbsp;
							<label class="small mb-1"  for="regdate">작성일</label>
							<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/>
						</div>
						<div class="form-group">
							<label class="small mb-1" for="title">제목: </label>
							<input class="form-control py-4" id="title" name="title" type="hidden" value="${read.title}"/>
							${read.title}
						</div>
						<div class="form-group">
							${read.content}
						</div>
						<div class="form-group align-items-center justify-content-between mt-4 mb-0">
							<button class="btn btn-primary" type="submit" onclick="updateClick()">수정</button>
							<button class="btn btn-primary" type="submit" onclick="deleteClick()">삭제</button>
							<button class="btn btn-primary float-right" type="submit" onclick="pageListClick()">목록으로</button>
						</div>
					</div>
					<div class="card-footer text-left">
						<!-- 댓글 쓰기 -->
						<form name="replyForm" method="post">
							<input type="hidden" id="bno" name="bno" value="${read.bno}" />
							<input type="hidden" id="page" name="page" value="${scri.page}">
							<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
							<input type="hidden"id="searchType" name="searchType" value="${scri.searchType}">
							<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}">
							<div class="form-group">
								<input class="form-control py-4" type="text" id="writer" name="writer" placeholder="작성자" />
								<textarea  id="content" name="content" ></textarea>
							</div>
							<div class="form-group align-items-center justify-content-between mt-4 mb-0">
								<button type="button" class="btn btn-primary" onclick="replyWriteBtn()">작성</button>
							</div>
						</form>
						<!-- 댓글 쓰기 끝 -->
						<!-- 댓글 보기-->
						<div id="reply">
							<ol class="replyList">
								<c:forEach items="${replyList}" var="replyList">
									<li>
										<p>
											작성자 : ${replyList.writer}<br /> 
											작성 날짜 :
											<fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
										</p>
										<div class="" id="reply_content">${replyList.content}</div>
										<!-- 댓글 수정 삭제-->
										<form name="replyForm2" role="form" method="post" >
											<input id="bno" name="bno" type="hidden" value="${read.bno}"/>
											<input id="rno" name="rno" type="hidden" value="${replyList.rno}"/>
											<div class="hide"  id="reply_update">
												<textarea id="content" name="content" >${replyList.content}</textarea>
											</div>
										</form>
										<div class="form-group align-items-center justify-content-between mt-4 mb-0">
											<button type="button" class="btn btn-primary"  id="replyUpdateBtn"  onclick="replyUpdateBtn()" data-rno="${replyList.rno}">수정</button>
											<button type="button" class="btn btn-primary hide"  id="replyUpdateClick"  onclick="replyUpdateClick()" data-rno="${replyList.rno}">저장</button>
											<button type="button" class="btn btn-primary"  onclick="replyDeleteClick()" data-rno="${replyList.rno}">삭제</button>
										</div>
										<!-- 댓글 수정 삭제 끝 -->
									</li>
								</c:forEach>
							</ol>
						</div>
						<!-- 댓글 보기 끝-->
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