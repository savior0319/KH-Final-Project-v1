<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>트레이너 등록</title>
</head>

<!-- CSS -->
<style>
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<div class="ui container">

		<form action="/bmiCalResult.diet" method="POST">


			<div class="ui center aligned basic segment">
				<br>
				<div class="ui large message">
					<div class="ui large header">트레이너 회원 등록</div>
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
											<th><strong>사진 등록</strong></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<!-- 사진 첨부 -->
												<div class="ui center aligned basic segment" style="margin: 0px; padding: 0px;">

													<div class="fileWrap">
														<br>
														<!-- <input type="file" class="form-control-file" id="exampleFormControlFile1"> -->
														<input type="file" id="stepImgFile0" multiple="multiple" style="display: none;" onchange="readURL(this,0);" /> <img src="/resources/image/user.png" width="150" height="150"
															style="cursor: pointer;" id="imgFile_Step_0" name="buyingAfterImage" class="rounded" onclick="document.all.stepImgFile0.click();" onerror='this.src="/resources/image/user.png"'
														>
													</div>


													<label for="stepImgFile0" style="color: #BDBDBD; font-size: 6pt;"> 사진 파일 1개만 첨부 가능합니다. </label> <br>
													<hr>
													<!-- 이미지 선택 모달 -->
													<div class="ui modal" id="updateProfile">
														<i class="close icon"></i>
														<div class="header">메인 사진 등록</div>
														<div class="image content">
															<form id="photoForm" action="/getDietTipMainPhotoPath.diet" method="post" enctype="multipart/form-data">
																<div class="description">
																	<div class="ui header">
																		<div class="fileBox">
																			<input type="text" class="fileName" id="fileName" readonly="readonly" /> <label for="uploadBtn" class="btn_file">찾아보기</label> <input type="file" id="uploadBtn" class="uploadBtn"
																				name="uploadFile"
																			/>
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
															<input type="hidden" value="멤버 ID 값" id="memberId" />
														</div>
													</div>

													<!-- 사진 추가  버튼 -->
													<button type="button" class="ui button" onclick="uploadPictureBtn();" style="width: 140px; background: rgb(250, 40, 40); color: white;">사진등록/변경</button>
												</div> <!-- 사진 첨부 끝 -->
											</td>
										</tr>
									</tbody>
								</table>
							<td>
								<table class="ui very basic table">
									<thead align="center">
										<tr>
											<td style="width: 13%;">이름</td>
											<td><span class="ui form"> 
											<input type="text" name="name" placeholder="이름 입력" id="numberCheck2" maxlength="5" required>
											
											</span></td>
										</tr>

										<tr>
										
											<td style="width: 13%;">연락처</td>
											<td style="border-top: 1px solid #EAEAEA;"><span class="ui form"> <input type="text" name="address" placeholder="010" id="numberCheck2" maxlength="3" required style="width: 33%"> <input type="text"
													name="address" placeholder="0000" id="numberCheck2" maxlength="4" required style="width: 33%"
												> <input type="text" name="address" placeholder="0000" id="numberCheck2" maxlength="4" required style="width: 33%">
											</span></td>
										</tr>
										<tr>
											<td style="width: 13%;">주소</td>
											<td style="border-top: 1px solid #EAEAEA;">
											<span class="ui form"> 
											<input type="text" id="postcode" name="postcode" class="form-control" style="width: 100px; float: left; margin-right: 10px;" value="" placeholder="우편번호" readonly/> 
											<input type="button" class="btn btn-default" id="postBtn" onclick="execDaumPostcode();" value="주소 찾기" style="width: 100px; float: left; height: 38px; magin: 0; padding: 0 5px;" /> <br>
											<input type="text" id="roadAddress" name="roadAddress" style="margin-top: 20px;" value="" class="form-control" placeholder="주소" readonly /> <input type="text" id="addAddress"	name="addAddress" 
											style="margin-top: 10px;" value="" class="form-control" placeholder="상세 주소 입력"/> 
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




				<!-- 세미때 형조오빠네 파일좀 ㅠ.ㅠ.ㅠ.ㅠ.ㅠㅠ.ㅠㅠㅠ 집에 있는줄알았는데 안보여 더펜션! ㅠㅠ -->

				<br>
				<h3 class="ui block header">상세 정보</h3>
				<form action="/bmiCalResult.diet" method="POST">
					<table class="ui celled table">
						<thead>
							<tr>
								<th style="width: 15%;">성별</th>
								<td>
									<div class="ui form">
										<div class="inline fields" style="margin-bottom: 0px;">
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="gender" value="f" checked="checked"> <label>여자</label>
												</div>
											</div>
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="gender" value="m"> <label>남자</label>
												</div>
											</div>
										</div>
									</div>

								</td>
							</tr>
							<tr>
								<th>연령</th>
								<td><select name="age" class="ui dropdown" required>
										<option value="1930">1930</option>
										<option value="1931">1931</option>
										<option value="1932">1932</option>
										<option value="1933">1933</option>
										<option value="1934">1934</option>
										<option value="1935">1935</option>
										<option value="1936">1936</option>
										<option value="1937">1937</option>
										<option value="1938">1938</option>
										<option value="1939">1939</option>
										<option value="1940">1940</option>
										<option value="1941">1941</option>
										<option value="1942">1942</option>
										<option value="1943">1943</option>
										<option value="1944">1944</option>
										<option value="1945">1945</option>
										<option value="1946">1946</option>
										<option value="1947">1947</option>
										<option value="1948">1948</option>
										<option value="1949">1949</option>
										<option value="1950">1950</option>
										<option value="1951">1951</option>
										<option value="1952">1952</option>
										<option value="1953">1953</option>
										<option value="1954">1954</option>
										<option value="1955">1955</option>
										<option value="1956">1956</option>
										<option value="1957">1957</option>
										<option value="1958">1958</option>
										<option value="1959">1959</option>
										<option value="1960">1960</option>
										<option value="1961">1961</option>
										<option value="1962">1962</option>
										<option value="1963">1963</option>
										<option value="1964">1964</option>
										<option value="1965">1965</option>
										<option value="1966">1966</option>
										<option value="1967">1967</option>
										<option value="1968">1968</option>
										<option value="1969">1969</option>
										<option value="1970">1970</option>
										<option value="1971">1971</option>
										<option value="1972">1972</option>
										<option value="1973">1973</option>
										<option value="1974">1974</option>
										<option value="1975">1975</option>
										<option value="1976">1976</option>
										<option value="1977">1977</option>
										<option value="1978">1978</option>
										<option value="1979">1979</option>
										<option value="1980">1980</option>
										<option value="1981">1981</option>
										<option value="1982">1982</option>
										<option value="1983">1983</option>
										<option value="1984">1984</option>
										<option value="1985">1985</option>
										<option value="1986">1986</option>
										<option value="1987">1987</option>
										<option value="1988">1988</option>
										<option value="1989">1989</option>
										<option value="1990" selected>1990</option>
										<option value="1991">1991</option>
										<option value="1992">1992</option>
										<option value="1993">1993</option>
										<option value="1994">1994</option>
										<option value="1995">1995</option>
										<option value="1996">1996</option>
										<option value="1997">1997</option>
										<option value="1998">1998</option>
										<option value="1999">1999</option>
										<option value="2000">2000</option>
										<option value="2001">2001</option>
										<option value="2002">2002</option>
										<option value="2003">2003</option>
										<option value="2004">2004</option>
										<option value="2005">2005</option>
										<option value="2006">2006</option>
										<option value="2007">2007</option>
										<option value="2008">2008</option>
										<option value="2009">2009</option>
										<option value="2010">2010</option>
								</select> 년</td>
							</tr>
							<tr>
								<th>키</th>
								<td><span class="ui form"> <input type="text" name="height" placeholder="키 입력" style="width: 40%;" id="numberCheck1" maxlength="3" required>
								</span> <span class="ui medium header" style="line-height: 40px;"> cm </span></td>
							</tr>
							<tr>
								<th>몸무게</th>
								<td><span class="ui form"> <input type="text" name="weight" placeholder="몸무게 입력" style="width: 40%;" id="numberCheck2" maxlength="3" required>
								</span> <span class="ui medium header" style="line-height: 40px;"> kg </span></td>
							</tr>
							<tr>
								<th style="width: 15%;">지역</th>
								<td><span class="ui form"> <input type="text" name="location" placeholder="가능 지역1" id="locationCheck" maxlength="10" required style="width: 30%"> <input type="text"
										name="location" placeholder="가능 지역2" id="locationCheck" maxlength="10" required style="width: 30%"
									> <input type="text" name="location" placeholder="가능 지역3" id="locationCheck" maxlength="10" required style="width: 30%">
								</span></td>
							</tr>
							<tr>
								<th style="width: 15%;">지도 방법</th>
								<td>
									<div class="ui form">
										<div class="inline fields" style="margin-bottom: 0px;">
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="teachingMethod" value="group" checked="checked"> <label>그룹</label>
												</div>
											</div>
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="teachingMethod" value="individual"> <label>개인</label>
												</div>
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>가능 시간</th>
								<td><select name="time" class="ui dropdown" required>
										<option value="1978">1978</option>
										<option value="1979">1979</option>
										<option value="1980">1980</option>
										<option value="1981">1981</option>
										<option value="1982">1982</option>
										<option value="1983">1983</option>
										<option value="1984">1984</option>
										<option value="1985">1985</option>
										<option value="1986">1986</option>
										<option value="1987">1987</option>
										<option value="1988">1988</option>
										<option value="1989">1989</option>
										<option value="1990" selected>1990</option>
								</select></td>
							</tr>
							<tr>
								<th>예상 비용</th>
								<td><select name="time" class="ui dropdown" required>
										<option value="1978">1978</option>
										<option value="1979">1979</option>
										<option value="1980">1980</option>
										<option value="1981">1981</option>
										<option value="1982">1982</option>
										<option value="1983">1983</option>
										<option value="1984">1984</option>
										<option value="1985">1985</option>
										<option value="1986">1986</option>
										<option value="1987">1987</option>
										<option value="1988">1988</option>
										<option value="1989">1989</option>
										<option value="1990" selected>1990</option>
								</select> <span class="ui medium header" style="line-height: 15px;"> &nbsp; 원 </span></td>
							</tr>

						</thead>
					</table>
					 <button class="ui inverted red button" type="submit">제출하기</button>

				</form>




			</div>
		</form>
	</div>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
	/* 시멘틱 셀렉트 드롭박스 */
	$('select.dropdown').dropdown();

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