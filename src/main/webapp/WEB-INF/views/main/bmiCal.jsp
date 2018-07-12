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
		<div class="ui center aligned basic segment">
			<h1>BMI계산</h1>
			<table class="ui celled table">
				<thead>
					<tr>
						<th style="width: 15%;">성별</th>
						<td>
							<input type="radio" name="gender"> 여자
							<input type="radio" name="gender" style="margin-left: 20px;"> 남자
						</td>
					</tr>
					<tr>
						<th>연령</th>
						<td>ㅇㅇ</td>
					</tr>
					<tr>
						<th>키</th>
						<td>ㅇㅇ</td>
					</tr>
					<tr>
						<th>몸무게</th>
						<td>ㅇㅇ</td>
					</tr>
				</thead>
			</table>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>