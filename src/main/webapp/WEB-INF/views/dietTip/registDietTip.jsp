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
<script>
	/* summernote에서 이미지 업로드시 실행할 함수 */
	function sendFile(file, editor, welEditable) {
		var fileName = false;
		try {
			fileName = file['name'];
		} catch (e) {
			fileName = false;
		}
		if (!fileName) {
			$(".note-alarm").remove();
		}
		console.log(fileName);
		data = new FormData();
		data.append("file", file);
		data.append("key", fileName);

		$.ajax({
			data : data,
			type : "POST",
			url : "/imageUpload1.diet",
			cache : false,
			contentType : false,
			processData : false,
			success : function(url) {
				var path = url.path;
				alert(path);
				$('#summernote').summernote('insertImage', path);
			}
		});
	}
</script>
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
				<div class="ui large header" align="center">다어어트팁</div>
			</div>
			<br>

			<div class="ui form" style="max-width: 1220px;">
				<div class="ui medium header" style="margin-bottom: 5px;">제목</div>
				<div class="ui fluid left action icon input">
					<div class="ui basic floating dropdown button">
						<div class="text">카테고리</div>
						<i class="dropdown icon"></i>
						<div class="menu select">
							<div class="item">칼럼</div>
							<div class="item">운동</div>
							<div class="item">식단</div>
							<div class="item">성공후기</div>
						</div>
					</div>
					<input type="text" id="title" placeholder="제목을 입력해주세요" />
				</div>

			</div>
			<br>
			<div class="ui grid">
				<div class="six wide column">
					<div style="width:100%; height:100px;">사진 등록</div>
					<div style="width:100%; height:30px;">
						<button id="sammary" type="button" class="ui button" id="uploadPictureBtn" onclick="updatePictureBtn();" style="width: 140px; background: rgb(250,40,40); color: white;">사진등록/변경</button>
					</div>
				</div>
				<div class="ten wide column">
					<div style="width:100%; height:30px;">요약글 작성</div>
					<textarea style="width: 100%; height: 100px; resize:none;"></textarea>
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

	$('.ui.dropdown').dropdown({
		allowAdditions : true,
		allowCategorySelection : true
	});

	// 카테고리 선택
	var category;
	$('.select > .item').click(function() {
		switch ($(this).text()) {
		case '칼럼':
			category = 1;
			break;
		case '운동':
			category = 2;
			break;
		case '식단':
			category = 3;
			break;
		case '성공후기':
			category = 4;
			break;
		}
	});

	function register() {
		var $title = $('#title').val();
		var $content = $('#summernote').summernote('code');
		var $sammary = $('#sammary').val();
		if (category != null && $title != '' && $content != '') {
			$.ajax({
				url : '/registDietTip.diet',
				type : 'post',
				data : {
					'title' : $title,
					'content' : $content,
					'category' : category,
					'sammary' : $sammary
				},
				success : function(data) {
					if (data == 1) {
						alert('게시글 등록 완료');
						location.href = "/dietTipList.diet";
					}else{
						alert('게시글 등록 실패');
						location.href = "/dietTipList.diet";
					}
				},
				error : function() {
					alert('게시글 등록 실패(과정 오류)');
					location.href = "/dietTipList.diet";
				}
			});
		} else {
			if (category == null) {
				alert('카테고리를 선택하여주세요.');
			} else {
				alert('내용을 반드시 기입하여주세요.');
			}
		}
	}
</script>

</html>