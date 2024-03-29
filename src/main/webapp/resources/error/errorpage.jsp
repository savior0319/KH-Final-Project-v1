<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>에러페이지</title>
</head>

<!-- CSS -->
<style>
</style>


<body>

	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="ui large message" style="background-color: white;">
				<br>
				<div>
					<img src="/resources/image/errorImg.JPG" style="width: 30%;">
				</div>
				<div>
					<span style="font-weight: 600;">죄송합니다.<br>
					요청하신 페이지를 찾을 수 없습니다.</span>		
					<br>
					<br>
					페이지의 주소가 잘못 입력되었거나
					<br>
					주소가 변경 혹은 삭제되어
					<br>
					요청하신 페이지를 찾을 수 없습니다.
					<br>
					입력하신 주소가 정확한지 다시 한 번 확인 해 주시기 바랍니다.
					<br>
					관련 문의 사항은 관리자에게 문의해주시면
					<br>
					친절하게 안내해드리겠습니다.
					<br>
					감사합니다.
				</div>
				<br>
				<button class="ui button" onclick="home();" style="background-color:rgb(250,40,40); color: white;">메인으로</button>
			</div>
		</div>
	</div>

</body>

<!-- SCRIPT -->
<script type="text/javascript">
function home() {
	location.href = "/";
}
</script>

</html>