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
body {
	margin-left: 240px;
}
</style>

<!--SCRIPT START  -->

<!-- 구글차트1 - 조회수  -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawVisualization);

	function drawVisualization() {
		var data = google.visualization.arrayToDataTable([
				[ 'Month', 'Bolivia', 'Ecuador', 'Madagascar',
						'Papua New Guinea', 'Rwanda', 'Average' ],
				[ '2004/05', 165, 938, 522, 998, 450, 614.6 ],
				[ '2005/06', 135, 1120, 599, 1268, 288, 682 ],
				[ '2006/07', 157, 1167, 587, 807, 397, 623 ],
				[ '2007/08', 139, 1110, 615, 968, 215, 609.4 ],
				[ '2008/09', 136, 691, 629, 1026, 366, 569.6 ] ]);
		var options = {
			title : 'Monthly Coffee Production by Country',
			vAxis : {
				title : 'Cups'
			},
			hAxis : {
				title : 'Month'
			},
			seriesType : 'bars',
			series : {
				5 : {
					type : 'line'
				}
			}
		};

		var chart = new google.visualization.ComboChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>

<!-- SCRIPT END  -->


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/adminheader.jsp"></jsp:include>


	<!-- 변수선언 -->


	<c:set var="cdthits" value="${requestScope.Current.THVO.dtHits}" />
	<c:set var="chthits" value="${requestScope.Current.THVO.htHits}" />
	<c:set var="cbrhits" value="${requestScope.Current.THVO.brHits}" />
	<c:set var="ctotalhits" value="${cdthits+chthits+cbrhits }" />
	<c:set var="cdtComments" value="${requestScope.Current.TCVO.dtComments}" />
	<c:set var="chtComments" value="${requestScope.Current.TCVO.htComments}" />
	<c:set var="cbrComments" value="${requestScope.Current.TCVO.brComments}" />
	<c:set var="ctotalComments" value="${cdtComments+chtComments+cbrComments }" />

	<c:set var="cdtBoard" value="${requestScope.Current.TPVO.dtBoard}" />
	<c:set var="chtBoard" value="${requestScope.Current.TPVO.htBoard}" />
	<c:set var="cbrBoard" value="${requestScope.Current.TPVO.brBoard}" />
	<c:set var="ctotalBoard" value="${cdtBoard+chtBoard+cbrBoard }" />
	<c:set var="cdtLike" value="${requestScope.Current.TLVO.dtLike}" />
	<c:set var="chtLike" value="${requestScope.Current.TLVO.htLike}" />
	<c:set var="cbrLike" value="${requestScope.Current.TLVO.brLike}" />
	<c:set var="ctotalLike" value="${cdtLike+chtLike+cbrLike }" />



	<c:set var="bdthits" value="${requestScope.Before.dtHits}" />
	<c:set var="bhthits" value="${requestScope.Before.htHits}" />
	<c:set var="bbrhits" value="${requestScope.Before.brHits}" />
	<c:set var="btotalhits" value="${bdthits+bhthits+bbrhits }" />
	<c:set var="bdtComments" value="${requestScope.Before.dtComments}" />
	<c:set var="bhtComments" value="${requestScope.Before.htComments}" />
	<c:set var="bbrComments" value="${requestScope.Before.brComments}" />
	<c:set var="btotalComments" value="${bdComments+bhComments+bbrComments }" />
	<c:set var="bdtBoard" value="${requestScope.Before.dtBoard}" />
	<c:set var="bhtBoard" value="${requestScope.Before.htBoard}" />
	<c:set var="bbrBoard" value="${requestScope.Before.brBoard}" />
	<c:set var="btotalBoard" value="${bdtBorad+bhtBoard+bbrBoard }" />
	<c:set var="bdtLike" value="${requestScope.Before.dtLike}" />
	<c:set var="bhtLike" value="${requestScope.Before.htLike}" />
	<c:set var="bbrLike" value="${requestScope.Before.brLike}" />
	<c:set var="btotalLike" value="${bdtLike+bhtLike+bbrLike }" />




	<c:set var="todayhits" value="${ctotalhits- btotalhits}" />
	<c:set var="todayComments" value="${ctotalComments - btotalComments }"/>
	<c:set var="todayBoard" value="${ctotalBoard-btotalBoard} "/>
	<c:set var="todayLike" value="${ctotalLike-btotalLike}"/> 
	<!-- 변수종료 -->

	<!-- CONTENTS -->
	<br>
	<br>
	<div class="ui container">
		<div class="ui center aligned segment">
			<h1>사이트 통계</h1>
		</div>

		<div class="ui horizontal segments">
			<div class="ui center aligned segment" style="width:20%">
				<h3>
					<i> </i> 오늘의 조회수
				</h3>
				<div class="ui segment">
					<c:out value="${todayhits}"></c:out>
				</div>
				<h4 style="color: green">
					<c:out value="${todayhits}" />
					▲ 상승
				</h4>
			</div>
			<div class="ui center aligned segment" style="width:20%">
				<h3>
					<i> </i>댓글수
				</h3>
				<div class="ui segment"> <c:out value="${todayComments }"/>
				</div>
					<h4 style="color: green">
						<c:out value="${todayComments}" />
						▲ 상승
					</h4>
			</div>
			<div class="ui center aligned segment" style="width:20%">
				<h3> <i> </i> 게시물 작성수</h3>
				<div class="ui segment"> <c:out value="${todayBoard}" /></div>
				<h4 style="color: green">
					<c:out value="${todayBoard}" />
					▲ 상승
				</h4>
			</div>
			<div class="ui center aligned segment" style="width:20%">
				<h3><i></i> 좋아요 </h3>
				<div class="ui segment"><c:out value="${todayLike}" /></div>
				<h4 style="color: green">
					<c:out value="${todayLike}" />
					▲ 상승
				</h4>

			</div>

		</div>
		<div class = "ui horizontal segments">
			<div class="ui center aligned segment" style="width:50%">
				<h3>
					<i> </i> 오늘 가입한 맴버 : <span style="color:green"> ${requestScope.todayInsertMemberSize} 명 ▲</span>
				</h3>
				<div>
				<table class="ui celled table">
				<thead>
					<tr align="center">
						<th>아이디</th>
						<th>닉네임</th>
						<th>성  별</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.todayInsertMember}" var="is">
					<tr align="center">
						<td>${is.mbId}</td>
						<td>${is.mbNickName}</td>
						<td>${is.mbGender}</td>
						<td>${is.mbEnrollDate}</td>
					</tr>
					</c:forEach>
				</tbody>
				</table>
				</div>
			</div>
			
			<div class="ui center aligned segment" style="width:50%">
				<h3>
					<i> </i> 오늘 탈퇴한 멤버 : <span style="color:red"> ${requestScope.todayDelMemberSize } 명 ▼ </span>
				</h3>
					<div>
				<table class="ui celled table">
				<thead>
					<tr align="center">
						<th>아이디</th>
						<th>닉네임</th>
						<th>성  별</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.todayDelMember}" var="ds">
					<tr align="center">
						<td>${ds.mbId}</td>
						<td>${ds.mbNickName}</td>
						<td>${ds.mbGender}</td>
						<td>${ds.mbDeleteDate}</td>
					</tr>
					</c:forEach>
				</tbody>
				</table>
				</div>
			</div>
		
		</div>
		
		<div class = "ui  segments">
			
				<div class="ui center aligned segment">
				<h3>
					<i> </i> 현재 접속중인 유저: ${requestScope.OnSessionSize} 명
				</h3>
				</div>
				<div>
				<table class="ui celled table">
				<thead>
					<tr align="center">
						<th style="width:33%">닉네임</th>
						<th style="width:33%">기   기</th>
						<th style="width:33%">I  P</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.OnSession}" var="on">
					<tr align="center">
						<td style="width:33%">${on.loginId}</td>
						<td style="width:33%">${on.device}</td>
						<td style="width:33%">${on.sessionIp}</td>
					</tr>
					</c:forEach>
				</tbody>
				</table>
				</div>
	
				<br>
				<br>
			
				<div class="ui center aligned segment">
				<h3>
					<i> </i> 오늘 접속헀던 유저 : ${requestScope.AllSessionSize} 명
				</h3>
				</div>
					<div>
				<table class="ui celled table">
				<thead>
					<tr align="center">
						<th style="width:15%">닉네임</th>
						<th style="width:15%">기   기</th>
						<th style="width:15%">I  P</th>
						<th style="width:15%">접속시간</th>
						<th style="width:15%">유지시간</th>
						<th style="width:15%">로그아웃</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.AllSession}" var="off">
					<tr align="center">
						<td style="width:15%">${off.nickName}</td>
						<td style="width:15%">${off.device}</td>
						<td style="width:15%">${off.sessionIp}</td>
						<td style="width:15%">${off.firstOn}</td>
						<td style="width:15%">${off.stay+(1-(off.stay%1))%1}초 [ ${off.stay%60} 분]</td>
						<td style="width:15%">${off.lastIn}</td>
					</tr>
					</c:forEach>
				</tbody>
				</table>
		
			</div>
		
		</div>

		<!-- <div id="chart_div" class="ui segment"
					style="width: 900px; height: 500px;"></div>
			</div> -->

		<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">
   
</script>

</html>

