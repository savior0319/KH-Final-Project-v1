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


.fileBox .fileName {
	display: inline-block;
	width: 190px;
	height: 30px;
	padding-left: 10px;
	margin-right: 5px;
	line-height: 30px;
	border: 1px solid #aaa;
	background-color: #fff;
	vertical-align: middle
}

.fileBox .btn_file {
	display: inline-block;
	border: 1px solid #000;
	width: 100px;
	height: 30px;
	font-size: 0.8em;
	line-height: 30px;
	text-align: center;
	vertical-align: middle
}

.fileBox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
}
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
					<div style="width: 100%; height: 100px;">사진 등록</div>
					<div style="width: 100%; height: 30px;">
						<button type="button" class="ui button" onclick="uploadPictureBtn();" style="width: 140px; background: rgb(250, 40, 40); color: white;">사진등록/변경</button>
					</div>
				</div>
				<div class="ten wide column">
					<div style="width: 100%; height: 30px;">요약글 작성</div>
					<textarea style="width: 100%; height: 100px; resize: none;" id="sammary"></textarea>
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

	<!-- 이미지 선택 모달 -->

	<div class="ui modal" id="updateProfile">
		<i class="close icon"></i>
		<div class="header">프로필 사진 변경</div>
		<div class="image content">
			<form action="/updateMyPicture.diet" method="post" enctype="multipart/form-data">
				<div class="description">
					<div class="ui header">
						<div class="fileBox">
							<input type="text" class="fileName" id="fileName" readonly="readonly" /> 
							<label for="uploadBtn" class="btn_file">찾아보기</label> 
							<input type="file" id="uploadBtn" class="uploadBtn"
								name="uploadFile" />
						</div>
					</div>
				</div>
				<br>
				<div class="actions">
					<button type="submit" style="background: rgb(250, 40, 40); color: white;" class="ui button">
						사진업데이트 <i class="checkmark icon"></i>
					</button>
					<button type="button" class="ui black button" id="modalOff">취소</button>
				</div>
			</form>
			<input type="hidden" value="${sessionScope.member.mbId}" id="memberId" />
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

	/* 사진등록,변경버튼 클릭시 모달 보여주기 */
	function uploadPictureBtn() {
		$("#updateProfile").modal('show');
	}

	/* 컨트롤러 호출 */
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
						location.href = "/dietTipList.diet?type=all";
					} else {
						alert('게시글 등록 실패');
						location.href = "/dietTipList.diet?type=all";
					}
				},
				error : function() {
					alert('게시글 등록 실패(과정 오류)');
					location.href = "/dietTipList.diet?type=all";
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
	
	/* 모달 창 종료 */
	$("#modalOff").click(function() {
		$("#updateProfile").modal('hide');
	});

	/* 모달 파일 input 부분 스크립트 */
	var uploadFile = $('.fileBox .uploadBtn');
	uploadFile.on('change', function() {
		if (window.FileReader) {
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$(this).siblings('.fileName').val(filename);
	});
</script>

</html>