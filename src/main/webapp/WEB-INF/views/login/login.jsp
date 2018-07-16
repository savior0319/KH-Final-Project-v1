<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>

<title>다이어트</title>
</head>

<!-- CSS -->
<style>
.contents.login {
	width: 500px;
	height: auto;
	margin: 0 auto;
	border: 1px solid #f2f2f2;
	box-sizing: border-box;
}

.login.title {
	border: 1px solid #f2f2f2;
	background-color: #CCCCCC;
	width: 100%;
	height: 70px;
	padding: 15px;
	box-sizing: border-box;
}

.login.box {
	border: 1px solid #f2f2f2;
	width: 100%;
	height: 550px;
	box-sizing: border-box;
}

.login.box input {
	width: 350px;
	height: 50px;
	margin: 3px;
}

#loginBtn {
	width: 350px;
	height: 50px;
	background-color: #fa2828;
	margin-top: 5px;
}

#joinBtn {
	width: 350px;
	height: 50px;
	background-color: #fa2828;
	margin-top: 5px;
}

h3 {
	text-decoration-line: underline;
}

ul li {
	list-style: none;
	float: left;
	margin-left: 65px;
}

a {
	text-decoration: none;
}
</style>
<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<div class="ui center aligned basic segment">
		<div class="ui container">
			<div class="contents login">
				<c:if test="${sessionScope.member==null}">
				<div class="login title">
					<h1>LOGIN</h1>
				</div>
				<div class="login box">
					<p style="padding-top: 20px; font-size: 13px; font-weight: 800;">
						다이어트신의 다양한 서비스를 이용하시려면 로그인을 해주세요. <br> 회원가입을 하시면 다양한 서비스를 받으실
						수 있습니다.
					</p>
					<br>
					<form action="/loginRequest.diet" method="post">
						<div class="ui input">
							<input type="text" placeholder="아이디.." name = "memberId" />
						</div>
						<br>
						<div class="ui input"> 
							<input type="text" placeholder="비밀번호.." name = "memberPwd" />
						</div>
						<br>
						<input type="submit" class="ui button loginBtn" id="loginBtn" value = "로그인" />
					</form>
					<br><br>
					<div>
						<ul>
							<li><a class="ui simple item findPwd" href="#"><h3>비밀번호재설정</h3></a></li>
							<li><a class="ui simple item findId" href="#"><h3>아이디찾기</h3></a></li>
						</ul>
					</div>
					<br> <br>
					<button type="button" class="ui negative basic button" id="joinBtn"
						onclick="joinBtn();">회원가입</button>
					<br> <br>
					<jsp:include page="/resources/SNSLogin/kakaoLogin.jsp"></jsp:include>
				</div>
				</c:if>
				
				<c:if test="${sessionScope.member!=null }">
					<script>	
						location.href="/index.jsp";
						alert("로그인상태입니다.");
					</script>
				</c:if>
			</div>
		</div>
	</div>

	<!-- 비밀번호 찾기 모달 -->

	<div class="ui modal" id="findPwdModal">
		<i class="close icon"></i>
		<div class="header">비밀번호 재설정</div>
		<div class="image content">
			<div class="description">
				<div class="ui header">
					<div class="ui input">
						<input type="text" placeholder="비밀번호 입력..">
					</div>
					<br>
					<div class="ui input">
						<input type="text" placeholder="비밀번호 재입력">
					</div>
				</div>
			</div>

			<div class="actions">
				<div class="ui black deny button">취소</div>
				<div class="ui positive right labeled icon button">
					비밀번호 변경 <i class="checkmark icon"></i>
				</div>
			</div>
		</div>
	</div>


	<!-- 아이디 찾기 모달 -->
	<div class="ui modal" id="findIdModal">
		<i class="close icon"></i>
		<div class="header">아이디 찾기</div>
		<div class="image content">
			<div class="description">
				<div class="ui header">
					<div class="ui input">
						<input type="text" placeholder="이메일 주소 입력">
					</div>
					<br>
					<div class="ui input">
						<input type="text" placeholder="이름 입력">
					</div>
				</div>
			</div>
			<div class="actions">
				<div class="ui black deny button">취소</div>
				<div class="ui positive right labeled icon button">
					아이디 찾기 <i class="checkmark icon"></i>
				</div>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	/* 비밀번호 찾기 모달 */
	$(".findPwd").click(function() {
		$('#findPwdModal').modal('show');
	});
	/* 아이디 찾기 모달 */
	$(".findId").click(function() {
		$('#findIdModal').modal('show');
	});
	
	/* 로그인 버튼 */

</script>

</html>