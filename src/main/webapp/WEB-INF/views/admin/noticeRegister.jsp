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
			<div class="ui form" style="max-width: 1220px;">
				<div class="ui medium header" style="margin-bottom: 5px;">제목</div>
				<div class="ui fluid left action icon input">
					<div class="ui basic floating dropdown button">
						<div class="text">카테고리</div>
						<i class="dropdown icon"></i>
						<div class="menu select">
							<div class="item">전체</div>
							<div class="item">자유게시판</div>
							<div class="item">팁&#38;노하우</div>
							<div class="item">고민&#38;질문</div>
							<div class="item">비포&#38;애프터</div>
						</div>
					</div>
					<input type="text" id="title" placeholder="제목을 입력해주세요" />
				</div>

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


$('.ui.dropdown').dropdown({
	allowAdditions : true,
	allowCategorySelection : true
});

	// 카테고리 선택
	var noticeType;
	$('.select > .item').click(function() {
		switch ($(this).text()) {
			case '전체':
			noticeType = '전체';
			break;
			case '자유게시판':
			noticeType = '자유게시판';
			break;
			case '팁&노하우':
			noticeType = '팁&노하우';
			break;
			case '고민&질문':
			noticeType = '고민&질문';
			break;
			case '비포&애프터':
			noticeType = '비포&애프터';
			break;
		}
	});


	function register() {
		var title = $('#title').val();
		var content = $('#summernote').summernote('code');

		if (noticeType != null) {
			$.ajax({
				url : '/noticeRegisterData.diet',
				type : 'post',
				data : {
					'title' : title,
					'content' : content,
					'noticeType' : noticeType
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
			
		} else {
			alert('카테고리를 선택하여주세요.');
		}
		
	}
</script>


</html>