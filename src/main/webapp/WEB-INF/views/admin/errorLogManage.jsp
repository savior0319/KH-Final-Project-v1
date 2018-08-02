<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>다이어트</title>
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

	<!--  -->
	<div class="ui center aligned basic segment">
		<div class="ui center aligned segment">
			<h3>에러 로그 관리 - 리스트</h3>
		</div>
		<br> <br>
		<!--중간 div -->
		<div class="ui center alignedsegment">

			<!-- 날자검색창  -->
			<!-- @@ 내부 div중 좌측, 가운대거를 날리고 우측것만있게해야함.  -->
			<div class="ui horizontal segments">
				<div class="ui segment"></div>
				<div class="ui segment"></div>
				<div class="ui segment">
					<div class="ui action input">
						<input type="text" placeholder="Search...">
						<button class="ui button">Search</button>
					</div>
				</div>
			</div>
			<br>
			<br>
			<!-- 날자검색창 종료 -->
			
			<!-- 테이블시작 -->
			<div class="ui center alignedsegment">
				<div class="ui center alignedsegment">
					<table class="ui celled table">
						<thead>
							<tr align="center">
								<th>날 짜</th>
								<th>경도 경고</th>
								<th>중도 경고</th>
								<th>고도 경고</th>
								<th>비 고</th>
							</tr>
						</thead>
						<!--  -->
						<tbody>
							<tr align="center">
								<td>2018-08-03</td>
								<td>4개</td>
								<td>2개</td>
								<td>0개</td>
								<td><button class="ui secondary button">자세히</button></td>
							</tr>
							<tr align="center">
								<td>2018-08-03</td>
								<td>4개</td>
								<td>2개</td>
								<td>0개</td>
								<td><button class="ui secondary button">자세히</button></td>
							</tr>
							<tr align="center">
								<td>2018-08-03</td>
								<td>4개</td>
								<td>2개</td>
								<td>0개</td>
								<td><button class="ui secondary button">자세히</button></td>
							</tr>
							<tr align="center">
								<td>2018-08-03</td>
								<td>4개</td>
								<td>2개</td>
								<td>0개</td>
								<td><button class="ui secondary button">자세히</button></td>
							</tr>
							<tr align="center">
								<td>2018-08-03</td>
								<td>4개</td>
								<td>2개</td>
								<td>0개</td>
								<td><button class="ui secondary button">자세히</button></td>
							</tr>
							<tr align="center">
								<td>2018-08-03</td>
								<td>4개</td>
								<td>2개</td>
								<td>0개</td>
								<td><button class="ui secondary button">자세히</button></td>
							</tr>
							<tr align="center">
								<td>2018-08-03</td>
								<td>4개</td>
								<td>2개</td>
								<td>0개</td>
								<td><button class="ui secondary button">자세히</button></td>
							</tr>
							<tr align="center">
								<td>2018-08-03</td>
								<td>4개</td>
								<td>2개</td>
								<td>0개</td>
								<td><button class="ui secondary button">자세히</button></td>
							</tr>
							<tr align="center">
								<td>2018-08-03</td>
								<td>4개</td>
								<td>2개</td>
								<td>0개</td>
								<td><button class="ui secondary button">자세히</button></td>
							</tr>
							<tr align="center">
								<td>2018-08-03</td>
								<td>4개</td>
								<td>2개</td>
								<td>0개</td>
								<td><button class="ui secondary button">자세히</button></td>
							</tr>
						</tbody>
						<!--  -->
					</table>

				</div>
			</div>
			
			<!-- 테이블 종료 -->

		</div>
		<!--중간 div종료 -->

	</div>
	<!--  -->
	<br>
	<br>

	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>