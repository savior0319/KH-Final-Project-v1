<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">

			<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
			<br>
			<c:if test="${sessionScope.member!=null}">
				<table class="ui gray table">
					<thead>
						<tr id="title" align="center">
							<th>쿠폰정보</th>
							<th>할인액</th>
							<th>사용조건</th>
							<th>유효기간</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<td>쿠폰명</td>
							<td>쿠폰할인액</td>
							<td>최소사용금액 : <br>최대할인금액 :
							</td>
							<td>유효기간</td>
						</tr>
					</tbody>
				</table>
			</c:if>
			<c:if test="${sessionScope.member==null}">
			<script type="text/javascript">
				alert("로그인 후 이용해주세요~");
				location.href = "/";
			</script>
			</c:if>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>

</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>