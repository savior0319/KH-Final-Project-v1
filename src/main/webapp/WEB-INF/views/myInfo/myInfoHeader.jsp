<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>

</style>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지-헤더</title>
</head>
<body>
	  	<div class="contents my">
			<div class="topBanner">
				<jsp:include page="/WEB-INF/views/myInfo/myInfoAd.jsp"></jsp:include>
			</div>
			<div class="ui eight item menu" id="myInfoMenu">
					<a class="item" href="/myInfoUpdate.diet" style=" font-size:15px; font-weight:600;"><i class="info icon"></i>내 정보 변경</a> 
					<a class="item" href="/myActivityInfo.diet" style="font-size:15px;   font-weight:600;"><i class="clipboard check  outline icon"></i>내 활동 정보</a> 
					<a class="item" href="/allMyOneToOneQuestion.diet" style=" font-size:17px;  font-weight:600;"><i class="question circle outline icon"></i> 1:1 문의</a>
					<a class="item" href="/myPost.diet" style="font-size:15px;  font-weight:600;"><i class="clipboard outline icon"></i>작성한게시물</a>
					<a class="item" href="/myComment.diet" style=" font-size:15px;  font-weight:600;"><i class="comment outline icon"></i>작성한댓글</a>
					<a class="item" href="/myBookMark.diet" style="font-size:15px;  font-weight:600;"><i class="bookmark outline icon"></i>북마크</a>
					<c:if test="${member.mbGrade == '일반회원' || member.mbGrade == '카카오회원'}">
					<a class="item" href="/requestTrainer.diet" style=" font-size:15px;  font-weight:600;"><i class="h square icon"></i>트레이너-일반</a>
					</c:if>
					<c:if test="${member.mbGrade == '트레이너'}">
					<a class="item" href="/applyTrainer.diet" style=" font-size:15px;  font-weight:600;"><i class="h square icon"></i>트레이너 매칭</a>
					</c:if>
					<c:if test="${member.mbGrade == '관리자'}">
					<a class="item" href="/applyTrainer.diet" style="font-size:15px;  font-weight:600;" ><i class="h square icon"></i>트레이너 매칭</a>
					
					</c:if>
					<a class="item" href="/secession.diet" style="font-size:15px;  font-weight:600;"><i class="hand paper icon"></i>회원탈퇴</a>
			</div>
		</div>
	           <script>
         
      $(document).ready(function() {
         var trainer = ${member.mbGrade == '트레이너'};
      
         var regExp = /myInfo.diet$/;
            var regExp1 = /myInfoUpdate.diet$/;
            var regExp2 = /myActivityInfo.diet$/;
            var regExp3 = /allMyOneToOneQuestion.diet$/;
            var regExp4 = /myPost.diet$/;
            var regExp5 = /myComment.diet$/;
            var regExp6 = /myBookMark.diet$/;
            if(trainer){
          	  var regExp7 = /applyTrainer.diet$/;
           }else {
          	  var regExp7 = /requestTrainer.diet$/;
           }
            var regExp8 = /secession.diet$/;
                        
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
            }
         
      });
   </script>
</body>
</html>