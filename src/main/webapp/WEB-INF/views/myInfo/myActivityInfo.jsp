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
margin-left:13%;  
}

.myActivity1{
border : 1px solid black;
border-radius: 30px;
width:100%;
height:130px;
background-color:lightgray;
position: relative;

}  
.myActivity2 a{
width : 20%;
margin :auto 0;
}
.clfix{height:117px}
.clfix li{float:left;width:300px;}
.clfix li strong{display:inline-block;padding-left:35px;margin-right:9px}
</style>


<body>
   <!-- HEADER -->
   <jsp:include page="/resources/layout/header.jsp"></jsp:include>


   <!-- CONTENTS -->
   <div class="ui center aligned basic segment">
		<div class="ui container">
	           <jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
				<br>
	         	<div class="myActivity1">
	                <ul class="clfix">
						<li class="mc1"><strong>출&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;석</strong><span class="p-red">1</span>회</li>
						<li class="mc2"><strong>게시물 작성수</strong><span class="p-red">0</span>회</li>
						<li class="mc3"><strong>댓글작성수</strong><span class="p-red">1</span>회</li>
						<li class="mc4"><strong>가입일</strong>2018.07.06</li>
					</ul>                
	          	</div> 
	          	
	      
	          	<br>
	          	<div class="myActivity2">
		          	<div class="ui tabular menu" id="myActivity2">
					  	  <a class="item active" href="#">작성한 게시물</a>
						  <a class="item" href="#">작성한 댓글</a>
						  <a class="item" href="#">북마크</a>
						  <a class="item" href="#">나의 상품평</a>
						  <a class="item" href="#">나의 상품문의</a>
					</div>
					<jsp:include page="/WEB-INF/views/myInfo/notice.jsp"></jsp:include>
	          	</div>
	          	 	
	          	</div>
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



   <!-- FOOTER -->
   <jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
   
</script>

</html>