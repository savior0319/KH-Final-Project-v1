<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style type="text/css" media="screen">
.menu {
	margin-right: 15px;
}
</style>

<!-- 메인 메뉴 -->
<div style="background: rgb(235, 235, 235);">
	<div class="ui right aligned basic segment" style="margin-bottom: 0; padding-top: 8px; padding-bottom: 8px;">
		<span class="menu"><a href="/admin.diet">관리자 페이지</a></span>
    <span class="menu"><a href="/login.diet">로그인</a></span>
    <span class="menu">회원가입</span>
    <span class="menu"><a href="/myInfo.diet">마이페이지</a></span>
		<span class="menu">주문배송조회</span>
		<span class="menu">장바구니</span>
		<span class="menu">제휴·광고문의</span>
		<span class="menu">즐겨찾기</span>
	</div>
</div>

<!-- 네비게이션 -->
<div class="ui menu" style="margin-top: 0;">
	<div class="ui container">
		<a href="/"><img class="logo" src="/resources/image/logo.gif" style="margin: 5px;"></a>

		<div class="ui simple dropdown item">
			<div style="font-weight: 600">
				다이어트꿀팁 <i class="dropdown icon"></i>
			</div>
			<div class="menu">
				<a class="item" href="#">전체</a>
				<a class="item" href="#">칼럼</a>
				<a class="item" href="#">운동</a>
				<a class="item" href="#">식단</a>
				<a class="item" href="#">성공후기</a>
			</div>
		</div>

		<div class="ui simple dropdown item">
			<div style="font-weight: 600">
				칼로리사전 <i class="dropdown icon"></i>
			</div>
			<div class="menu">
				<a class="item" href="#">음식칼로리</a>
				<a class="item" href="#">운동칼로리</a>
			</div>
		</div>

		<div class="ui simple dropdown item">
			<div style="font-weight: 600">
				홈트레이닝 <i class="dropdown icon"></i>
			</div>
			<div class="menu">
				<a class="item" href="#">전체</a>
				<a class="item" href="#">전신</a>
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
				<a class="item" href="#">전체</a>
				<a class="item" href="/bulletinBoard.diet">자유게시판</a>
				<a class="item" href="#">레시피&식단</a>
				<a class="item" href="#">팁&노하우</a>
				<a class="item" href="#">고민&질문</a>
				<a class="item" href="#">비포&애프터</a>
			</div>
		</div>

		<div class="ui simple dropdown item">
			<div style="font-weight: 600">
				고객센터 <i class="dropdown icon"></i>
			</div>
			<div class="menu">
				<a class="item" href="#">공지사항</a>
				<a class="item" href="#">자주 묻는 질문</a>
				<a class="item" href="#">QnA</a>
			</div>
		</div>

		<div class="ui simple dropdown item">
			<div style="font-weight: 600">
				다이어트샵 
			</div>
		</div>
	</div>
</div>