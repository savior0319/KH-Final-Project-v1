<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>다이어트</title>
</head>

<!-- CSS -->
<style>
<%--
cursor: pointer
마우스가 반응하는 위치의 모양을 pointer로 잡아줌
box-shadow
그림자 효과 표현
filter는 .. border-radius : 

--%> .visitorbook {
	background-color: #44c767;
	border-radius: 19px 20px 20px;
	display: inline-block;
	font-family: Courier New;
	font-size: 16px;
	padding: 16px 30px;
	text-decoration: none;
	border: 0;
	outline: none;
	border-style: outset;
	text-shadow: 0px 0px 0px #2f6627;
}

.visitorbook:active {
	border-style: outset;
}

.goals {
	background-color: #44c767;
	border-radius: 19px 20px 20px;
	display: inline-block;
	font-family: Courier New;
	font-size: 16px;
	padding: 16px 30px;
	text-decoration: none;
	border: 0;
	outline: 0;
	border-style: outset;
	text-shadow: 0px 0px 0px #2f6627;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui center aligned basic segment">
		<div class="ui container">
			<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
			<!-- 실제 코딩  -->
			<div>
				<div>
					<div style="width: 80%; margin: auto;">
						<form action="/myDiaryRegister.diet" method="post">
							<ul class="visitorbook">
								<button id="visitorbook" name="myDiary" value="방명록">방명록
								</ul>

								<ul class="goals">
									<button id="goals" name="myDiary" value="목표설정">목표설정
									</ul>
								</div>
								<br>
								<div>
									<br>
									<textarea cols="80" rows="10" style="resize: none;" name="content"></textarea>
									<input type="hidden" name="mbId" value="${sessionScope.member.mbId}">
								</div>
								<br>
								<input class="visitTextbtn" type="submit" value="작성">
								<input class="visitTextbtn" type="reset" value="취소">
							</form>
						</div>
					</div>
				</div>
			</div>

			<!-- FOOTER -->
			<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
		</body>

		<!-- SCRIPT -->
		<script type="text/javascript">
			
		</script>

		</html>