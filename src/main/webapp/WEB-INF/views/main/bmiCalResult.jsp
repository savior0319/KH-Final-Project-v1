<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>BMI 계산 결과</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">

		$(document).ready(function() {


			var bmiPoint = ${bmi.bmi};
			var bmigender = '${bmi.gender}';
			var color;

			if(18.5>= bmiPoint && bmiPoint >= 0){
				color='lightgray';
				$('#bmiMsg').html('저체중').css('color', 'red');

				if(bmigender == '여자'){
					$('#imageBody').html("<img src='/resources/image/body/W_Body1.png' height='120px;'>");
				} else {
					$('#imageBody').html("<img src='/resources/image/body/M_Body1.png' height='120px;'>");
				} 

			} else if(23> bmiPoint && bmiPoint > 18.5) {
				color='green';
				$('#bmiMsg').html('정상').css('color', 'green');

				if(bmigender == '여자'){
					$('#imageBody').html("<img src='/resources/image/body/W_Body2.png' height='120px;'>");
				} else {
					$('#imageBody').html("<img src='/resources/image/body/M_Body2.png' height='120px;'>");
				} 

			} else if(25> bmiPoint && bmiPoint >= 23){
				color='orange';
				$('#bmiMsg').html('비만 전단계').css('color', 'orange');

				if(bmigender == '여자'){
					$('#imageBody').html("<img src='/resources/image/body/W_Body3.png' height='120px;'>");
				} else {
					$('#imageBody').html("<img src='/resources/image/body/M_Body3.png' height='120px;'>");
				} 

			} else if(30> bmiPoint && bmiPoint >= 25){
				color='red';
				$('#bmiMsg').html('1단계 비만').css('color', 'red');

				if(bmigender == '여자'){
					$('#imageBody').html("<img src='/resources/image/body/W_Body4.png' height='120px;'>");
				} else {
					$('#imageBody').html("<img src='/resources/image/body/M_Body4.png' height='120px;'>");
				} 

			} else if(35> bmiPoint && bmiPoint >= 30){
				color='red';
				$('#bmiMsg').html('2단계 비만').css('color', 'red');

				if(bmigender == '여자'){
					$('#imageBody').html("<img src='/resources/image/body/W_Body5.png' height='120px;'>");
				} else {
					$('#imageBody').html("<img src='/resources/image/body/M_Body5.png' height='120px;'>");
				} 

			} else if(bmiPoint >= 35){
				color='red';
				$('#bmiMsg').html('3단계 비만').css('color', 'red');

				if(bmigender == '여자'){
					$('#imageBody').html("<img src='/resources/image/body/W_Body6.png' height='120px;'>");
				} else {
					$('#imageBody').html("<img src='/resources/image/body/M_Body6.png' height='120px;'>");
				} 
			}


			google.charts.load("current", {packages:["corechart"]});
			google.charts.setOnLoadCallback(drawChart);

			function drawChart() {
				var data = google.visualization.arrayToDataTable([

					["Element", "BMI", { role: "style" } ],
					["BMI", bmiPoint, color],

					]);

				var view = new google.visualization.DataView(data);
				view.setColumns([0, 1,
					{ calc: "stringify",
					sourceColumn: 1,
					type: "string",
					role: "annotation" },
					2]);

				var options = {
					title: "비만도(BMI) 검사 결과",
					width: 900,
					height: 150,
					bar: {groupWidth: "55%"},
					legend: { position: "none" },

					hAxis: {
						viewWindow: {
							min: 0,
							max: 35
						},
						ticks: [0,5,10,15,20,25,30,35]
					}
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
			<div class="ui large message"><div class="ui large header">나의 BMI 지수 확인</div></div>
			<table class="ui celled table">
				<thead>
					<tr align="center">
						<th>성별</th>
						<th>나이</th>
						<th>키</th>
						<th>몸무게</th>
						<th>BMI 지수</th>
					</tr>
					<tr align="center">
						<td>${bmi.gender}</td>
						<td>만 ${bmi.age}세</td>
						<td>${bmi.height}cm</td>
						<td>${bmi.weight}kg</td>
						<td>${bmi.bmi}</td>
					</tr>
				</thead>
			</table>
			<div class="ui center aligned basic segment">
				<div id="barchart_values" style="width: 100%; height: 150px;"></div>
			</div>
			<div id="imageBody"></div>
			<br>
			<div class="ui gray message"><div class="ui medium header">당신의 BMI는 ${bmi.bmi}로 "<span id="bmiMsg"></span>"입니다</div></div>
			<br>
			<table class="ui celled table">
				<thead>
					<span class="ui medium header">BMI 표</span>(대한비만학회 기준)
					<tr align="center">
						<th>저체중</th>
						<th>정상</th>
						<th>비만 전단계</th>
						<th>1단계 비만</th>
						<th>2단계 비만</th>
						<th>3단계 비만</th>
					</tr>
					<tr align="center">
						<td>18.5미만</td>
						<td>18.5이상 &nbsp; 23미만</td>
						<td>23이상 &nbsp; 25미만</td>
						<td>25이상 &nbsp; 30미만</td>
						<td>30이상 &nbsp; 35미만</td>
						<td>35이상</td>
					</tr>
				</thead>
			</table>


			<button type="button" class="ui blue button" onclick="back();">다시하기</button>
		</div>
	</div>
	<br>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">

	function back(){
		location.href="/bmiCal.diet"
	}

</script>

</html>