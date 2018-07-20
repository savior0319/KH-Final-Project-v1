<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-122472043-1"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag(){dataLayer.push(arguments);}
	gtag('js', new Date());

	gtag('config', 'UA-122472043-1');
</script>

<style type="text/css" media="screen">
.menu {
	margin-right: 15px;
}
</style>

<!-- 메인 메뉴 -->
<div style="background: rgb(242, 242, 242);">
	<div class="ui right aligned basic segment" style="margin-bottom: 0; padding-top: 8px; padding-bottom: 8px;">

		<c:if test="${sessionScope.member.mbId == 'admin'}">
		<span class="menu">
			<a href="/admin.diet">관리자 페이지</a>
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
	<c:if test ="${sessionScope.member!=null}">
		<span class="menu">
			${member.mbNickName}님 환영합니다 ^^
		</span>
		<span class="menu">
			<a href="/logout.diet">로그아웃</a>
		</span>
		<span class="menu">
			<a href="/myInfo.diet">마이페이지</a>
		</span>
    </c:if>

<span class="menu">주문배송조회</span>
<span class="menu">장바구니</span>
<span class="menu" id="resize1">제휴·광고문의</span>
<span class="menu" id="resize2">즐겨찾기</span>
</div>
</div>

<!-- 네비게이션 -->
<div class="ui stackable menu" style="margin-top: 0;">
	<div class="ui container">
		<a href="/">
			<img class="logo" src="/resources/image/logo.gif" style="margin: 5px;">
		</a>

		<div class="ui simple dropdown item">
			<div style="font-weight: 600">
				다이어트꿀팁 <i class="dropdown icon"></i>
			</div>
			<div class="menu">
				<a class="item" href="/dietTipList.diet?type=all">전체</a>
				<a class="item" href="/dietTipList.diet?type=column">칼럼</a>
				<a class="item" href="/dietTipList.diet?type=sport">운동</a>
				<a class="item" href="/dietTipList.diet?type=dietFood">식단</a>
				<a class="item" href="/dietTipList.diet?type=successLatter">성공후기</a>
			</div>
		</div>

		<div class="ui simple dropdown item">
			<div style="font-weight: 600">
				칼로리사전 <i class="dropdown icon"></i>
			</div>
			<div class="menu">
				<a class="item" href="/foodCalorieRank.diet">음식칼로리</a>
				<a class="item" href="/sportsCalorieRank.diet">운동칼로리</a>
			</div>
		</div>

		<div class="ui simple dropdown item">
			<div style="font-weight: 600">
				홈트레이닝 <i class="dropdown icon"></i>
			</div>
			<div class="menu">
				<a class="item" href="/homeTrainingAll.diet">전체</a>
				<a class="item" href="/homeTrainingList.diet">전신</a>
				<a class="item" href="#">복부</a>
				<a class="item" href="#">상체</a>
				<a class="item" href="#">하체</a>
				<a class="item" href="#">스트레칭</a>
				<a class="item" href="#">댄스</a>
				<a class="item" href="#">요가</a>
				<a class="item" href="#">4주챌린지</a>
			</div>
		</div>

		<div class="ui simple dropdown item">
			<div style="font-weight: 600">
				커뮤니티 <i class="dropdown icon"></i>
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

		<div class="ui simple dropdown item">
			<div style="font-weight: 600">
				고객센터 <i class="dropdown icon"></i>
			</div>
			<div class="menu">
				<a class="item" href="#">공지사항</a>
				<a class="item" href="#">자주 묻는 질문</a>
				<a class="item" href="#">Q&#38;A</a>
			</div>
		</div>

		<div class="ui simple dropdown item">
			<div style="font-weight: 600">다이어트샵</div>
		</div>
	</div>
</div>

<style type="text/css" media="screen">
@media (max-width: 768px) {
	#resize1{
		display: none;
	}
	#resize2{
		display: none;
	}
}
</style>