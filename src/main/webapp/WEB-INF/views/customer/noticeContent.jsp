<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>공지사항 - ${nvo.noticeTitle}</title>
	<script src="/resources/slider/responsiveslides.min.js"></script>
</head>

<!-- CSS -->
<style>
.singo {
	text-align: left;
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

	<!-- CONTENTS -->
	<div class="ui container">
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
		<br> <span class="ui grid"> <span class="four column row" style="padding-left: 20px;">
			<h2 class="ui header">
				<i class="comment icon"></i>
				<div class="content">공지사항</div>
			</h2>
		</span>
	</span>
	<hr style="border: 2px solid #D5D5D5;">
	<br> <br>

	<!-- 제목 -->
	<h2 class="ui center aligned container">
		<i class="quote left icon"></i> ${nvo.noticeTitle} <i class="quote right icon"></i>
	</h2>

	<!-- 닉네임, 날짜, 뷰수, 댓글 수 -->
	<!-- 모바일이 아닌 사이즈 -->
	<div id="size1" class="ui black segment">
		<div class="ui grid">
			<div class="three column row">
				<span class="left floated column"> <span class="ui left aligned"> <a> <!-- 프로필이미지 --> <img class="ui avatar image" src="/resources/image/admin.png"> <!-- 닉네임 -->
					${nvo.noticeWriter}
				</a>
			</span>
		</span> <span id="resizeBlock" class="right floated column" style="padding-left: 7%;"> <!-- 날짜 --> <span class="ui right aligned"> <i class="calendar icon"></i> <fmt:formatDate
			value="${nvo.noticeWriteDay}" pattern="yyyy-MM-dd HH:mm" />
		</span> <!-- 뷰수 --> <span id="resize" class="ui right aligned"> &nbsp;&nbsp;|&nbsp;&nbsp; <i class="eye icon"></i> ${nvo.noticeView}
		</span>
	</span>
</div>
</div>
</div>

<!-- 모바일 사이즈 -->
<div id="size2" class="ui black segment">
	<div class="ui grid" style="padding: 10px;">
		<div class="ui left aligned">
			<img class="ui avatar image" src="/resources/image/admin.png"> ${nvo.noticeWriter}
		</div>
		<div>
			<!-- 날짜 -->
			<span class="ui right aligned"> <i class="calendar icon"></i> <fmt:formatDate value="${nvo.noticeWriteDay}" pattern="yyyy-MM-dd HH:mm" />
			</span>
			<!-- 뷰수 -->
			<span id="resize" class="ui right aligned"> &nbsp;&nbsp;|&nbsp;&nbsp; <i class="eye icon"></i> ${nvo.noticeView}
			</span>
		</div>
	</div>
</div>

<!-- 내용 들어가는 부분! -->
<div class="ui clearing segment">
	${nvo.noticeContent} <br> <br> <br> <br>
	<hr style="border: 1px dashed #D5D5D5;">
	<br>
	<div align="center">
		<button type="button" onclick="back();" class="ui button" style="color: white; background: rgb(250, 40, 40);">뒤로가기</button>
	</div>
	<br>
</div>
</div>

<!-- FOOTER -->
<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">

	function back() {
		history.back(-1);
	}

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
				random : true,
			});
		});

	</script>
	<style type="text/css" media="screen">
	/* 모바일용 아닌 사이즈 */
	@media ( min-width : 550px) {
		#size1 {
			display: block;
		}
		#size2 {
			display: none;
		}
	}
	/* 모바일용 사이즈 */
	@media ( max-width : 549px) {
		#size1 {
			display: none;
		}
		#size2 {
			display: block;
		}
	}
</style>

</html>