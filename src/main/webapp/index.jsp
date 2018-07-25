<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>다부해 - 다이어트를 부탁해</title>
	<script src="/resources/slider/responsiveslides.min.js"></script>
</head>

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
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>
	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segments">
			<div class="ui horizontal basic segments">
				<div class="ui basic segment" style="padding: 0;">
					<div class="ui left aligned basic segment" style="margin: 0; padding-bottom: 0;">
						<div class="ui message">
							<span class="ui small header">
								<i class="book icon" style="display: inline-block;"></i><span id="fs"></span>
							</span>
						</div>


						<!-- 반응형 메뉴 768px 이하 -->
						<table class="ui celled table" style="width: 100%; height: 100%;" id="mainBoardResize">
							<tr align="center">
								<td style="padding: 0px; width: 70px;">
									<button onclick="bmiCal();" type="button"
									style="height: 100%; width: 100%; background: rgb(250, 40, 40); border: 0; color: white; font-weight: 600; font-size: 15px; padding: 8px;">
									<i class="large calculator icon" id="icon1"></i>
									내 BMI 지수는? (비만도 계산)
								</button>
							</td>
							<td style="padding: 0px; width: 70px;">
								<button onclick="bmrCal();" type="button"
								style="height: 100%; width: 100%; background: orange; border: 0; color: white; font-weight: 600; font-size: 15px; padding: 8px;">
								<i class="large sticky note outline icon" id="icon2"></i>
								칼로리처방 받기
							</button>
						</td>
						<td style="padding: 0px; width: 70px;">
							<button type="button" style="height: 100%; width: 100%; background: gray; border: 0; color: white; font-weight: 600; font-size: 15px; padding: 8px;">
								<i class="large mobile alternate icon" id="icon3"></i>
								다이어트 어플리케이션
							</button>
						</td>
						<td style="padding: 0px; width: 70px;">
							<button  onclick="healthCenter();" type="button"
							style="height: 100%; width: 100%; background: rgb(250, 40, 40); border: 0; color: white; font-weight: 600; font-size: 15px; padding: 8px;">
							<i class="large sistrix icon" id="icon4"></i>
							인바디 측정 보건소 찾기
						</button>
					</td>
				</tr>
			</table>
		</div>
		<!-- 슬라이드-->
		<ul class="rslides">
			<li><img src="/resources/image/mainPic.jpg"></li>
			<li><img src="/resources/image/mainPic1.jpg"></li>
			<li><img src="/resources/image/mainPic2.jpg"></li>
			<li><img src="/resources/image/mainPic3.jpg"></li>
		</ul>

	</div>

	<!-- 반응형 메뉴 768px 이상 -->
	<div class="ui basic segment" align="center" id="mainBoard">
		<table class="ui celled table" style="width: 100%; height: 100%;" >
			<tr align="center">
				<td style="padding: 0px; width: 70px;">
					<button onclick="bmiCal();" type="button"
					style="height: 100%; width: 100%; background: rgb(250, 40, 40); border: 0; color: white; font-weight: 600; font-size: 15px;">
					<i class="large calculator icon" id="icon1"></i>
					<div class="disappear">
						<br>
						내 BMI 지수는?
						<br>
						(비만도 계산)
					</div>
				</button>
			</td>
			<td style="padding: 0px; width: 70px;">
				<button onclick="bmrCal();" type="button"
				style="height: 100%; width: 100%; background: orange; border: 0; color: white; font-weight: 600; font-size: 15px;">
				<i class="large sticky note outline icon" id="icon2"></i>
				<div class="disappear">
					<br>
					칼로리처방
					<br>
					받기
				</div>
			</button>
		</td>
	</tr>
	<tr align="center">
		<td style="padding: 0px; width: 70px;">
			<button type="button" style="height: 100%; width: 100%; background: gray; border: 0; color: white; font-weight: 600; font-size: 15px;">
				<i class="large mobile alternate icon" id="icon3"></i>
				<div class="disappear">
					<br>
					다이어트
					<br>
					어플리케이션
				</div>
			</button>
		</td>
		<td style="padding: 0px; width: 70px;">
			<button  onclick="healthCenter();" type="button"
			style="height: 100%; width: 100%; background: rgb(250, 40, 40); border: 0; color: white; font-weight: 600; font-size: 15px;">
			<i class="large sistrix icon" id="icon4"></i>
			<div class="disappear">
				<br>
				인바디 측정
				<br>
				보건소 찾기
			</div>
		</button>
	</td>
</tr>
</table>
</div>
</div>

<div class="ui horizontal basic segments">
	<div class="ui basic segment">
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
	</div>
	<div class="ui basic segment">
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
	</div>
	<div class="ui basic segment">
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
	</div>
</div>

<div class="ui horizontal basic segments">
	<div class="ui basic segment">
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
	</div>
	<div class="ui basic segment">
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
	</div>
	<div class="ui basic segment">
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
		<p>내용들어감</p>
	</div>
</div>

</div>
</div>
<!-- FOOTER -->
<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	function bmiCal() {
		window.location.href = "/bmiCal.diet";
	}

	function bmrCal() {
		window.location.href = "/bmrCal.diet";
	}

	function healthCenter() {
		window.location.href = "/healthCenter.diet?location=all";
	}

	$(document).ready(function() {
		var title = ['동물이 되고 싶은가 인간이 되고 싶은가', '인생을 걸고 다이어트를 하라', '먹어서 살이 찌는게 아니라 많이 먹어서 살이 찌는 것이다', '먹어서 살이 찌는게 아니라 많이 먹어서 살이 찌는 것이다', '먹어봤자 내가 알고 있는 그 맛이다', '다이어트란 체중 감량이 아닌 싸이즈의 축소이다', '운동할때 고통은 잠깐이지만 성공후의 즐거움은 평생이다', '자기전에 이빨은 안닦아도 운동은 해라', '다이어트의 완성은 많은 움직임이다', '맛과 멋은 같이 갈 수 없다', '먹기 위해서 사는 것이 아니라 살기 위해서 먹는 것이다', '실패안에서 나를 발견한다.', '인생이란 결코 공평하지 않다. 이 사실에 익숙해져라', '돈 주고 살찌는 것 보다 남기는게 낫다', '포기란 실패를 뜻한다', '내 몸을 속여야 살을 뺄 수 있다.' , '살찌는건 한 순간 살빼는건 피눈물...', '자기자신에게 투자하라.', '한번 사는 인생이다. 폼나게 살고 싶지 않는가.', '한번 사는 인생이다. 폼나게 살고 싶지 않는가.', '사람은 스타일을 입는다.', '일하는 것을 귀찮아 하지 말고 먹는 것을 귀찮아 해라.', '인생은 살이 쪘을 때와 안쪘을 때로 나뉘어 진다.', '너 자신을 보아라! 시간은 언제나 너를 환영해 준다.', '음식은 맛있을 수록 비례하고 칼로리도 높아진다.', '노력의 의미를 모르면 함부로 말하지 마라.', '세상에서 가장 안전한 성형은 다이어트다.', '내가 결심한 순간 반은 성공한 것이다.', '내 사전엔 불가능이란 없다.', '탄산음료와 커피도 물이다. 음료와 커피를 끊고 물을 마셔라.'];
		var randonNum = Math.floor(Math.random() * (title.length));
		var fs = $('#fs').html(title[randonNum]);
	});

// 슬라이드
$(function() {
	$(".rslides").responsiveSlides({
		auto: true,
		timeout: 1500,  
	});
});

</script>
<style type="text/css" media="screen">
@media (max-width: 1200px) {
	.disappear{
		display: none;
	}
}
@media (max-width: 768px) {
	#mainBoard{
		display: none;
	}
}
@media (min-width: 768px) {
	#mainBoardResize{
		display: none;
	}
}
</style>
</html>