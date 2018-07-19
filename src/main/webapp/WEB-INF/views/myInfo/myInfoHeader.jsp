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
					<a class="item" href="/myInfoUpdate.diet">내 정보 변경</a> 
					<a class="item" href="/myActivityInfo.diet">내 활동 정보</a> 
					<a class="item" href="/myPoint.diet">적립금</a> 
					<a class="item" href="/myCoupon.diet">쿠폰</a> 
					<a class="item" href="/allMyOneToOneQuestion.diet">1:1 문의</a>
					<a class="item" href="#">최근본상품</a>
					<a class="item" href="/myWishList.diet">찜한상품</a> 
					<a class="item" href="/myDiary.diet">나의다이어리</a> 
					<a class="item" href="/secession.diet">회원탈퇴</a>
			</div>
		</div>
	           <script>
         
      $(document).ready(function() {
         
         var regExp = /myInfo.diet$/;
            var regExp1 = /myInfoUpdate.diet$/;
            var regExp2 = /myActivityInfo.diet$/;
            var regExp3 = /myPoint.diet$/;
            var regExp4 = /myCoupon.diet$/;
            var regExp5 = /allMyOneToOneQuestion.diet$/;
            var regExp6 = /mmmmmmmmmmmm.diet$/;
            var regExp7 = /myWishList.diet$/;
            var regExp8 = /myDiary.diet$/;
            var regExp9 = /secession.diet$/;
                        
            if(regExp.test(location.href) || regExp1.test(location.href)){
               $("#myInfoMenu").find('a:first-child').addClass('active');
            }else if(regExp2.test(location.href)){
               $("#myInfoMenu").find('a:nth-child(2)').addClass('active');
            }else if(regExp3.test(location.href)){
               $("#myInfoMenu").find('a:nth-child(3)').addClass('active');
            }else if(regExp4.test(location.href)){
               $("#myInfoMenu").find('a:nth-child(4)').addClass('active');
            }else if(regExp5.test(location.href)){
               $("#myInfoMenu").find('a:nth-child(5)').addClass('active');
            }else if(regExp6.test(location.href)){
               $("#myInfoMenu").find('a:nth-child(6)').addClass('active');
            }else if(regExp7.test(location.href)){
               $("#myInfoMenu").find('a:nth-child(7)').addClass('active');
            }else if(regExp8.test(location.href)){
               $("#myInfoMenu").find('a:nth-child(8)').addClass('active');
            }else if(regExp9.test(location.href)){
               $("#myInfoMenu").find('a:last-child').addClass('active');
            }
         
      });
   </script>
        <div class="sideBar">
             
       	</div>

  
</body>
</html>