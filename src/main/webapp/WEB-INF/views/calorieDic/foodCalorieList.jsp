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
<!-- 			<hr>

			<h3 class="ui left aligned header">
				금주의 음식칼로리 <span style="color: red;">검색순위 TOP</span>
			</h3>
			<hr> -->


			<!-- 검색순위 TOP 들어가는 곳 -->

			<table class="ui very compact table">
				<thead>
					<tr align="center">
						<th>번호</th>
						<th>음식명</th>
						<th>기준</th>
						<th>칼로리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.fcpd.fcList }" var="fc">
					<tr align="center">
						<td style="padding-top: 15px; padding-bottom: 15px;">${fc.fcIndex }</td>
						<td><a href="foodCalorieInfo.diet?fcIndex=${fc.fcIndex }">${fc.fcName }</a></td>
						<td>${fc.fcGram }g</td>
						<td>${fc.fcCal } kcal</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		
		<div class="ui grid">
			<div class="three column row">
				<div class="four wide column"></div>
				<div class="eight wide column">
					<div class="ui center aligned basic segment">
						<div class="ui pagination menu">${requestScope.fcpd.pageNavi }</div>
					</div>
				</div>
				<div class="four wide column">
					
				</div>
			</div>
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