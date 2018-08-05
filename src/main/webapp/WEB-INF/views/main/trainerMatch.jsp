<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>트레이너 매칭</title>
</head>

<!-- CSS -->
<style>
#div1{
	background: rgba(250,40,40,1); 
	cursor: pointer; 
	margin-right: 10px; 
	border-radius: 15px;
}

#div2{
	background: rgba(171,171,171,0.9); 
	cursor: pointer; 
	margin-left: 10px;
	border-radius: 15px;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<div class="ui container" style="border: 0;">
		<div class="ui center aligned basic segment" style="border: 0;">
			<br>
			<div class="ui large message">
				<div class="ui large header">트레이너 매칭</div>
			</div>
			<br>
			<div class="ui horizontal basic segments" align="center" style="border: 0;">
				<div class="ui segment" id="div1" onclick="trainerFind();" style="border: 0;">
					<br>
					<h2 class="ui header" style="color:white;" style="border: 0;">
						<br>
						<br>
						<span align="center">
							<i class="huge child icon" id="icon1"></i>
						</span>
						<br>
						<br>
						<div class="ui large header" style="color:white;">트레이너 찾기</div>
						<br>
					</h2>
					<div class="ui message"><div class="ui small header">트레이너를 찾고 싶다면 찾기go</div></div>
					<br>
				</div>


				<c:choose>
					<c:when test="${sessionScope.member.mbGrade ne '트레이너'}">
					<div class="ui segment" id="div2" onclick="trainerReg();" style="border: 0;">
					<br>
					<h2 class="ui header" style="color:white;" style="border: 0;"> 
						<br>
						<br>
						<span align="center">
							<i class="huge edit icon" id="icon2"></i>
						</span>
						<br>
						<br>
						<div class="ui large header" style="color:white;">트레이너 등록</div>
						<br>
					</h2>
					<div class="ui red message"><div class="ui small header">트레이너가 되고 싶다면 신청go</div></div>
					<br>
					</div>
					</c:when>
					<c:otherwise>
					<div class="ui segment" id="div2" onclick="programReg();" style="border: 0;">
					<br>
					<h2 class="ui header" style="color:white;" style="border: 0;"> 
						<br>
						<br>
						<span align="center">
							<i class="huge edit icon" id="icon2"></i>
						</span>
						<br>
						<br>
						<div class="ui large header" style="color:white;">트레이너 등록</div>
						<br>
					</h2>
					<div class="ui red message"><div class="ui small header">프로그램 신청go</div></div>
					<br>
					</div>
					</c:otherwise>
				</c:choose>
			</div>
			<br>
			<br>
			<br>
			<br>
		</div>
	</div> 
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	function trainerReg(){
		if(${sessionScope.member != null}){
		location.href="/trainerReg.diet";
		}else{
			alert('로그인 후 이용이 가능합니다.');
		}
	}

	function trainerFind(){
		location.href="/trainerFind.diet";
	}
	
	function programReg() {
		location.href="/programReg.diet";
	}
	$('#div1').hover(function() {
		$('#div1').css('background', 'rgb(170,10,10)'); 
		$('#icon1').css('color', 'rgb(90,90,90)');
	}, function() {
		$('#div1').css('background', 'rgba(250,40,40)'); 
		$('#icon1').css('color', 'rgb(255,255,255)');
	});

	$('#div2').hover(function() {
		$('#div2').css('background', 'rgb(141,140,140)'); 
		$('#icon2').css('color', 'rgb(250,40,40)');
	}, function() {
		$('#div2').css('background', 'rgba(171,171,171)'); 
		$('#icon2').css('color', 'rgb(255,255,255)');
	});
</script>

</html>

