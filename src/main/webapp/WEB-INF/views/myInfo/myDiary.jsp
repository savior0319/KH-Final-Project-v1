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


<%--
cursor: pointer
마우스가 반응하는 위치의 모양을 pointer로 잡아줌
box-shadow
그림자 효과 표현
filter는 .. border-radius : 

 --%> 
 .visitorbook {
	background-color: #44c767;
	border-radius: 19px 20px 20px;
	display: inline-block;
	font-family: Courier New;
	font-size: 16px;
	padding: 16px 30px;
	text-decoration: none;
	border: 0;
	outline: none;
	border-style: outset;
	text-shadow: 0px 0px 0px #2f6627;
}

.visitorbook:active {
	border-style: outset;
}

.goals {
	background-color: #44c767;
	border-radius: 19px 20px 20px;
	display: inline-block;
	font-family: Courier New;
	font-size: 16px;
	padding: 16px 30px;
	text-decoration: none;
	border: 0;
	outline: 0;
	border-style: outset;
	text-shadow: 0px 0px 0px #2f6627;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui center aligned basic segment">
		<div class="ui container">
			<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
			<!-- 실제 코딩  -->
			<div>
				<div>
					<div style="width: 80%; margin: auto;">
						<ul class="visitorbook">
							<button id="visitorbook" name="myDiary" value="방명록">방명록
						</ul>

						<ul class="goals">
							<button id="goals" name="myDiary" value="목표설정">목표설정
						</ul>
					</div>
					<br>
					<div>
						<br>
						<textarea cols="80" rows="10" style="resize: none;"></textarea>
					</div>
					<br>
					<form>
						<input class="visitTextbtn" type="submit" value="작성"> <input
							class="visitTextbtn" type="reset" value="취소">
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">


	$("#visitorbook").click(function() {
		$.ajax({
			type:"POST",
			url:"./visitorbook.jsp",
			data:{name:"홍길동"},
			dataType:"xml",
			}
		});
	});
	.done(function(){ // success랑 같음
		
	})
	.fail(function(){ // error와 같음
		
	})
	.always(function(){ // complete와 같음
		
	})
	
	function myDiaryPage{
		var data = document.getElementById("visitorbook").value;
		// 객체 생성(IE의 경우 버전별로 설정해야 함)
		var xhttp = new XMLHttpRequest();
		// 요청 정보 설정
		xhttp.open("GET","/visitorbook?data="+data,true);
		
		// 콜백 함수(메소드 작동)
		xhttp.onreadystatechange = function(){
			if(this.readyState==4){
				if(this.status==200){
					con
				}
			}
		}
		}
</script>

</html>