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
			<div class="ui large message">
				<div class="ui large header">블랙리스트 신고 내역</div>
			</div>
			<table class="ui celled table">
				<thead>
					<tr align="center">
						<th>신고게시물 번호</th>
						<th>신고댓글</th>
						<th>신고사유</th>
						<th>신고자</th>
						<th>피신고자</th>
					</tr>
				</thead>
				<c:forEach items="${requestScope.content}" var="c">
				<tr>
					<c:choose>
						<c:when test="${c.postIndex eq '0'}">
					<td>[댓글이 신고됨]</td>
						</c:when>
						<c:otherwise>
					<td><a href="/postedCommunity.diet?postIndex=${c.postIndex}">${c.postIndex}</a></td>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${c.targetContent eq null}">
					<td>[게시물이 신고됨]</td>
						</c:when>
						<c:otherwise>
					<td>${c.targetContent}</td>
						</c:otherwise>
					</c:choose>

					<td>${c.cmtContent}</td>
					<td>${c.mbNickName}</td>
					<td>${c.targetMbNickName}</td>
				</tr>
			   </c:forEach>
		</table>
	</div>
</div>


<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>