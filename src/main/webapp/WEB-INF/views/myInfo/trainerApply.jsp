<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>트레이너자격신청</title>
</head>

<!-- CSS -->
<style>
</style>


<body>

	
	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">
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
												<input type="radio" name="gender" value="여" required>
												<label>여</label>
											</div>
										</div>
										<div class="field">
											<div class="ui radio checkbox">
												<input type="radio" name="gender" value="남">
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
													<option value="전체">전체</option>
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
													<option value="전체">전체</option>
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
			</div>
		</div>
	</div>

</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>