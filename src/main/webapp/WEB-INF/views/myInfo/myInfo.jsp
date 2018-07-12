<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>다이어트</title>
</head>

<!-- 카카오 로그인 JS -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- CSS -->
<style>

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
	             <script>
					 $(function(){
					    var sBtn = $("#myInfoMenu");    
					    sBtn.find('a').click(function(){   
					    sBtn.find('a').removeClass("active");    
					    $(this).addClass("active"); 
					  });
					 });
				</script>
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