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
td {
	padding: 10px;
	text-align: left;
}

tr>th {
	background: #faede6;
	text-align: left;
	padding: 10px;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">

			<h1 class="ui left aligned header">운동칼로리</h1>
			<hr>


			<!-- 운동 검색 -->

			<div class="ui secondary segment">
				<div class="ui right action left icon input" style="width:80%;">
					<i class="search icon"></i> <input id="searchText" type="text"
						placeholder="검색어 입력" style="width:80%;">
					<div class="ui basic floating dropdown button"
						onclick="healthCalSearch();">
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
			<hr>
			<br>

			

			<!-- 운동 강도와 시간 선택에 따른 칼로리 -->

			<table border="2" bordercolor="#a1a0a0"
				style="width: 100%; height: 120px; border-collapse: collapse;">
				<colgroup>
					<col style="width: 165px">
					<col style="width: auto">
				</colgroup>
				<tbody>
					<tr>
						<th>운동명</th>
						<td>${requestScope.hc.hcName }</td>
					</tr>
					<tr>
						<th>강도/세트</th>
						<td>
							${requestScope.hc.hcHard }
						</td>
					</tr>
					<tr>
						<th><c:choose>
								<c:when test="${requestScope.hc.hcType=='numbers' }">
									운동 횟수
								</c:when>
								<c:when test="${requestScope.hc.hcType=='minute' }">
									운동 시간(분)
								</c:when>
								<c:when test="${requestScope.hc.hcType=='seconds' }">
									운동 시간(초)
								</c:when>
							</c:choose></th>
						<td>
							<div class="ui input" style="width: 150px; height: 30px;">
								<input id="set" type="text" value="${requestScope.hc.hcSet }"
									readonly="readonly" style="width:40%;">
								<div class="mini ui basic buttons" style="width:60%;">
									<div class="ui button" onclick="setDown();" style="width:50%; float:left;">
										<i class="angle left icon" style="width:100%;"></i>
									</div>
									<div class="ui button" onclick="setUp();" style="width:50%; float:left;">
										<i class="angle right icon" style="width:100%;"></i>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th>칼로리</th>
						<td id="cal"><fmt:formatNumber
								value="${requestScope.hc.hcCal }" pattern="#.0" /> Kcal</td>
					</tr>
				</tbody>
			</table>



			<h3 class="ui left aligned header">효과 및 참고사항</h3>
			<hr>

			<!-- 효과 및 참고사항 들어가는 부분 -->
			<div class="notedItems" style="text-align: left;">
				<pre id="size1">${hc.hcExplain }</pre>
				<p id="size2">${hc.hcExplain }</p>
			</div>
			<hr>

			<!-- 동영상 강좌 부분(영상이 있는페이지와 없는 페이지가 있음 있을시 영상 보이게 -->
			<c:if test="${hc.hcVideo!=null }">

				<h3 class="ui left aligned header">동영상 강좌</h3>
				<div id="size1" class="videoLecture"
					style="width: 700px; height: 200px; border: 2px solid grey;">
					<div class="youtube" style="width: 40%; height: 100%; float: left;">
						<iframe width="100%;" height="100%;" src="${hc.hcVideo }"
							frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
					<div style="width: 60%; height: 100%; float: left;">
						<div class="sprotTitle"
							style="width: 100%; height: 40%; padding: 3%; padding-top: 5%; border-bottom: 1px solid grey;">
							<h3>${hc.hcName }</h3>
						</div>
					</div>
				</div>
				
				<div id="size2" class="videoLecture"
					style="width: 300px; height: 200px; border: 2px solid grey;">
					<div class="youtube" style="width: 100%; height: 100%; float: left;">
						<iframe width="100%;" height="100%;" src="${hc.hcVideo }"
							frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
					</div>
				</div>

			</c:if>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	var initSet = document.getElementById('set').value;
	var initCal = '${hc.hcCal}';
	function setUp() {
		var set = document.getElementById('set');

		if (set.value != initSet * 20) {
			document.getElementById('set').value = Number(set.value)
					+ Number(initSet);
			document.getElementById('cal').innerHTML = (Number(set.value)
					/ Number(initSet) * Number(initCal)).toFixed(1)
					+ ' Kcal';
		}
	}

	function setDown() {
		var set = document.getElementById('set');

		if (set.value != initSet) {
			document.getElementById('set').value = Number(set.value)
					- Number(initSet);
			document.getElementById('cal').innerHTML = (Number(set.value)
					/ Number(initSet) * Number(initCal)).toFixed(1)
					+ ' Kcal';
		}
	}

	function healthCalSearch() {
		var searchText = $('#searchText').val();

		location.href = "/healthCalorieList.diet?searchText=" + searchText;
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