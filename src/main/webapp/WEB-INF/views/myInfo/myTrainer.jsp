<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>트레이너</title>
</head>

<!-- CSS -->
<style>
</style>

<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>
	<c:if test="${sessionScope.member!=null}">
		<!-- CONTENTS -->
		<div class="ui container">
			<div class="ui center aligned basic segment">
				<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
				<br>
				<div class="ui two item menu">
					<a class="item" href="javascript:void(0);" onclick="apply();"
						id="apply1"> <span id="text1">트레이너 자격</span>
					</a> <a class="item" href="javascript:void(0);" onclick="applyList();"
						id="apply2"> <span id="text2">프로그램 구매 리스트</span>
					</a>
				</div>
				<br>
				<c:choose>
					<c:when test="${!applyTrainer.comList.isEmpty()}">
						<div id="trainerApply">
							<div class="ui brown message" align="center">
								<div class="ui small header">※ 트레이너 자격 신청</div>
							</div>

							<table class="ui gray table">
								<thead>
									<tr id="title" align="center">
										<th><i class="h square icon"></i> 번 호</th>
										<th><i class="h square icon"></i> 제 목</th>
										<th><i class="h square icon"></i> 요 청 일</th>
										<th><i class="h square icon"></i> 트레이너 자격 승인</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${applyTrainer.comList}" var="m">
										<tr align="center">
											<td style="width: 13%;">${m.trIndex}</td>
											<td style="width: 44%;"><a href="javascript:void(0);"
												onclick="applyTrainer();">${m.trContent}</a></td>
											<td style="width: 20%;">
											<c:set var="TextValue" value="${m.trRegDate}" />
												${fn:substring(TextValue,0,11)}일
												${fn:substring(TextValue,11,16)}분</td>
											<td style="width: 23%;"><c:if
													test="${m.trStatus == '승인'}">
													<button class="ui blue button">자격승인</button>
												</c:if> <c:if test="${m.trStatus == '심사중'}">
													<button class="ui red button">심사중</button>
												</c:if> <c:if test="${m.trStatus == '거절'}">
													<button class="ui red button">자격거절</button>
												</c:if></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="ui grid">
								<div class="three column row">
									<div class="column"></div>
									<div class="column">
										<div class="ui center aligned basic segment">
											<div class="ui pagination menu">${applyTrainer.pageNavi}</div>
										</div>
									</div>
									<div class="column"></div>
								</div>
								<br>
							</div>
							<br>
						</div>
					</c:when>
					<c:when test="${applyTrainer.comList.isEmpty()}">
						<div id="trainerApply">
							<div class="ui red message" align="center">※ 트레이너 자격 신청하신
								내역이 없습니다.</div>
						</div>
					</c:when>
				</c:choose>

				<c:choose>
					<c:when test="${!myRequest.comList.isEmpty()}">
						<div id="memberApply">
							<div class="ui brown message" align="center">
								<div class="ui small header">※ 프로그램 구매 List</div>
							</div>
							<table class="ui gray table">
								<thead>
									<tr id="title" align="center">
										<th><i class="h square icon"></i> 프 로 그 램 번 호</th>
										<th><i class="h square icon"></i> 프 로 그 램 명</th>
										<th><i class="h square icon"></i> 구 매 금 액</th>
										<th><i class="h square icon"></i> 구 매 일</th>
										<th><i class="h square icon"></i> 취 소</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${myRequest.comList}" var="m">
										<tr align="center" id="tRow">
											<td style="width: 10%;">${m.tpIndex}</td>
											<td style="width: 30%;"><a
												href="programDetail.diet?tpIndex=${m.tpIndex}">${m.tpTitle}</a>
											</td>
											<td style="width: 15%;">${m.tpCost}원</td>
											<td style="width: 15%;"><c:set var="TextValue" value="${m.tpRegDate}" />
												${fn:substring(TextValue,0,11)}일
												${fn:substring(TextValue,11,16)}분</td>
											<td style="width: 15%;">
												<button id="canBtn" class="ui blue button"
													onclick="canclePro(${m.tpIndex});">구매취소</button>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>

							<div class="ui grid">
								<div class="three column row">
									<div class="column"></div>
									<div class="column">
										<div class="ui center aligned basic segment">
											<div class="ui pagination menu">${myRequest.pageNavi}</div>
										</div>
									</div>
									<div class="column"></div>
								</div>
								<br>
							</div>
						</div>
					</c:when>

					<c:otherwise>
						<div id="memberApply">
							<div class="ui red message" align="center">※ 프로그램 구매 내역이
								없습니다.</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<br>
		<div class="ui modal" id="questionModal3">
			<i class="close icon"></i>
			<div class="ui large header">자격 신청 내용</div>
			<div class="ui left aligned basic segment">
				<br>
				<div class="ui form" style="font-weight: 600;">
					<div class="ui center aligned basic segment">
						<h3 class="ui block header">기본 정보</h3>
						<table class="ui celled table">
							<thead>
								<tr>
									<td style="width: 30%;">
										<table class="ui collapsing table" style="width: 100%;">
											<thead align="center">
												<tr>
													<th><strong>사 진</strong></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<!-- 사진 첨부 -->
														<div class="six wide column">
															<div style="width: 100%;">
																<img id="img" style="width: 300px; height: 300px;"
																	src="${trv.trImagePath}">
															</div>
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
													<td style="padding-bottom: 30px; padding-top: 30px;">
														<span class="ui form"> <input type="text"
															name="trVame" id="nameCheck" maxlength="5"
															autocomplete="off" required value="${trv.trName}"
															readonly="readonly" />
													</span>
														<div id="nameMessage" style="display: none;"></div>
													</td>
												</tr>
												<tr>
													<td style="width: 13%;">연락처</td>
													<td
														style="border-top: 1px solid #EAEAEA; padding-top: 30px; padding-bottom: 30px;">
														<span class="ui form"> <input type="text" readonly
															name="phone" id="numberCheck" value="${trv.trPhone}"
															maxlength="11" required autocomplete="off" />
													</span>
														<div id="phoneMessage" style="display: none;"></div>
													</td>
												</tr>
												<tr>
													<td style="width: 13%;">주소</td>
													<td
														style="border-top: 1px solid #EAEAEA; padding-bottom: 30px;">
														<span class="ui form"> <input type="text"
															id="roadAddress" name="roadAddress"
															style="margin-top: 20px;" class="form-control"
															value="${trv.trAddress}" readonly />
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
												<c:if test="${trv.trGender=='m'}">
													<div class="field">
														<div class="ui radio checkbox">
															<input type="radio" name="gender" value="남"
																checked="checked"> <label>남</label>
														</div>
													</div>
												</c:if>
												<c:if test="${trv.trGender=='f'}">
													<div class="field">
														<div class="ui radio checkbox">
															<input type="radio" name="gender" value="여"
																checked="checked"> <label>여</label>
														</div>
													</div>
												</c:if>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th style="text-align: center;">생년월일</th>
									<td>
										<div class="field">
											<div class="ui left icon input">
												<i class="calendar icon"></i> <input type="text"
													value="${trv.trBirth}" id="birth" name="birth" readonly
													required="required">
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<th style="text-align: center;">키</th>
									<td><span class="ui form"> <input type="text"
											readonly name="height" value="${trv.trHeight}"
											style="width: 40%;" id="heightCheck" maxlength="3" required
											autocomplete="off" />
									</span> <span class="ui medium header" style="line-height: 40px;">
											cm </span>
										<div id="heightMessage" style="display: none;"></div></td>
								</tr>
								<tr>
									<th style="text-align: center;">몸무게</th>
									<td><span class="ui form"> <input type="text"
											readonly name="weight" value="${trv.trWeight}"
											style="width: 40%;" id="weightCheck" maxlength="3" required
											autocomplete="off" />
									</span> <span class="ui medium header" style="line-height: 40px;">
											kg </span>
										<div id="weightMessage" style="display: none;"></div></td>
								</tr>
								<tr>
									<th style="text-align: center;">지역</th>
									<td>
										<div class="ui form">
											<div class="one fields">
												<div class="field">${trv.trArea}</div>
											</div>
										</div>
									</td>
								</tr>
								<tr style="text-align: center;">
									<th>경력</th>
									<td>
										<div class="ui form">
											<div class="field">
												<textarea id="trComment"
													style="margin-top: 0px; margin-bottom: 0px; height: 203px; resize: none;"
													required="required" autocomplete="off" readonly>
														${trv.trContent}
														</textarea>
											</div>
										</div>
									</td>
								</tr>
							</thead>
						</table>
						<div class="ui small red message">
							<div class="ui small header">※ 궁금하신 사항은 관리자에게 문의 바랍니다.</div>
						</div>
						<button style="float: right; margin-top: 13px;"
							class="ui grey button closeBtn" onclick="closeBtn();">닫기</button>
					</div>
					<br>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${sessionScope.member==null}">
		<script>
			alert("로그인 후 이용해주세요~");
			location.href = "/";
		</script>
	</c:if>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
<!--프로그램 신청 취소 -->
	function canclePro(tpIndex) {
		var result = window.confirm("구매를 취소하시겠습니까?");
		if (result) {
			$.ajax({
				url : "/canclePro.diet",
				type : 'POST',
				data : {
					'tpIndex' : tpIndex
				},
				success : function(data) {
					if (data > 0) {
						alert("구매가 취소되었습니다. 결제취소는 2~3일 후 처리될 예정입니다.");
						location.href = "/";
					} else {
						alert("구매 취소가 불가합니다. 관리자에게 문의 바랍니다.");
						location.href = "/";
					}

				},
				error : function() {
					alert("구매 취소가 불가합니다. 관리자에게 문의 바랍니다.");
				}
			});

		}
	}

	window.onload()
	{
		$("#trainerApply").show();
		$("#memberApply").hide();
		$("#apply1").css('background-color', 'black');
		$("#text1").css('color', 'white');
		$("#text1").css('font-weight', 900);
	}

	function apply() {
		$("#trainerApply").show();
		$("#memberApply").hide();
		$("#apply1").css('background-color', 'black');
		$("#apply2").css('background-color', 'white');
		$("#text1").css('color', 'white');
		$("#text1").css('font-weight', 900);
		$("#text2").css('color', 'black');
		$("#text2").css('font-weight', 900);
	}

	function applyList() {
		console.log("here");
		$("#trainerApply").hide();
		$("#memberApply").show();
		$("#apply1").css('background-color', 'white');
		$("#apply2").css('background-color', 'black');
		$("#text1").css('color', 'black');
		$("#text1").css('font-weight', 900);
		$("#text2").css('color', 'white');
		$("#text2").css('font-weight', 900);

	}

	function applyTrainer() {
		$('#questionModal3').modal({
			centered : false
		}).modal('show');
	}

	function closeBtn() {
		$('#questionModal3').modal({
			centered : false
		}).modal('hide');
	}
</script>
</html>