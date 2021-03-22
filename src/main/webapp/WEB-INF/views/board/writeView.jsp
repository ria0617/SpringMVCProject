<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<%@ include file="../include/head.jsp" %>

<body class="sb-nav-fixed">

<%@ include file="../include/main_header.jsp" %>

<div id="layoutSidenav">
	<%@ include file="../include/left_column.jsp" %>
	
	<div id="layoutSidenav_content">
		<main>
			<div class="container">
				<div class="row justify-content-center">
					<div class="col-lg-7">
						<div class="card shadow-lg border-0 rounded-lg mt-5">
							<div class="card-header">
								<h3 class="text-center font-weight-light my-4">글쓰기</h3>
							</div>
							<div class="card-body">
								<form role="form" method="post" action="/board/write">
									<div class="form-group">
										<label class="small mb-1" >제목</label>
										<input class="form-control py-4" id="title" name="title" type="text" placeholder="제목을 입력해주세요" />
									</div>
									<div class="form-row">
										<div class="col-md-6">
											<div class="form-group">
												<label class="small mb-1" >작성자</label>
												<input class="form-control py-4" id="writer" name="writer" type="text" placeholder="작성자" />
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="small mb-1" >내용</label>
										<textarea  class="form-control py-4"  id="content" name="content" ></textarea>
									</div>
									<div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
											<button class="btn btn-primary"  type="submit">글쓰기</button>
											<a class="small"  href="login.html">목록으로</a>
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
				</div>
			</div>
		</main>
		<%@ include file="../include/main_footer.jsp" %>
	</div>
</div>

<%@ include file="../include/plugin_js.jsp" %>

</body>
</html>