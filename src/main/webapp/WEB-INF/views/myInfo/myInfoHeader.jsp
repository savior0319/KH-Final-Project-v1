<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	  	<div class="contents my">
			<div class="topBanner">
				<jsp:include page="/WEB-INF/views/myInfo/myInfoAd.jsp"></jsp:include>
			</div>
			<div class="ui nine item menu" id="myInfoMenu">
					<a class="item active" href="/myInfoUpdate.diet">내 정보 변경</a> 
					<a class="item" href="/myActivityInfo.diet">내 활동 정보</a> 
					<a class="item" href="/myPoint.diet">적립금</a> 
					<a class="item" href="/myCoupon.diet">쿠폰</a> 
					<a class="item" href="#">1:1 문의</a>
					<a class="item" href="#">최근본상품</a>
					<a class="item" href="#">찜한상품</a> 
					<a class="item" href="#">나의다이어리</a> 
					<a class="item" href="/secession.diet">회원탈퇴</a>
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

  
</body>
</html>