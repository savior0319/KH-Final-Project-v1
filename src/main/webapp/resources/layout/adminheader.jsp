<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="ui visible inverted left vertical thin sidebar menu" style="width: 240px;">
	<a class="item" href="/admin.diet">
		<h2>
			<i class="cog icon"></i> 관리자 페이지
		</h2>
	</a>
	<div class="item">
		<h3>
			<i class="clipboard iternate icon"></i> 페이지 설정
		</h3>
		<div class="menu dropdown">
			<h4>
				<a class="ui simple item" href="#">페이지 관리</a>
			</h4>
		</div>
	</div>


	<div class="item">
		<h3>
			<i class="clipboard iternate icon"></i> 회원 관리
		</h3>
		<div class="menu dropdown">
			<h4>
				<a class="ui simple item" href="/memberList.diet">회원조회</a>
				<a class="ui simple item" href="#">휴면 계정 관리</a>
				<a class="ui simple item" href="#">닉네임 변경 이력</a>
				<a class="ui simple item" href="#">로그인 현황</a>
				<a class="ui simple item" href="#">회원 접속로그</a>
				<a class="ui simple item" href="#">탈퇴 내역 조회</a>
			</h4>
		</div>
	</div>

	<div class="item">
		<h3><i class="clipboard iternate icon"></i>게시판 관리</h3>
		<div class="menu dropdown">
			<h4>
				<a class="ui simple item" href="/noticeRegister.diet">공지사항 등록</a>
				<a class="ui simple item" href="#">1:1문의 답변</a>
			</h4>
		</div>
	</div>


	<div class="item">
		<h3><i class="clipboard iternate icon"></i>통계 관리</h3>
		<div class="menu dropdown">
			<a class="ui simple item" href="/currentLoginUser.diet">접속자 통계</a>
			<a class="ui simple item" href="#">회원 접속 기록관리</a>
			<a class="ui simple item" href="#">사이트 통계</a>
		</div>
	</div>


	<div class="item">
		<h3><i class="clipboard iternate icon"></i>쇼핑몰 관리</h3>
		<div class="menu dropdown">
			<a class="ui simple item" href="#">상품등록</a>
			<a class="ui simple item" href="#">구매관리</a>
			<a class="ui simple item" href="#">배송관리</a>
			<a class="ui simple item" href="#">매출관리</a>
		</div>
	</div>

	<div class="item">
		<h3><i class="clipboard iternate icon"></i>기타 관리</h3>
		<div class="menu dropdown">
			<a class="ui simple item" href="#">추가예정</a>
		</div>
	</div>


	<a class="item" href="/">
		메인으로 <i class="sign out iternate icon"></i>
	</a>

</div>
