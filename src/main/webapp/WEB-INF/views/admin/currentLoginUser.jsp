<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- 
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include> 
--%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>

<!-- Load the AJAX API -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<!--jQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<!--Script Start -->
<script type="text/javascript">
	google.charts.load('current', {'packages' : [ 'corechart' ]});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Device');
		data.addColumn('number', 'Count');
		data.addRows([
		[ 'PC', ${requestScope.CD.PC}],
		[ 'Mobile', ${requestScope.CD.MOBILE}]
		]);
		var options = {'width' : 700,'height' : 300};
		var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
		//var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>


<script type="text/javascript">
//선형차트
google.charts.load('current', {'packages':['line']});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
var data = new google.visualization.DataTable();
 data.addColumn('string', '시간대');
 data.addColumn('number', '회원 ');
 data.addColumn('number', '비회원');
 data.addRows([
   ['00 - 12', ${requestScope.CD.atoBOn}, ${requestScope.CD.atoBOff}],
   ['12 - 15', ${requestScope.CD.btoCOn}, ${requestScope.CD.btoCOff}],
   ['15 - 18', ${requestScope.CD.ctoDOn}, ${requestScope.CD.ctoDOff}],
   ['18 - 21', ${requestScope.CD.dtoEOn}, ${requestScope.CD.dtoEOff}],
   ['21 - 24', ${requestScope.CD.etoFOn}, ${requestScope.CD.etoFOff}]
 ]);
 var options = {width: 450, height: 300};
 var chart = new google.charts.Line(document.getElementById('linechart_material'));
 /* chart.draw(data, google.charts.Line.convertOptions(options)); */
 chart.draw(data,options);
}
</script>






<title>관리자</title>
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
	<br>
	<div class="ui container">
		<div class="ui horizontal segments">
			<div class="ui center aligned segment" style="width: 50%">
				<div class="ui center aligned segment">
					<h3><i class="address book icon"></i>&nbsp현재 접속자 : ${requestScope.size} 명</h3>
				</div>

				<div class="ui center aligned segment">
					<table class="ui celled table">
						<thead>
							<tr align="center">
								<th>IP</th>
								<th>로그인</th>
								<th>닉네임</th>
								<th>최초 방문 시간</th>
								<th>접속기기</th>

							</tr>
						</thead>
						<tbody>
						<c:choose>
						<c:when test="${requestScope.size==0}">
						<tr >
						<td style="height:50px"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						</tr>
						<tr >
						<td style="height:50px"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						</tr>
						</c:when>
						<c:otherwise>
						<c:forEach items="${requestScope.currentSession.ssList}" var="ss">
								<tr align="center">
									<td>${ss.sessionIp}</td>
									<td>${ss.state }</td>
									<c:choose>
										<c:when test="${ss.state eq 'OFF'}">
											<td>비회원</td>
										</c:when>
										<c:when test="${ss.state eq 'ON'}">
											<td>${ss.logInNickName }</td>
										</c:when>
									</c:choose>
									<td>${ss.firstOn }</td>
									<c:choose>
										<c:when test="${ss.device eq 'pc'}">
											<td> <i class="desktop icon"></i> PC</td>
										</c:when>
										<c:otherwise>
											<td> <i class="mobile alternate icon"></i>MOBILE</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						<div class="ui center aligned basic segment">
						
						</div>
						
						</c:otherwise>
						</c:choose>							
						</tbody>
						
					</table>
					<div class="ui pagination menu">${requestScope.currentSession.pageNavi}</div>
				</div>
			</div>
			<div class="ui center aligned segment"
				style="overflow: auto; height: 300px; width: 50%">
				<div class="ui center aligned segment">
					<h3><i class="address book outline icon">&nbsp</i>오늘접속자 : ${requestScope.totalSize} 명</h3>
				</div>
			
				<table class="ui celled table">
					<thead>
						<tr align="center">
							<th>IP</th>
							<th>닉네임</th>
							<th>최초 방문 시간</th>
							<th>유지시간</th>
							<th>접속기기</th>

						</tr>
					</thead>
					<tbody>
						<c:choose>
						<c:when test="${requestScope.totalSize==0}">
						<tr >
						<td style="height:50px"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						</tr>
						<tr >
						<td style="height:50px"></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						</tr>
						</c:when>
						<c:otherwise>
						<c:forEach items="${requestScope.onList}" var="aa">
							<tr align="center">
								<td>${aa.sessionIp}</td>
								<c:choose>
									<c:when test="${aa.nickName eq 'NULL'}">
										<td>비회원</td>
									</c:when>
									<c:otherwise>
										<td>${aa.nickName}</td>
									</c:otherwise>
								</c:choose>
								<td>${aa.firstOn}</td>
								<c:choose>
									<c:when test="${aa.stay > 60}">
										<td><fmt:formatNumber value="${aa.stay/60.1}" pattern="#" />분</td>
									</c:when>
									<c:otherwise>
										<td style="width: 15%"><fmt:formatNumber
												value="${aa.stay}" pattern="#" />초</td>
									</c:otherwise>
								</c:choose>

								<c:choose>
									<c:when test="${aa.device eq 'pc'}">
										<td> <i class="desktop icon"></i> PC</td>
									</c:when>
									<c:otherwise>
										<td> <i class="mobile alternate icon"></i> MOBILE</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
						</c:otherwise>
						</c:choose>
						
					</tbody>
				</table>

			</div>

			<br>
		</div>



		<div class="ui horizontal segments">
			<div class="ui segment" style="width: 100%; display: on">
				<div class="ui center aligned segment">
					<h3> <i class="chart pie icon"></i> &nbsp사용자 접속 기기 분류</h3>
				</div>
				<!-- 원형차트  -->
				<div id="chart_div"></div>
				<table class="ui celled table">
					<thead>
						<tr align="center">
							<th style="width: 50%"> <i class="desktop icon"></i> PC</th>
							<th style="width: 50%"> <i class="mobile alternate icon"></i> MOBILE</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<td>${requestScope.CD.PC}명</td>
							<td>${requestScope.CD.MOBILE}명</td>
						</tr>
					</tbody>
				</table>

			</div>

			<div class="ui segment" style="width: 100%; display: on">
				<div class="ui center aligned segment">
					<h3><i class="chart line icon"></i> &nbsp 접속시간대 분석 &nbsp</h3>
				</div>
				<!-- 그래프  -->
				<div id="linechart_material"></div>
				<table class="ui celled table">
					<thead>
						<tr align="center">
							<th style="width: 33%">시간</th>
							<th style="width: 33%">회원</th>
							<th style="width: 33%">비회원</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<td style="width: 33%">00시 - 12시</td>
							<td style="width: 33%">${requestScope.CD.atoBOn}명</td>
							<td style="width: 33%">${requestScope.CD.atoBOff}명</td>
						</tr>
						<tr align="center">
							<td style="width: 33%">12시 - 15시</td>
							<td style="width: 33%">${requestScope.CD.btoCOn}명</td>
							<td style="width: 33%">${requestScope.CD.btoCOff}명</td>
						</tr>
						<tr align="center">
							<td style="width: 33%">15시 - 18시</td>
							<td style="width: 33%">${requestScope.CD.ctoDOn}명</td>
							<td style="width: 33%">${requestScope.CD.ctoDOff}명</td>
						</tr>
						<tr align="center">
							<td style="width: 33%">18시 - 21시</td>
							<td style="width: 33%">${requestScope.CD.dtoEOn}명</td>
							<td style="width: 33%">${requestScope.CD.dtoEOff}명</td>
						</tr>
						<tr align="center">
							<td style="width: 33%">21시 - 24시</td>
							<td style="width: 33%">${requestScope.CD.etoFOn}명</td>
							<td style="width: 33%">${requestScope.CD.etoFOff}명</td>
						</tr>
					</tbody>
				</table>
			</div>
			<br> <br>
		</div>
		<!-- 		
		<div class="ui horizontal segments">

			<div class="ui center aligned segment" style="width: 50%">
				<h5>접속시간</h5>
			</div>
			<div class="ui center aligned segment" style="width: 50%"></div>

		</div> 
		-->
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>