<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300" rel="stylesheet">
<title>마이페이지-활동내역</title>
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
							<div class="ui red message warning" style="margin-top: -10px; font-size: 10px; width: 350px; float: right;">※ 댓글 신고 5번이상이 되면 활동제한(게시글,댓글작성금지)됩니다.</div>
							<tr align="center">
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="github alternate icon"></i>
									출 석 횟 수
								</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="edit outline icon"></i>
									게 시 물 작 성 수
								</th>

								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="pencil alternate icon"></i>
									댓 글 작 성 수
								</th>

								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="shield alternate icon"></i>
									나 의 등 급
								</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="user icon"></i>
									가 입 일
								</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="edit outline icon"></i>
									신 고 당 한 횟 수
								</th>
							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<td>
									<c:if test="${loginCount == 0}">
										<h3 class="ui center aligned header">
											<span style="font-family: 'Sunflower', sans-serif;">1&nbsp;회</span>
										</h3>
									</c:if>
									<c:if test="${loginCount != 0}">
										<h3 class="ui center aligned header">
											<span style="font-family: 'Sunflower', sans-serif;">${loginCount}&nbsp;회</span>
										</h3>
									</c:if>
								</td>
								<td class="single line">
									<c:if test="${ma.myBoardCount == null}">
										<h3>
											<span style="font-family: 'Sunflower', sans-serif;">0&nbsp;회</span>
										</h3>
									</c:if>
									<c:if test="${ma.myBoardCount != null}">
										<h3>
											<span style="font-family: 'Sunflower', sans-serif;">${ma.myBoardCount }&nbsp;회</span>
										</h3>
									</c:if>

								</td>
								<td style="font-family: 'Sunflower', sans-serif;">
									<c:if test="${ma.myCommentCount == null}">
										<h3>
											<span style="font-family: 'Sunflower', sans-serif;">0&nbsp;회</span>
										</h3>
									</c:if>
									<c:if test="${ma.myCommentCount != null}">
										<h3>
											<span style="font-family: 'Sunflower', sans-serif;">${ma.myCommentCount}&nbsp;회</span>
										</h3>
									</c:if>
								</td>
								<td style="font-family: 'Sunflower', sans-serif;">
									<h3>
										<span style="font-family: 'Sunflower', sans-serif;">${ma.mbGrade}</span>
									</h3>
								</td>
								<td style="font-family: 'Sunflower', sans-serif;">
									<h3>
										<span style="font-family: 'Sunflower', sans-serif;">${ma.mbEnrollDate}</span>
									</h3>
								</td>
								<td>
									<c:if test="${ma.warningComment == 0}">
										<h3>
											댓 글 :
											<span style="font-family: 'Sunflower', sans-serif;">0</span>
											회

										</h3>
									</c:if>
									<c:if test="${ma.warningComment != 0}">
										<h3>
											<span style="font-family: 'Sunflower', sans-serif;">댓 글 :${ma.warningComment}번</span>
										</h3>
									</c:if>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
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