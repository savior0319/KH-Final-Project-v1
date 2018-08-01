<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>다이어트</title>
</head>

<!-- CSS -->
<style>
body {
	margin-left: 240px;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/adminheader.jsp"></jsp:include>


	<!-- CONTENTS -->
	<br>
	<br>
	<div class="ui container">
		<div class="ui center aligned segment">
			<h1>트레이너 신청 관리</h1>
		</div>

		<table class="ui very compact table">
			<thead>
				<tr align="center">
					<th>신청 번호</th>
					<th>아이디</th>
					<th>연락처</th>
					<th>성별</th>
					<th>회원등급</th>
					<th>신청일</th>
					<th>자세히보기</th>
				</tr>
			</thead>
			<tbody>
				<tr align="center">
					<td>666</td>
					<td>555</td>
					<td>444</td>
					<td>333</td>
					<td>222</td>
					<td>111</td>
					<th><button id="trInfo_" class="ui red button" style="margin-right: 0px;padding-top: 8px;padding-bottom: 8px;padding-left: 18px;padding-right: 18px;"><i class="large zoom-in icon" style="margin-left: 0px; margin-right: 0px;"></i></button></th>
				</tr>
			</tbody>
		</table>


	</div>





	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>