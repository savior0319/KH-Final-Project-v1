<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<script src="/resources/slider/responsiveslides.min.js"></script>
<title>트레이너</title>
</head>
<!-- CSS -->
<link rel="stylesheet" type="text/css" class="ui"
	href="/stylesheets/shape.css">
<style>
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
	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">
			<!-- 슬라이드-->
			<ul class="rslides" style="padding-bottom: 15px;">
				<li><a
					href="https://www.google.co.kr/search?q=%EA%B7%80%EC%8B%A0&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjfktevrcjcAhXEdt4KHXnfAb8Q_AUICigB&biw=1920&bih=974">
						<img style="height:300px" src="/resources/image/mainPic.jpg">
				</a></li>
				<li><a
					href="https://www.google.co.kr/search?q=%EA%B7%80%EC%8B%A0&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjfktevrcjcAhXEdt4KHXnfAb8Q_AUICigB&biw=1920&bih=974">
						<img style="height:300px;" src="/resources/image/mainPic1.jpg">
				</a></li>
				<li><a
					href="https://www.google.co.kr/search?q=%EA%B7%80%EC%8B%A0&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjfktevrcjcAhXEdt4KHXnfAb8Q_AUICigB&biw=1920&bih=974">
						<img style="height:300px;" src="/resources/image/mainPic2.jpg">
				</a></li>
				<li><a
					href="https://www.google.co.kr/search?q=%EA%B7%80%EC%8B%A0&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjfktevrcjcAhXEdt4KHXnfAb8Q_AUICigB&biw=1920&bih=974">
						<img style="height:300px;" src="/resources/image/mainPic3.jpg">
				</a></li>
				<li><a
					href="https://www.google.co.kr/search?q=%EA%B7%80%EC%8B%A0&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjfktevrcjcAhXEdt4KHXnfAb8Q_AUICigB&biw=1920&bih=974">
						<img style="height:300px;" src="/resources/image/advertise.png">
				</a></li>
			</ul>
		</div>
	</div>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
<!-- 광고 이미지 스크립트 -->
	// 슬라이드
	$(function() {
		$(".rslides").responsiveSlides({
			auto : true,
			timeout : 1500,
			random : true,
		});
	});
</script>

</html>