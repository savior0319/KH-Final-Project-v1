<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include> 

<!DOCTYPE html>
<html>
<head>

<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>관리자 - 사이트 통계</title>
</head>

<!-- CSS -->
<style>
body {
	margin-left: 240px;
}
</style>

<!--SCRIPT START  -->


<!-- Load the AJAX API -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<!--jQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.js"></script>



<!-- 구글차트1 - 조회수  -->
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawVisualization);

	function drawVisualization() {
		var data = google.visualization.arrayToDataTable([
				[ '종류','조회수', '댓글', '게시물', '평균','좋아요','총계' ],
				[ '다이어트팁', ${thits}, ${tcomments},${tpost}, ${thits+tlike+tcomments+tpost},${tlike}, ${thits+tlike+tcomments+tpost/4}  ],
				[ '홈트레이닝', ${hhits}, ${hcomments},${hpost}, ${hhits+hlike+hcomments+hpost}, ${hlike}, ${hhits+hlike+hcomments+hpost/4} ],
				[ '커뮤니티', ${chits}, ${ccomments},${cpost}, ${chits+clike+ccomments+cpost},  ${clike}, ${chits+clike+ccomments+cpost/4}]]);
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
				.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>

<script type="text/javascript">
//선형차트 - 다이어트팁
google.charts.load('current', {'packages':['line']});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
var data = new google.visualization.DataTable();
 data.addColumn('string', '시간대');
 data.addColumn('number', '조회수');
 data.addColumn('number', '댓글');
 data.addColumn('number', '게시물');
 data.addColumn('number', '좋아요');
 if(${currentTime==5})
{
 data.addRows([
   ['00 - 12', ${T1.hits}, ${T1.comments}, ${T1.post}, ${T1.likes}],
   ['12 - 15', ${T2.hits}, ${T2.comments}, ${T2.post}, ${T2.likes}],
   ['15 - 18', ${T3.hits}, ${T3.comments}, ${T3.post}, ${T3.likes}],
   ['18 - 21', ${T4.hits}, ${T4.comments}, ${T4.post}, ${T4.likes}],
   ['21 - 24', ${T5.hits}, ${T5.comments}, ${T5.post}, ${T5.likes}]
   ]);
}
 else if(${currentTime==4})
 {
	 data.addRows([
		   ['00 - 12', ${T1.hits}, ${T1.comments}, ${T1.post}, ${T1.likes}],
		   ['12 - 15', ${T2.hits}, ${T2.comments}, ${T2.post}, ${T2.likes}],
		   ['15 - 18', ${T3.hits}, ${T3.comments}, ${T3.post}, ${T3.likes}],
		   ['18 - 21', ${T4.hits}, ${T4.comments}, ${T4.post}, ${T4.likes}]
		   ]); 
 }
 else if(${currentTime==3})
 {
	 data.addRows([
		   ['00 - 12', ${T1.hits}, ${T1.comments}, ${T1.post}, ${T1.likes}],
		   ['12 - 15', ${T2.hits}, ${T2.comments}, ${T2.post}, ${T2.likes}],
		   ['15 - 18', ${T3.hits}, ${T3.comments}, ${T3.post}, ${T3.likes}]
		   ]);
 }
 else if(${currentTime==2})
 {
	 data.addRows([
		   ['00 - 12', ${T1.hits}, ${T1.comments}, ${T1.post}, ${T1.likes}],
		   ['12 - 15', ${T2.hits}, ${T2.comments}, ${T2.post}, ${T2.likes}]
		   ]);
 }
 else if(${currentTime==1})
 {
	 data.addRows([
		   ['00 - 12', ${T1.hits}, ${T1.comments}, ${T1.post}, ${T1.likes}]
		   ]);
 }
 var options = {width: 500, height: 400};
 var chart = new google.charts.Line(document.getElementById('linechart_material'));
 /* chart.draw(data, google.charts.Line.convertOptions(options)); */
 chart.draw(data,options);
}
</script>


<script type="text/javascript">
//선형차트 - 홈트레이닝
google.charts.load('current', {'packages':['line']});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
var data = new google.visualization.DataTable();
data.addColumn('string', '시간대');
data.addColumn('number', '조회수');
data.addColumn('number', '댓글');
data.addColumn('number', '게시물');
data.addColumn('number', '좋아요');
 if(${currentTime==5})
{
 data.addRows([
   ['00 - 12', ${H1.hits}, ${H1.comments}, ${H1.post}, ${H1.likes}],
   ['12 - 15', ${H2.hits}, ${H2.comments}, ${H2.post}, ${H2.likes}],
   ['15 - 18', ${H3.hits}, ${H3.comments}, ${H3.post}, ${H3.likes}],
   ['18 - 21', ${H4.hits}, ${H4.comments}, ${H4.post}, ${H4.likes}],
   ['21 - 24', ${H5.hits}, ${H5.comments}, ${H5.post}, ${H5.likes}]
   ]);
}
 else if(${currentTime==4})
 {
	 data.addRows([
		   ['00 - 12', ${H1.hits}, ${H1.comments}, ${H1.post}, ${H1.likes}],
		   ['12 - 15', ${H2.hits}, ${H2.comments}, ${H2.post}, ${H2.likes}],
		   ['15 - 18', ${H3.hits}, ${H3.comments}, ${H3.post}, ${H3.likes}],
		   ['18 - 21', ${H4.hits}, ${H4.comments}, ${H4.post}, ${H4.likes}]
		   ]); 
 }
 else if(${currentTime==3})
 {
	 data.addRows([
		   ['00 - 12', ${H1.hits}, ${H1.comments}, ${H1.post}, ${H1.likes}],
		   ['12 - 15', ${H2.hits}, ${H2.comments}, ${H2.post}, ${H2.likes}],
		   ['15 - 18', ${H3.hits}, ${H3.comments}, ${H3.post}, ${H3.likes}]]);
 }
 else if(${currentTime==2})
 {
	 data.addRows([
		   ['00 - 12', ${H1.hits}, ${H1.comments}, ${H1.post}, ${H1.likes}],
		   ['12 - 15', ${H2.hits}, ${H2.comments}, ${H2.post}, ${H2.likes}]
		   ]);
 }
 else if(${currentTime==1})
 {
	 data.addRows([
		   ['00 - 12', ${H1.hits}, ${H1.comments}, ${H1.post}, ${H1.likes}]
		   ]);
 }
 var options = {width: 500, height: 400};
 var chart = new google.charts.Line(document.getElementById('linechart_material2'));
 /* chart.draw(data, google.charts.Line.convertOptions(options)); */
 chart.draw(data,options);
}
</script>


<script type="text/javascript">
//선형차트 - 커뮤니티
google.charts.load('current', {'packages':['line']});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
var data = new google.visualization.DataTable();
data.addColumn('string', '시간대');
data.addColumn('number', '조회수');
data.addColumn('number', '댓글');
data.addColumn('number', '게시물');
data.addColumn('number', '좋아요');
 if(${currentTime==5})
{
 data.addRows([
   ['00 - 12', ${C1.hits}, ${C1.comments}, ${C1.post}, ${C1.likes}],
   ['12 - 15', ${C2.hits}, ${C2.comments}, ${C2.post}, ${C2.likes}],
   ['15 - 18', ${C3.hits}, ${C3.comments}, ${C3.post}, ${C3.likes}],
   ['18 - 21', ${C4.hits}, ${C4.comments}, ${C4.post}, ${C4.likes}],
   ['21 - 24', ${C5.hits}, ${C5.comments}, ${C5.post}, ${C5.likes}]
   ]);
}
 else if(${currentTime==4})
 {
	 data.addRows([
		   ['00 - 12', ${C1.hits}, ${C1.comments}, ${C1.post}, ${C1.likes}],
		   ['12 - 15', ${C2.hits}, ${C2.comments}, ${C2.post}, ${C2.likes}],
		   ['15 - 18', ${C3.hits}, ${C3.comments}, ${C3.post}, ${C3.likes}],
		   ['18 - 21', ${C4.hits}, ${C4.comments}, ${C4.post}, ${C4.likes}]
		   ]); 
 }
 else if(${currentTime==3})
 {
	 data.addRows([
		   ['00 - 12', ${C1.hits}, ${C1.comments}, ${C1.post}, ${C1.likes}],
		   ['12 - 15', ${C2.hits}, ${C2.comments}, ${C2.post}, ${C2.likes}],
		   ['15 - 18', ${C3.hits}, ${C3.comments}, ${C3.post}, ${C3.likes}]
		   ]);
 }
 else if(${currentTime==2})
 {
	 data.addRows([
		   ['00 - 12', ${C1.hits}, ${C1.comments}, ${C1.post}, ${C1.likes}],
		   ['12 - 15', ${C2.hits}, ${C2.comments}, ${C2.post}, ${C2.likes}]
		   ]);
 }
 else if(${currentTime==1})
 {	
	 data.addRows([
		   ['00 - 12', ${C1.hits}, ${C1.comments}, ${C1.post}, ${C1.likes}]
		   ]);
 }
 var options = {width: 500, height: 400};
 var chart = new google.charts.Line(document.getElementById('linechart_material3'));
 /* chart.draw(data, google.charts.Line.convertOptions(options)); */
 chart.draw(data,options);
}
</script>





<!-- SCRIPT END  -->


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/adminheader.jsp"></jsp:include>


	<!-- 변선언 -->
	

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
		value="${cdtComments+chtComments+cbrComments}" />

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
		value="${bdtComments+bhtComments+bbrComments}" />
	<c:set var="bdtBoard" value="${requestScope.Before.dtBoard}" />
	<c:set var="bhtBoard" value="${requestScope.Before.htBoard}" />
	<c:set var="bbrBoard" value="${requestScope.Before.brBoard}" />
	<c:set var="btotalBoard" value="${bdtBoard+bhtBoard+bbrBoard }" />
	<c:set var="bdtLike" value="${requestScope.Before.dtLike}" />
	<c:set var="bhtLike" value="${requestScope.Before.htLike}" />
	<c:set var="bbrLike" value="${requestScope.Before.brLike}" />
	<c:set var="btotalLike" value="${bdtLike+bhtLike+bbrLike }" />


	<c:set var="todayhits" value="${ctotalhits - btotalhits}" />
	<c:set var="todayComments" value="${ctotalComments - btotalComments}" />
	<c:set var="todayBoard" value="${ctotalBoard - btotalBoard}" />
	<c:set var="todayLike" value="${ctotalLike - btotalLike}" />
	<!-- 변종료 -->

	<!-- CONTENTS -->
	<br>
	<div class="ui container">
		<div class="ui center aligned segment">
			<h1>관리자 통계 (사이트)</h1>
		</div>
		<div class="ui horizontal segments">
			<div class="ui center aligned segment" style="width: 20%">
				<h3>
					<i class="eye icon"></i> 조회수 증가량
				</h3>
				<div class="ui segment">
					<c:choose>
						<c:when test="${thits+chits+hhits>0}">
							<h4 style="color: green">
								<c:out value="${thits+chits+hhits}" />
								(▲)
							</h4>
						</c:when>
						<c:when test="${thits+chits+hhits==0}">
							<h4 style="color: black">
								<c:out value="${thits+chits+hhits}" />
								(-)
							</h4>
						</c:when>
						<c:otherwise>
							<h4 style="color: red">
								<c:out value="${thits+chits+hhits}" />
								(▼)
							</h4>
						</c:otherwise>
					</c:choose>
				</div>

			</div>
			<div class="ui center aligned segment" style="width: 20%">
				<h3>
					<i class="comment alternate outline icon"></i> 댓글 증감량
				</h3>
				<div class="ui segment">
					<c:choose>
						<c:when test="${todayComments>0}">
							<h4 style="color: green">
								<c:out value="${todayComments}" />
								(▲)
							</h4>
						</c:when>
						<c:when test="${todayComments==0}">
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
					<i class="edit icon"></i> 게시물 증감량
				</h3>
				<div class="ui segment">
					<c:choose>
						<c:when test="${todayBoard>0}">
							<h4 style="color: green">
								<c:out value="${todayBoard}" />
								(▲)
							</h4>
						</c:when>
						<c:when test="${todayBoard==0}">
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
					<i class="heart icon"></i> 좋아요 증감량
				</h3>
				<div class="ui segment">
					<c:choose>
						<c:when test="${todayLike>0}">
							<h4 style="color: green">
								<c:out value="${todayLike}" />
								(▲)
							</h4>
						</c:when>
						<c:when test="${todayLike==0}">
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
					<i class="chart line icon"></i> 방문자
				</h3>
				<div class="ui segment">
					<h4 style="color: green">
						${requestScope.OnSessionSize+requestScope.AllSessionSize} (▲)</h4>
				</div>


			</div>

		</div>
		<div class="ui horizontal segments">
			<div class="ui center aligned segment" style="width: 50%">
				<c:choose>
					<c:when test="${requestScope.todayInsertMemberSize == 0}">
						<h3>
							<i class="user plus icon"></i> 오늘 가입한 멤버 : <span>
								${requestScope.todayInsertMemberSize} 명 (-)</span>
						</h3>
					</c:when>
					<c:otherwise>
						<h3>
							<i class="user plus icon"></i> 오늘 가입한 멤버 : <span
								style="color: green">
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
								<th style="width: 20%"><i class="address card outline icon"></i>
									아이디</th>
								<th style="width: 20%"><i class="address card icon"></i>
									닉네임</th>
								<th style="width: 20%"><i class="venus mars icon"></i> 성 별</th>
								<th style="width: 20%"><i class="user secret icon"></i></i> 등 급</th>

							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${requestScope.todayInsertMemberSize==0}">
									<tr>
										<td style="height: 100px"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
									<tr>
										<td style="height: 100px"></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${requestScope.todayInsertMember}" var="is"
										varStatus="status">
										<tr align="center">
											<td style="width: 11%"><c:out value="${status.index+1}" /></td>
											<c:choose>
														<c:when test="${fn:length(is.mbId)>17}">
															<td style="width: 20%">
															<c:out value="${fn:substring(is.mbId,0,13)}"/>..
															</td>
														</c:when>
														<c:otherwise>
															<td style="width: 20%">${is.mbId}</td>
														</c:otherwise>
											</c:choose>
											<td style="width: 20%">${is.mbNickName}</td>
											<c:choose>
												<c:when test="${is.mbGender eq 'm'}">
													<td style="width: 22%">남 성 ( <i class="male icon"></i>)
													</td>
												</c:when>
												<c:when test="${is.mbGender eq 'f'}">
													<td style="width: 22%">여 성 ( <i class="female icon"></i>)
													</td>
												</c:when>
												<c:otherwise>
													<td style="width: 22%">카카오회원 ( <i
														class="github alternate icon"></i>)
													</td>
												</c:otherwise>
											</c:choose>
											<td style="width: 20%">${is.mbGrade}</td>

										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

						</tbody>
					</table>
				</div>
			</div>

			<div class="ui center aligned segment" style="width: 50%">
				<c:choose>
					<c:when test="${requestScope.todayDelMemberSize  == 0}">
						<h3>
							<i class="user times icon"></i> 오늘 탈퇴한 멤버 : <span>
								${requestScope.todayDelMemberSize } 명 (-)</span>
						</h3>
					</c:when>
					<c:otherwise>
						<h3>
							<i class="user times icon"></i> 오늘 탈퇴한 멤버 : <span
								style="color: red"> ${requestScope.todayDelMemberSize } 명
								(▼)</span>
						</h3>
					</c:otherwise>
				</c:choose>

				<div class="ui center aligned segment"
					style="overflow: auto; height: 300px">
					<table class="ui celled table">
						<thead>
							<tr align="center">
								<th style="width: 11%">비고</th>
								<th style="width: 25%"><i class="address card outline icon"></i>
									아이디</th>
								<!-- <th style="width: 22%"><i class="venus mars icon"></i> 성 별</th> -->
								<th style="width: 21%"><i class="calendar plus icon"></i>가입일</th>
								<th style="width: 22%"><i class="user secret icon"></i></i> 등 급</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${requestScope.todayDelMemberSize==0}">
									<tr>
										<td style="height: 100px"></td>
										<td></td>
										<td></td>
										<!-- <td></td> -->
										<td></td>
									</tr>
									<tr>
										<td style="height: 100px"></td>
										<td></td>
										<td></td>
										<!-- <td></td> -->
										<td></td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${requestScope.todayDelMember}" var="ds"
										varStatus="status">
										<tr align="center">
											<td style="width: 13%"><c:out value="${status.index+1}" /></td>
											<c:choose>
														<c:when test="${fn:length(ds.mbId)>17}">
															<td style="width: 20%">
															<c:out value="${fn:substring(ds.mbId,0,10)}"/>..
															</td>
														</c:when>
														<c:otherwise>
															<td style="width: 20%">${ds.mbId}</td>
														</c:otherwise>
											</c:choose>
											<%-- <c:choose>
												<c:when test="${ds.mbGender eq 'm'}">
													<td style="width: 20%">남 성 ( <i class="male icon"></i>)
													</td>
												</c:when>
												<c:when test="${ds.mbGender eq 'f'}">
													<td style="width: 20%">여 성 ( <i class="female icon"></i>)
													</td>
												</c:when>
												<c:otherwise>
													<td style="width: 20%">카카오회원 ( <i
														class="github alternate icon"></i>)
													</td>
												</c:otherwise>
											</c:choose> --%>
											<td style="width: 25%">${ds.mbDeleteDate}</td>
											<td style="width: 28%">${ds.mbGrade}</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>

						</tbody>
					</table>
				</div>
			</div>
		</div>
		<br>
		<div class="ui center aligned segment">
			<div class="ui center aligned segment">
				<h3>전체 게시판 통계</h3>
			</div>
			<div class="ui horizontal segments" style="width: 100%">

				<div id="chart_div" class="ui segment"
					style="width: 100%; height: 500px"></div>

			</div>
			<div class="ui center aligned segment" style="width: 100%">
				<table class="ui celled table">
					<thead>
						<tr align="center">
							<th style="width: 15%">비고 / 분류</th>
							<th style="width: 15%"><i class="eye icon"></i> 조회수</th>
							<th style="width: 15%"><i class="comment icon"></i> 댓글</th>
							<th style="width: 15%"><i class="edit outline icon"></i> 게시물
							</th>
							<th style="width: 15%"><i class="heart icon"></i> 좋아요</th>
							<th style="width: 15%"><i class="sitemap icon"></i> 합 계</th>
							<th style="width: 15%"><i class="chart bar icon"></i> 평 균</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<td>다이어트 팁</td>
							<td>${thits}</td>
							<td>${tcomments}</td>
							<td>${tpost}</td>
							<td>${tlike}</td>
							<td>${thits+tcomments+tpost+tlike}</td>
							<td>${thits+tcomments+tpost+tlike/4}</td>
						</tr>
						<tr align="center">
							<td>홈트레이닝</td>
							<td>${hhits}</td>
							<td>${hcomments}</td>
							<td>${hpost}</td>
							<td>${hlike}</td>
							<td>${hhits+hcomments+Hpost+hlike}</td>
							<td>${hhits+hcomments+hpost+hlike/4}</td>
						</tr>
						<tr align="center">
							<td>커뮤니티</td>
							<td>${chits}</td>
							<td>${ccomments}</td>
							<td>${cpost}</td>
							<td>${clike}</td>
							<td>${chits+ccomments+cpost+clike}</td>
							<td>${chits+ccomments+cpost+clike/4}</td>
						</tr>
					</tbody>
				</table>
			</div>

		</div>
		<br>

		<div class="ui center aligned segment" style="width: 100%;">
			<div class="ui grid">
				<div class="four wide column"></div>
				<div class="eight wide column"></div>
				<div class="four wide column" style="border-left: none;">
					<!--  -->
					<select class="ui dropdown" id="select" onchange="onchangeSelect()">
						<option value="all">전 체</option>
						<option value="tip">다이어트 팁</option>
						<option value="home">홈 트레이닝</option>
						<option value="commu">커뮤니티</option>
					</select>
					<!--  -->
				</div>
			</div>

			<!-- 다이어트 팁 차트  -->
			<div id="chart1" class="ui center aligned segment"
				style="width: 100%;">

				<div class="ui horizontal segments">
					<div class="ui right aligned segment" style="width: 60%">
						<h3>다이어트 팁 게시판 분석</h3>
					</div>
					<div class="ui right aligned segment"
						style="width: 40%; border-left: none;"></div>
				</div>


				<div class="ui horizontal segments">
					<div class="ui center aligned segment" style="width: 50%"
						id="linechart_material"></div>
					<div class="ui center aligned segment" style="width: 50%">
						<div class="ui center aligned segment">
							<h3>다이어트팁 상세정보</h3>
						</div>
						<table class="ui celled table">
							<thead>
								<tr align="center">
									<th style="width: 20%"><i class="clock outline icon"></i>
										시간대</th>
									<th style="width: 20%"><i class="eye icon"></i> 조회수</th>
									<th style="width: 20%"><i class="comment icon"></i>댓글</th>
									<th style="width: 20%"><i class="edit outline icon"></i>
										게시물</th>
									<th style="width: 20%"><i class="heart icon"></i> 좋아요</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${currentTime==5}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${T1.hits}</td>
											<td style="width: 20%">${T1.comments}</td>
											<td style="width: 20%">${T1.post}</td>
											<td style="width: 20%">${T1.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">12 - 15</td>
											<td style="width: 20%">${T2.hits}</td>
											<td style="width: 20%">${T2.comments}</td>
											<td style="width: 20%">${T2.post}</td>
											<td style="width: 20%">${T2.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">15 - 18</td>
											<td style="width: 20%">${T3.hits}</td>
											<td style="width: 20%">${T3.comments}</td>
											<td style="width: 20%">${T3.post}</td>
											<td style="width: 20%">${T3.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">18 - 21</td>
											<td style="width: 20%">${T4.hits}</td>
											<td style="width: 20%">${T4.comments}</td>
											<td style="width: 20%">${T4.post}</td>
											<td style="width: 20%">${T4.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">21 - 24</td>
											<td style="width: 20%">${T5.hits}</td>
											<td style="width: 20%">${T5.comments}</td>
											<td style="width: 20%">${T5.post}</td>
											<td style="width: 20%">${T5.likes}</td>
										</tr>
									</c:when>
									<c:when test="${currentTime==4}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${T1.hits}</td>
											<td style="width: 20%">${T1.comments}</td>
											<td style="width: 20%">${T1.post}</td>
											<td style="width: 20%">${T1.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">12 - 15</td>
											<td style="width: 20%">${T2.hits}</td>
											<td style="width: 20%">${T2.comments}</td>
											<td style="width: 20%">${T2.post}</td>
											<td style="width: 20%">${T2.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">15 - 18</td>
											<td style="width: 20%">${T3.hits}</td>
											<td style="width: 20%">${T3.comments}</td>
											<td style="width: 20%">${T3.post}</td>
											<td style="width: 20%">${T3.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">18 - 21</td>
											<td style="width: 20%">${T4.hits}</td>
											<td style="width: 20%">${T4.comments}</td>
											<td style="width: 20%">${T4.post}</td>
											<td style="width: 20%">${T4.likes}</td>
										</tr>
									</c:when>
									<c:when test="${currentTime==3}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${T1.hits}</td>
											<td style="width: 20%">${T1.comments}</td>
											<td style="width: 20%">${T1.post}</td>
											<td style="width: 20%">${T1.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">12 - 15</td>
											<td style="width: 20%">${T2.hits}</td>
											<td style="width: 20%">${T2.comments}</td>
											<td style="width: 20%">${T2.post}</td>
											<td style="width: 20%">${T2.likes}</td>
										</tr>
										<tr align="center">
										<tr align="center">
											<td style="width: 20%">15 - 18</td>
											<td style="width: 20%">${T3.hits}</td>
											<td style="width: 20%">${T3.comments}</td>
											<td style="width: 20%">${T3.post}</td>
											<td style="width: 20%">${T3.likes}</td>
										</tr>


									</c:when>
									<c:when test="${currentTime==2}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${T1.hits}</td>
											<td style="width: 20%">${T1.comments}</td>
											<td style="width: 20%">${T1.post}</td>
											<td style="width: 20%">${T1.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">12 - 15</td>
											<td style="width: 20%">${T2.hits}</td>
											<td style="width: 20%">${T2.comments}</td>
											<td style="width: 20%">${T2.post}</td>
											<td style="width: 20%">${T2.likes}</td>
										</tr>

									</c:when>
									<c:when test="${currentTime==1}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${T1.hits}</td>
											<td style="width: 20%">${T1.comments}</td>
											<td style="width: 20%">${T1.post}</td>
											<td style="width: 20%">${T1.likes}</td>
										</tr>
									</c:when>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>

			</div>


			<!-- 홈트레이닝 차트 -->

			<div class="ui center aligned segment"
				style="width: 100%; display: block" id="chart2">
				<div class="ui horizontal segments">
					<div class="ui right aligned segment" style="width: 60%">
						<h3>홈 트레이닝 게시판 분석</h3>
					</div>
					<div class="ui right aligned segment"
						style="width: 40%; border-left: none;"></div>
				</div>

				<div class="ui horizontal segments">
					<div class="ui center aligned segment" style="width: 50%"
						id="linechart_material2"></div>
					<div class="ui center aligned segment" style="width: 50%">
						<div class="ui center aligned segment">
							<h3>홈 트레이닝 상세정보</h3>
						</div>
						<table class="ui celled table">
							<thead>
								<tr align="center">
									<th style="width: 20%"><i class="clock outline icon"></i>
										시간대</th>
									<th style="width: 20%"><i class="eye icon"></i> 조회수</th>
									<th style="width: 20%"><i class="comment icon"></i> 댓글</th>
									<th style="width: 20%"><i class="edit outline icon"></i>
										게시물</th>
									<th style="width: 20%"><i class="heart icon"></i> 좋아요</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${currentTime==5}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${H1.hits}</td>
											<td style="width: 20%">${H1.comments}</td>
											<td style="width: 20%">${H1.post}</td>
											<td style="width: 20%">${H1.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">12 - 15</td>
											<td style="width: 20%">${H2.hits}</td>
											<td style="width: 20%">${H2.comments}</td>
											<td style="width: 20%">${H2.post}</td>
											<td style="width: 20%">${H2.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">15 - 18</td>
											<td style="width: 20%">${H3.hits}</td>
											<td style="width: 20%">${H3.comments}</td>
											<td style="width: 20%">${H3.post}</td>
											<td style="width: 20%">${H3.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">18 - 21</td>
											<td style="width: 20%">${H4.hits}</td>
											<td style="width: 20%">${H4.comments}</td>
											<td style="width: 20%">${H4.post}</td>
											<td style="width: 20%">${H4.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">21 - 24</td>
											<td style="width: 20%">${H5.hits}</td>
											<td style="width: 20%">${H5.comments}</td>
											<td style="width: 20%">${H5.post}</td>
											<td style="width: 20%">${H5.likes}</td>
										</tr>




									</c:when>
									<c:when test="${currentTime==4}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${H1.hits}</td>
											<td style="width: 20%">${H1.comments}</td>
											<td style="width: 20%">${H1.post}</td>
											<td style="width: 20%">${H1.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">12 - 15</td>
											<td style="width: 20%">${H2.hits}</td>
											<td style="width: 20%">${H2.comments}</td>
											<td style="width: 20%">${H2.post}</td>
											<td style="width: 20%">${H2.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">15 - 18</td>
											<td style="width: 20%">${H3.hits}</td>
											<td style="width: 20%">${H3.comments}</td>
											<td style="width: 20%">${H3.post}</td>
											<td style="width: 20%">${H3.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">18 - 21</td>
											<td style="width: 20%">${H4.hits}</td>
											<td style="width: 20%">${H4.comments}</td>
											<td style="width: 20%">${H4.post}</td>
											<td style="width: 20%">${H4.likes}</td>
										</tr>
									</c:when>
									<c:when test="${currentTime==3}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${H1.hits}</td>
											<td style="width: 20%">${H1.comments}</td>
											<td style="width: 20%">${H1.post}</td>
											<td style="width: 20%">${H1.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">12 - 15</td>
											<td style="width: 20%">${H2.hits}</td>
											<td style="width: 20%">${H2.comments}</td>
											<td style="width: 20%">${H2.post}</td>
											<td style="width: 20%">${H2.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">15 - 18</td>
											<td style="width: 20%">${H3.hits}</td>
											<td style="width: 20%">${H3.comments}</td>
											<td style="width: 20%">${H3.post}</td>
											<td style="width: 20%">${H3.likes}</td>
										</tr>
									</c:when>
									<c:when test="${currentTime==2}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${H1.hits}</td>
											<td style="width: 20%">${H1.comments}</td>
											<td style="width: 20%">${H1.post}</td>
											<td style="width: 20%">${H1.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">12 - 15</td>
											<td style="width: 20%">${H2.hits}</td>
											<td style="width: 20%">${H2.comments}</td>
											<td style="width: 20%">${H2.post}</td>
											<td style="width: 20%">${H2.likes}</td>
										</tr>
									</c:when>
									<c:when test="${currentTime==1}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${H1.hits}</td>
											<td style="width: 20%">${H1.comments}</td>
											<td style="width: 20%">${H1.post}</td>
											<td style="width: 20%">${H1.likes}</td>
										</tr>
									</c:when>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>

			</div>

			<!--커뮤니티 차트 -->
			<div class="ui center aligned segment"
				style="width: 100%; display: block" id="chart3">
				<div class="ui horizontal segments">
					<div class="ui right aligned segment" style="width: 60%">
						<h3>커뮤니티 게시판 분석</h3>
					</div>
					<div class="ui right aligned segment"
						style="width: 40%; border-left: none;"></div>
				</div>
				
				
				
				<div class="ui horizontal segments">
					<div class="ui center aligned segment" style="width: 50%"
						id="linechart_material3"></div>
					<div class="ui center aligned segment" style="width: 50%">
						<div class="ui center aligned segment">
							<h3>커뮤니티 상세정보</h3>
						</div>
						<table class="ui celled table">
							<thead>
								<tr align="center">
									<th style="width: 20%"><i class="clock outline icon"></i>
										시간대</th>
									<th style="width: 20%"><i class="eye icon"></i>조회수</th>
									<th style="width: 20%"><i class="comment icon"></i> 댓글</th>
									<th style="width: 20%"><i class="edit outline icon"></i>
										게시물</th>
									<th style="width: 20%"><i class="heart icon"></i> 좋아요</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${currentTime==5}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${C1.hits}</td>
											<td style="width: 20%">${C1.comments}</td>
											<td style="width: 20%">${C1.post}</td>
											<td style="width: 20%">${C1.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">12 - 15</td>
											<td style="width: 20%">${C2.hits}</td>
											<td style="width: 20%">${C2.comments}</td>
											<td style="width: 20%">${C2.post}</td>
											<td style="width: 20%">${C2.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">15 - 18</td>
											<td style="width: 20%">${C3.hits}</td>
											<td style="width: 20%">${C3.comments}</td>
											<td style="width: 20%">${C3.post}</td>
											<td style="width: 20%">${C3.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">18 - 21</td>
											<td style="width: 20%">${C4.hits}</td>
											<td style="width: 20%">${C4.comments}</td>
											<td style="width: 20%">${C4.post}</td>
											<td style="width: 20%">${C4.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">21 - 24</td>
											<td style="width: 20%">${C5.hits}</td>
											<td style="width: 20%">${C5.comments}</td>
											<td style="width: 20%">${C5.post}</td>
											<td style="width: 20%">${C5.likes}</td>
										</tr>
									</c:when>
									<c:when test="${currentTime==4}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${C1.hits}</td>
											<td style="width: 20%">${C1.comments}</td>
											<td style="width: 20%">${C1.post}</td>
											<td style="width: 20%">${C1.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">12 - 15</td>
											<td style="width: 20%">${C2.hits}</td>
											<td style="width: 20%">${C2.comments}</td>
											<td style="width: 20%">${C2.post}</td>
											<td style="width: 20%">${C2.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">15 - 18</td>
											<td style="width: 20%">${C3.hits}</td>
											<td style="width: 20%">${C3.comments}</td>
											<td style="width: 20%">${C3.post}</td>
											<td style="width: 20%">${C3.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">18 - 21</td>
											<td style="width: 20%">${C4.hits}</td>
											<td style="width: 20%">${C4.comments}</td>
											<td style="width: 20%">${C4.post}</td>
											<td style="width: 20%">${C4.likes}</td>
										</tr>
									</c:when>
									<c:when test="${currentTime==3}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${C1.hits}</td>
											<td style="width: 20%">${C1.comments}</td>
											<td style="width: 20%">${C1.post}</td>
											<td style="width: 20%">${C1.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">12 - 15</td>
											<td style="width: 20%">${C2.hits}</td>
											<td style="width: 20%">${C2.comments}</td>
											<td style="width: 20%">${C2.post}</td>
											<td style="width: 20%">${C2.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">15 - 18</td>
											<td style="width: 20%">${C3.hits}</td>
											<td style="width: 20%">${C3.comments}</td>
											<td style="width: 20%">${C3.post}</td>
											<td style="width: 20%">${C3.likes}</td>
										</tr>
									</c:when>
									<c:when test="${currentTime==2}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${C1.hits}</td>
											<td style="width: 20%">${C1.comments}</td>
											<td style="width: 20%">${C1.post}</td>
											<td style="width: 20%">${C1.likes}</td>
										</tr>
										<tr align="center">
											<td style="width: 20%">12 - 15</td>
											<td style="width: 20%">${C2.hits}</td>
											<td style="width: 20%">${C2.comments}</td>
											<td style="width: 20%">${C2.post}</td>
											<td style="width: 20%">${C2.likes}</td>
										</tr>
									</c:when>
									<c:when test="${currentTime==1}">
										<tr align="center">
											<td style="width: 20%">00 - 12</td>
											<td style="width: 20%">${C1.hits}</td>
											<td style="width: 20%">${C1.comments}</td>
											<td style="width: 20%">${C1.post}</td>
											<td style="width: 20%">${C1.likes}</td>
										</tr>
									</c:when>
								</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<br>
<br>

<!-- SCRIPT -->
<script type="text/javascript">
// 차트선택
function onchangeSelect(){
	var clicked = $('#select').val();
	switch(clicked){
	case "all":
		$('#chart1').attr("style","display:block");
		$('#chart2').attr("style","display:block");
		$('#chart3').attr("style","display:block");
		break;
	case "tip": 
		$('#chart1').attr("style","display:block");
		$('#chart2').attr("style","display:none");
		$('#chart3').attr("style","display:none");
	break;
	case "home":
		$('#chart1').attr("style","display:none");
		$('#chart2').attr("style","display:block");
		$('#chart3').attr("style","display:none");
	break;
	case "commu": 
		$('#chart1').attr("style","display:none");
		$('#chart2').attr("style","display:none");
		$('#chart3').attr("style","display:block");
	break;
	}
}
</script>
</html>

