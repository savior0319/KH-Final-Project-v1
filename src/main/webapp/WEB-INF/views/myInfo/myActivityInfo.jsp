<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>마이페이지</title>
</head>

<!-- CSS -->
<style>
html, body {
	margin: 0 auto;
}
.myActivity1 {
	border-radius: 30px;
	position: relative;
}
.myActivity2 a {
	width: 20%;
	margin: auto 0;
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
			<div class="myActivity1">
				<table class="ui celled padded table">
					<thead>
						<tr align="center">
							<th>출석횟수</th>
							<th>게시물 작성수</th>
							<th>댓글작성수</th>
							<th>가입일</th>
						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<td>
								<h2 class="ui center aligned header">A</h2>
							</td>
							<td class="single line">Power Output</td>
							<td>댓글작성몇번?</td>
							<td>ddd</td>
						</tr>
					</tbody>
				</table>
			</div>


			<br>
			<div class="myActivity2">
				<div class="ui tabular menu" id="myActivity2" >
					<a class="item active" href="#" >작성한 게시물</a>
					<a class="item" href="#">작성한 댓글</a> 
					<a class="item" href="#">북마크</a> 
					<a class="item" href="#">나의 상품평</a>
					<a class="item" href="#">나의 상품문의</a>		
				</div>
				<jsp:include page="/WEB-INF/views/myInfo/notice.jsp"></jsp:include>
			</div>

		</div>
		<script>
			$(function() {
				var sBtn = $("#myActivity2");
				sBtn.find('a').click(function() {
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