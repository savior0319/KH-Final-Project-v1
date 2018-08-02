<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<!-- 주소 api -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- 달력 추가 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

	<title>트레이너 신청</title>
</head>

<!-- CSS -->
<style>
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<input id="mainPhotoPath" type="hidden">
	<div class="ui container">



		<div class="ui center aligned basic segment">
			<br>
			<div class="ui large message">
				<div class="ui large header">트레이너 신청</div>
			</div>
			<div class="ui small red message">
				<div class="ui small header">※ 트레이너 회원은 아래 항목 입력 후 관리자의 승인이 필요합니다</div>
			</div>
			<br>

			<h3 class="ui block header">기본 정보</h3>
			<table class="ui celled table">
				<thead>
					<tr>
						<td style="width: 30%;">


							<table class="ui collapsing table" style="width: 100%;">
								<thead align="center">
									<tr>
										<th>
											<strong>사진 등록</strong>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>
											<!-- 사진 첨부 -->
											<div class="six wide column">
												<div style="width: 100%;">
													<img id="img" style="width: 300px; height: 300px;">
												</div>
												<div style="width: 100%; height: 20%; margin-top: 20px;" align="center">
													<button type="button" class="ui button" onclick="uploadPictureBtn();" style="background: rgb(250, 40, 40); color: white;">사진등록/변경</button>
												</div>
											</div>
											<!-- 사진 첨부 끝 -->
										</td>
									</tr>
								</tbody>
							</table>
							<td>
								<table class="ui very basic table">
									<thead align="center">
										<tr>
											<td style="width: 13%;">이름</td>
											<td style="padding-bottom: 30px; padding-top: 30px;">
												<span class="ui form">
													<input type="text" name="trVame" placeholder="이름 입력" id="nameCheck" maxlength="5" autocomplete="off" required />
												</span>
												<div id="nameMessage" style="display: none;"></div>
											</td>
										</tr>

										<tr>

											<td style="width: 13%;">연락처</td>
											<td style="border-top: 1px solid #EAEAEA; padding-top: 30px; padding-bottom: 30px;">
												<span class="ui form">
													<input type="text" name="phone" placeholder="01*********" id="numberCheck" maxlength="11" required autocomplete="off" />

												</span>
												<div id="phoneMessage" style="display: none;"></div>

											</td>
										</tr>
										<tr>
											<td style="width: 13%;">주소</td>
											<td style="border-top: 1px solid #EAEAEA; padding-top: 30px; padding-bottom: 30px;">
												<span class="ui form">
													<input type="text" id="postcode" name="postcode" class="form-control" style="width: 100px; float: left; margin-right: 10px;" value="" placeholder="우편번호" readonly required />
													<button class="samll ui button" id="postBtn" onclick="execDaumPostcode();" style="float: left; background: rgb(250, 40, 40); color: white;">주소찾기</button>
													<br>
													<input type="text" id="roadAddress" name="roadAddress" style="margin-top: 20px;" value="" class="form-control" placeholder="주소" readonly required />
													<input type="text" id="addAddress" name="addAddress" style="margin-top: 10px;" value="" class="form-control" placeholder="상세 주소 입력" autocomplete="off" />
													<span id="guide" style="color: #999"> </span>
												</span>
											</td>
										</tr>

									</thead>
								</table>


							</td>
						</tr>
					</thead>
				</table>


				<br>
				<h3 class="ui block header">상세 정보</h3>

				<table class="ui celled table">
					<thead>
						<tr>
							<th style="width: 15%; text-align: center;">성별</th>
							<td>
								<div class="ui form">
									<div class="inline fields" style="margin-bottom: 0px;">
										<div class="field">
											<div class="ui radio checkbox">
												<input type="radio" name="gender" value="f" required>
												<label>여</label>
											</div>
										</div>
										<div class="field">
											<div class="ui radio checkbox">
												<input type="radio" name="gender" value="m">
												<label>남</label>
											</div>
										</div>
									</div>
								</div>

							</td>
						</tr>
						<tr>
							<th style="text-align: center;">생년월일</th>
							<td>

								<div class="field">
									<div class="ui left icon input">
										<i class="calendar icon"></i>
										<input type="text" placeholder="생년월일" id="birth" name="birth" readonly required="required">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th style="text-align: center;">키</th>
							<td>
								<span class="ui form">
									<input type="text" name="height" placeholder="키 입력(176)" style="width: 40%;" id="heightCheck" maxlength="3" required autocomplete="off" />
								</span>
								<span class="ui medium header" style="line-height: 40px;"> cm </span>
								<div id="heightMessage" style="display: none;"></div>
							</td>
						</tr>
						<tr>
							<th style="text-align: center;">몸무게</th>
							<td>
								<span class="ui form">
									<input type="text" name="weight" placeholder="몸무게 입력(76)" style="width: 40%;" id="weightCheck" maxlength="3" required autocomplete="off" />
								</span>
								<span class="ui medium header" style="line-height: 40px;"> kg </span>
								<div id="weightMessage" style="display: none;"></div>
							</td>
						</tr>
						<tr>
							<th style="text-align: center;">지역</th>
							<td>

								<div class="ui form">
									<div class="two fields">
										<div class="field">
											<select name="city" class="ui  search fluid normal dropdown" id="dropdown1" required>
												<option value="서울특별시">서울특별시</option>
												<option value="인천광역시">인천광역시</option>
											</select>
										</div>
										<div class="field">
											<div id="ifSeoul">
												<select multiple="" name="area1" class="ui search fluid normal dropdown" id="dropdown2">
													<option value="">선택</option>
													<!-- <option value="전체">전체</option> -->
													<option value="강남구">강남구</option>
													<option value="강동구">강동구</option>
													<option value="강북구">강북구</option>
													<option value="강서구">강서구</option>
													<option value="관악구">관악구</option>
													<option value="광진구">광진구</option>
													<option value="구로구">구로구</option>
													<option value="금천구">금천구</option>
													<option value="노원구">노원구</option>
													<option value="도봉구">도봉구</option>
													<option value="동대문구">동대문구</option>
													<option value="동작구">동작구</option>
													<option value="마포구">마포구</option>
													<option value="서대문구">서대문구</option>
													<option value="서초구">서초구</option>
													<option value="성동구">성동구</option>
													<option value="성북구">성북구</option>
													<option value="송파구">송파구</option>
													<option value="양천구">양천구</option>
													<option value="영등포구">영등포구</option>
													<option value="용산구">용산구</option>
													<option value="은평구">은평구</option>
													<option value="종로구">종로구</option>
													<option value="중구">중구</option>
												</select>
											</div>

											<div id="ifIncheon" style="display: none;">
												<select multiple="" name="area2" class="ui search fluid normal dropdown" id="dropdown3">
													<option value="">선택</option>
													<!-- <option value="전체">전체</option> -->
													<option value="강화군">강화군</option>
													<option value="계양구">계양구</option>
													<option value="남동구">남동구</option>
													<option value="동구">동구</option>
													<option value="미추홀구">미추홀구</option>
													<option value="부평구">부평구</option>
													<option value="서구">서구</option>
													<option value="연수구">연수구</option>
													<option value="옹진군">옹진군</option>
													<option value="중구">중구</option>
												</select>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr style="text-align: center;">
							<th>경력</th>
							<td>
								<div class="ui form">
									<div class="field">
										<textarea id="trComment" style="margin-top: 0px; margin-bottom: 0px; height: 203px; resize: none;" required="required" autocomplete="off" placeholder="ex) 2018.01.30 ~ 2018.07.31 KH 헬스트레이너 "></textarea>
									</div>
								</div>
							</td>
						</tr>

					</thead>
				</table>
				<button class="ui inverted red button" onclick=" return submitBtn();">제출하기</button>






			</div>

		</div>
		<!-- FOOTER -->
		<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
	</body>
	<!-- 이미지 선택 모달 -->

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
			<%-- <input type="hidden" value="${sessionScope.member.mbId}" id="memberId" /> --%>
		</div>
	</div>
	<!-- SCRIPT -->


	<script type="text/javascript">



		/* 사진등록,변경버튼 클릭시 모달 보여주기 */
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






		/* 사진등록,변경버튼 클릭시 모달 보여주기 */
		function uploadPictureBtn() {
			$("#updateProfile").modal('show');
		}

		function photoPreview() {
			handle();

		}

		/* 그림추가부분-step*/
		function readURL(input, stepImgNum) {

			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#imgFile_Step_' + stepImgNum).attr('src', e.target.result);

					var imgAddr = $('#imgFile_Step_' + stepImgNum).attr('src');
					$('#stepRPic' + stepImgNum).attr('value', imgAddr);

				}

				reader.readAsDataURL(input.files[0]);
			}

		};







	/* function submitBtn() {

		var city = $('#dropdown1').val();
		var area1 = $('#dropdown2').val();
		var area2 = $('#dropdown3').val();
		if (city == '서울특별시') {
			//location.href = "/trainerSearchResult.diet?city=" + city + "&area=" + area1;
			alert(city);
			alert(area1);
		} else if (city == '인천광역시') {
			//location.href = "/trainerSearchResult.diet?city=" + city + "&area=" + area2;
			alert(city);
			alert(area2);
		}
	}; */

	//양식 체크 확인
	function submitBtn() {
		/* 값 가져오기 */
		/* 이름 */
		var trName = $('#nameCheck').val();
		/* 연락처 */
		var trPhone = $('#numberCheck').val();
		/* 주소 */
		var postCode = $('#postcode').val();
		var roadAddress = $('#roadAddress').val();
		var addAddress = $('#addAddress').val();
		var trAddress = postCode + " " + roadAddress +" "+addAddress;
		/* 성별 */
		var trGender = $('input[name=gender]:checked').val();
		/* 생년월일 */
		var trBirth = $('#birth').val();
		/* 키 */
		var trHeight = $('#heightCheck').val();
		/* 몸무게 */
		var trWeight = $('#weightCheck').val();
		/* 지역 */
		var trCity =  $("select[name=city]").val();
		/* 상세 지역 */
		var seoulArea = $("select[name=area1]").val();
		var IncheonArea = $("select[name=area2]").val();
		var trArea = seoulArea + IncheonArea;
		/* 경력 */
		var trContent = $('#trComment').val();
		/* 이미지 */
		var trImage = new FormData(document.getElementById('photoForm'));
		
		
		if (phonePass == false || weightPass == false || heightPass == false || namePass == false) {
			 /* phonePass == false || weightPass == false || heightPass == false || namePass == false
			 || postCode != null || roadAddress != null || trBirth != null || trArea !=null
			 
			 */
			 alert('트레이너 전환 양식을 모두 작성해주세요.');
			 return false;
			} else {

				console.log("이름 : " + trName);
				console.log("핸드폰 : " + trPhone);
				console.log("우편번호 : " + postcode);
				console.log("성별 : " + trGender);			
				console.log("주소 : " + roadAddress);
				console.log("상세주소 : " + addAddress);
				console.log("총 주소 : " + trAddress);
				console.log("생년월일 : " + trBirth);
				console.log(" 키 : " + trHeight);
				console.log("몸무게 : " + trWeight);
				console.log("지역 : " + trCity);
				console.log("상세 지역 : " + trArea);
				console.log("경력 : " + trContent);

				$.ajax({
	    		url : '/saveDietTipMainPhotoPath.diet',		// 이거는 그냥 dietTip꺼 쓰면 될듯
	    		type : 'post',
	    		data : trImage,
	    		processData: false,
	    		contentType: false,
	    		success : function (data){
	    			$('#mainPhotoPath').val(data);
	    			var trImagePath = $('#mainPhotoPath').val();
	    			
	    			$.ajax({
	    				url : '/trainerRegister.diet',
	    				type : 'post',
	    				data : {
	    					'trName' : trName,
	    					'trPhone' : trPhone,
	    					'trAddress' : trAddress,
	    					'trBirth' : trBirth,
	    					'trHeight' : trHeight,
	    					'trWeight' : trWeight,
	    					'trCity' : trCity,
	    					'trAreas' : trArea,
	    					'trGender' : trGender,
	    					'trContent' : trContent,
	    					'trImagePath' : trImagePath
	    				},
	    				success : function(result) {
	    					if (result == '1') {
	    						alert('신청 완료');
	    						location.href="/trainerMatch.diet";
	    					} else {
	    						alert('신청 실패');
    							//location.href="/trainerMatch.diet";
    						}
    					},
    					error : function(result) {
    						alert('실패');
    						//location.href="/trainerMatch.diet";
    					}
    				});		  

	    			
	    		}
	    	});
			}
		}

	//정규표현식하기!
	var phoneRegExp = /^01([0|1|6|7|8|9]{1})([0-9]{3,4})([0-9]{4})$/;
	var numRegExp = /^[0-9]*$/;
	var nameRegExp = /^[가-힣]{2,5}$/;
	
	
	var phonePass = false;
	var weightPass = false;
	var heightPass = false;
	var namePass = false;

	$(document).ready(
		function() {

			$('#numberCheck').keyup(
				function() {
					var phone = $('#numberCheck').val();

					var phoneCheck = phoneRegExp.test(phone);

					if (phoneCheck == false) {
						$('#phoneMessage').html("* '-'을 제외한 11자리 숫자를 입력해주세요 ").attr(
							"style", "display:block; color:red;");
						phonePass = false;
					} else if (phoneCheck == true) {
						$('#phoneMessage').attr("style",
							"display:none;");
						phonePass = true;
					}

				});

			$('#heightCheck').keyup(
				function() {
					var height = $('#heightCheck').val();

					var numCheck = numRegExp.test(height);

					if (numCheck == false) {
						$('#heightMessage').html('* 키는 숫자만 입력이 가능합니다.').attr(
							"style", "display:block; color:red;");
						heightPass = false;
					} else if (numCheck == true) {
						$('#heightMessage').attr("style",
							"display:none;");
						heightPass = true;
					}

				});

			$('#weightCheck').keyup(
				function() {
					var weight = $('#weightCheck').val();

					var numCheck = numRegExp.test(weight);

					if (numCheck == false) {
						$('#weightMessage').html('* 몸무게는 숫자만 입력이 가능합니다.').attr(
							"style", "display:block; color:red;");
						weightPass = false;
					} else if (numCheck == true) {
						$('#weightMessage').attr("style",
							"display:none;");
						weightPass = true;
					}

				});


			$('#nameCheck').keyup(
				function() {
					var name = $('#nameCheck').val();

					var nameCheck = nameRegExp.test(name);

					if (nameCheck == false) {
						$('#nameMessage').html('* 이름은 한글 2~5 글자만 가능합니다.').attr(
							"style", "display:block; color:red;");
						namePass = false;
					} else if (nameCheck == true) {
						$('#nameMessage').attr("style",
							"display:none;");
						namePass = true;
					}

				});


		});
	//정규표현식 끝!!!!!!


	
	/* 지역 드롭다운 */
	$('#dropdown1').dropdown();

	$('#dropdown2').dropdown({
		maxSelections : 3 
	});
	
	$('#dropdown3').dropdown({
		maxSelections : 3
	});
	
	
/* 	$("select[name=area1]").on('change').change(function() {
		var seoulArea = $("select[name=area1]").val();
		
		console.log(seoulArea);
		
		if(seoulArea[0] == "전체"){
			   $(this).siblings().off();
			$(this).maxSelections = false;
		}
		
	}); */
	

	$('#dropdown1').change(function() {
		var loc = $('#dropdown1').val();
		if (loc == '서울특별시') {
			$('#ifIncheon').hide();
			$('#ifSeoul').show();
		} else if (loc == '인천광역시') {
			$('#ifSeoul').hide();
			$('#ifIncheon').show();
		}
	});

	
	
	
	/* 생년월일 달력 : Datepicker */
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
		yearRange : '1920:2000',
		defaultDate : new Date(1990, 0, 1)
	});

	$(function() {
		$("#birth").datepicker();
	});

	/* 시멘틱 셀렉트 드롭박스 */
	$('select.dropdown').dropdown();

	

	
	
	

	//주소찾기
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function execDaumPostcode() {
		new daum.Postcode(
		{
			oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}
						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('roadAddress').value = fullRoadAddr;
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
							+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
							+ expRoadAddr + ')';
						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
							+ expJibunAddr + ')';
						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>

</html>