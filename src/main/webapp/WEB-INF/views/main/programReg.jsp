<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>
<title>트레이너 프로그램 등록</title>
<!-- 달력 추가 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<link href="/resources/summernote/dist/summernote-lite.css" rel="stylesheet">
<script src="/resources/summernote/dist/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<script src="/resources/slider/responsiveslides.min.js"></script>
</head>

<!-- CSS -->
<style>
.rslides {
	position: relative;
	list-style: none;
	overflow: hidden;
	width: 100%;
	padding: 0;
	margin: 0;
}

.rslides li {
	-webkit-backface-visibility: hidden;
	position: absolute;
	display: none;
	width: 100%;
	left: 0;
	top: 0;
}

.rslides li:first-child {
	position: relative;
	display: block;
	float: left;
}

.rslides img {
	display: block;
	height: auto;
	float: left;
	width: 100%;
	border: 0;
}

</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui container" style="border: 0;">

<!-- 슬라이드-->
               <ul class="rslides">
                  <li>
                     <img src="#" id="image1" style="height:250px;">
                  </li>
                  <li>
                     <img src="#" id="image2" style="height:250px;">
                  </li>
                  <li>
                     <img src="#" id="image3" style="height:250px;">
                  </li>
                  <li>
                     <img src="#" id="image4" style="height:250px;">
                  </li>
                  <li>
                     <img src="/resources/image/advertise.png" style="height:250px;">
                  </li>
               </ul>
		<div class="ui left aligned basic segment">
			
			<div class="ui large message">
				<div class="ui large header" align="center">프로그램 등록</div>
			</div>
			<br>

			<div class="ui form" style="max-width: 1220px;">
				<div class="ui medium header" style="margin-bottom: 5px; padding-left: 5px;">프로그램 명</div>
				<div class="ui fluid left action icon input">
					<div class="ui basic floating dropdown button">
						<div class="text">PT 종류</div>
						<i class="dropdown icon"></i>
						<div class="menu select">
							<div class="item">개인</div>
							<div class="item">그룹</div>
						</div>
					</div>
					<input type="text" id="title" placeholder="제목을 입력해주세요" />
				</div>
			</div>

			<br>
			<br>

			<div class="ui grid">
				<div class="six wide column">
					<div style="width: 100%;">
						<img id="img" style="width: 100%; height: 260px;">
					</div>
					<div style="width: 100%; height: 20%; margin-top: 20px;" align="center">
						<button type="button" class="ui button" onclick="uploadPictureBtn();" style="background: rgb(250, 40, 40); color: white;">사진등록/변경</button>
					</div>

					<!-- 메인사진 등록 MODAL -->

					<div class="ui modal" id="updateProfile">
						<i class="close icon"></i>
						<div class="header">메인 사진 등록</div>
						<div class="image content">
							<form id="photoForm" action="/getDietTipMainPhotoPath.diet" method="post" enctype="multipart/form-data">
								<div class="description">
									<div class="ui header">
										<div class="fileBox">
											<input type="text" class="fileName" id="fileName" readonly="readonly" />
											<label for="uploadBtn" class="btn_file">찾아보기</label>
											<input type="file" id="uploadBtn" class="uploadBtn" name="uploadFile" />
										</div>
									</div>
								</div>
							</form>
							<br>

							<div class="actions">
								<button onclick="photoPreview();" id="photoRegist" style="background: rgb(250, 40, 40); color: white;" class="ui button">
									사진 등록
									<i class="checkmark icon"></i>
								</button>
								<button type="button" class="ui black button" id="modalOff">취소</button>
							</div>
							<input type="hidden" value="${sessionScope.member.mbId}" id="memberId" />
							<input type="hidden" id="mainPhotoPath" />
						</div>
					</div>
				</div>


				<div class="ten wide column" style="padding-top: 0;">
					<div class="ui grid red segment">
						<div class="column">
							<label>트레이닝 시작 </label>
							&nbsp;&nbsp;&nbsp;
							<div class="ui left icon input">
								<i class="calendar icon"></i>
								<input type="text" placeholder="날짜" id="startDay" required readonly>
							</div>
							&nbsp;&nbsp;&nbsp;
							<label>트레이닝 종료 </label>
							&nbsp;&nbsp;&nbsp;
							<div class="ui left icon input">
								<i class="calendar icon"></i>
								<input type="text" placeholder="날짜" id="endDay" required readonly">
							</div>
						</div>
					</div>

					<div class="ui grid red segment">
						<div class="column">
							<label>트레이닝 요일</label>
							&nbsp;&nbsp;&nbsp;
							<div class="ui left input" style="width: 500px;">
								<select multiple="" name="time" class="ui  search fluid normal dropdown" id="dropdown4" required>
									<option value="">요일 선택</option>
									<option value="전체">전체</option>
									<option value="월요일">월요일</option>
									<option value="화요일">화요일</option>
									<option value="수요일">수요일</option>
									<option value="목요일">목요일</option>
									<option value="금요일">금요일</option>
									<option value="토요일">토요일</option>
									<option value="일요일">일요일</option>
								</select>
							</div>
						</div>
					</div>
					<div class="ui grid red segment">
						<div class="column">
							<label>트레이닝 장소</label>
							&nbsp;&nbsp;&nbsp;
							<div class="ui left icon input">
								<i class="home icon"></i>
								<input type="text" placeholder="주소" id="address" name="address" required readonly style="width: 400px;">
								<button type="button" class="ui button" style="background: rgb(250, 40, 40); color: white; margin-left: 15px;" id="findAddress">주소검색</button>
							</div>
						</div>
					</div>

					<div class="ui grid red segment">
						<div class="column">
							<label>트레이닝 비용</label>
							&nbsp;&nbsp;&nbsp;
							<span class="ui form">
								<input type="text" name="height" placeholder="비용" style="width: 400px;" id="tpCost" onkeyup="inputNumberFormat(this)" maxlength="9" required>
							</span>
							&nbsp;&nbsp;&nbsp;
							<span class="ui medium header" style="line-height: 40px;"> 원 </span>
						</div>
					</div>

					<div class="ui grid red segment">
						<div class="column">
							<label>모집&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;인원</label>
							&nbsp;&nbsp;&nbsp;
							<select id="personnel" name="personnel" class="ui dropdown" required>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10" selected>10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<br>
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
	$('.ui.dropdown').dropdown({
		allowAdditions : true,
		allowCategorySelection : true
	});

	/* 달력 */
	/* 생년월일 달력 */
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		showMonthAfterYear : true,
		yearSuffix : '년',
		changeMonth : true,
		changeYear : true,
		yearRange : '2018:2030',
		defaultDate : new Date(2018, 7)
	});

	$(function() {
		$("#startDay").datepicker({minDate:0});
		$("#endDay").datepicker({minDate:0});	
		
		
	});

	/* 주소 검색 API */
	var $findAddress = $('#findAddress');
	var $address = $('#address');
	var $addressDetails = $('#addressDetails');
	$findAddress.click(function() {
		new daum.Postcode({
			oncomplete : function(data) {

				var fullAddr = '';

				if (data.userSelectedType === 'R') {
					fullAddr = data.roadAddress;
				} else {
					fullAddr = data.jibunAddress;
				}

				$address.val(fullAddr);
				$addressDetails.focus();
			}
		}).open();
	});

	$address.click(function() {
		new daum.Postcode({
			oncomplete : function(data) {

				var fullAddr = '';

				if (data.userSelectedType === 'R') {
					fullAddr = data.roadAddress;
				} else {
					fullAddr = data.jibunAddress;
				}

				$address.val(fullAddr);
				$addressDetails.focus();
			}
		}).open();
	});

	function inputNumberFormat(obj) {
		obj.value = comma(uncomma(obj.value));
	}

	function comma(str) {
		str = String(str);
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

	function uncomma(str) {
		str = String(str);
		return str.replace(/[^\d]+/g, '');
	}

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
				},
				onMediaDelete : function() {
					alert('이미지 삭제 콜백');
				}
			}
		});
	});
	/* summernote에서 이미지 업로드시 실행할 함수 */
	var postImage;
	function sendFile(file, el) {
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
				postImage = url;
			}
		});
	}
	/* 모달 창 오픈 */
	function uploadPictureBtn() {
		$("#updateProfile").modal('show');
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

	function photoPreview() {
		handle();

	}

	function handleImgFileSelect(e) {

		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
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

	function handle() {
		reader.readAsDataURL(ff);
		$("#updateProfile").modal('hide');
	}

	/* 등록 완료 컨트롤러 호출 */
	function register() {
		jQuery.ajaxSettings.traditional = true;

		// 사진 저장
		var form = new FormData(document.getElementById('photoForm'));
		var tpTitle = $('#title').val();
		var tpActiveStart = $('#startDay').val();
		var tpActiveEnd = $('#endDay').val();
		var tpContent = $('#summernote').summernote('code');
		var tpLocation = $('#address').val();
		var tpCost = $('#tpCost').val();
		tpCost = tpCost.replace(/[^0-9\.]+/g, "");
		var tpPersonnel = $('#personnel option:selected').val();

		var tpActiveDays = $('#dropdown4').val();			
		$.ajax({
			url : 'saveDietTipMainPhotoPath.diet',
			type : 'post',
			data : form,
			processData : false,
			contentType : false,
			success : function(data) {
				$('#mainPhotoPath').val(data);
				var tpMainImage = $('#mainPhotoPath').val();

				// 사진 저장 성공하면 전체 등록 진행				
				if (tpTrainType != null && tpTitle != '' && tpContent != '') {
					$.ajax({
						url : '/registTrainerProgram.diet',
						type : 'post',
						data : {
							'tpTitle' : tpTitle,
							'tpActiveStart' : tpActiveStart,
							'tpActiveEnd' : tpActiveEnd,
							'tpContent' : tpContent,
							'tpLocation' : tpLocation,
							'tpCost' : tpCost,
							'tpPersonnel' : tpPersonnel,
							'tpMainImage' : tpMainImage,
							'tpActiveDays' : tpActiveDays,
							'tpTrainType' : tpTrainType
						},
						success : function(result) {
							if (result == 1) {
								alert('게시글 등록 완료');
								location.href="/trainerMatch.diet";
								
							} else {
								alert('게시글 등록 실패');
								
							}
						},
						error : function() {
							alert('게시글 등록 실패(과정 오류)');
							
						}
					});
				} else {
					if (tpTrainType == null) {
						alert('PT유형을 선택하여주세요.');
					} else {
						alert('내용을 반드시 기입하여주세요.');
					}
				}

			},
			error : function(data) {
				alert('실패ㅋㅋㅋ');
			}
		});
	}
	
	// 카테고리 선택
	var tpTrainType;
	$('.select > .item').click(function() {
		switch ($(this).text()) {
		case '개인':
			tpTrainType = '개인';
			console.log(tpTrainType);
			break;
		case '그룹':
			tpTrainType = '그룹';
			console.log(tpTrainType);
			break;
		}
	});
	
	// 슬라이드
	$(function() {
		$(".rslides").responsiveSlides({
			auto : true,
			timeout : 1500,
		});
	});


   /* 광고 이미지 불러오기 */
   $(document).ready(function() {
      $.ajax({
         url : '/advertiseImageLoad.diet',
         type : 'post',
         success : function(img){
            $("#image1").attr("src",img[0].path1);
            $("#image2").attr("src",img[1].path1);
            $("#image3").attr("src",img[2].path1);
            $("#image4").attr("src",img[3].path1);
         },
         error : function(){
            console.log('[ERROR] - 이미지 불러오기 오류');
         }
      });
   });
	
</script>


</html>