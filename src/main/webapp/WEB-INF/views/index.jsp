<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<%@ include file="include/head.jsp" %>

<body class="sb-nav-fixed">

<%@ include file="include/main_header.jsp" %>

<div id="layoutSidenav">
	<%@ include file="include/left_column.jsp" %>
	
	<div id="layoutSidenav_content">
		<main>
			<div>메인 페이지</div>
		</main>
		<%@ include file="include/main_footer.jsp" %>
	</div>
</div>

<%@ include file="include/plugin_js.jsp" %>

</body>
</html>
