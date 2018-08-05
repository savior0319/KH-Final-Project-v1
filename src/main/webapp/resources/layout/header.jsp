
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/resources/layout/scrollUp.jsp"></jsp:include>
<!-- 인보 - 세션생성  및 브라우저 확인  -->

<c:if test="${sessionScope.member.mbId == null}">
	<script type="text/javascript">
		$(document).ready(function() {
			var filter = "win16|win32|win64|mac";
			var device = "";
			if (navigator.platform) {
				if (0 > filter.indexOf(navigator.platform.toLowerCase())) {
					device = "mobile";
				} else {
					device = "pc";
				}
			}
			$.ajax({
				url : '/createSession.diet',
				type : 'post',
				data : {
					'device' : device
				}
			});
		});
	</script>
</c:if>
<c:if test="${sessionScope.member.mbId != null}">
	<script type="text/javascript">
		$(document).ready(function() {
			var filter = "win16|win32|win64|mac";
			var device = "";
			if (navigator.platform) {
				if (0 > filter.indexOf(navigator.platform.toLowerCase())) {
					device = "mobile";
				} else {
					device = "pc";
				}
			}
			$.ajax({
				url : '/updateOnSession.diet',
				type : 'post',
				data : {
					'data' : '${sessionScope.member.mbNickName}',
					'device' : device
				}
			});
		});
	</script>
</c:if>

<style type="text/css" media="screen">
.menu {
	margin-right: 15px;
}

#load {
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	position: fixed;
	display: block;
	opacity: 1;
	background: rgb(235, 235, 235);
	z-index: 99;
	text-align: center;
}

#load>img {
	position: absolute;
	top: 50%;
	left: 50%;
	z-index: 100;
}
</style>

<div id="load">
	<img src="/resources/image/loading.gif" alt="loading">
</div>

<!-- 메인 메뉴 -->
<div style="background: rgb(242, 242, 242);">
	<div class="ui right aligned basic segment" style="margin-bottom: 0; padding-top: 8px; padding-bottom: 8px;">

		<c:if test="${sessionScope.member.mbId == 'admin'}">
			<span id="admin-page" class="menu">
				<a href="/todayAnalytics.diet">관리자 페이지</a>
			</span>
		</c:if>

		<!-- 로그인 , 로그아웃  -->
		<c:if test="${sessionScope.member==null}">
			<span class="menu">
				<a href="/login.diet">로그인</a>
			</span>
			<span class="menu">
				<a href="/signup.diet">회원가입</a>
			</span>

		</c:if>

		<c:if test="${sessionScope.member!=null}">
			<span class="menu"> ${member.mbNickName}님 환영합니다</span>
			<span class="menu">
				<a href="/logout.diet">로그아웃</a>
			</span>
			<span id="resize1" class="menu">
				<a href="/myInfo.diet">마이페이지</a>
			</span>
		</c:if>
		<span class="menu" id="resize1">
			<a href='javascript:void(0);' onClick='requestAdvertise(); return false'>제휴·광고문의</a>
		</span>
		<span class="menu" id="resize2">
			<a href='javascript:void(0);' onClick='bookMark(); return false'>즐겨찾기</a>
		</span>
	</div>
</div>

<!-- 네비게이션 -->
<div class="ui stackable menu" style="margin-top: 0;">
	<div class="ui container">
		<div id="resizeLogo">
		<a href="/">
			<img class="logo" src="/resources/image/logo.png" style="height: 80px; margin-right: 15px; margin-top: 5px;">
		</a>
		</div>

		<div class="ui simple dropdown item" style="padding-top:10px; padding-bottom:10px;">
			<div style="font-weight: 600; padding: 0;">
				다이어트꿀팁
				<i class="dropdown icon"></i>
			</div>
			<div class="menu">
				<a class="item" href="/dietTipList.diet?type=all">전체</a>
				<a class="item" href="/dietTipList.diet?type=column">칼럼</a>
				<a class="item" href="/dietTipList.diet?type=sport">운동</a>
				<a class="item" href="/dietTipList.diet?type=dietFood">식단</a>
				<a class="item" href="/dietTipList.diet?type=successLatter">성공후기</a>
			</div>
		</div>

		<div class="ui simple dropdown item" style="padding-top:10px; padding-bottom:10px;">
			<div style="font-weight: 600; padding: 0;">
				칼로리사전
				<i class="dropdown icon"></i>
			</div>
			<div class="menu">
				<a class="item" href="/foodCalorieList.diet">음식칼로리</a>
				<a class="item" href="/healthCalorieList.diet">운동칼로리</a>
			</div>
		</div>

		<div class="ui simple dropdown item" style="padding-top:10px; padding-bottom:10px;">
			<div style="font-weight: 600; padding: 0;">
				홈트레이닝
				<i class="dropdown icon"></i>
			</div>
			<div class="menu">
				<a class="item" href="/homeTrainingAll.diet">전체</a>
				<a class="item" href="/homeTrainingList.diet?type=wholeBody">전신</a>
				<a class="item" href="/homeTrainingList.diet?type=abdomen">복부</a>
				<a class="item" href="/homeTrainingList.diet?type=upperBody">상체</a>
				<a class="item" href="/homeTrainingList.diet?type=lowerBody">하체</a>
				<a class="item" href="/homeTrainingList.diet?type=stretching">스트레칭</a>
				<a class="item" href="/homeTrainingList.diet?type=dance">댄스</a>
				<a class="item" href="/homeTrainingList.diet?type=yoga">요가</a>
				<a class="item" href="/homeTrainingList.diet?type=fourChallenge">4주챌린지</a>
			</div>
		</div>

		<div class="ui simple dropdown item" style="padding-top:10px; padding-bottom:10px;">
			<div style="font-weight: 600; padding: 0;">
				커뮤니티
				<i class="dropdown icon"></i>
			</div>
			<div class="menu">
				<a class="item" href="/communityWholeBoard.diet?type=comAll">전체</a>
				<a class="item" href="/communityWholeBoard.diet?type=15">자유게시판</a>
				<a class="item" href="/recipeBoard.diet?type=16">레시피&#38;식단</a>
				<a class="item" href="/communityWholeBoard.diet?type=17">팁&#38;노하우</a>
				<a class="item" href="/communityWholeBoard.diet?type=18">고민&#38;질문</a>
				<a class="item" href="/communityWholeBoard.diet?type=19">비포&#38;애프터</a>
			</div>
		</div>

		<div class="ui simple dropdown item" style="padding-top:10px; padding-bottom:10px;">
			<div style="font-weight: 600; padding: 0;">
				고객센터
				<i class="dropdown icon"></i>
			</div>
			<div class="menu">
				<a class="item" href="/notice.diet">공지사항</a>
				<a class="item" href="/faq.diet">자주하는 질문</a>
				<a id="size1" class="item" href='javascript:void(0);' onClick='question(); return false'>Q&#38;A</a>
			</div>
		</div>

		<div id="trainer-match" class="ui simple dropdown item" style="padding-top:10px; padding-bottom:10px;" onclick="trainerMatch();">
			<div style="font-weight: 600; padding: 0;">트레이너 매칭</div>
		</div>
	</div>
</div>

<style type="text/css" media="screen">
@media ( max-width : 768px) {
	#resizeLogo{
		margin : 0 auto;
	}
	#resize1 {
		display: none;
	}
	#resize2 {
		display: none;
	}
	#admin-page{
		display:none;
	}
	#trainer-match{
		display:none;
	}
}
</style>

<script type="text/javascript">
	function bookMark() {
		alert('CTRL + D키를 누르면 즐겨찾기에 추가 할 수 있습니다');
	}

	function requestAdvertise(){
		alert('로그인 후 관리자에게 문의하세요');
	}

	window.onload = function() {
		$('#load').hide();
	}
	function trainerMatch(){
		location.href = "/trainerMatch.diet";
	}
</script>