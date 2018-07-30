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
			<c:if test="${sessionScope.member!=null}">
				<table class="ui gray table">
					<thead>
						<tr id="title" align="center">
							<th ><i class="question circle icon"></i> 게 시 판</th>
							<th><i class="question circle icon"></i> 제 목</th>
							<th><i class="question circle icon"></i> 작 성 자</th>
							<th><i class="question circle icon"></i> 조 회 수</th>
							<th> <i class="heart icon"></i> 좋 아 요</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${myBookMark.comList}" var="m">
							<tr align="center">
								<td style="width: 20%;"><c:choose>
										<c:when test="${m.bcaIndex=='15'}">
											<label><a href="recipeBoard.diet?type=15">자유게시판</a></label>
										</c:when>
										<c:when test="${m.bcaIndex=='16' }">
											<label><a href="recipeBoard.diet?type=16">레시피&#38;식단</a></label>
										</c:when>
										<c:when test="${m.bcaIndex=='17' }">
											<label><a href="recipeBoard.diet?type=16">팁&#38;노하우</a></label>
										</c:when>
										<c:when test="${m.bcaIndex=='18' }">
											<label><a href="recipeBoard.diet?type=16">고민&#38;질문</a></label>
										</c:when>
										<c:when test="${m.bcaIndex=='19' }">
											<label><a href="recipeBoard.diet?type=16">비포&#38;애프터</a></label>
										</c:when>
									</c:choose></td>
								<td style="width: 40%;"><a
									href="/postedCommunity.diet?postIndex=${m.postIndex }">${m.postTitle}</a></td>
								<td style="width: 15%;">${m.mbId}</td>
								<td style="width: 10%;">${m.postHit}</td>
								<td style="width: 10%;"><i class="heart icon"></i>&nbsp;&nbsp;${m.postLike}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="ui grid">
					<div class="three column row">
						<div class="column"></div>
						<div class="column">
							<div class="ui center aligned basic segment">
								<div class="ui pagination menu">${requestScope.myBookMark.pageNavi }</div>
							</div>
						</div>
						<div class="column">
							<div class="ui right aligned container"></div>
						</div>
					</div>
					<br>
				</div>
			</c:if>
			<br>
		</div>
	</div>
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