<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>자주하는 질문</title>
</head>

<!-- CSS -->
<style>

</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<div class="ui container">
		<br>
		<div class="ui center aligned basic segment">
			<div class="ui left aligned container">
				<h1>자주하는 질문</h1>
			</div>
			<hr style="border: 2px solid #D5D5D5;">
			<br>
			<div align="center">

				<!-- 자주하는 질문 --> 
				<br><br><br><br>
				<div class="ui styled accordion" id="faq">
					<div class="title">
						<i class="dropdown icon"></i>
						회원 등급은 어떻게 되나요?
					</div>
					<div class="content">
						<p>- 회원 등급은 일반회원/트레이너/관리자가 있으며<br>트레이너 회원이 되려면 트레이너 신청 후 관리자의 승인이 필요합니다.</p>
					</div>
					<div class="title">
						<i class="dropdown icon"></i>
						회원 탈퇴는 어떻게 하나요?
					</div>
					<div class="content">
						<p>- 로그인 후 상단 마이페이지에서 회원 탈퇴가 가능합니다.</p>
					</div>
					<div class="title">
						<i class="dropdown icon"></i>
						비밀번호를 잊어 버렸어요
					</div>
					<div class="content">
						<p>- 상단 메뉴에서 로그인을 클립합니다.<br>비밀번호 재설정을 누르고 가입한 아이디를 입력하면<br>이메일로 임시 비밀번호가 전송 됩니다.</p>
					</div>
					<div class="title">
						<i class="dropdown icon"></i>
						광고를 하고 싶어요
					</div>
					<div class="content">
						<p>- 로그인 후 관리자에게 문의하세요</p>
					</div>
					<div class="title">
						<i class="dropdown icon"></i>
						트레이닝 수강 취소를 하고 싶어요
					</div>
					<div class="content">
						<p>- 로그인 후 마이페이지에서 내 트레이닝 수강 내역을 확인 할 수 있습니다.</p>
					</div>
				</div>

				<!-- 자주하는 질문 끝 -->
				<br><br><br><br>	
			</div>
		</div>
	</div>
	
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	$(document).ready(function() {
		$('#faq').accordion();
	});
</script>

</html>