<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>공지사항</title>
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
		<ul class="rslides" style="padding-bottom: 15px;">
			<li>
				<img src="#"" id="image1" style="height: 300px;">
			</li>
			<li>
				<img src="#"" id="image2" style="height: 300px;">
			</li>
			<li>
				<img src="#"" id="image3" style="height: 300px;">
			</li>
			<li>
				<img src="#"" id="image4" style="height: 300px;">
			</li>
			<li>
				<img src="/resources/image/advertise.png">
			</li>
		</ul>
		<br>
		<div class="ui left aligned container">
			<h1>공지사항</h1>
		</div>
		<hr style="border: 2px solid #D5D5D5;">
		<br>
		<div class="ui center aligned basic segment" style="margin-top: 0px; padding: 0px;">
			<table class="ui very compact table">
				<thead>
					<tr align="center">
						<th style="width: 60%;">제목</th>
						<th style="width: 15%;">작성자</th>
						<th style="width: 10%;">조회수</th>
						<th style="width: 15%;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.npd.noList}" var="n">
					<tr align="center">
						<td style="padding-top: 15px; padding-bottom: 15px;">
							<a href="/noticeContent.diet?index=${n.noticeIndex}">${n.noticeTitle}</a>
						</td>
						<td><img class="ui avatar image" src="/resources/image/admin.png" /> ${n.noticeWriter}</td>
						<td>${n.noticeView}</td>
						<td>
							<fmt:formatDate value="${n.noticeWriteDay}" pattern="yyyy-MM-dd HH:mm"></fmt:formatDate>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="ui center aligned basic segment">
			<div class="ui pagination menu">${requestScope.npd.pageNavi}</div>
		</div>
	</div>
	<br>
</div>
<!-- FOOTER -->
<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">

	/* 광고 이미지 불러오기 */
	$(document).ready(function() {
		$.ajax({
			url : '/advertiseImageLoad.diet',
			type : 'post',
			success : function(img){
				$("#image1").attr("src",img[0].path1);
				$("#image2").attr("src",img[1].path1);
				$("#image3").attr("src",img[2].path1);
				$("#image4").attr("src",img[3].path1);

			},
			error : function(){
				console.log('[ERROR] - 이미지 불러오기 오류');
			}
		});
	});

	// 슬라이드
	$(function() {
		$(".rslides").responsiveSlides({
			auto : true,
			timeout : 1500,
		});
	});
	// 리로드
	if (self.name != 'reload') {
		self.name = 'reload';
		self.location.reload(true);
	} else
	self.name = '';
</script>

</html>