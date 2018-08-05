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
#myPoint1Table th {
	font-size: 15px;
}

#myPoint2Table th {
	font-size: 15px;
}

#myPoint2Table td {
	font-size: 15px;
}
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
				<div class="myPoint1">

					<table class="ui celled table" id="myPoint1Table">
						<thead>
							<tr align="center">
								<th><i class="calendar check icon"></i>총누적적립금</th>
								<th><i class="calendar check icon"></i>총사용 적립금</th>
								<th><i class="calendar check icon"></i>사용가능 적립금</th>
							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<td>-원</td>
								<td>-원</td>
								<td>-원</td>
							</tr>
						</tbody>
					</table>
				</div>
				<br>
				<div id="myPoint2">
					<table class="ui red table" id="myPoint2Table">
						<thead>
							<tr align="center">
								<th><i class="calendar check icon"></i>날 짜</th>
								<th><i class="calendar check icon"></i>내 용</th>
								<th><i class="calendar check icon"></i>적립 금액</th>
							</tr>
						</thead>
						<tbody>
							<tr align="center">
								<td>Apples</td>
								<td>200</td>
								<td>0g</td>
							</tr>
						</tbody>
					</table>
				</div>
			</c:if>
			<c:if test="${sessionScope.member==null}">
				<script type="text/javascript">
					alert("로그인 후 이용해주세요~");
					location.href = "/";
				</script>
			</c:if>

			<br>
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