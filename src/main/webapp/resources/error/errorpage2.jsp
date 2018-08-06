<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">
			<div class="ui huge message" style="background-color: white;">
				<br>
				<div style="float: left;">
					<img src="/resources/image/errorImg.JPG"
						style="height: 200px; margin-left: 170px; margin-botton: 200px;">
				</div>
				<div style="margin-right: 150px;">
					<h6>
						페이지의 주소가 잘못 입력되었거나,주소가 변경 혹은 삭제되어 <br>요청하신 페이지를 찾을 수 없습니다.<br>
						입력하신 주소가 정확한지 다시 한 번 확인해 주시기 바랍니다. <br>관련 문의 사항은 관리자에게 문의해주시면<br>
						친절하게 안내해드리겠습니다. 감사합니다.<br>
					</h6>
					<br>
				</div>
				<button class="ui grey button" onclick="home();">메인으로</button>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	function home() {
		location.href = "/";
	}
</script>

</html>