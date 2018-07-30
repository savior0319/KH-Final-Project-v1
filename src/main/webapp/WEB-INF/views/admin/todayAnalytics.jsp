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

		var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
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
	<c:set var="cdtComments"
		value="${requestScope.Current.TCVO.dtComments}" />
	<c:set var="chtComments"
		value="${requestScope.Current.TCVO.htComments}" />
	<c:set var="cbrComments"
		value="${requestScope.Current.TCVO.brComments}" />
	<c:set var="ctotalComments"
		value="${cdtComments+chtComments+cbrComments }" />

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
	<c:set var="btotalComments"
		value="${bdtComments+bhtComments+bbrComments }" />
	<c:set var="bdtBoard" value="${requestScope.Before.dtBoard}" />
	<c:set var="bhtBoard" value="${requestScope.Before.htBoard}" />
	<c:set var="bbrBoard" value="${requestScope.Before.brBoard}" />
	<c:set var="btotalBoard" value="${bdtBoard+bhtBoard+bbrBoard }" />
	<c:set var="bdtLike" value="${requestScope.Before.dtLike}" />
	<c:set var="bhtLike" value="${requestScope.Before.htLike}" />
	<c:set var="bbrLike" value="${requestScope.Before.brLike}" />
	<c:set var="btotalLike" value="${bdtLike+bhtLike+bbrLike }" />




	<c:set var="todayhits" value="${ctotalhits - btotalhits}" />
	<c:set var="todayComments" value="${ctotalComments - btotalComments }" />
	<c:set var="todayBoard" value="${ctotalBoard - btotalBoard}" />
	<c:set var="todayLike" value="${ctotalLike - btotalLike}" />
	<!-- 변수종료 -->

	<!-- CONTENTS -->
	<br>
	<div class="ui container">

		<div class="ui horizontal segments">
			<div class="ui center aligned segment" style="width: 20%">
				<h3>
					<i class="eye icon"></i>   조회수 증가량   
				</h3>
				<div class="ui segment">
					<h4 style="color: green">${todayhits} (▲)</h4>
				</div>
			</div>
			<div class="ui center aligned segment" style="width: 20%">
				<h3>
					<i class="comment alternate outline icon"></i>   댓글 증가량    
				</h3>
				<div class="ui segment">
					<c:choose>
						<c:when test="${todayComments > 0}">
							<h4 style="color: green">
								<c:out value="${todayComments}" />
								(▲)
							</h4>
						</c:when>
						<c:when test="${todayComments == 0}">
							<h4 style="color: black">
								<c:out value="${todayComments}" />
								(-)
							</h4>
						</c:when>
						<c:otherwise>
							<h4 style="color: red">
								<c:out value="${todayComments}" />
								(▼)
							</h4>
						</c:otherwise>
					</c:choose>


				</div>

			</div>
			<div class="ui center aligned segment" style="width: 20%">
				<h3>
					<i class="edit icon"></i>  게시물 증가량
				</h3>
				<div class="ui segment">
					<c:choose>
						<c:when test="${ todayBoard > 0 } ">
							<h4 style="color: green">
								<c:out value="${todayBoard}" />
								(▲)
							</h4>
						</c:when>
						<c:when test="${todayBoard == 0}">
							<h4 style="color: black">
								<c:out value="${todayBoard}" />
								(-)
							</h4>
						</c:when>
						<c:otherwise>
							<h4 style="color: red">
								<c:out value="${todayBoard}" />
								(▼)
							</h4>
						</c:otherwise>
					</c:choose>


				</div>


			</div>
			<div class="ui center aligned segment" style="width: 20%">
				<h3>
					<i class="heart icon"></i> 좋아요 증가량
				</h3>
				<div class="ui segment">
					<c:choose>
						<c:when test="${ todayLike > 0 }">
							<h4 style="color: green">
								<c:out value="${todayLike}" />
								(▲)
							</h4>
						</c:when>
						<c:when test="${todayLike == 0}">
							<h4 style="color: black">
								<c:out value="${todayLike}" />
								(-)
							</h4>
						</c:when>
						<c:otherwise>
							<h4 style="color: red">
								<c:out value="${todayLike}" />
								(▼)
							</h4>
						</c:otherwise>
					</c:choose>

				</div>


			</div>
			
			<div class="ui center aligned segment" style="width: 20%">
				<h3>
					<i class="chart line icon"></i> 방문자수 
				</h3>
				<div class="ui segment">
					<h4 style="color: green">
						${requestScope.OnSessionSize+requestScope.AllSessionSize} (▲)
					</h4>
				</div>


			</div>

		</div>
		<div class="ui horizontal segments">
			<div class="ui center aligned segment" style="width: 50%">
				<c:choose>
					<c:when test="${requestScope.todayInsertMemberSize == 0}">
						<h3>
							<i class="user plus icon"></i> 오늘 가입한 맴버 : <span>
								${requestScope.todayInsertMemberSize} 명 (-)</span>
						</h3>
					</c:when>
					<c:otherwise>
						<h3>
							<i class="user plus icon"></i>   오늘 가입한 맴버 : <span style="color: green">
								${requestScope.todayInsertMemberSize} 명(▲)</span>
						</h3>
					</c:otherwise>
				</c:choose>




				<div class="ui center aligned segment"
				style="overflow: auto; height: 300px">
					<table class="ui celled table">
						<thead>
							<tr align="center">
								<th style="width: 10%">비고</th>
								<th style="width: 30%">아이디</th>
								<th style="width: 30%">닉네임</th>
								<th style="width: 30%">성 별</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.todayInsertMember}" var="is" varStatus="status">
								<tr align="center">
									<td style="width:10%"> <c:out value="${status.index+1}" /></td>
									<td style="width: 30%">${is.mbId}</td>
									<td style="width: 30%">${is.mbNickName}</td>
									<c:choose>
										<c:when test="${is.mbGender eq 'm'}">
											<td style="width: 30%">남 성</td>
										</c:when>
										<c:otherwise>
											<td style="width: 30%">여 성</td>
										</c:otherwise>
									</c:choose>


								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<div class="ui center aligned segment" style="width: 50%">
				<c:choose>
					<c:when test="${requestScope.todayDelMemberSize  == 0}">
						<h3>
							<i class="user times icon"></i>  오늘 탈퇴한 맴버 : <span>
								${requestScope.todayDelMemberSize } 명 (-)</span>
						</h3>
					</c:when>
					<c:otherwise>
						<h3>
							<i class="user times icon"></i>	 오늘 탈퇴한 맴버 : <span style="color: red">
								${requestScope.todayDelMemberSize } 명 (▼)</span>
						</h3>
					</c:otherwise>
				</c:choose>

				<div>
					<table class="ui celled table">
						<thead>
							<tr align="center">	
								<th style="width:10%">비고</th>
								<th style="width:40%">아이디</th>
								<th style="width:15%">닉네임</th>
								<th style="width:15%">성 별</th>
								<th style="width:20%">가입일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.todayDelMember}" var="ds" varStatus="status">
								<tr align="center">
								<td style="width:10%"> <c:out value="${status.index+1}" /></td>
									<td style="width: 40%">${ds.mbId}</td>
									<td style="width: 15%">${ds.mbNickName}</td>
									<c:choose>
										<c:when test="${ds.mbGender eq 'm'}">
											<td style="width: 15%">남 성</td>
										</c:when>
										<c:otherwise>
											<td style="width: 15%">여 성</td>
										</c:otherwise>
									</c:choose>
									<td style="width: 20%">${ds.mbDeleteDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

		</div>

		<div class="ui  segments">

			<div class="ui center aligned segment">
			
				<h3>
						<i class="hourglass  icon"> </i> 현재 접속중인 유저: ${requestScope.OnSessionSize} 명
				</h3>
			</div>
			<div class="ui center aligned segment"
				style="overflow: auto; height: 300px">
				<table class="ui celled table">
					<thead>
						<tr align="center">
							<th style="width: 10%">비고 </th>
							<th style="width: 30%">닉네임</th>
							<th style="width: 30%">기 기</th>
							<th style="width: 30%">I P</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.OnSession}" var="on" varStatus="status">
							<tr align="center">
									<td style="width:10%"> <c:out value="${status.index+1}" /></td>
								<c:choose>
									<c:when test="${on.loginId eq 'NULL'}">
										<td style="width: 30%">비회원</td>
									</c:when>
									<c:otherwise>
										<td style="width: 30%">${on.loginId}</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${on.device eq 'pc' }">
										<td style="width: 30%">P&nbsp;&nbsp;&nbsp; C</td>
									</c:when>
									<c:otherwise>
										<td style="width: 30%">모바일</td>
									</c:otherwise>
								</c:choose>
								<td style="width: 30%">${on.sessionIp}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<br> <br>

			<div class="ui center aligned segment">
				<h3>
					<i class="hourglass outline icon"> </i> 오늘 접속했던 유저 : ${requestScope.AllSessionSize} 명
				</h3>
			</div>
			<div class="ui center aligned segment"
				style="overflow: auto; height: 300px">
				<table class="ui celled table">
					<thead>
						<tr align="center">
							<th style="width: 10%">비고</th>
							<th style="width: 15%">닉네임</th>
							<th style="width: 15%">기 기</th>
							<th style="width: 15%">I P</th>
							<th style="width: 15%">접속시간</th>
							<th style="width: 15%">로그아웃</th>
							<th style="width: 15%">유지시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.AllSession}" var="off" varStatus="status">
							<tr align="center">
										<td><c:out value="${status.index+1}" /></td>
								<c:choose>
									<c:when test="${off.nickName eq 'NULL'}">
										<td style="width: 15%">비회원</td>
									</c:when>
									<c:otherwise>
										<td style="width: 15%">${off.nickName}</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${off.device eq 'pc' }">
										<td style="width: 15%">P&nbsp;&nbsp;&nbsp; C</td>
									</c:when>
									<c:otherwise>
										<td style="width: 15%">모바일</td>
									</c:otherwise>
								</c:choose>
								<td style="width: 15%">${off.sessionIp}</td>
								<td style="width: 15%">${off.firstOn}</td>
								<td style="width: 15%">${off.lastIn}</td>
								<c:choose>
									<c:when test="${off.stay > 60}">
										<td style="width: 15%"><fmt:formatNumber
												value="${off.stay/60.1}" pattern="#" />분</td>
									</c:when>
									<c:otherwise>
										<td style="width: 15%"><fmt:formatNumber
												value="${off.stay}" pattern="#" />초</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

	</div>
	<br>
	<br>
	<br>
	<!-- <div id="chart_div" class="ui segment"
					style="width: 900px; height: 500px;"></div>
			</div> -->

	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>

