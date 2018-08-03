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
</style>

<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">

			<h1 class="ui left aligned header">음식칼로리</h1>
			<hr>

			<!-- 음식검색 -->
			<div class="ui secondary segment">
				<div class="ui right action left icon input" style="width:80%;">
					<i class="search icon"></i> <input id="searchText" type="text" placeholder="검색어 입력"
						style="width:80%;"  onkeypress="runScript(event)" >
					<div class="ui basic floating dropdown button" onclick="foodCalSearch();">
						<div class="text">검색</div>
					</div>
				</div>
				<div id="size1" style="text-align: center; margin-top: 3%; height: 40px;">
					<i class="chevron circle right icon"></i> 다신 칼로리 사전은 <span
						style="color: skyblue;">음식의 칼로리 뿐만 아니라 영양소 구성도 함께</span> 나와 다이어트뿐
					아니라 건강한 식습관 형성에도 도움이 됩니다.
				</div>
				<div id="size2" style="text-align: center; margin-top: 3%; height: 20px;">
					<i class="chevron circle right icon"></i> 알아보고 싶은 음식을 검색해 주세요
				</div>
			</div>
			<br>

			<table class="ui very compact table">
				<thead>
					<tr align="center">
						<th>번호</th>
						<th>음식명</th>
						<th>기준</th>
						<th>칼로리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.fcpd.fcList }" var="fc">
					<tr align="center">
						<td style="padding-top: 15px; padding-bottom: 15px;">${fc.fcIndex }</td>
						<td><a href="foodCalorieInfo.diet?fcIndex=${fc.fcIndex }">${fc.fcName }</a></td>
						<td>${fc.fcGram }g</td>
						<td>${fc.fcCal } kcal</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>

		</div>
		
		<div id="size1" class="ui grid">
			<div class="three column row">
				<div class="four wide column"></div>
				<div class="eight wide column">
					<div class="ui center aligned basic segment">
						<div class="ui pagination menu">${requestScope.fcpd.pageNavi }</div>
					</div>
				</div>
				<div class="four wide column">
					
				</div>
			</div>
			<br>
		</div>
		
		<div id="size2" class="ui center aligned grid">

			<c:if test="${requestScope.fcpd.fcList[0]!=null }">
				<div class="ui center aligned basic segment" style="margin: 0; padding: 0;">
					<div class="ui pagination menu" align="center">${requestScope.fcpd.pageNavi }</div>
				</div>
			</c:if>


			<br>
		</div>

	</div>
	

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">

/* 검색  - 엔터*/
function runScript(e) {
	if (e.keyCode == 13) {
		foodCalSearch();
	}
}

function foodCalSearch(){
	var searchText = $('#searchText').val();
	
	location.href="/foodCalorieList.diet?searchText=" + searchText;
}
</script>
<style type="text/css" media="screen">
/* 모바일용 아닌 사이즈 */
@media ( min-width : 550px) {
	#size1 {
		display: block;
	}
	#size2 {
		display: none;
	}
}
/* 모바일용 사이즈 */
@media ( max-width : 549px) {
	#size1 {
		display: none;
	}
	#size2 {
		display: block;
	}
}
</style>
</html>