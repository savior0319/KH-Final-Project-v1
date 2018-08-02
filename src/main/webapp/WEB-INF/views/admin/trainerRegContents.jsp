<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<!-- 주소 api -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 달력 추가 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<title>트레이너 신청 정보</title>
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
	<input id="mainPhotoPath" type="hidden">
	<div class="ui container">



		<div class="ui center aligned basic segment">
			<br>
			<div class="ui large message">
				<div class="ui large header">트레이너 신청 정보</div>
			</div>

			<h3 class="ui block header">기본 정보</h3>
			<table class="ui celled table">
				<thead>
					<tr>
						<td style="width: 30%;">
											<!-- 사진 첨부 -->
											<div class="ui two column centered grid">
												<div style="width: 100%;">
													<img id="img" style="width: 300px; height: 300px;" src="${requestScope.trv.trImagePath}">
												</div>

											</div>
											<!-- 사진 첨부 끝 -->

						<td>
							<table class="ui very basic table">
								<thead align="center">
									<tr>
										<td style="width: 13%;">이름</td>
										<td style="padding-bottom: 30px; padding-top: 30px;">
											<span class="ui form">
												<input type="text" name="trVame" placeholder="이름" id="nameCheck" maxlength="5" autocomplete="off" required readonly />
											</span>
										</td>
									</tr>

									<tr>

										<td style="width: 13%;">연락처</td>
										<td style="border-top: 1px solid #EAEAEA; padding-top: 30px; padding-bottom: 30px;">
											<span class="ui form">
												<input type="text" name="phone" placeholder="01*********" id="numberCheck" maxlength="11" required autocomplete="off" readonly />
											</span>
										</td>
									</tr>
									<tr>
										<td style="width: 13%;">주소</td>
										<td style="border-top: 1px solid #EAEAEA; padding-top: 30px; padding-bottom: 30px;">
											<span class="ui form">
												<input type="text" id="addAddress" name="addAddress" style="margin-top: 10px;" value="" class="form-control" placeholder="주소" autocomplete="off" readonly />
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
								<input type="text" name="height" placeholder="키 " style="width: 40%;" id="heightCheck" maxlength="3" required autocomplete="off" readonly />
							</span>
							<span class="ui medium header" style="line-height: 40px;"> cm </span>
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">몸무게</th>
						<td>
							<span class="ui form">
								<input type="text" name="weight" placeholder="몸무게" style="width: 40%;" id="weightCheck" maxlength="3" required autocomplete="off" readonly/>
							</span>
							<span class="ui medium header" style="line-height: 40px;"> kg </span>
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
									<textarea id="trComment" style="margin-top: 0px; margin-bottom: 0px; height: 203px; resize: none;" required="required" autocomplete="off" placeholder="신청 회원 경력" readonly></textarea>
								</div>
							</div>
						</td>
					</tr>

				</thead>
			</table>

			<button class="ui inverted red button" onclick="acceptBtn();">승인</button>
			<button class="ui inverted secondary button" onclick="denyBtn();">거부</button>


		</div>

	</div>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>


<!-- SCRIPT -->

<script type="text/javascript">
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
</script>

</html>