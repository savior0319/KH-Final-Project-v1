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
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">
			<br>
			<div class="ui large message">
				<div class="ui large header">트레이너 매칭</div>
			</div>
			<br>
			<div class="ui horizontal basic segments" align="center">
				<div class="ui segment" style="background: rgba(250,40,40,0.9); cursor: pointer; margin-right: 10px; border-radius: 15px;" onclick="trainerFind();">
					<br>
					<h2 class="ui header" style="color:white;">
						<br>
						<br>
						<span align="center">
							<i class="huge child icon"></i>
						</span>
						<br>
						<br>
						<div class="ui large header" style="color:white;">트레이너 찾기</div>
						<br>
					</h2>
					<div class="ui message"><div class="ui small header">트레이너를 찾고 싶다면 찾기go</div></div>
					<br>
				</div>
				<div class="ui segment" style="background: rgba(171,171,171,0.9); cursor: pointer; margin-left: 10px; border-radius: 15px;" onclick="trainerReg();">
					<br>
					<h2 class="ui header" style="color:white;">
						<br>
						<br>
						<span align="center">
							<i class="huge edit icon"></i>
						</span>
						<br>
						<br>
						<div class="ui large header" style="color:white;">트레이너 등록</div>
						<br>
					</h2>
					<div class="ui red message"><div class="ui small header">트레이너가 되고 싶다면 신청go</div></div>
					<br>
				</div>
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
		location.href="/trainerReg.diet";
	}

	function trainerFind(){
		location.href="#";
	}
</script>

</html>