<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="ui visible inverted left vertical thin sidebar menu" style="width: 240px;">
	<!-- <a class="item" href="/admin.diet"> -->
	<a class="item" href="/todayAnalytics.diet">
		<h2>
			<i class="cog icon"></i>
			관리자 페이지
		</h2>
	</a>
	<div class="item">
		<h3>
			<i class="clipboard iternate icon"></i>
			페이지 설정
		</h3>
		<div class="menu dropdown">
			<h4>
				<a class="ui simple item" href="/pageManagement.diet">페이지 관리</a>
			</h4>
		</div>
	</div>


	<div class="item">
		<h3>
			<i class="clipboard iternate icon"></i>
			일반 회원 관리
		</h3>
		<div class="menu dropdown">
			<h4>
				<a class="ui simple item" href="/memberList.diet">전체 회원조회</a>
				<a class="ui simple item" href="/deleteMemberList.diet">탈퇴 회원 조회</a>
				<a class="ui simple item" href="/blackList.diet">블랙리스트 회원 관리</a>
			</h4>
		</div>
	</div>

	<div class="item">
		<h3>
			<i class="clipboard iternate icon"></i>
			트레이너 회원 관리
		</h3>
		<div class="menu dropdown">
			<h4>
				<a class="ui simple item" href="/trainer.diet">트레이너 신청 관리</a>
				<a class="ui simple item" href="/trainerChange.diet">트레이너 회원 관리</a>
			</h4>
		</div>
	</div>

	<div class="item">
		<h3>
			<i class="clipboard iternate icon"></i>
			게시판 관리
		</h3>
		<div class="menu dropdown">
			<h4>
				<a class="ui simple item" href="/noticeRegister.diet">공지사항 등록</a>
				<a class="ui simple item" href="/answer.diet">1:1문의 답변</a>
			</h4>
		</div>
	</div>


	<div class="item">
		<h3>
			<i class="clipboard iternate icon"></i>
			통계 관리
		</h3>
		<div class="menu dropdown">
			<a class="ui simple item" href="/currentLoginUser.diet">접속자 통계</a>
			<a class="ui simple item" href="/todayAnalytics.diet">사이트 통계</a>
			<a class="ui simple item" href="/errorLogManage.diet">에러 로그 관리</a>
		</div>
	</div>
	<div class="item">
		<h3>
			<i class="clipboard iternate icon"></i>
			기타 관리
		</h3>
		<div class="menu dropdown">
			<a class="ui simple item" href="#">추가예정</a>
		</div>
	</div>


	<a class="item" href="/">
		메인으로
		<i class="sign out iternate icon"></i>
	</a>

</div>
