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
.myInfoUpdateContents {
	width: 100%;
	height: 500px;
	position: relative;
}

.gender_Image {
	width: 70%;
	height: 35%;
	float: left;
	box-sizing: border-box;
}

.myInfoTable{
	margin-top:180px;
	width:100%;
	height:60%;
	border: 1px solid black;
}
.Btn {
	border: 1px solid black;
	width: 30%;
	height: 35%;
	position: relative;
	float: left;
	padding-top: 50px;
	border-radius: 31px;
}
	
.gender_Image>div {
	width: 50%;
	height: 100%;
	border: 1px solid black;
	position: relative;
	float: left;
	border-radius: 31px;
}

.gender_Image img{
	width: 115px;
    height: 115px;
    border-radius: 51px;
    overflow: hidden;
  	margin-top:25px;
 
}

.firstTd{
	background-color:#fa2828;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui center aligned basic segment">
		<div class="ui container">
			<div class="contents my">
				<div class="topBanner">
					<h1>광고를 넣어요</h1>
				</div>
				<div class="ui eight item menu" id="myInfoMenu">
						<a class="item active" href="/myInfoUpdate.diet">내 정보 변경</a> 
						<a class="item" href="/myActivityInfo.diet">내 활동 정보</a> 
						<a class="item" href="#">적립금</a> 
						<a class="item" href="#">쿠폰</a> 
						<a class="item" href="#">1:1 문의</a>
						<a class="item" href="#">최근본상품</a>
						<a class="item" href="#">찜한상품</a> 
						<a class="item" href="#">회원탈퇴</a>
				</div>
			</div>
			<br>
			<div class="myInfoUpdateContents">
				<div class="gender_Image">
					<div class="femail">
						<img id="femailImage" src="https://st.depositphotos.com/1010146/4669/v/950/depositphotos_46693561-stock-illustration-formal-man-icon.jpg" />
						<input type="radio" class="radio" id="female" name="gender" value="F" checked />여자
					</div>
					<div class="mail">
						<img id="mailImage" src="https://st2.depositphotos.com/1432405/11185/v/950/depositphotos_111854370-stock-illustration-woman-icon-simple-style.jpg" />
						<input type="radio" class="radio" id="male" name="gender" value="M"/>남자
					</div>
				</div>
				<div class="Btn">
					<button class="ui button" id="loginBtn" style="width:140px;">사진등록/변경</button>
					<br>
					<button class="ui button" id="deletePictureBtn" style="margin-top:10px; width:140px;">사진 삭제</button>
				</div>
				<br>   
				<div class="myInfoTable">
					<table class="ui celled table">
						<thead>
						</thead>
						<tbody>
							<tr>
								<td class="firstTd">등급</td>
								<td>입문 다이어터&nbsp;&nbsp;
									<button class="ui button">등급안내</button>
								</td>
							</tr>
							<tr>
								<td class="firstTd">계정</td>
								<td>
									<div class="ui input focus">
										<input type="text" id="account" name="account" value="이메일계정보여주기" style="width: 300px;">
									</div>	
								</td>
							</tr>
							<tr>
								<td class="firstTd">닉네임</td>
								<td>
									<div class="ui input focus">
										<input type="text" placeholder="닉네임" id="nickName" name="nickName" style="width: 300px;">		
									</div>
								</td>
							</tr>
							<tr>
								<td class="firstTd">다짐</td>
								<td><div class="ui input focus">
										<input type="text" placeholder="한 줄 다짐" id="promise" name="promise" style="width: 500px;">								
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<button class="ui red button" id="loginBtn">확인</button>
					<button class="ui button" id="loginBtn">취소</button>
				</div>
			</div>
			<div class="sideBar"></div>
			<!--  ui container 닫기  -->
		</div>
	</div>


	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>