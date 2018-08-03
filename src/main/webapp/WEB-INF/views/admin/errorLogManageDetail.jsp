<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>

<!-- 달력 추가 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<title>관리자 - 에러 로그 관리 상세내용</title>
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

	<!-- 테이블시작 -->
	<div class="ui center aligned basic segment">
		<div class="ui center aligned basic segment">
			<div class="ui center aligned segment">
				<h1>에러 로그 관리 (상세 내용)</h1>
			</div>
		</div>
		<br>
		<!--중간 div -->
		<div class="ui center alignedsegment">

			<!-- 테이블시작 -->
			<div class="ui center alignedsegment">
				<div class="ui center alignedsegment">


					<div class=" ui center aligned segment">

						<!-- 달력선택, 난이도선택  -->
						<div class="ui grid">

							<div class="four wide column"></div>
							<div class="eight wide column"></div>
							<div class="four wide column" style="border-left: none;">
								<!--  -->
								<div class="ui center basic aligned segment"
									style="float: left; margin: 0px;">
									<div class="ui input">
										<input type="text" id="datepicker1" name="date"
											readonly="readonly" placeholder="날짜 조회">
									</div>
								</div>

								<div class="ui basic floating dropdown button"
									style="float: left;; margin-top: 15px;">
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
						<!-- 경도시작 -->
						<div id ="chart1" class="ui center aligned segment" style="width: 100%;">
							<div class=" ui center aligned segment">
								<h2>경도</h2>
							</div>
							<div class="ui center aligned segment"
								style="overflow: auto; height: 700px;">

								<table class="ui celled table">
									<thead>
										<tr align="center">
											<th>비고</th>
											<th>발생 시간</th>
											<th>발생 장소</th>
											<th>발생 이유</th>
											<th>발생 이유2</th>
										</tr>
									</thead>
									<!--  -->
									<tbody>
										<tr align="center">
											<td>비고</td>
											<td>2018-12-12</td>
											<td>어딘가</td>
											<td>유저불량</td>
											<td>유저불량2</td>

										</tr>
										<tr align="center">
											<td>비고</td>
											<td>2018-12-12</td>
											<td>어딘가</td>
											<td>유저불량</td>
											<td>유저불량2</td>

										</tr>
										<tr align="center">
											<td>비고</td>
											<td>2018-12-12</td>
											<td>어딘가</td>
											<td>유저불량</td>
											<td>유저불량2</td>

										</tr>
										<tr align="center">
											<td>비고</td>
											<td>2018-12-12</td>
											<td>어딘가</td>
											<td>유저불량</td>
											<td>유저불량2</td>

										</tr>
										<tr align="center">
											<td>비고</td>
											<td>2018-12-12</td>
											<td>어딘가</td>
											<td>유저불량</td>
											<td>유저불량2</td>

										</tr>
										<tr align="center">
											<td>비고</td>
											<td>2018-12-12</td>
											<td>어딘가</td>
											<td>유저불량</td>
											<td>유저불량2</td>

										</tr>
										<tr align="center">
											<td>비고</td>
											<td>2018-12-12</td>
											<td>어딘가</td>
											<td>유저불량</td>
											<td>유저불량2</td>

										</tr>
										<tr align="center">
											<td>비고</td>
											<td>2018-12-12</td>
											<td>어딘가</td>
											<td>유저불량</td>
											<td>유저불량2</td>

										</tr>
										<tr align="center">
											<td>비고</td>
											<td>2018-12-12</td>
											<td>어딘가</td>
											<td>유저불량</td>
											<td>유저불량2</td>

										</tr>
										<tr align="center">
											<td>비고</td>
											<td>2018-12-12</td>
											<td>어딘가</td>
											<td>유저불량</td>
											<td>유저불량2</td>

										</tr>
									</tbody>
									<!--  -->
								</table>
							</div>
						</div>
						<!-- 경도종료 -->
					</div>
				</div>
			</div>
		</div>
	</div>








	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	$('.ui.dropdown').dropdown({
		allowAdditions : true,
		allowCategorySelection : true
	});

	//카테고리 선택
	var category = '';
	$('.menu > .item').click(function() {
		switch ($(this).text()) {
		case '경도':
			category = '';
			break;
		case '중도':
			category = '';
			break;
		case '고도':
			category = '';
			break;
		}
	});

	// 날짜 선택
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