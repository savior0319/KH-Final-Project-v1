<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>칼로리 처방 결과</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">

	$(document).ready(function() {

		var bmr1 = Number('${bmr.bmr}');
		var bmr2 = bmr1 * 0.1;
		var bmrStr = '${bmr.needCal}';
		var bmr3 = Number('${bmr.needCal}');
		var bmr4 = bmr3 - bmr2 - bmr1;

		google.charts.load("current", {packages:["corechart"]});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			var view = google.visualization.arrayToDataTable([
				['칼로리 처방', '기초대사량', '활동대사량', '소화를 위한 에너지', { role: 'annotation' } ],
				['칼로리', bmr1, bmr2, bmr4, bmrStr + 'Kcal']
				]);

			var options = {
				width: 900,
				height: 200,
				legend: { position: 'bottom', maxLines: 1 },
				isStacked: true
			};
			var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
			chart.draw(view, options);
		}

	});
</script>

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
			<div class="ui large message">
				<div class="ui large header">칼로리 처방(내용추가 필요)</div>
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
						<th>하루소비칼로리</th>
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
			<div align="left">
				<span class="ui large header">하루 소비 칼로리는 <span style="color: red;">'${bmr.needCal}'</span>kcal</span>
			</div>
			<div class="ui center aligned basic segment">
				<div id="barchart_values" style="width: 100%;"></div>
			</div>
			<div align="left">
				※ 하루 소비 칼로리는 일상생활을 하는데 기본적으로 소비되는 칼로리입니다. <br>
				※ 칼로리 처방 시, 선택하는 활동량에 따라 달라질 수 있습니다.  <br>
			</div>
			<br>
			<button id="back"type="button" class="ui button" style="background:rgb(250,40,40); color:white;">다시하기</button>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">

	$('#back').click(function(){
		location.href="/bmrCal.diet";
	});

</script>

</html>