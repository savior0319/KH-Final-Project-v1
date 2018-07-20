<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>칼로리 처방 결과</title>
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
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="ui large message">
				<div class="ui large header">칼로리 처방(더 추가 해야함)</div>
			</div>
			<br>
			<table class="ui table">
				<thead>
					<tr align="center">
						<th>성별</th>
						<th>나이</th>
						<th>몸무게</th>
						<th>키</th>
						<th>다이어트 기간</th>
						<th>활동량</th>
						<th>기초대사량</th>
						<th>활동대사량</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td>${bmr.gender}</td>
						<td>만 ${bmr.age}세</td>
						<td>${bmr.height}cm</td>
						<td>${bmr.weight}kg</td>
						<td>${bmr.period}${bmr.periodUnit}</td>
						<td>${bmr.activeMass}</td>
						<td>${bmr.bmr}Kcal</td>
						<td>${bmr.needCal}Kcal</td>
					</tr>
				</tbody>
			</table>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>