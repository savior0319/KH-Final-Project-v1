<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>관리자 - 1:1문의 답변</title>
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
		<div class="ui center aligned segment"><h1>1:1문의 답변</h1></div>
		<table class="ui very compact table">
			<thead>
				<tr align="center">
					<th>문의번호</th>
					<th>문의제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>답변여부</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.qpd.QList}" var="qd">
				<tr align="center">
					<td>${qd.qsIndex}</td>
					<td><div style="color: rgb(65,131,196); cursor: pointer;" onclick="thclick(this);">${qd.qsTitle}</div></td>
					<td>${qd.mbNickName}</td>
					<td><fmt:formatDate value="${qd.qsWriteTime}" pattern="yyyy-MM-dd HH:mm"/></td>
				<c:choose>
				<c:when test="${qd.qsAnswerCheck eq 'n'}">
					<td>답변 대기 중</td>
				</c:when>
				<c:otherwise>
					<td>답변 완료</td>
				</c:otherwise>
				</c:choose>
				</tr>
			</c:forEach> 
		</tbody>
	</table>

	<c:if test="${requestScope.qpd.QList[0].qsIndex ne null}">
		<div class="ui center aligned basic segment">
			<div class="ui pagination menu">${requestScope.qpd.pageNavi}</div>
		</div>
	</c:if>
</div>


<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">

	function thclick(etc){
		var index = $(etc).parent().siblings('td:first()').html();
		location.href="/qaContent.diet?index=" + index;
	}

</script>

</html>