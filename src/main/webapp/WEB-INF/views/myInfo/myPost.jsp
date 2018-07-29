<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>마이페이지</title>
</head>

<!-- CSS -->
<style>
html, body {
	margin: 0 auto;
}

.myActivity1 {
	border-radius: 30px;
	position: relative;
}

.myActivity2 a {
	width: 20%;
	margin: auto 0;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>
	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">
			<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
			<br>
			<c:if test="${sessionScope.member!=null}">
				<table class="ui gray table">
					<thead>
						<tr id="title" align="center">
							<th><i class="question circle icon"></i>게 시 판</th>
							<th><i class="question circle icon"></i>게 시 물 번 호</th>
							<th><i class="question circle icon"></i>제 목</th>
							<th><i class="question circle icon"></i>작 성 일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${myPost.comList}" var="m">
							<tr align="center">
								<td><c:choose>
										<c:when test="${requestScope.m.type.equals('15') }">
											<h1>자유게시판</h1>
										</c:when>
										<c:when test="${requestScope.m.type.equals('16') }">
											<h1>레시피&#38;식단</h1>
										</c:when>
										<c:when test="${requestScope.m.type.equals('17') }">
											<h1>팁&#38;노하우</h1>
										</c:when>
										<c:when test="${requestScope.m.type.equals('18') }">
											<h1>고민&#38;질문</h1>
										</c:when>
										<c:when test="${requestScope.m.type.equals('19') }">
											<h1>비포&#38;애프터</h1>
										</c:when>
									</c:choose></td>
								<td>${m.postIndex }</td>
								<td><a href="/postedCommunity.diet?postIndex=${m.postIndex }">${m.postTitle }</a></td>
								<td>${m.postDateTime }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
		</div>
		<div class="ui grid">
			<div class="three column row">
				<div class="column"></div>
				<div class="column">
					<div class="ui center aligned basic segment">
						<div class="ui pagination menu">${requestScope.myPost.pageNavi}</div>
					</div>
				</div>
				<div class="column"></div>
			</div>
			<br>
		</div>
	</div>
	<br>
	<c:if test="${sessionScope.member==null}">
		<script>
			alert("로그인 후 이용해주세요~");
			location.href = "/";
		</script>
	</c:if>
	<script>
		$(function() {
			var sBtn = $("#myActivity2");
			sBtn.find('a').click(function() {
				sBtn.find('a').removeClass("active");
				$(this).addClass("active");
			});
		});
	</script>
	<!--  ui container 닫기  -->
	</div>
	<input type="hidden" value="${member.mbId}" id="mbId" />
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>