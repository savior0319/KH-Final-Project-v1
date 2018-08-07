<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<script src="/resources/slider/responsiveslides.min.js"></script>
<title>트레이너</title>
</head>
<!-- CSS -->
<link rel="stylesheet" type="text/css" class="ui" href="/stylesheets/shape.css">
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
				<li>
					<img src="#" id="image1" style="height: 300px;">
				</li>
				<li>
					<img src="#" id="image2" style="height: 300px;">
				</li>
				<li>
					<img src="#" id="image3" style="height: 300px;">
				</li>
				<li>
					<img src="#" id="image4" style="height: 300px;">
				</li>
				<li>
					<img src="/resources/image/advertise.png" style="height: 300px;">
				</li>
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
	/* 광고 이미지 불러오기 */
	$(document).ready(function() {
		$.ajax({
			url : '/advertiseImageLoad.diet',
			type : 'post',
			success : function(img) {
				$("#image1").attr("src", img[0].path1);
				$("#image2").attr("src", img[1].path1);
				$("#image3").attr("src", img[2].path1);
				$("#image4").attr("src", img[3].path1);
			},
			error : function() {
				console.log('[ERROR] - 이미지 불러오기 오류');
			}
		});
	});
</script>

</html>