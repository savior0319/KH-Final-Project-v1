<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>다이어트</title>
<link href="/resources/summernote/dist/summernote-lite.css" rel="stylesheet">
<script src="/resources/summernote/dist/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
</head>
</head>

<!-- CSS -->
<style>
body {
	margin-left: 240px;
}
</style>




<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/adminheader.jsp"></jsp:include>

	<!-- CONTENTS -->
	<br>
	<br>
	<div class="ui container">
		<div class="ui left aligned basic segment">
			<div class="ui medium message">
				<div class="ui large header" align="center">공지사항 등록(사진 빼고 글 부터 테스트 중)</div>
			</div>
			<br>
			<div class="ui form">
				<div class="ui medium header" style="margin-bottom: 5px;">제목</div>
				<input type="text" id="title" placeholder="제목을 입력해주세요">
			</div>
			<br>
			<div id="summernote"></div>
			<br>
			<div align="center">
				<button class="ui blue button" onclick="register();">등록</button>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			lang : 'ko-KR',
			placeholder : '내용을 입력해주세요',
			tabsize : 2,
			height : 500,
		});
	});

	function register() {
		var title = $('#title').val();
		var content = $('#summernote').summernote('code');

		$.ajax({
			url : '/noticeRegisterData.diet',
			type : 'post',
			data : {
				'title' : title,
				'content' : content
			},

			success : function(data) {
				if (data == 'success') {
					alert('공지등록 완료');
					location.href = "/admin.diet"
				}
			},
			error : function() {
				alert('공지등록 실패');
			}
		});
	}
</script>


</html>