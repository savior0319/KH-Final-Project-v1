<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<!-- 카카오로그인 외부 JS -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
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

#joinBtn{
	width: 350px;
	height: 50px;
	background-color: #fa2828;
	margin-top: 5px;
}
    
h3{
    text-decoration-line: underline;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui center aligned basic segment">
		<div class="ui container">
			<div class="contents login">
				<div class="login title">
					<h1>LOGIN</h1>
				</div>
				<div class="login box">
					<p style="padding-top:20px; font-size:13px; font-weight:800;">
						다이어트신의 다양한 서비스를 이용하시려면 로그인을 해주세요.<br>
						회원가입을 하시면 다양한 서비스를 받으실 수 있습니다.
					</p>
					<br>
					<div class="ui input">
						<input type="text" placeholder="아이디.." />
					</div>
					<br>
					<div class="ui input">
						<input type="text" placeholder="비밀번호.." />
					</div>
					<br>
					<button class="ui button" id="loginBtn">로그인</button>
					<br>
					<br>
					<a href="#"><h3>비밀번호재설정</h3></a>
					<br>
					<button class="ui negative basic button" id="joinBtn"><a href="#" style="color:#fa2828;">회원가입</a></button>
					<br>
					<br>
					<jsp:include page="/WEB-INF/views/login/kakaoLogin.html"></jsp:include>
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