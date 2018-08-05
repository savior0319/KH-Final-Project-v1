<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<title>내정보게시판</title>
</head>

<!-- CSS -->
<style>
</style>


<body>
	<!-- HEADER -->

	<!-- CONTENTS -->
	<div class="ui center aligned basic segment">
		<div class="container">
			<div class="ui tabular menu" id="myActivity2">
				<a class="item active" href="/myPost.diet?mbIndex=${member.mbIndex}">작성한 게시물</a>
				<a class="item" href="/myComment.diet">작성한 댓글</a>
				<a class="item" href="myBookMark.diet">북마크</a>
				<a class="item" href="#">나의 상품평</a>
				<a class="item" href="#">나의 상품문의</a>
			</div>
			<div class="ui center aligned basic segment">
				<div class="container">
					<table class="ui very compact table">
						<thead>
							<tr align="center">
								<th style="width: 15%;">게시판</th>
								<th style="width: 50%;">제목</th>
								<th style="width: 15%;">작성자</th>
								<th style="width: 10%;">조회수</th>
								<th style="width: 10%;">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.cpdv.comList}" var="c">
								<tr align="center">
									<td>
										<c:choose>
											<c:when test="${c.bcaIndex==15}">자유게시판</c:when>
											<c:when test="${c.bcaIndex==17}">팁&노하우</c:when>
											<c:when test="${c.bcaIndex==18 }">고민&질문</c:when>
											<c:when test="${c.bcaIndex==19 }">비포&애프터</c:when>
										</c:choose>
									</td>
									<td style="padding-top: 15px; padding-bottom: 15px;" onclick="recipeLink(${c.postIndex});">
										<a class="item" href="/postedCommunity.diet">${c.postTitle}</a>
									</td>
									<td>
										<img class="ui avatar image" src="${c.postImage}">
										닉네임
									</td>
									<td>${c.postHit}</td>
									<td>${c.postDateTime}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
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
	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>