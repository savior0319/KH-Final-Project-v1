<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>회원탈퇴</title>
</head>

<!-- CSS -->
<style>
.secssionContents {
	border: 1px solid #cacaca;
	margin-bottom: 18px
}

.secssionContents ul {
	width: 674px;
	margin: 0 auto;
	padding: 5px 0
}

.secssionContents li {
	padding: 10px 0;
	border-top: 1px solid #e3e3e3;
	font-weight: bold;
	overflow: hidden
}

.secssionContents li:first-child {
	border-top: 0 none
}

.secssionContents li strong {
	float: left;
	padding-left: 5px;
	width: 100px;
	line-height: 35px
}

.secssionContents li em {
	float: left;
	width: 569px;
	line-height: 35px
}

.explan>strong {
	margin-top: 10px;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">

			<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
			<br> <br>
			<div class="explan">
				<strong>사용하고 계신 아이디<span
					style="font-size: 20px; color: red;">
						[${sessionScope.member.mbId}]</span> 는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
				</strong> <br> <strong>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게
					선택하시기 바랍니다.</strong> <br> <strong>탈퇴 후에는 아이디 <span
					style="font-size: 20px; color: red;"><strong>[${sessionScope.member.mbId}]</strong></span>
					로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
				</strong> <br> <strong>게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.</strong> <br>
			</div>
			<br>
			<div class="secssionContents">
				<div>
					<ul>
						<li><strong>계정</strong> <span style="font-size: 20px;">[${sessionScope.member.mbId}]</span>
						</li>
						<li><strong>탈퇴동의</strong> <input type="checkbox"
							class="checkbox" id="agreeChk" value="Y" /> <label>탈퇴에
								동의합니다.</label></li>

					</ul>
				</div>
			</div>
			<div class="Btn">
				<button class="ui red button" id="loginBtn" type="button"
					onclick="okayBtn();">확인</button>
				<button class="ui button" onclick="home();" type="button">홈으로</button>
			</div>
			<input type="hidden" value="${sessionScope.member.mbId}"
				id="memberId" />
		</div>
	</div>


	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
<!-- 회원 탈퇴 ajax -->
	function home() {
		location.href = "/";
	}
	function okayBtn() {
		var checkBox = $("#agreeChk").is(":checked");
		var memberId = $("#memberId").val();
		if (checkBox) {
			var result = window.confirm("정말로 탈퇴 하시겠습니까?");
			if (result) {
				$.ajax({
					url : "/secessionMember.diet",
					data : {
						memberId : memberId
					},
					type : "post",
					success : function(data) {
						if (data == '1') {
							alert('회원탈퇴 성공하였습니다.');
							location.href = "/"
						} else {
							alert('회원탈퇴 실패하였습니다.');
						}
					},
					error : function() {
						alert("탈퇴가 실패 되었습니다.");
					}
				});
			} else {
				alert("탈퇴 취소 하셨습니다.");
				location.reload();
			}
		} else {
			alert("탈퇴 동의 체크해주세요.");
		}
	}
</script>

</html>