<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include> 

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

<!-- 선형차트 - 7일간 접속자명단  -->
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawVisualization);

	function drawVisualization() {
		var data = google.visualization.arrayToDataTable([
				[ '기간','회원', '비회원', '합계'],
				[ '1일 전', ${requestScope.graph7b.count}, ${requestScope.graph7a.count},${requestScope.graph7b.count}+${requestScope.graph7a.count}],
				[ '2일 전', ${requestScope.graph6b.count}, ${requestScope.graph6a.count},${requestScope.graph6b.count}+${requestScope.graph6a.count}],
				[ '3일 전', ${requestScope.graph5b.count}, ${requestScope.graph5a.count},${requestScope.graph5b.count}+${requestScope.graph5a.count}],
				[ '4일 전',  ${requestScope.graph4b.count}, ${requestScope.graph4a.count},${requestScope.graph4b.count}+${requestScope.graph4a.count}],
				[ '5일 전',  ${requestScope.graph3b.count}, ${requestScope.graph3a.count},${requestScope.graph3b.count}+${requestScope.graph3a.count}],
				[ '6일 전',  ${requestScope.graph2b.count}, ${requestScope.graph2a.count},${requestScope.graph2b.count}+${requestScope.graph2a.count}],
				[ '7일 전', ${requestScope.graph1b.count}, ${requestScope.graph1a.count},${requestScope.graph1b.count}+${requestScope.graph1a.count}]]);
		var options = {
			selectionMode: 'multiple',
			tooltip: {trigger: 'selection'},
			aggregationTarget: 'category',
			seriesType : 'bars',
			series : {
				3 : {
					type : 'line'
				}
			}
		};

		var chart = new google.visualization.ComboChart(document
				.getElementById('chart_div_7seven'));
		chart.draw(data, options);
	}
</script>


<title>관리자 - 접속자 통계</title>
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
		<div class="ui center aligned segment">
			<h1>관리자 통계(접속자)</h1>
		</div>
		<div class="ui horizontal segments">
			<div class="ui center aligned segment" style="width: 50%">
				<div class="ui center aligned segment">
					<h3>
						<i class="address book icon"></i>&nbsp;현재 접속자 :
						${requestScope.size} 명
					</h3>
				</div>

				<div class="ui center aligned segment"
					style="overflow: auto; height: 300px;">
					<table class="ui celled table">
						<thead>
							<tr align="center">
								<th>IP</th>
								<th>로그인</th>
								<th>닉네임</th>
								<th>접속 시간</th>
								<th>기기</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${requestScope.size==0}">
									<tr>
										<td style="height: 40px"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td style="height: 40px"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td style="height: 40px"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td style="height: 40px"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td style="height: 40px"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</c:when>
								<c:when test="${requestScope.size==1}">
									<c:forEach items="${requestScope.currentSession.ssList}"
										var="ss">
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
													<td>PC</td>
												</c:when>
												<c:otherwise>
													<td>MOBILE</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
									<tr>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									</tr>
									<tr>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									</tr>
									<tr>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									</tr>
									<tr>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									</tr>
								</c:when>
								<c:when test="${requestScope.size==2}">
									<c:forEach items="${requestScope.currentSession.ssList}"
										var="ss">
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
													<td>PC</td>
												</c:when>
												<c:otherwise>
													<td>MOBILE</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
									<tr>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									</tr>
									<tr>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									</tr>
									<tr>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									</tr>
								</c:when>
								<c:when test="${requestScope.size==3}">
									<c:forEach items="${requestScope.currentSession.ssList}"
										var="ss">
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
													<td>PC</td>
												</c:when>
												<c:otherwise>
													<td>MOBILE</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
									<tr>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									</tr>
									<tr>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									</tr>
								</c:when>
								<c:when test="${requestScope.size==4}">
									<c:forEach items="${requestScope.currentSession.ssList}"
										var="ss">
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
													<td>PC</td>
												</c:when>
												<c:otherwise>
													<td>MOBILE</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
									<tr>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									<td style="height: 40px"></td>
									</tr>
								</c:when>
								
								<c:otherwise>
									<c:forEach items="${requestScope.currentSession.ssList}"
										var="ss">
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
													<td>PC</td>
												</c:when>
												<c:otherwise>
													<td>MOBILE</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
									<div class="ui center aligned basic segment"></div>
								</c:otherwise>
							</c:choose>
						</tbody>

					</table>
				</div>
				<%-- <div class="ui pagination menu">${requestScope.currentSession.pageNavi}</div>  네비삭제--%>

			</div>
			<div class="ui center aligned segment" style="width: 50%">
				<div class="ui center aligned segment">
					<h3>
						<i class="address book outline icon">&nbsp;</i>오늘 접속자 :
						${requestScope.totalSize} 명
					</h3>
				</div>

				<div class="ui center aligned segment"
					style="overflow: auto; height: 300px;">
					<table class="ui celled table">
						<thead>
							<tr align="center">
								<th>IP</th>
								<th>닉네임</th>
								<th>접속 시간</th>
								<th>유지시간</th>
								<th>기기</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${requestScope.totalSize==0}">
									<tr>
										<td style="height: 40px"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td style="height: 40px"></td>
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
													<td><fmt:formatNumber value="${aa.stay/60.1}"
															pattern="#" />분</td>
												</c:when>
												<c:otherwise>
													<td><fmt:formatNumber value="${aa.stay}" pattern="#" />초</td>
												</c:otherwise>
											</c:choose>
											<c:choose>
												<c:when test="${aa.device eq 'pc'}">
													<td>PC</td>
												</c:when>
												<c:otherwise>
													<td>MOBILE</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>



		<div class="ui horizontal segments">
			<div class="ui segment" style="width: 100%; display: on">
				<div class="ui center aligned segment">
					<h3>
						<i class="chart pie icon"></i> &nbsp;사용자 접속 기기 분류
					</h3>
				</div>
				<!-- 원형차트  -->
				<div id="chart_div"></div>
				<table class="ui celled table">
					<thead>
						<tr align="center">
							<th style="width: 50%"><i class="desktop icon"></i> PC</th>
							<th style="width: 50%"><i class="mobile alternate icon"></i>
								MOBILE</th>
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
					<h3>
						<i class="chart line icon"></i> &nbsp; 접속시간대 분석 &nbsp;
					</h3>
				</div>
				<!-- 그래프  -->
				<div id="linechart_material"></div>
				<table class="ui celled table">
					<thead>
						<tr align="center">
							<th style="width: 33%"><i class="clock outline icon"></i> 시간</th>
							<th style="width: 33%"><i class="user plus icon"></i>
								&nbsp;&nbsp;회원</th>
							<th style="width: 33%"><i class="user times icon"></i>
								&nbsp;&nbsp;비회원</th>
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
		<!-- 일주일 단위 접속자 내역 보여주기 -->
		<div class="ui center aligned segment">
			<div class="ui center aligned segment">
				<h3><i class="signal icon"></i> 지난 7일간 접속자 분석</h3>
			</div>
			<div class="ui horizontal segments">
				<!-- 그래프 보여주기 -->
		<div id="chart_div_7seven" style="width: 60%;">
				
				</div>
				
				<!-- 리스트보여주기  -->
				<div class="ui center aligned segment" ;style="width: 40%">
				<table class="ui celled table">
					<thead>
						<tr align="center">
							<th style="width: 50%"><i class="clock outline icon"></i> 기간</th>
							<th style="width: 25%"><i class="user plus icon"></i>
								&nbsp;&nbsp;회원</th>
							<th style="width: 25%"><i class="user times icon"></i>
								&nbsp;&nbsp;비회원</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
								<td>${requestScope.graph7a.day} / 1일전</td>
								<td>${requestScope.graph7b.count} 명</td>
								<td>${requestScope.graph7a.count} 명</td>
						</tr>
						<tr align="center">
								<td>${requestScope.graph6a.day} / 2일전</td>
								<td>${requestScope.graph6b.count} 명</td>
								<td>${requestScope.graph6a.count} 명</td>
						</tr>
						<tr align="center">
								<td>${requestScope.graph5a.day} / 3일전</td>
								<td>${requestScope.graph5b.count} 명</td>
								<td>${requestScope.graph5a.count} 명</td>
						</tr>
						<tr align="center">
								<td>${requestScope.graph4a.day} / 4일전</td>
								<td>${requestScope.graph4b.count} 명</td>
								<td>${requestScope.graph4a.count} 명</td>
						</tr>
						<tr align="center">
								<td>${requestScope.graph3a.day} / 5일전</td>
								<td>${requestScope.graph3b.count} 명</td>
								<td>${requestScope.graph3a.count} 명</td>
						</tr>
						<tr align="center">
								<td>${requestScope.graph2a.day} / 6일전</td>
								<td>${requestScope.graph2b.count} 명</td>
								<td>${requestScope.graph2a.count} 명</td>
						</tr>
						<tr align="center">
								<td>${requestScope.graph1a.day} / 7일전</td>
								<td>${requestScope.graph1b.count} 명</td>
								<td>${requestScope.graph1a.count} 명</td>
						</tr>
						
					</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
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