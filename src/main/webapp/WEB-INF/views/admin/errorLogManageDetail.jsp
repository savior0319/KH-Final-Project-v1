<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>

<!-- 달력 추가 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<title>관리자 - 에러 로그 관리 상세내용</title>
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

	<!-- 테이블시작 -->
	<div class="ui container">
		<div class="ui center aligned basic segment">
			<div class="ui center aligned basic segment">
				<div class="ui center aligned segment">
					<h1>에러 로그 관리 (상세 내용)</h1>
				</div>
			</div>
			<br>
			<!--중간 div -->
			<div class="ui center alignedsegment">

				<!-- 테이블시작 -->
				<div class="ui center alignedsegment">
					<div class="ui center alignedsegment">


						<div class=" ui center aligned segment">

							<!-- 달력선택, 난이도선택  -->
							<div class="ui grid">

								<div class="four wide column"></div>
								<div class="six wide column"></div>
								<div class="six wide column" style="border-left: none;">
									<!--  -->
									<div class="ui center basic aligned segment"
										style="float: left; margin: 0px;">
										<div class="ui input">
											<input type="text" id="datepicker1" name="date"
												readonly="readonly" placeholder="날짜 조회">
										</div>
									</div>

									<div class="ui basic floating dropdown button"
										style="float: left;; margin-top: 15px;">
										<div class="text">선택</div>
										<i class="dropdown icon"></i>
										<div class="menu" id="menu">
											<div class="item">경도</div>
											<div class="item">중도</div>
											<div class="item">고도</div>
										</div>
									</div>
									<!--  -->
								</div>
							</div>
							<!-- 달력선택, 난이도선택 종료-->
							<!-- 경도시작 -->
							<div id="chart1" class="ui center aligned segment"
								style="width: 100%;">
								<div class=" ui center aligned segment">
									<h2>${requestScope.listType}</h2>
								</div>
								<div class="ui center aligned segment"
									style="overflow: auto; height: 700px;">

									<table class="ui celled table">
										<thead>
											<tr align="center">
												<th>발생 시간</th>
												<th>발생 내용1</th>
												<th>발생 내용2</th>
												<th>발생 내용3</th>
												<th>발생 내용4</th>
											</tr>
										</thead>
										<!--  -->
										<tbody>
											<c:forEach items="${requestScope.list}" var="ss"
												varStatus="status">
												<tr align="center">
													<td>${ss.erStamp}</td>
													<td>${ss.erInfoOne}</td>
													<c:choose>
														<c:when test="${fn:length(ss.erInfoTwo) > 25}">
															<td><button class="ui secondary button"
																	onclick="info(${status.index},1);">자세히</button></td>
															<td id="Date${status.index}1" ; style="display: none">
																${ss.erInfoTwo}</td>

														</c:when>
														<c:otherwise>
															<td>${ss.erInfoTwo}</td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${fn:length(ss.erInfoThr) > 25}">
															<td><button class="ui secondary button"
																	onclick="info(${status.index},2);">자세히</button></td>
															<td id="Date${status.index}2" ; style="display: none">
																${ss.erInfoThr}</td>
														</c:when>
														<c:otherwise>
															<td>${ss.erInfoThr}</td>
														</c:otherwise>
													</c:choose>
													<c:choose>
														<c:when test="${fn:length(ss.erInfoFor) > 25}">
															<td><button class="ui secondary button"
																	onclick="info(${status.index},3);">자세히</button></td>
															<td id="Date${status.index}3" ; style="display: none">
																${ss.erInfoFor}</td>
														</c:when>
														<c:otherwise>
															<td>${ss.erInfoFor}</td>
														</c:otherwise>
													</c:choose>

												</tr>
											</c:forEach>
										</tbody>
										<!--  -->
									</table>
								</div>
							</div>
							<!-- 경도종료 -->
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>


	<!-- 자세히 버튼, 모달띄우기 문의하기 -->
	<div class="ui modal" id="questionModal">
		<i class="close icon"></i>
		<div class="ui large header">상세내용</div>
		<div class="ui left aligned basic segment">
			<div class="ui form" style="font-weight: 600;">
				<div class="field">
					<textarea style="height: 400px;" id="content" readonly="readonly">
					
					</textarea>
				</div>
			</div>
		</div>
		<div class="ui right aligned basic segment"
			style="padding-top: 0px; margin-top: 0px;"></div>
	</div>

	<script type="text/javascript">

	function info(index,test){
		var findDate = $("#Date"+index+test).html();
		$('#content').html(findDate);
		$('#questionModal').modal({
			centered: false
		}).modal('show');	
	}
</script>

	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">

	$('.ui.dropdown').dropdown({
		allowAdditions : true,
		allowCategorySelection : true
	});

	//카테고리 선택
	var type = '';
	var findDate = "${requestScope.findDate}";

	$('#menu > .item').click(function() {
		switch ($(this).text()) {
		case '경도':
					type ="low";
					location.href = "/errorLogManageDetail.diet?findDate="+findDate+"&type="+type;
			break;
		case '중도':
					type ="mid";
					location.href = "/errorLogManageDetail.diet?findDate="+findDate+"&type="+type;
			break;
		case '고도':	
					type ="high";
					location.href = "/errorLogManageDetail.diet?findDate="+findDate+"&type="+type;
			break;
		}
		
		
	});

	// 날짜 선택
	$.datepicker.setDefaults({
		dateFormat : 'yy-mm-dd',
		prevText : '이전 달',
		nextText : '다음 달',
		monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월',
				'10월', '11월', '12월' ],
		monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
				'9월', '10월', '11월', '12월' ],
		dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
		dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
		showMonthAfterYear : true,
		yearSuffix : '년',
        maxDate: "0D"
	});

	$("#datepicker1").datepicker({ onSelect: function(dateText) {  

		alert("선택하신 날자 : " + dateText + " 해당날자 로그로 이동합니다"); 
		var findDate = this.value;
		location.href = "/errorLogManageDetail.diet?findDate="+findDate+"&type=low";
		  }
		}); 
</script>

</html>