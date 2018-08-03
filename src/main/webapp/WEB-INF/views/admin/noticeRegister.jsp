<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>관리자 - 공지사항 등록</title>
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
				<div class="ui large header" align="center">공지사항 등록</div>
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
			toolbar: [
			['style', ['bold', 'italic', 'underline', 'clear']],
			['fontsize', ['fontsize']], 
			['color', ['color']],
			['hr'],
			['para', ['ul', 'ol', 'paragraph']],
			['table'], 
			['height', ['height']],
			['codeview'],
			['link'],
			['video'],
			['picture']
			],
			lang : 'ko-KR',
			placeholder : '내용을 입력해주세요',
			tabsize : 2,
			height : 500,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						imgUpload(files[i], this);
					}
				},
				onMediaDelete : function() {
				}
			}
		});
	});

	function imgUpload(file, el) {
		form = new FormData();
		form.append("file", file);
		$.ajax({
			data : form,
			type : "POST",
			url : "/imageUpload.diet",
			cache : false,
			contentType : false,
			processData : false,
			encType : "multipart/form-data",
			success : function(url) {
				$(el).summernote('editor.insertImage', url);
			}
		});
	}

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