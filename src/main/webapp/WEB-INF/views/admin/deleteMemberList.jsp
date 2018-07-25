<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

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


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/adminheader.jsp"></jsp:include>

	<!-- CONTENTS -->
	<br>
	<br>
	<div class="ui container">
		<div class="ui center aligned segment">
			<h1>탈퇴 회원 조회</h1>
		</div>

		<table class="ui very compact table">
			<thead>
				<tr align="center">
					<th>아이디</th>
					<th>닉네임</th>
					<th>성별</th>
					<th>블랙리스트</th>
					<th>탈퇴일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.mbpd.mbList}" var="mb">
					<tr align="center">
						<td>${mb.mbId}</td>
						<td>${mb.mbNickName}</td>
						<c:choose>
							<c:when test="${mb.mbGender == 'f'}">
								<td>여자</td>
							</c:when>
							<c:otherwise>
								<td>남자</td>
							</c:otherwise>
						</c:choose>
						<td>${mb.mbGrade}</td>
						<td>${mb.mbEnrollDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="ui center aligned basic segment">
			<div class="ui pagination menu">${requestScope.mbpd.pageNavi}</div>
		</div>
	</div>
	</div>
	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>