<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>다이어트</title>
</head>

<!-- CSS -->
<style>
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<div class="ui container">
		<br><br>
		<div class="ui center aligned basic segment"> 
			<div class="ui huge header">회원가입</div>
			<br>
			회원가입은 무료이며 가입 후 다양한 서비스를 받으실 수 있습니다.
			<br><br>
			<hr style="height: 3px; width: 70%; background: red; border: 0px;">
			<div class="ui left aligned basic segment" style="padding-left: 15%;">
				<span class="ui medium header">정보입력</span> 
				<span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 필수입력항목
			</div>
			<div align="center">
				<form action="/signupsave.diet" method="POST" accept-charset="utf-8">
					<table class="ui celled table" style="width: 70%;">
						<thead>
							<tr>
								<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 계정(이메일 주소)</th>
								<td>
									<div class="ui form">
										<input type="text" name="mbId" placeholder="이메일 주소입력">
									</div>
								</td>
							</tr>
							<tr>
								<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 닉네임</th>
								<td>
									<div class="ui form">
										<input type="text" name="mbNickName" placeholder="닉네임 입력">
									</div>
								</td>
							</tr>
							<tr>
								<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 비밀번호</th>
								<td>
									<div class="ui form">
										<input type="password" name="mbPwd" id="pwd" placeholder="비밀번호 입력">
									</div>
								</td>
							</tr>
							<tr>
								<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 비밀번호 재확인</th>
								<td>
									<div class="ui form">
										<input type="password" id="pwdRe" placeholder="비밀번호 재확인 입력">
									</div>
								</td>
							</tr>
							<tr>
								<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 성별</th>
								<td>
									<div class="ui form">
										<input type="radio" name="gender" value="f" style="margin-left: 5px;"> 여자
										<input type="radio" name="gender" value="m" style="margin-left: 15px;"> 남자 
									</div>
								</td>
							</tr>
							<tr>
								<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;"> </span> 관심항목</th>
								<td>
									<div class="ui form">
										<input type="checkbox" name="interest" value="다이어트 식품" style="margin-left: 5px;"> 다이어트 식품
										<input type="checkbox" name="interest" value="다이어트 레시피" style="margin-left: 5px;"> 다이어트 레시피
										<input type="checkbox" name="interest" value="다이어트 경험" style="margin-left: 5px;"> 다이어트 경험<br>  
										<input type="checkbox" name="interest" value="운동 방법" style="margin-left: 5px; margin-top: 5px;"> 운동 방법
										<input type="checkbox" name="interest" value="연예인 다이어트" style="margin-left: 5px; margin-top: 5px;"> 연예인 다이어트
										<input type="checkbox" name="interest" value="운동 도구" style="margin-left: 5px; margin-top: 5px;"> 운동 도구
									</div>
								</td>
							</tr>
						</thead>
					</table>
					<hr style="width: 70%;">
					<div class="ui left aligned basic segment" style="padding-left: 15%; margin-top: 0px;">
						<a href="#">이용약관</a> 및 <a href="#">개인정보 취급방침</a>에 동의합니다.(필수)
						<input type="checkbox" id="term">
					</div>
					<button type="submit" class="ui red button">가입하기</button>
					<button type="button" class="ui black button" onclick="back();">뒤로가기</button>
				</form>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	function back(){
		location.href="/";
	}
</script>

</html>