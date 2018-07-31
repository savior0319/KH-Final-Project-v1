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
								<th>
									<i class="github alternate icon"></i>
									출 석 횟 수
								</th>
								<th>
									<i class="edit outline icon"></i>
									게 시 물 작 성 수
								</th>
								<th>
									<i class="pencil alternate icon"></i>
									댓 글 작 성 수
								</th>
								<th>
									<i class="shield alternate icon"></i>
									나의 등급
								</th>
								<th>
									<i class="user icon"></i>
									가 입 일
								</th>
							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<td>
									<c:if test="${loginCount == 0}">
										<h3 class="ui center aligned header">1</h3>
									</c:if>
									<c:if test="${loginCount != 0}">
										<h3 class="ui center aligned header">${loginCount}</h3>
									</c:if>
								</td>
								<td class="single line">
									<c:if test="${ma.myBoardCount == null}">
										<h3>0</h3>
									</c:if>
									<c:if test="${ma.myBoardCount != null}">
										<h3>${ma.myBoardCount }</h3>
									</c:if>

								</td>
								<td>
									<c:if test="${ma.myCommentCount == null}">
										<h3>0</h3>
									</c:if>
									<c:if test="${ma.myCommentCount != null}">
										<h3>${ma.myCommentCount}</h3>
									</c:if>
								</td>
								<td>
									<h3>${ma.mbGrade}</h3>
								</td>
								<td>
									<h3>${ma.mbEnrollDate}</h3>
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