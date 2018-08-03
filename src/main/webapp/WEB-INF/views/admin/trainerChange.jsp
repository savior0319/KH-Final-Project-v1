<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>관리자 - 트레이너 회원 관리</title>
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
			<h1>트레이너 신청 관리</h1>
		</div>

		<table class="ui very compact table">
			<thead>?
				<tr align="center">
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>연락처</th>
					<th>성별</th>
					<th>회원등급</th>
					<th>트레이너 등록일</th>
					<th>회원 등급 변경</th>
				</tr>
			</thead>
			<c:if test="${requestScope.trpdv.trList[0] !=null}">
				<tbody>
					<c:forEach items="${requestScope.trpdv.trList}" var="tr">
						<input type="hidden" id="" />
						<tr align="center">
							<td>${tr.trIndex}</td>
							<td>${tr.mbId}</td>
							<td>${tr.trPhone}</td>
							<td>${tr.mbGrade}</td>
							<td>${tr.trPhone}</td>
							<c:choose>
								<c:when test="${tr.trGender eq 'f'}">
									<td>여자</td>
								</c:when>
								<c:otherwise>
									<td>남자</td>
								</c:otherwise>
							</c:choose>
							<td>${tr.trStatus}</td>
							<td><fmt:formatDate value="${tr.trRegDate}" pattern="yyyy-MM-dd HH:mm" /></td>
							<td><c:choose>
									<c:when test="${tr.trStatus eq '심사중'}">
										<button id="trInfo_${tr.trIndex}" onclick="trainerInfo(${tr.trIndex});" class="ui red button"
											style="margin-right: 0px; padding-top: 8px; padding-bottom: 8px; padding-left: 18px; padding-right: 18px;"
										>
										<i class="exchange alternate icon" style="margin-left: 0px; margin-right: 0px;"></i>
										</button>
									</c:when>
									<c:otherwise>
										<button disabled="disabled" id="trInfo_${tr.trIndex}" class="big ui red button" style="margin-right: 0px; padding-top: 7px; padding-bottom: 7px; padding-left: 6px; padding-right: 6px;">
											<span style="font-size: 70%;">심사완료</span>
										</button>
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</c:if>
		</table>



		<c:if test="${requestScope.trpdv.trList[0] !=null}">
			<div class="ui center aligned basic segment">
				<div class="ui pagination menu">${requestScope.trpdv.pageNavi }</div>
			</div>
		</c:if>


	</div>





	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">

/* 각 신청 페이지 이동 */
		 function trainerInfo(ti){
			 location.href = "/trainerRegContents.diet?trIndex="+ti;
		 }
	
</script>

</html>