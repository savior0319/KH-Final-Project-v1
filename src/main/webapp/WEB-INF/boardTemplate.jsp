<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>커뮤니티</title>
<script src="/resources/slider/responsiveslides.min.js"></script>
</head>

<!-- CSS -->
<style>
.ui.card {
	width: 400px;
}

.rslides {
	position: relative;
	list-style: none;
	overflow: hidden;
	width: 100%;
	padding: 0;
	margin: 0;
}

.rslides li {
	-webkit-backface-visibility: hidden;
	position: absolute;
	display: none;
	width: 100%;
	left: 0;
	top: 0;
}

.rslides li:first-child {
	position: relative;
	display: block;
	float: left;
}

.rslides img {
	display: block;
	height: auto;
	float: left;
	width: 100%;
	border: 0;
}
</style>

<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<div class="ui center aligned container">
		<!-- 슬라이드-->
		<ul class="rslides">
			<li>
				<img src="/resources/image/mainPic.jpg" style="height: 250px;">
			</li>
			<li>
				<img src="/resources/image/mainPic1.jpg" style="height: 250px;">
			</li>
			<li>
				<img src="/resources/image/mainPic2.jpg" style="height: 250px;">
			</li>
			<li>
				<img src="/resources/image/mainPic3.jpg" style="height: 250px;">
			</li>
		</ul>
		<br>
		<div class="ui left aligned container">
			<h1>
				<!-- 게시판 제목 입력 -->
			</h1>
		</div>
		<hr style="border: 2px solid #D5D5D5;">
		<br>
		<div class="ui center aligned basic segment" style="margin-top: 0px; padding: 0px;">
			<table class="ui very compact table">
				<thead>
					<tr align="center">
						<th style="width: 15%;">게시판</th>
						<th style="width: 50%;">제목</th>
						<th style="width: 15%;">작성자</th>
						<th style="width: 10%;">조회수</th>
						<th style="width: 10%;">작성일</th>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
		<br>
	</div>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	// 슬라이드
	$(function() {
		$(".rslides").responsiveSlides({
			auto : true,
			timeout : 1500,
		});
	});
</script>

</html>