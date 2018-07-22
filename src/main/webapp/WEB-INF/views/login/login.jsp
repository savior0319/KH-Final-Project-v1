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
							다이어트신의 다양한 서비스를 이용하시려면 로그인을 해주세요. <br> 회원가입을 하시면 다양한 서비스를
							받으실 수 있습니다.
						</p>
						<br>
						<form action="/loginRequest.diet" method="post">
							<div class="ui input">
								<input type="text" placeholder="아이디.." name="memberId" />
							</div>
							<br>
							<div class="ui input">
								<input type="password" placeholder="비밀번호.." name="memberPwd" />
							</div>
							<br> <input type="submit" class="ui button loginBtn"
								id="loginBtn" value="로그인" />
						</form>
						<br> <br>
						<div>
							<a class="ui simple item findPwd" href="#"><h3>비밀번호재설정</h3></a>
						</div>
						<br> <br>
						<button type="button" class="ui negative basic button"
							id="joinBtn" onclick="joinBtn1();">회원가입</button>
						<br> <br>
						<jsp:include page="/resources/SNSLogin/kakaoLogin.jsp"></jsp:include>
					</div>
				</c:if>

				<c:if test="${sessionScope.member!=null }">
					<script>
						location.href = "/index.jsp";
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
		<h5 style="padding-left:3%;">※SNS계정으로 로그인한 회원은 비밀번호 찾기를 하실 수 없습니다.회원 가입 후 이용 바랍니다.</h5>
		<div class="image content">
			<div class="description">
				<div class="ui header">
					
					<div class="ui input">
						<input type="text" placeholder="인증받을 이메일 입력 " id="mbId"
							style="width: 400px;">
					</div>
					<button type="button" class="ui red button" onclick="updatePwd();">비밀번호
						변경</button>
					<button class="ui gray button" type="reset">취소</button>
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
							
	/* 회원가입하기 버튼 클릭시 */
	function joinBtn1(){
		location.href="/signup.diet";
	}
	/* 비밀번호 찾기 모달 */
	$(".findPwd").click(function() {
		$('#findPwdModal').modal('show');
	});

	/* 비밀번호 재설정 - 이메일로 임시비밀번호 발송 */
	function updatePwd(){

		var mbId = $("#mbId").val();
		var pwdRegExp = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{6,16}$/;

					$.ajax({
					url : '/updatePassword.diet',
					data : {
						'mbId' : mbId,
					},		
					type : "post",
					success : function(data) {
						console.log(data);
						if (data == '1') {
							alert("임시비밀번호가 발급되었습니다. 메일을 확인해주세요");
							location.href = "/"
						} else {
							alert("비밀번호 변경 실패하였습니다.");
						}
					},
					error : function() {
						alert("비밀번호 변경 실패하였습니다.");
					}
				});			
			}

</script>

</html>