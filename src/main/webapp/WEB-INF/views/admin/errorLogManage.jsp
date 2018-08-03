<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>관리자 - 에러 로그 관리 리스트</title>
</head>


<!-- 달력 추가 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

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
	<div class="ui container">
		<div class="ui center aligned basic segment">
			<div class="ui center aligned segment">
				<h1>에러 로그 관리 (리스트)</h1>
			</div>
			<br> <br>
			<!--중간 div -->
			<div class="ui center aligned segment">
				<div class="ui center aligned segment">
					<!-- 달력선택, 난이도선택  -->
					<div class="ui grid">

						<div class="four wide column"></div>
						<div class="seven wide column"></div>
						<div class="five wide column" style="border-left: none;">
							<!--  -->
							<div class="ui center basic aligned segment"
								style="float: left; margin: 0px;">
								<div class="ui input">
									<input type="text" id="datepicker1" name="date"
										readonly="readonly" placeholder="날짜 조회">
								</div>
							</div>

							<div class="ui basic floating dropdown button"
								style="float: left; margin-top: 15px;">
								<div class="text">선택</div>
								<i class="dropdown icon"></i>
								<div class="menu">
									<div class="item">경도</div>
									<div class="item">중도</div>
									<div class="item">고도</div>
								</div>
							</div>
							<!--  -->
						</div>
					</div>
					<!-- 달력선택, 난이도선택 종료-->
					<!-- 날자검색창 종료 -->
					<!-- 테이블시작 -->
					<div class="ui center aligned segment">
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
											<td><button class="ui secondary button"
													onclick="goDetail()">자세히</button></td>
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
					<!-- 테이블 종료 -->

				</div>
				<!--중간 div종료 -->
			</div>
		</div>
		<!--  -->
		<br> <br>
	</div>
	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	function goDetail() {
		location.href = "/errorLogManageDetail.diet";
	};
	
	//날자선택
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		showMonthAfterYear : true,
		yearSuffix : '년'
	});

	$(function() {
		$("#datepicker1").datepicker();
	});
</script>

</html>