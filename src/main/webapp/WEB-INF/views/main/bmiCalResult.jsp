<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>다이어트</title>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">

	$(document).ready(function() {


		var bmiPoint = ${bmi.bmi}
		var color;

		if(18.5>= bmiPoint && bmiPoint >= 0){
			color='lightgray';
			$('#bmiMsg').html('저체중').css('color', 'red');
		} else if(23> bmiPoint && bmiPoint > 18.5) {
			color='green';
			$('#bmiMsg').html('정상').css('color', 'green');
		} else if(25> bmiPoint && bmiPoint >= 23){
			color='orange';
			$('#bmiMsg').html('비만 전단계').css('color', 'orange');
		} else if(30> bmiPoint && bmiPoint >= 25){
			color='red';
			$('#bmiMsg').html('1단계 비만').css('color', 'red');
		} else if(35> bmiPoint && bmiPoint >= 30){
			color='red';
			$('#bmiMsg').html('2단계 비만').css('color', 'red');
		} else if(bmiPoint >= 35){
			color='red';
			$('#bmiMsg').html('3단계 비만').css('color', 'red');
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
    				ticks: [0,5,10,15,20,25,30,35] // display labels every 25
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
			<br>
			<table class="ui celled table">
				<thead>
					<tr>
						<th>성별</th>
						<th>나이</th>
						<th>키</th>
						<th>몸무게</th>
						<th>BMI 지수</th>
					</tr>
					<tr>
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

			<div class="ui gray message"><div class="ui medium header">당신의 BMI는 "${bmi.bmi}"로 <span id="bmiMsg"></span>입니다</div></div>

			<button type="button" class="ui blue button" onclick="back();">다시하기</button>
		</div>
	</div>
	<br>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
$(document).ready(function() {

	function back(){
		location.href="/bmiCal.diet"
	}
});

</script>

</html>