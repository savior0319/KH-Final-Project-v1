<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>관리자 - 전체 회원 조회</title>
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
			<h1>전체 회원 조회</h1>
		</div>
			<table class="ui very compact table">
				<thead>
					<tr align="center">
						<th>아이디</th>
						<th>이름</th>
						<th>닉네임</th>
						<th>성별</th>
						<th>나이</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>회원등급</th>
						<th>블랙리스트</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.mbpd.mbList}" var="mb">
					<tr align="center">
						<td style="padding-bottom: 12px; padding-top: 12px;">${mb.mbId}</td>
						<c:choose>
							<c:when test="${mb.mbName eq null}">
						<td>(미기입)</td>
							</c:when>
							<c:otherwise>
						<td>${mb.mbName}</td>
							</c:otherwise>
						</c:choose>							
						<td>${mb.mbNickName}</td>
						<c:choose>
							<c:when test="${mb.mbGender eq 'f'}">
								<td>여자</td>
							</c:when>
							<c:otherwise>
								<td>남자</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${mb.mbAge eq 0}">
						<td>(미기입)</td>
							</c:when>
							<c:otherwise>
						<td>${mb.mbAge}</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${mb.mbPhone eq null}">
						<td>(미기입)</td>
							</c:when>
							<c:otherwise>
						<td>${mb.mbPhone}</td>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${mb.mbAddress eq null}">
						<td>(미기입)</td>
							</c:when>
							<c:otherwise>
						<td>${mb.mbAddress}</td>
							</c:otherwise>
						</c:choose>
						<td>${mb.mbGrade}</td>
						<c:choose>
							<c:when test="${mb.mbReport eq 'n'}">
						<td>X</td>
							</c:when>
							<c:otherwise>
						<td>O</td>
							</c:otherwise>
						</c:choose>

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