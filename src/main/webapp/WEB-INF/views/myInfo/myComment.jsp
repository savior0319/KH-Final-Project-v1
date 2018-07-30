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
	<c:if test="${sessionScope.member!=null}">
		<div class="ui container">
			<div class="ui center aligned basic segment">
				<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
				<br>

				<table class="ui gray table">
					<thead>
						<tr id="title" align="center">
							<th><i class="question circle icon"></i> 게 시 물 제 목</th>
							<th><i class="question circle icon"></i> 댓 글 내 용</th>
							<th><i class="question circle icon"></i> 작 성 일</th>
							<th><i class="question circle icon"></i> 좋 아 요</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${myComment.comList}" var="m">
							<tr align="center">
								<td><a
									href="/postedCommunity.diet?postIndex=${m.postIndex }">${m.postTitle}</a></td>
								<td>${m.cmtContent}</td>
								<td>${m.cmtDateTime}</td>
								<td>${m.cmtLike}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="ui grid">
			<div class="three column row">
				<div class="column"></div>
				<div class="column">
					<div class="ui center aligned basic segment">
						<div class="ui pagination menu">${requestScope.myComment.pageNavi }</div>
					</div>
				</div>
			</div>
			<br>
		</div>
	</c:if>
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
	<input type="hidden" value="${member.mbId}" id="mbId" />
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>