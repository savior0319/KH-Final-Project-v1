<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>홈트레이닝 수정</title>
<link href="/resources/summernote/dist/summernote-lite.css" rel="stylesheet">
<script src="/resources/summernote/dist/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
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
	<input id="mainPhotoPath" type="hidden" value="${requestScope.ht.htMainPhoto }">
	<input type="hidden" id="indexNo" value="${requestScope.ht.indexNo }">
	<br>
	<br>
	<div class="ui container">
		<div class="ui left aligned basic segment">
			<div class="ui medium message">
				<div class="ui large header" align="center">홈트레이닝</div>
			</div>
			<br>

			<div class="ui form" style="max-width: 1220px;">
				<div class="ui medium header" style="margin-bottom: 5px;">제목</div>
				<div class="ui fluid left action icon input">
					<div class="ui basic floating dropdown button">
						<div class="text">
						<c:choose>
							<c:when test="${requestScope.ht.htType==1 }">
							전신
							</c:when>
							<c:when test="${requestScope.ht.htType==2 }">
							복부
							</c:when>
							<c:when test="${requestScope.ht.htType==3 }">
							상체
							</c:when>
							<c:when test="${requestScope.ht.htType==4 }">
							하체
							</c:when>
							<c:when test="${requestScope.ht.htType==5 }">
							스트레칭
							</c:when>
							<c:when test="${requestScope.ht.htType==6 }">
							댄스
							</c:when>
							<c:when test="${requestScope.ht.htType==7 }">
							요가
							</c:when>
							<c:when test="${requestScope.ht.htType==8 }">
							4주챌린지
							</c:when>
						</c:choose>
						</div>
						<i class="dropdown icon"></i>
						<div class="menu select">
							<div class="item">전신</div>
							<div class="item">복부</div>
							<div class="item">상체</div>
							<div class="item">하체</div>
							<div class="item">스트레칭</div>
							<div class="item">요가</div>
							<div class="item">댄스</div>
							<div class="item">4주챌린지</div>
						</div>
					</div>
					<input type="text" id="title" value="${requestScope.ht.htTitle }"/>
				</div>

			</div>
			<br>
			<div class="ui grid">
				<div class="six wide column">
					<div style="width: 100%;">
						<img id="img" style="width:230px; height:180px;" src="${requestScope.ht.htMainPhoto }" onerror='this.src="/resources/image/300x400.png"'>
					</div>
					<div style="width: 100%; height: 30px; margin-top:20px;">
						<button type="button" class="ui button" onclick="uploadPictureBtn();" style="width: 140px; background: rgb(250, 40, 40); color: white;">사진등록/변경</button>
					</div>
				</div>
				<div class="ten wide column">
					<div style="width: 100%; height: 30px; margin-top:8%;"><h2>4단계 작성 및 유튜브 주소</h2><br><br>
					
					<table class="ui celled table">
							<thead>
								<tr>
									<th>영상 시간</th>
									<td>
										<div class="ui input">
											<input type="text" id="time" value="${requestScope.ht.htStepTime }">
										</div>
									</td>
								</tr>
								<tr>
									<th>운동 난이도</th>
									<td>
										<div class="ui input">
											<input type="text" id="hard" value="${requestScope.ht.htStepHard }">
										</div>
									</td>
								</tr>
								<tr>
									<th>칼로리 소모량</th>
									<td>		
										<div class="ui input">
											<input type="text" id="kal" value="${requestScope.ht.htStepKal }">
										</div>
									</td>
								</tr>
								<tr>
									<th>유튜브 주소</th>
									<td>
										<div class="ui input">
											<input type="text" id="video" value="${requestScope.ht.htVideo }" onchange="videoChange();">
										</div>
									</td>
								</tr>
							</thead>
						</table>
					
					
					
					<%-- 
					<h3>영상 시간 : <input type="text" id="time" value="${requestScope.ht.htStepTime }"></h3>
					<h3>운동 난이도 : <input type="text" id="hard" value="${requestScope.ht.htStepHard }"></h3>
					<h3>칼로리 소모량 : <input type="text" id="kal" value="${requestScope.ht.htStepKal }"></h3>
					<h3>유튜브 주소 : <input type="text" id="video" value="${requestScope.ht.htVideo }" onchange="videoChange();"></h3> --%>
					
					
					</div>
				</div>
				
			    <div class="six wide column">
			    <div style="width:100%;">
					<c:choose>
               <c:when test="${requestScope.ht.htVideo != null}">
               <!-- 유튜브 미리보기 영상 들어가는 곳 -->
               <iframe id="lookAhead" width="230px;" height="180px" style="border: 2px solid red;"
               src=${requestScope.ht.htVideo }" frameborder="0"
               allow="autoplay; encrypted-media" allowfullscreen></iframe>
               </c:when>
               <c:otherwise>
               <img id="img" style="width:230px; height:180px;" src="/resources/image/no-video.png">
               </c:otherwise>
               </c:choose>
					
				</div>
				<div style="width:100%; height:30px; margin-top:20px;">
				
				<h4>유튜브 영상 미리보기</h4></div>
				</div>	
				
			</div>
			<br>
			<div id="summernote">
				${requestScope.ht.htExplain }
			</div>
			<br>
			<div align="center">
				<button class="ui red basic button" onclick="register();">수정완료</button>
			</div>
		</div>
	</div>
		
	
	<!-- 이미지 선택 모달 -->

	<div class="ui modal" id="updateProfile">
		<i class="close icon"></i>
		<div class="header">메인 사진 변경</div>
		<div class="image content">
			<form id="photoForm" action="/getDietTipMainPhotoPath.diet" method="post" enctype="multipart/form-data">
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
				
				
			</form>
			<br>
			<div class="actions">
					<button onclick="photoPreview();" id="photoRegist" style="background: rgb(250, 40, 40); color: white;" class="ui button">
						사진 등록 <i class="checkmark icon"></i>
					</button>
					<button type="button" class="ui black button" id="modalOff">취소</button>
				</div>
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
			
		});
		category = '${requestScope.ht.htType}';
	});

	$('.ui.dropdown').dropdown({
		allowAdditions : true,
		allowCategorySelection : true
	});

	// 카테고리 선택
	var category = '${requestScope.ht.htType}';
	$('.select > .item').click(function() {
		switch ($(this).text()) {
		case '전신':
			category = 1;
			break;
		case '복부':
			category = 2;
			break;
		case '하체':
			category = 3;
			break;
		case '상체':
			category = 4;
			break;
		case '스트레칭':
			category = 5;
			break;
		case '댄스':
			category = 6;
			break;
		case '요가':
			category = 7;
			break;
		case '4주챌린지':
			category = 8;
			break;
		}
	});

	/* 사진등록,변경버튼 클릭시 모달 보여주기 */
	function uploadPictureBtn() {
		$("#updateProfile").modal('show');
	}

	/* 등록 완료 컨트롤러 호출 */
	function register() {
		
		// 사진 저장
		var form = new FormData(document.getElementById('photoForm'));
    	$.ajax({
    		url : 'saveDietTipMainPhotoPath.diet',		// 이거는 그냥 dietTip꺼 쓰면 될듯
    		type : 'post',
    		data : form,
    		processData: false,
    		contentType: false,
    		success : function (data){
    			if(data!=""){
    				$('#mainPhotoPath').val(data);
    			}
    			
        			 
    			// 사진 저장 성공하면 전체 등록 진행
    			var $title = $('#title').val();
    			var $content = $('#summernote').summernote('code');
    			var $time = $('#time').val();
    			var $hard = $('#hard').val();
    			var $kal = $('#kal').val();
    			var $video = $('#video').val();
    			var $mainPhotoPath = $('#mainPhotoPath').val();
    			var $indexNo = $('#indexNo').val();
    		
    			if (category != null && $title != '' && $content != '') {
    				$.ajax({
    					url : '/updateHomeTraining.diet',
    					type : 'post',
    					data : {
    						'title' : $title,
    						'content' : $content,
    						'time' : $time,
    						'hard' : $hard,
    						'kal' : $kal,
    						'category' : category,
    						'video' : $video,
    						'mainPhotoPath' : $mainPhotoPath,
    						'indexNo' : $indexNo
    					},
    					success : function(result) {
    						if (result == 1) {
    							alert('게시글 수정 완료');
    							location.href = "/homeTrainingAll.diet";
    						} else {
    							alert('게시글 등록 실패');
    							location.href = "/homeTrainingAll.diet";
    						}
    					},
    					error : function() {
    						alert('게시글 등록 실패(과정 오류)');
    						location.href = "/homeTrainingAll.diet";
    					}
    				});
    			} else {
    				if (category == null) {
    					alert('카테고리를 선택하여주세요.');
    				} else {
    					alert('내용을 반드시 기입하여주세요.');
    				}
    			}
    			
    			
    			
    		},
    		error : function (data){
    			alert('실패ㅋㅋㅋ');
    		}
    	});
		
		
		
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
	
	
	
	/* 올린 이미지 미리보기 */
	var sel_file;
    var reader;
    var ff;

    $(document).ready(function() {
        $("#uploadBtn").on("change", handleImgFileSelect);
    }); 

    function photoPreview(){
    	handle();
    	
    }
    
    function handleImgFileSelect(e) {
        
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        filesArr.forEach(function(f) {
            if(!f.type.match("image.*")) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }

            sel_file = f;

            reader = new FileReader();
            
            reader.onload = function(e) {
                $("#img").attr("src", e.target.result);
            }
            ff = f;
        });
    }
    
    function handle(){
        reader.readAsDataURL(ff);
        $("#updateProfile").modal('hide');
    }
    
    // 유튜브 영상 미리보기
    function videoChange(){
    	var videoIframe = $('#lookAhead');
    	var video = $('#video').val();
    	var subVideo = '###';
		if(video.length>29){
			subVideo = video.substring(30,video.length-1);
		}
		videoIframe.attr("src", 'https://www.youtube.com/embed/' + subVideo);  	
    }
    
</script>

</html>