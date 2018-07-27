<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>관리자</title>
</head>

<!-- CSS -->
<style>
body {
	margin-left: 240px;
}

</style>




<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/adminheader.jsp"></jsp:include>


	<!-- CONTENTS -->
	<br>
	<br>
	<div class="ui container">
		<div class="ui center aligned segment">
			<h1>접속자 통계</h1>
		</div>
		<br> <br>
		<div class="ui center aligned segment">
			<h1>현재 접속자 : ?? 명</h1>
			<button>갱신</button>
		</div>
		<div class="ui center aligned segment">
			<table class="ui celled table">
				<thead>
					<tr align="center">
						<th>IP</th>
						<th>로그인</th>
						<th>닉네임</th>
						<th>접속시간</th>
						<th>비고</th>
						<th>비고</th>
					</tr>
					<tr align="center">
						<td>127.0.0.1</td>
						<td>ON</td>
						<td>어드민</td>
						<td>18.7.27 12:00:00</td>
						<td>모바일</td>
						<td>기타</td>
					</tr>
					<tr align="center">
						<td>127.0.0.2</td>
						<td>OFF</td>
						<td>비회원</td>
						<td>18.7.27 12:15:00</td>
						<td>PC</td>
						<td>기타</td>
					</tr>
				</thead>
			</table>
		</div>
		<br>

		<div class="ui center aligned segment">
			<h1>오늘접속자 : ?? 명</h1>
		</div>
		<br>
		<div class="ui center aligned segment">
			<div class="ui center aligned segment">
				<table>테이블
				</table>
			</div>
			<div class="ui center aligned segment">차트</div>
		</div>

		<br>
	</div>




</body>

<!-- SCRIPT -->
<script type="text/javascript">
   
</script>

</html>