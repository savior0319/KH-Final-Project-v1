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

<title>관리자 - 트레이너 신청 정보</title>
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
									<img id="img" style="width: 300px; height: 300px;" src="${requestScope.trv.trImagePath}" onerror='this.src="/resources/image/coach.png"'>
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
												<input value="${requestScope.trv.trName}" type="text" name="trVame" placeholder="이름" id="nameCheck" maxlength="5" autocomplete="off" required readonly />
											</span>
										</td>
									</tr>

									<tr>

										<td style="width: 13%;">연락처</td>
										<td style="border-top: 1px solid #EAEAEA; padding-top: 30px; padding-bottom: 30px;">
											<span class="ui form">
												<input type="text" value="${requestScope.trv.trPhone}" name="phone" placeholder="01*********" id="numberCheck" maxlength="11" required autocomplete="off" readonly />
											</span>
										</td>
									</tr>
									<tr>
										<td style="width: 13%;">주소</td>
										<td style="border-top: 1px solid #EAEAEA; padding-top: 30px; padding-bottom: 30px;">
											<span class="ui form">
												<input type="text" value="${requestScope.trv.trAddress}" id="addAddress" name="addAddress" style="margin-top: 10px;" value="" class="form-control" placeholder="주소" autocomplete="off"
													readonly />
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
									<c:choose>
										<c:when test="${requestScope.trv.trGender eq 'f'}">
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="gender" value="f" checked="checked">
													<label>여</label>
												</div>
											</div>
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="gender" value="m" disabled="disabled">
													<label>남</label>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="gender" value="f" disabled="disabled">
													<label>여</label>
												</div>
											</div>
											<div class="field">
												<div class="ui radio checkbox">
													<input type="radio" name="gender" value="m" checked="checked">
													<label>남</label>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
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
									<input type="text" value="${requestScope.trv.trBirth}" placeholder="생년월일" id="birth" name="birth" readonly>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">키</th>
						<td>
							<span class="ui form">
								<input type="text" value="${requestScope.trv.trHeight}" name="height" placeholder="키 " style="width: 40%;" id="heightCheck" maxlength="3" required autocomplete="off" readonly />
							</span>
							<span class="ui medium header" style="line-height: 40px;"> cm </span>
						</td>
					</tr>
					<tr>
						<th style="text-align: center;">몸무게</th>
						<td>
							<span class="ui form">
								<input type="text" value="${requestScope.trv.trWeight}" name="weight" placeholder="몸무게" style="width: 40%;" id="weightCheck" maxlength="3" required autocomplete="off" readonly />
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
										<input type="text" value="${requestScope.trv.trCity}" name="trCity" placeholder="지역" id="trCity" required autocomplete="off" readonly />
									</div>
									<div class="field">
										<input type="text" value="${requestScope.trv.trArea}" name="trArea" placeholder="상세 지역" id="trArea" required autocomplete="off" readonly />
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr style="text-align: center;">
						<th>경력</th>
						<td>
							<div class="ui form">

								<textarea id="trComment" style="margin-top: 0px; margin-bottom: 0px; height: 203px; resize: none;" autocomplete="off" placeholder="신청 회원 경력" readonly>${requestScope.trv.trContent}</textarea>

							</div>
						</td>
					</tr>

				</thead>
			</table>

			<button class="ui inverted red button" onclick="acceptBtn(${requestScope.trv.trIndex});">승인</button>
			<button class="ui inverted secondary button" onclick="denyBtn(${requestScope.trv.trIndex});">거부</button>


		</div>

	</div>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>


<!-- SCRIPT -->

<script type="text/javascript">
	
	function acceptBtn(ti){
		var check = window.confirm("일반회원에서 트레이너 회원으로의 신청을 승인 하시겠습니까?");
		if(check == true){
		
		$.ajax({
			url : '/acceptTrainerReg.diet',
			type : 'post',
			data : {
				'trIndex' : ti
			},
			success : function(data) {
				if (data=='success') {
					location.href = "/trainer.diet";
				} else {
					alert('승인 실패!!');
				}
			},
			error : function() {
				alert('처리실패!!');
			}
		});	
		}else{
			
		}
		
	}
	
	function denyBtn(ti){
		var check = window.confirm("일반회원에서 트레이너 회원으로의 신청을 거부 하시겠습니까?");
		if(check == true){
		$.ajax({
			url : '/denyTrainerReg.diet',
			type : 'post',
			data : {
				'trIndex' : ti
			},
			success : function(data) {
				if (data=='success') {
					location.href = "/trainer.diet";
				} else {
					alert('거부 실패!!');
				}
				
			},
			error : function(data) {
				alert('처리실패!!');
			}
		});	
		}else{
			
		}
	}
	
	
</script>

</html>