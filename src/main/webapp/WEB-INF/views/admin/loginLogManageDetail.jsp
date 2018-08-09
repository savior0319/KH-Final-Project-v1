<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>

<!-- 달력 추가 -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<title>관리자 - 접속자 로그 상세내용</title>
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
					<h1>접속자 로그 관리 (상세 내용)</h1>
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

								<div class="four wide column">
								</div>
								<div class="seven wide column">
									<div class="ui center basic aligned segment"
										style="float: right; margin: 0px;">
										<div class="ui input">
											<input type="text" id="datepicker1" name="date"
												readonly="readonly" placeholder="날짜 조회">
										</div>
									</div>
								</div>
								<div class="five wide column" style="border-left: none;">
									<!--  -->
									<div class="ui center basic aligned segment"
										style="float: left; margin: 0px;">
										<div class="ui icon input">
											<input type="text" id ="textWord" placeholder="아이디  ||전체검색(all)" onkeypress="runScript(event)"> 
											<i class="inverted circular search link icon" onclick="searchBtn()"></i>
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
									<h2 id="todayDate">${requestScope.today}</h2>
								</div>	
								<div class="ui center aligned segment"
									style="overflow: auto; height: 700px;">

									<table class="ui celled table">
										<thead>
											<tr align="center">
												<th style="display:none">날자</th>
												<th>번호</th>
												<th>로그인 시간</th>
												<th>로그아웃 시간</th>
												<th>IP 주소</th>
												<th>접속 기기</th>
												<th>유지 시간</th>
												<th>회원아이디</th>
												<th>닉네임</th>
											</tr>
										</thead>
										<!--  -->
										<tbody>
											<c:forEach items="${requestScope.list}" var="li"
												varStatus="ss">
												<tr align="center">
													<td class ="todate" style="display:none">${li.day}</td>
													<td>${li.userNo}</td>
													<td>${li.login}</td>
													<td>${li.logout}</td>
													<td>${li.ip}</td>
													<td>${li.device}</td>
													<c:choose>
														<c:when test="${li.stay>60}">
															<td><fmt:formatNumber value="${li.stay/60}"
																	pattern="0" /> 분</td>
														</c:when>
														<c:otherwise>
															<td>${li.stay}초</td>
														</c:otherwise>
													</c:choose>
													<td>${li.id}</td>
													   <c:choose>
           <c:when test="${fn:length(li.nickName) > 5}">
            <td><c:out value="${fn:substring(li.nickName,0,3)}"/>...</td>
           </c:when>
           <c:otherwise>
          	<td>  <c:out value="${li.nickName}"/></td>
           </c:otherwise> 
          </c:choose>


												</tr>
											</c:forEach>
										</tbody>
										<!--  -->
									</table>
								</div>
							</div>
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
	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">
/* 검색  - 엔터*/
function runScript(e) {
	if (e.keyCode == 13) {
		searchBtn();
	}
}
function searchBtn() {
	var searchText = $('#textWord').val();
	var findDate = $('#todayDate').html();
		if(searchText != "")
		{
			$.ajax({
				url : '/loginLogManageDetail.diet',
				type : 'post',
				data : {
					'findDate' : findDate,
					'search' : searchText
				},
				success : function() {
					
					location.href = "/loginLogManageDetail.diet?findDate="
							+ findDate + "&type=non" + "&search="+searchText;

				},
				error : function() {
					alert('해당 대상자는 없습니다, 관리자에게 문의하세요');
				}
			});
		}
		else{
			alert('아이디를 입력해 주세요');
		}
	}

	/* + "&type=" + type */


	$('.ui.dropdown').dropdown({
		allowAdditions : true,
		allowCategorySelection : true
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

	$("#datepicker1")
			.datepicker(
					{
						onSelect : function(dateText) {

							var findDate = this.value;
							$.ajax({
										url : '/loginLogManageDetail.diet',
										type : 'post',
										data : {
											'findDate' : findDate,
											'type' : 'non'
										},
										success : function() {
											alert("선택하신 날짜 : " + dateText
													+ " 해당날짜 로그로 이동합니다");
											location.href = "/loginLogManageDetail.diet?findDate="
													+ findDate + "&type=non";

										},
										error : function() {
											alert('해당 로그는 없습니다, 관리자에게 문의하세요');
										}
									});

						}
					});
</script>

</html>