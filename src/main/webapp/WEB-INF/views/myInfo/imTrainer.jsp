<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
						id="apply1"> <span id="text1">트레이너 자격 신청</span>
					</a> <a class="item" href="javascript:void(0);"
						onclick="enrollProgram();" id="apply2"> <span id="text2">프로그램
							등록 내역</span>
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
											<td style="width: 44%;"><a href="javascript:void(0);">${m.trContent}</a>
											</td>
											<td style="width: 20%;">${m.trRegDate }</td>
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
							<input type="hidden" value="${applyTrainer.comList}"
								id="listSize" />
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
								<div class="ui small header">※프로그램 등록 List</div>
							</div>
							<table class="ui gray table">
								<thead>
									<tr id="title" align="center">
										<th><i class="h square icon"></i> 번 호</th>
										<th><i class="h square icon"></i> 프 로 그 램 명</th>
										<th><i class="h square icon"></i> 판 매 금 액</th>
										<th><i class="h square icon"></i> 등 록 날 짜</th>
										<th><i class="h square icon"></i> 판 매 여 부</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach items="${myRequest.comList}" var="m">
										<tr align="center">
											<td style="width: 10%;" id="tpIndex">${m.tpIndex}</td>
											<td style="width: 30%;"><a href="javascript:void(0);"
												onclick="showMyTrainer1();">${m.tpTitle}</a></td>
											<td style="width: 15%;">${m.tpCost}</td>
											<td style="width: 15%;">${m.tpRegDate}</td>
											<td style="width: 23%;">
											<c:forEach items="${!checkSale.size()}" var="i">
												<c:if test="${!checkSale.isEmpty() && checkSale[i].tpIndex == ${m.tpIndex}}">
													<button class="ui red button">판매완료</button>												</c:if>
											</c:forEach> 
												<c:if test="${checkSale.isEmpty()}">
													<button class="ui grey button">판매대기</button>
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
							<div class="ui red message" align="center">※ 프로그램 등록 내역이
								없습니다.</div>

						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="ui modal" id="questionModal3">
				<i class="close icon"></i>
				<div class="ui large header">프로그램 내용</div>
				<div class="ui left aligned basic segment">
					<br>
					<div class="ui form" style="font-weight: 600;">

						<button style="float: right; margin-top: 13px;"
							class="ui grey button">닫기</button>
					</div>
					<br> <br>
				</div>
				<input type="hidden" value="" id="qsIndex" />
			</div>
		</div>
		<br>
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

	function enrollProgram() {
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
	function showMyTrainer1() {

		$('#questionModal3').modal({
			centered : false
		}).modal('show');

	}
</script>

</html>