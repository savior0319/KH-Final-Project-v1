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
position: relative;
}

.gender_Image{
width:70%;
height:auto;
position: relative;
float:left;
}

.Btn{
width:30%;
height:auto;
position: relative;
float:left;
}

.gender_Image>div{
width:50%;
height:auto;
border:1px solid black;
float:left;
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
	                    <a class="item" href="/myActivityInfo.diet">내 활동 정보</a> 
	                    <a class="item" href="#">적립금</a> 
	                    <a class="item" href="#">쿠폰</a> 
	                    <a class="item" href="#">1:1 문의</a> 
	                    <a class="item" href="#">최근본상품</a> 
	                    <a class="item" href="#">찜한상품</a> 
	                    <a class="item" href="#">회원탈퇴</a> 
	                </div>
	            </div>
	            <div class="myInfoUpdateContents">
	            	<div class="gender_Image">
	            		<div class="femail" ><img style="width:100%; height:200px;" src="data:image/jpeg;base64,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" /></div>
	            		<div class="mail" ><img style="width:100%; height:200px;" src="https://st.depositphotos.com/1010146/4669/v/950/depositphotos_46693561-stock-illustration-formal-man-icon.jpg" /></div>
	            	</div>
	            	<div class="Btn">
	            		<button class="ui button" id="loginBtn">사진등록/변경</button>
	            		<button class="ui button" id="deletePictureBtn">사진삭제</button>
	            	</div>
	            	
	            	<div class="myInfoTable">
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