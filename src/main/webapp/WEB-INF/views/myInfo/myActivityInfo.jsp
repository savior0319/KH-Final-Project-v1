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
.clfix li{
list-style-type: none;
float:left;
margin-top:25px;
margin-left:130px;
}

.myActivity1{
border : 1px solid black;
border-radius: 30px;
width:100%;
height:100px;
background-color:red;

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
	                	<a class="item " href="/myInfoUpdate.diet">내 정보 변경</a>
	                    <a class="item active" href="#">내 활동 정보</a> 
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
				<br>
	            <div class="myActivity1">
	                <ul class="clfix">
						<li class="mc1"><strong>출석</strong><em><span class="p-red">1</span>회</em></li>
						<li class="mc2"><strong>게시물 작성수</strong><em><span class="p-red">0</span>회</em></li>
						<li class="mc3"><strong>댓글작성수</strong><em><span class="p-red">1</span>회</em></li>
						<li class="mc4"><strong>가입일</strong><em>2018.07.06</em></li>
					</ul>                
	          	</div>
	          	<br>
	          	<div class="myActivity2">
	          		<div class="ui five item menu" id="myActivity2">
						  <a class="item active">작성한 게시물</a>
						  <a class="item">작성한 댓글</a>
						  <a class="item">북마크</a>
						  <a class="item">나의 상품평</a>
						  <a class="item">나의 상품문의</a>
					</div>
	          	</div>
	          	
	          	<h1>공용게시판 만들기</h1>
	          	<br>
	          	<script>
					 $(function(){
					    var sBtn = $("#myActivity2");    
					    sBtn.find('a').click(function(){   
					    sBtn.find('a').removeClass("active");    
					    $(this).addClass("active"); 
					  });
					 });
				</script>
	          	
	          	
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