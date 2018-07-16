<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>회원탈퇴</title>
</head>

<!-- CSS -->
<style>

.secssionContents{border:1px solid #cacaca;margin-bottom:18px}
.secssionContents ul{width:674px;margin:0 auto;padding:5px 0}
.secssionContents li{padding:10px 0; border-top:1px solid #e3e3e3;font-weight:bold;overflow:hidden}
.secssionContents li:first-child{border-top:0 none}
.secssionContents li strong{float:left;padding-left:5px;width:100px;line-height:35px}
.secssionContents li em{float:left;width:569px;line-height:35px}
.explan>strong{margin-top:10px;}
</style>


<body>
   <!-- HEADER -->
   <jsp:include page="/resources/layout/header.jsp"></jsp:include>


   <!-- CONTENTS -->
   <div class="ui center aligned basic segment">
	<div class="ui container">
		<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
			<br><br>
			<div class="explan">
				<strong>사용하고 계신 아이디<em style="color:red;">(계정넣기)</em>는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</strong> <br>
				<strong>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</strong> <br>
				<strong>탈퇴 후에는 아이디 <em style="color:red;">(계정넣기)</em> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.</strong> <br>
				<strong>게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다. </strong><br>
			</div>
			<br>
			<div class="secssionContents">			
				<div>
					<ul>
						<li>
							<strong>계정</strong>
							<em>계정 불러오기</em>
						</li>
						<li>
							<strong>탈퇴동의</strong>
							<em>
								<div>
									<input type="checkbox" class="checkbox" id="agreeBtn" name="agreeBtn" value="Y" />
									<label>탈퇴에 동의합니다.</label> 
								</div>							
							</em>
						</li>
						
					</ul>
				</div>
			</div>
			<div class="Btn">
				<button class="ui red button" id="loginBtn" type="button" onclick="okayBtn();">확인</button>
				<button class="ui button" id="loginBtn" type="button">취소</button>
			</div>
	</div>
   </div>


   <!-- FOOTER -->
   <jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
function okayBtn() {
	var checkBox = $("#agreeBtn").is(":checked");
	if(checkBox){
		var result = window.confirm("정말로 탈퇴 하시겠습니까?");
		if(result){
			var password = window.prompt("비밀번호를 입력해주세요");
			if(password==userPwd){
				alert("탈퇴가 완료되었습니다.");
				location.href = "/index.jsp";
			}
			else{
				alert("비밀번호를 재확인해주세요");
				location.reload();
			}
		}else{
			alert("탈퇴 취소 하셨습니다.");
			location.reload();
		}
	}else{
		alert("탈퇴 동의 체크해주세요.");
	}
}
</script>

</html>