<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<div class="myActivity1">
					<table class="ui celled padded table">
						<thead>
							<tr align="center">
								<th>출석횟수</th>
								<th>게시물 작성수</th>
								<th>댓글작성수</th>
								<th>가입일</th>
							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<td>
									<h3 class="ui center aligned header">${ma.myAttendance}</h3>
								</td>
								<td class="single line">
									<h3>${ma.myBoardCount }</h3>
								</td>
								<td>
									<h3>${ma.myCommentCount}</h3>
								</td>
								<td>
									<h3>${ma.mbEnrollDate}</h3>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div class="myActivity2">
					<div class="ui center aligned basic segment">
						<div class="container">
							<div class="ui tabular menu" id="myActivity2">
								<a class="item" href="/myPost.diet">작성한 게시물</a>
								<a class="item active" href="/myComment.diet">작성한 댓글</a>
								<a class="item" href="/myBookMark.diet">북마크</a>
								<a class="item" href="/myReview.diet">나의 상품평</a>
								<a class="item" href="/myQuestion.diet">나의 상품문의</a>
							</div>
							<table class="ui very compact table">
								<thead>
									<tr align="center">
										<th style="width: 25%;">게시물제목</th>
										<th style="width: 50%;">댓글내용</th>
										<th style="width: 20%;">작성일</th>
									</tr>
								</thead>
								<tbody id="myBoard">
									<c:if test="${!list.isEmpty()}">
										<c:forEach items="${list}" var="c">
											<tr align="center">
												<td style="width: 25%;">
													<a class="item" href="#"> ${c.postTitle}</a>
												</td>
												<td style="width: 50%;"></td>

												<td style="width: 20%;">${c.postDateTime}</td>
											</tr>
										</c:forEach>
									</c:if>
									<c:if test="${list.isEmpty()}">
										<tr align="center">
											<td colspan="5">
												<h3>댓글을 작성한 게시물이 없습니다.</h3>
											</td>
										</tr>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<br>
					<div class="ui grid">
						<div class="three column row">
							<div class="column"></div>
							<div class="column">
								<div class="ui center aligned basic segment">
									<div class="ui pagination menu">${requestScope.cpdv.pageNavi }</div>
								</div>
							</div>
						</div>
						<br>
					</div>
				</div>
			</c:if>
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