<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<%@ include file="../include/head.jsp" %>
<link id="contextPath" data-path="<c:url value='/'/>" />
<script type="text/javascript" src="<c:url value='../../resources/smarteditor/js/service/HuskyEZCreator.js'/>" charset="utf-8"></script>


<textarea name="ir1" id="ir1" rows="10" cols="100">에디터에 기본으로 삽입할 글(수정 모드)이 없다면 이 value 값을 지정하지 않으시면 됩니다.</textarea>
<button type="button" class="btn">작성내용 콘솔에 찍기!!</button>

<script>
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "ir1",
		sSkinURI: $('#contextPath').data('path') + "../../resources/smarteditor/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
	$(".btn").on("click", function() {
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
		var value = document.getElementById("ir1").value;
		console.log(value);
	});
</script>
<%@ include file="../include/plugin_js.jsp" %>

</body>
</html>