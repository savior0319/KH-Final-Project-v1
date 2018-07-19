<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>글 등록하기페이지</title>
<link href="/resources/summernote/dist/summernote-lite.css" rel="stylesheet">
<script src="/resources/summernote/dist/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
</head>

<!-- CSS -->
<style>
</style>



<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<br>
	<br>
	<div class="ui container">
		<div class="ui left aligned basic segment">
			<div class="ui medium message">
				<div class="ui large header" align="center">게시글 등록</div>
			</div>
			<br>

			<div class="ui form" style="max-width: 1220px;">
				<div class="ui medium header" style="margin-bottom: 5px;">제목</div>
				<div class="ui fluid left action icon input">
					<div class="ui basic floating dropdown button">
						<div class="text">카테고리</div>
						<i class="dropdown icon"></i>
						<div class="menu select">
							<div class="item">자유게시판</div>
							<div class="item">레시피&식단</div>
							<div class="item">팁&노하우</div>
							<div class="item">고민&질문</div>
							<div class="item">비포&에프터</div>
						</div>
					</div>
					<input type="text" id="title" placeholder="제목을 입력해주세요" />
				</div>

			</div>
			<br>
			<div id="summernote"></div>
			<br>
			<div align="center">
				<button class="ui red basic button" onclick="register();">등록</button>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#summernote').summernote({
			lang : 'ko-KR',
			placeholder : '내용을 입력해주세요',
			tabsize : 2,
			height : 500,
			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				}
			}
		});
	});

	function sendFile(file, el) {
		var form_data = new FormData();
		form_data.append('file', file);
		$.ajax({
			data : form_data,
			type : "POST",
			url : './profileImage.mpf',
			cache : false,
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(img_name) {
				$(el).summernote('editor.insertImage', img_name);
			}
		});
	}

	$('.ui.dropdown').dropdown({
		allowAdditions : true,
		allowCategorySelection : true
	});

	// 카테고리 선택
	var $category;
	$('.select > .item').click(function() {
		$category = $(this).text();
	});

	function register() {

		var $title = $('#title').val();
		var $content = $('#summernote').summernote('code');
		if ($category != null) {
			$.ajax({
				url : '/communityPostRegist.diet',
				type : 'post',
				data : {
					'title' : $title,
					'content' : $content,
					'category' : $category
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