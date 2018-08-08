<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>관리자 - 회원 접속 로그 리스트</title>
</head>


<!-- 달력 추가 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
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
				<h1>회원 접속 로그 (리스트)</h1>
			</div>
			<br>
			<br>
			<!--중간 div -->
			<div class="ui center aligned segment">
				<div class="ui center aligned segment">
					<!-- 달력선택, 난이도선택  -->
					<div class="ui grid">
						<div class="four wide column"></div>
						<div class="eight wide column"></div>
						<div class="four wide column" style="border-left: none;">
							<!--  -->
							<div class="ui center basic aligned segment" style="float: left; margin: 0px;">
								<div class="ui input">
									<input type="text" id="datepicker1" name="date" readonly="readonly" placeholder="날짜 조회">
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
									<th style="width: 30%;">날 짜</th>
									<th style="width: 30%;">총 접속자수(회원)</th>
									<th style="width: 30%;">비 고</th>
								</tr>
							</thead>
							<!--  -->
							<tbody>
								
								<tr align="center">
									<td id="searchDate1">${list[0].day}</td>
									<td>${list[0].count+list[1].count}</td>
									<td>
										<button class="ui secondary button" onclick="move(1);">자세히</button>
									</td>
								</tr>
								<tr align="center">
									<td id="searchDate2">${list[2].day}</td>
									<td>${list[2].count+list[3].count}</td>
									<td>
										<button class="ui secondary button" onclick="move(2);">자세히</button>
									</td>
								</tr>
								<tr align="center">
									<td id="searchDate3">${list[4].day}</td>
									<td>${list[4].count+list[5].count}</td>
									<td>
										<button class="ui secondary button" onclick="move(3);">자세히</button>
									</td>
								</tr>
								<tr align="center">
									<td id="searchDate4">${list[6].day}</td>
									<td>${list[6].count+list[7].count}</td>
									<td>
										<button class="ui secondary button" onclick="move(4);">자세히</button>
									</td>
								</tr>
								<tr align="center">
									<td id="searchDate5">${list[8].day}</td>
									<td>${list[8].count+list[9].count}</td>
									<td>
										<button class="ui secondary button" onclick="move(5);">자세히</button>
									</td>
								</tr>
								<tr align="center">
									<td id="searchDate6">${list[10].day}</td>
									<td>${list[10].count+list[11].count}</td>
									<td>
										<button class="ui secondary button" onclick="move(6);">자세히</button>
									</td>
								</tr>
								<tr align="center">
									<td id="searchDate7">${list[12].day}</td>
									<td>${list[12].count+list[13].count}</td>
									<td>
										<button class="ui secondary button" onclick="move(7);">자세히</button>
									</td>
								</tr>
								<tr align="center">
									<td id="searchDate8">${list[14].day}</td>
									<td>${list[14].count+list[15].count}</td>
									<td>
										<button class="ui secondary button" onclick="move(8);">자세히</button>
									</td>
								</tr>
								<tr align="center">
									<td id="searchDate9">${list[16].day}</td>
									<td>${list[16].count+list[17].count}</td>
									<td>
										<button class="ui secondary button" onclick="move(9);">자세히</button>
									</td>
								</tr>
								<tr align="center">
									<td id="searchDate10">${list[18].day}</td>
									<td>${list[18].count+list[19].count}</td>
									<td>
										<button class="ui secondary button" onclick="move(10);">자세히</button>
									</td>
								</tr>
								
							</tbody>
						</table>

					</div>
					<!-- 테이블 종료 -->

				</div>
				<!--중간 div종료 -->
			</div>
		</div>
		<!--  -->
		<br>
		<br>
	</div>
	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	function move(num) {
		var findDate ="";
		switch(num)
		{
		case 1 : findDate = $("#searchDate1").html();break;
		case 2 : findDate = $("#searchDate2").html();break;
		case 3 : findDate = $("#searchDate3").html();break;
		case 4 : findDate = $("#searchDate4").html();break;
		case 5 : findDate = $("#searchDate5").html();break;
		case 6 : findDate = $("#searchDate6").html();break;
		case 7 : findDate = $("#searchDate7").html();break;
		case 8 : findDate = $("#searchDate8").html();break;
		case 9 : findDate = $("#searchDate9").html();break;
		case 10 : findDate = $("#searchDate10").html();break;
		}
		location.href = "/loginLogManageDetail.diet?findDate="+findDate+"&type=non";
		/* var findDate = $("#searchDate" + test).html(); */
		/* ?findDate=" + findDate
				+ "&type=low"; */
	}

	//날짜선택
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
		yearSuffix : '년',
        maxDate: "0D"
	});

	$("#datepicker1").datepicker(
			{
				onSelect : function(dateText) {

					
					var findDate = this.value;
					$.ajax({
						url : '/loginLogManageDetail.diet',
						type : 'post',
						data : {
							'findDate' : findDate,
							'type' : 'non'
						},
						success : function() {
							alert("선택하신 날짜 : " + dateText + " 해당날짜 로그로 이동합니다");
							location.href = "/loginLogManageDetail.diet?findDate="
								+ findDate + "&type=non";
							
						},
						error : function() {
								alert('해당 로그는 없습니다, 관리자에게 문의하세요');
							}
						});
					
					
				}
			});
</script>

</html>