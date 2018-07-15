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
#myPoint1Table th{
	padding-left:120px;
	font-size:15px;
}

#myPoint1Table td{
	padding-left:160px;
}

#myPoint1Table tr{
	height:60px;
}

#myPoint2Table th{
	padding-left:150px;
	font-size:15px;
}

#myPoint2Table td{
	padding-left:155px;
	font-size:15px;
}

</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui center aligned basic segment">
		<div class="ui container">
			<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
			<br>
			<div class="myPoint1">
				<table class="ui celled table" id="myPoint1Table">
					<thead>
						<tr>
							<th>총 누적 적립금</th>
							<th>총 사용 적립금</th>
							<th>사용가능 적립금</th>
						</tr>
					</thead>
					<tbody>
						<tr>
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
					    <tr><th>날 짜</th>
					    <th>내 용</th>
					    <th>적립 금액</th>
					  </tr></thead><tbody>
					    <tr>
					      <td>Apples</td>
					      <td>200</td>
					      <td>0g</td>
					    </tr>
					  </tbody>
					</table>
			</div>
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