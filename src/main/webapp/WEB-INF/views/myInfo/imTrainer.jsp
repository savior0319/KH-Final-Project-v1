<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>트레이너수락</title>
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
					<a class="item" href="javascript:void(0);" onclick="apply();" id="apply1">
						<span id="text1">트레이너 자격</span>
					</a>
					<a class="item" href="javascript:void(0);" onclick="applyList();" id="apply2">
						<span id="text2">트레이너 요청 리스트</span>
					</a>
				</div>
				<br>
				<div id="trainerApply">
					<div class="ui brown message" style="width: 300px; margin-left: 35%;">
						<div class="ui small header">※ 트레이너 자격 신청</div>
					</div>
					<table class="ui gray table">
						<thead>
							<tr id="title" align="center">
								<th>
									<i class="h square icon"></i>
									번 호
								</th>
								<th>
									<i class="h square icon"></i>
									제 목
								</th>
								<th>
									<i class="h square icon"></i>
									요 청 일
								</th>
								<th>
									<i class="h square icon"></i>
									트레이너 자격 승인
								</th>

							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<td style="width: 13%;">111</td>
								<td style="width: 44%;">
									<a href="javascript:void(0);" onclick="showMyTrainer();">test123214214214</a>
								</td>
								<td style="width: 20%;">2018-18-182</td>
								<td style="width: 23%;">
									<button class="ui red button">자격승인</button>
									<button class="ui grey button">자격거절</button>
								</td>
							</tr>
						</tbody>
					</table>
					<br>
					<br>
					<br>
				</div>

				<div id="memberApply">
					<div class="ui brown message" style="width: 300px; margin-left: 35%;">
						<div class="ui small header">※ 트레이너 요청 리스트</div>
					</div>
					<table class="ui gray table">
						<thead>
							<tr id="title" align="center">
								<th>
									<i class="h square icon"></i>
									번 호
								</th>
								<th>
									<i class="h square icon"></i>
									제 목
								</th>
								<th>
									<i class="h square icon"></i>
									요 청 자
								</th>
								<th>
									<i class="h square icon"></i>
									요 청 일
								</th>
								<th>
									<i class="h square icon"></i>
									수 락 여 부
								</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${myRequest.comList}" var="m">
								<tr align="center">
									<td style="width: 10%;">${m.tpLocation}</td>
									<td style="width: 30%;">
										<a href="javascript:void(0);" onclick="showMyTrainer1();">test123214214214</a>
									</td>
									<td style="width: 15%;">${m.tpLocation}</td>
									<td style="width: 15%;">${m.tpLocation}</td>
									<td style="width: 23%;">
										<button class="ui red button">수락</button>
										<button class="ui grey button">거절</button>
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
									<div class="ui pagination menu">"${requestScope.myRequest.pageNavi}"</div>
								</div>
							</div>
							<div class="column"></div>
						</div>
						<br>
					</div>
				</div>
			</div>

			<div class="ui modal" id="questionModal2">
				<i class="close icon"></i>
				<div class="ui large header">트레이너 요청</div>
				<div class="ui left aligned basic segment">
					<br>
					<div class="ui form" style="font-weight: 600;">
						<div class="ui red message" align="center">※ 트레이너 자격 심사 진행 중입니다.</div>
						<div class="ui red message" align="center">※ 트레이너 자격 승인 되었습니다.</div>
						<div class="ui red message" align="center">※ 트레이너 자격 거절 되었습니다.</div>
					</div>
					<br>
					<br>
				</div>
				<input type="hidden" value="" id="qsIndex" />
			</div>

			<div class="ui modal" id="questionModal3">
				<i class="close icon"></i>
				<div class="ui large header">
					<img src="" />
					트레이너 요청 내용
				</div>
				<div class="ui left aligned basic segment">
					<br>
					<div class="ui form" style="font-weight: 600;">
						<div class="ui floating message" style="margin: 0 auto;">
							<p>
								제 목 :&nbsp;&nbsp;&nbsp;
								<span></span>
							</p>
						</div>
						<div class="ui floating message" style="width: 25%; float: left;">
							<p align="center">
								지 역 :&nbsp;&nbsp;&nbsp;
								<span>${requsetScope.myRequest.tpLocation}</span>
							</p>
						</div>
						<div class="ui floating message" style="width: 25%; float: left; margin-left: 20px;">
							<p align="center">
								신 청 시 간 :&nbsp;&nbsp;&nbsp;
								<span>${requsetScope.myRequest.tpActiveTime}</span>
							</p>
						</div>
						<div class="ui floating message" style="width: 20%; float: left; margin-left: 20px;">
							<p align="center">
								아 이 디 :&nbsp;&nbsp;&nbsp;
								<span>바키</span>
							</p>
						</div>
						<div class="ui floating message" style="width: 23%; float: left; margin-left: 20px;">
							<p align="center">
								PT 종 류 :&nbsp;&nbsp;&nbsp;
								<span></span>
							</p>
						</div>
						<br>
						<br>
						<div class="field">
							<br>
							<label style="font-size: 18px; font-weight: 900;">내 용</label>
							<br>
							<textarea placeholder="내용 입력" style="height: 2px; overflow: hidden; resize: none;" id="contentQuestion"></textarea>
						</div>
						<br>
						<div class="field">
							<label style="font-size: 18px; font-weight: 900;">거 절 사 유</label>
							<br>
							<textarea placeholder="내용 입력" style="height: 2px; overflow: hidden; resize: none;" id="contentQuestion"></textarea>
						</div>
						<div class="ui floating message" align="center" style="margin: 0 auto;">
							<p>
								※ 수락 시
								<span style="color: red; font-weight: 900; font-size: 15px;">'수락'</span>
								버튼을 눌러주세요 ~
							</p>
						</div>

						<button style="float: right; margin-top: 13px;" class="ui red button">수락</button>
						<button style="float: right; margin-top: 13px;" class="ui grey button">거절</button>
					</div>
					<br>
					<br>
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
	<script>
		$(function() {
			var sBtn = $("#myActivity2");
			sBtn.find('a').click(function() {
				sBtn.find('a').removeClass("active");
				$(this).addClass("active");
			});
		});
	</script>
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

	function applyList() {
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

	function showMyTrainer() {

		$('#questionModal2').modal({
			centered : false
		}).modal('show');

	}
</script>

</html>