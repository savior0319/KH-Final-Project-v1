<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<script src="/resources/slider/responsiveslides.min.js"></script>
<title>다이어트</title>
</head>

<!-- CSS -->
<style>
.rslides {
	position: relative;
	list-style: none;
	overflow: hidden;
	width: 100%;
	padding: 0;
	margin: 0;
}

.rslides li {
	-webkit-backface-visibility: hidden;
	position: absolute;
	display: none;
	width: 100%;
	left: 0;
	top: 0;
}

.rslides li:first-child {
	position: relative;
	display: block;
	float: left;
}

.rslides img {
	display: block;
	height: auto;
	float: left;
	width: 100%;
	border: 0;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<div class="ui container">
	<!-- 슬라이드-->
               <ul class="rslides" style="padding-bottom: 15px;">
                  <li>
                     <img src="#" id="image1" style="height:300px;">
                  </li>
                  <li>
                     <img src="#" id="image2" style="height:300px;">
                  </li>
                  <li>
                     <img src="#" id="image3" style="height:300px;">
                  </li>
                  <li>
                     <img src="#" id="image4" style="height:300px;">
                  </li>
                  <li>
                     <img src="/resources/image/advertise.png" style="height:300px;">
                  </li>
               </ul>
		
			<h1 class="ui left aligned header">운동칼로리</h1>
			<hr>

			<!-- 음식검색 -->
			<div class="ui secondary segment">
				<div class="ui right action left icon input" style="width:80%;">
					<i class="search icon"></i> <input id="searchText" type="text" placeholder="검색어 입력"
						style="width:80%;"  onkeypress="runScript(event)" >
					<div class="ui basic floating dropdown button" onclick="healthCalSearch();">
						<div class="text">검색</div>
					</div>
				</div>
				<div id="size1" style="text-align: center; margin-top: 3%; height: 40px;">
					<i class="chevron circle right icon"></i> 다신 칼로리 사전은 <span
						style="color: skyblue;">음식의 칼로리 뿐만 아니라 영양소 구성도 함께</span> 나와 다이어트뿐
					아니라 건강한 식습관 형성에도 도움이 됩니다.
				</div>
				<div id="size2" style="text-align: center; margin-top: 3%; height: 20px;">
					<i class="chevron circle right icon"></i> 알고 싶은 운동을 검색해 주세요
				</div>
			</div>
			<br>

			<h3 class="ui left aligned header">
				운동칼로리 <span style="color: red;"></span>
			</h3>
			<hr>
			
			<c:choose>
				<c:when test="${requestScope.hcpd.hcList[0]!=null }">


			<!-- 검색순위 TOP 들어가는 곳 -->

			<table class="ui very compact table">
				<thead>
					<tr align="center">
						<th>번호</th>
						<th>운동칼로리</th>
						<th>강도/세트</th>
						<th>분/초/횟수</th>
						<th>칼로리</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${requestScope.hcpd.hcList }" var="hc">
						<tr align="center">
							<td style="padding-top: 15px; padding-bottom: 15px;">${hc.hcIndex }</td>
							<td><a href="/healthCalorieInfo.diet?hcIndex=${hc.hcIndex }">${hc.hcName }</a></td>
							<td>${hc.hcHard }</td>
							<td>${hc.hcSet }</td>
							<td>${hc.hcCal }Kcal</td>
						</tr>

					</c:forEach>
				</tbody>
			</table>

		</c:when>
		<c:otherwise>
				<table class="ui very compact table">
				<thead>
					<tr align="center">
						<th>번호</th>
						<th>운동칼로리</th>
						<th>강도/세트</th>
						<th>분/초/횟수</th>
						<th>칼로리</th>
					</tr>
				</thead>
				</table>
				<div class="ui red medium message">
					<br>
					<i class="exclamation huge icon"></i>
					<div class="ui medium header">
						<br>
						※게시물이 존재하지 않습니다.
						<br>
						다른 키워드로 검색을 해주세요.
						<br>
						<br>
						<br>
					</div>
				</div>	
					
				</c:otherwise>
			</c:choose>

		</div>
		<div id="size1" class="ui grid">
			<div class="three column row">
				<div class="four wide column"></div>
				<div class="eight wide column">
				<c:if test="${requestScope.hcpd.hcList[0]!=null }">
					<div class="ui center aligned basic segment">
						<div class="ui pagination menu">${requestScope.hcpd.pageNavi }</div>
					</div>
					</c:if>
				</div>
				<div class="four wide column"></div>
			</div>
			<br>
		</div>
		
		<div id="size2" class="ui center aligned grid">

			<c:if test="${requestScope.hcpd.hcList[0]!=null }">
				<div class="ui center aligned basic segment" style="margin: 0; padding: 0;">
					<div class="ui pagination menu" align="center">${requestScope.hcpd.pageNavi }</div>
				</div>
			</c:if>
		</div>

	


	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
/* 검색  - 엔터*/
function runScript(e) {
	if (e.keyCode == 13) {
		healthCalSearch();
	}
}

	function healthCalSearch(){
		var searchText = $('#searchText').val();
		
		location.href="/healthCalorieList.diet?searchText=" + searchText;
	}
	
	//슬라이드
	$(function() {
		$(".rslides").responsiveSlides({
			auto : true,
			timeout : 1500,
		});
	});

	/* 광고 이미지 불러오기 */
	$(document).ready(function() {
	   $.ajax({
	      url : '/advertiseImageLoad.diet',
	      type : 'post',
	      success : function(img){
	         $("#image1").attr("src",img[0].path1);
	         $("#image2").attr("src",img[1].path1);
	         $("#image3").attr("src",img[2].path1);
	         $("#image4").attr("src",img[3].path1);
	      },
	      error : function(){
	         console.log('[ERROR] - 이미지 불러오기 오류');
	      }
	   });
	});
	
	
</script>
<style type="text/css" media="screen">
/* 모바일용 아닌 사이즈 */
@media ( min-width : 650px) {
	#size1 {
		display: block;
	}
	#size2 {
		display: none;
	}
}
/* 모바일용 사이즈 */
@media ( max-width : 649px) {
	#size1 {
		display: none;
	}
	#size2 {
		display: block;
	}
}
</style>

</html>