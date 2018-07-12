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
.myInfoUpdateContents{
width : 100%; 
height:500px;
border:1px solid black;
}
</style>


<body>
   <!-- HEADER -->
   <jsp:include page="/resources/layout/header.jsp"></jsp:include>


   <!-- CONTENTS -->
   <div class="ui center aligned basic segment">
		<div class="ui container">
	            <div class="contents my">
	                <div class="topBanner"><h1>광고를 넣어요</h1></div>
	                <div class="ui eight item menu" id="myInfoMenu"> 
	                	<a class="item active" href="/myInfoUpdate.diet">내 정보 변경</a>
	                    <a class="item" href="#">내 활동 정보</a> 
	                    <a class="item" href="#">적립금</a> 
	                    <a class="item" href="#">쿠폰</a> 
	                    <a class="item" href="#">1:1 문의</a> 
	                    <a class="item" href="#">최근본상품</a> 
	                    <a class="item" href="#">찜한상품</a> 
	                    <a class="item" href="#">회원탈퇴</a> 
	                </div>
	            </div>
	            <div class="myInfoUpdateContents">
	            	<div class="profileImage">
	            		여자 이미지 / 남자이미지 프로필 사진 넣기 
	            	</div>
	            	<div class="Btn">
	            		<button class="ui button" id="loginBtn">사진등록/변경</button>
	            		<button class="ui button" id="deletePictureBtn">사진삭제</button>
	            	</div>
	            	<div>
	            		<table class="ui celled table">
						 <thead>
						 </thead>
						  <tbody>
						    <tr>
						      <td>등급</td>
						      <td>입문다이어터&nbsp;&nbsp;<button class="ui button">등급안내</button></td>
						    </tr>
						    <tr>
						       <td>계정</td>
						      <td>계정 보여주기</td>
						    </tr>
						    <tr>
						      <td>닉네임</td>
						      <td><div class="ui input focus">
								     <input type="text" placeholder="닉네임" id="nickName" name="nickName">
								  </div>
							 </td>
						    </tr>
						    <tr>
						      <td>다짐</td>
						      <td><div class="ui input focus">
								     <input type="text" placeholder="한 줄 다짐" id="promise" name="promise"
								      style="width:500px;">
								  </div>
							 </td>
						    </tr>
						  </tbody>
						</table>
						<button class="ui red button" id="loginBtn">확인</button>
						<button class="ui button" id="loginBtn">취소</button>
	            	</div>
	            </div>
	            <div class="sideBar">
	                
	          	</div>
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