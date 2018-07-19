<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

			<h1 class="ui left aligned header">음식칼로리</h1>
			<hr>

			<!-- 음식검색 -->
			<div class="ui secondary segment">
				<div class="ui right action left icon input">
					<i class="search icon"></i> <input type="text" placeholder="검색어 입력"
						style="width: 600px;">
					<div class="ui basic floating dropdown button">
						<div class="text">검색</div>
					</div>
				</div>
				<div style="text-align: center; margin-top: 3%; height: 40px;">
					<i class="chevron circle right icon"></i> 다신 칼로리 사전은 <span
						style="color: skyblue;">음식의 칼로리 뿐만 아니라 영양소 구성도 함께</span> 나와 다이어트뿐
					아니라 건강한 식습관 형성에도 도움이 됩니다.
				</div>
			</div>
			<br>
			<hr>

			<h3 class="ui left aligned header">
				금주의 음식칼로리 <span style="color: red;">검색순위 TOP</span>
			</h3>
			<hr>


			<!-- 검색순위 TOP 들어가는 곳 -->

			<table class="ui very compact table">
				<thead>
					<tr align="center">
						<th>순위</th>
						<th>음식명</th>
						<th>단위</th>
						<th>칼로리</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center" style="height: 40px;">
						<td>1</td>
						<td><a href="foodCalorieInfo.diet">쌀밥</a></td>
						<td>1공기(210g)</td>
						<td>211 kcal</td>
					</tr>
					<tr align="center" style="height: 40px;">
						<td>2</td>
						<td>삶은 계란</td>
						<td>1개(50g)</td>
						<td>310 kcal</td>
					</tr>
					<tr align="center" style="height: 40px;">
						<td>3</td>
						<td>수박</td>
						<td>1회(100g)</td>
						<td>121 kcal</td>
					</tr>
					<tr align="center" style="height: 40px;">
						<td>4</td>
						<td>바나나</td>
						<td>1개(100g)</td>
						<td>44 kcal</td>
					</tr>
					<tr align="center" style="height: 40px;">
						<td>5</td>
						<td>방울토마토</td>
						<td>1개(13g)</td>
						<td>22 kcal</td>
					</tr>
				</tbody>
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