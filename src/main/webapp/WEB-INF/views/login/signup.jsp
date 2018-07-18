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
				<table class="ui celled table" style="width: 70%;">
					<thead>
						<tr>
							<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 계정(이메일 주소)</th>
							<td>
								<div class="ui form">
									<input type="text" name="" placeholder="이메일 주소입력">
								</div>
							</td>
						</tr>
						<tr>
							<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 닉네임</th>
							<td>
								<div class="ui form">
									<input type="text" name="" placeholder="닉네임 입력">
								</div>
							</td>
						</tr>
						<tr>
							<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 비밀번호</th>
							<td>
								<div class="ui form">
									<input type="text" name="" placeholder="닉네임 입력">
								</div>
							</td>
						</tr>
						<tr>
							<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 비밀번호 비밀</th>
							<td>
								<div class="ui form">
									<input type="text" name="" placeholder="닉네임 입력">
								</div>
							</td>
						</tr>
					</thead>
				</table>
				<hr style="width: 70%;">
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>