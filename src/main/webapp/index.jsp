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

	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segments">
			<div class="ui horizontal basic segments">
				<div class="ui basic segment" style="padding: 0;">
					<div class="ui left aligned basic segment" style="margin: 0; padding-bottom: 0;">
						<div class="ui message">
							<span class="ui small header">
								<i class="book icon" style="display: inline-block;"></i>
								<span id="fs"></span>
							</span>
						</div>

						<!-- 반응형 메뉴 768px 이하 -->
						<table class="ui table" style="width: 100%; height: 100%;" id="mainBoardResize">
							<tr align="center">
								<td style="padding: 0px; width: 70px;">
									<button onclick="bmiCal();" type="button" style="height: 100%; width: 100%; background: rgb(250, 40, 40); border: 0; color: white; font-weight: 600; font-size: 15px; padding: 8px; cursor:pointer;">
										<i class="large calculator icon" id="icon1"></i>
										내 BMI 지수는? (비만도 계산)
									</button>
								</td>
								<td style="padding: 0px; width: 70px; margin-top:7.6px;">
									<button onclick="bmrCal();" type="button" style="height: 100%; width: 100%; background: orange; border: 0; color: white; font-weight: 600; font-size: 15px; padding: 8px; cursor:pointer;">
										<i class="large sticky note outline icon" id="icon2"></i>
										칼로리처방 받기
									</button>
								</td>
								<td id="trainer-match" style="padding: 0px; width: 70px;">
									<button id="trainer-match" type="button" onclick="findTrainer();" style="height: 100%; width: 100%; background: gray; border: 0; color: white; font-weight: 600; font-size: 15px; padding: 8px; cursor:pointer;">
										<i class="large child icon" id="icon3"></i>
										트레이너 매칭
									</button>
								</td>
								<td style="padding: 0px; width: 70px;">
									<button onclick="healthCenter();" type="button" style="height: 100%; width: 100%; background: rgb(250, 40, 40); border: 0; color: white; font-weight: 600; font-size: 15px; padding: 8px; cursor:pointer;">
										<i class="large sistrix icon" id="icon4"></i>
										인바디 측정 보건소 찾기
									</button>
								</td>
							</tr>
						</table>
					</div>

					<!-- 슬라이드-->
					<ul class="rslides" style="padding-bottom: 15px;">
						<li>
							<img src="#"" id="image1">
						</li>
						<li>
							<img src="#"" id="image2">
						</li>
						<li>
							<img src="#"" id="image3">
						</li>
						<li>
							<img src="#"" id="image4">
						</li>
						<li>
							<img src="/resources/image/advertise.png">
						</li>
					</ul>
				</div>

				<!-- 반응형 메뉴 768px 이상 -->
				<div class="ui basic segment" align="center" id="mainBoard">
					<table class="ui table" style="width: 100%; height: 100%;">
						<tr align="center">
							<td style="padding: 0px; width: 70px;">
								<button onclick="bmiCal();" type="button" style="height: 100%; width: 100%; background: rgb(250, 40, 40); border: 0; color: white; font-weight: 600; font-size: 15px; cursor:pointer;">
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
								<button onclick="bmrCal();" type="button" style="height: 100%; width: 100%; background: orange; border: 0; color: white; font-weight: 600; font-size: 15px; cursor:pointer;">
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
								<button type="button" onclick="findTrainer();" style="height: 100%; width: 100%; background: gray; border: 0; color: white; font-weight: 600; font-size: 15px; cursor:pointer;">
									<i class="large child icon" id="icon3"></i>
									<div class="disappear">
										<br>
										트레이너 매칭
										<br>
									</div>
								</button>
							</td>
							<td style="padding: 0px; width: 70px;">
								<button type="button" onclick="healthCenter();" style="height: 100%; width: 100%; background: rgb(250, 40, 40); border: 0; color: white; font-weight: 600; font-size: 15px; cursor:pointer;">
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
		</div>
		<br>
		<c:choose>
		<c:when test="${sessionScope.member==null }">
		<label class="ui large header">홈트레이닝</label>
	</c:when>
	<c:when test="${sessionScope.member!=null }">
	<label class="ui large header">추천 영상</label>
</c:when>
</c:choose>

<hr>

<!-- 반응형 메뉴 출력 -->
<div class="ui relaxed divided items">
	<div class="item">
		<div class="ui small image">
			<img id="matchedImg0" src="" style="height: 100%; cursor:pointer;"  onerror='this.src="/resources/image/300x400.png"'>
		</div>
		<div class="content">
			<div class="header" id="matchedTitle0" style="cursor:pointer;"></div>
			<div id="matchedType0" class="meta"></div>
			<div class="description" id="matchedExplain0" style="text-indent:10px; cursor:pointer;"></div>
			<div class="extra" id="matchedWriter0">
				<img id="matchedWriterImg0" src="" class="ui circular avatar image">
			</div>
		</div>
	</div>
	<div class="item">
		<div class="ui small image">
			<img id="matchedImg1"  src="" style="height: 100%; cursor:pointer;" onerror='this.src="/resources/image/300x400.png"'>
		</div>
		<div class="content">
			<div class="header" id="matchedTitle1" style="cursor:pointer;"></div>
			<div id="matchedType1" class="meta"></div>
			<div class="description" id="matchedExplain1" style="text-indent:10px; cursor:pointer;"></div>
			<div class="extra" id="matchedWriter1">
				<img id="matchedWriterImg1" src="" class="ui circular avatar image">
			</div>
		</div>
	</div>
	<div class="item">
		<div class="ui small image">
			<img id="matchedImg2" src="" style="height: 100%; cursor:pointer;" onerror='this.src="/resources/image/300x400.png"'>
		</div>
		<div class="content">
			<div class="header" id="matchedTitle2" style="cursor:pointer;"></div>
			<div id="matchedType2" class="meta"></div>
			<div class="description" id="matchedExplain2" style="text-indent:10px; cursor:pointer;"></div>
			<div class="extra" id="matchedWriter2">
				<img id="matchedWriterImg2" src="" class="ui circular avatar image">
			</div>
		</div>
		<br>
	</div>
	<hr>
</div>


<div id="size11" class="ui three column grid">
	<div class="column">
		<table id="boardTbl1" class="ui table">
			<thead>
				<tr align="center">
					<th>
						커뮤니티
						<span style="margin-left: 20px;">
							<a href="/communityWholeBoard.diet?type=comAll" style="color: rgb(250, 40, 40);">
								<i class="plus square outline icon"></i>
							</a>
						</span>
					</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="column">
		<table id="boardTbl2" class="ui table">
			<thead>
				<tr align="center">
					<th>
						다이어트꿀팁
						<span style="margin-left: 20px;">
							<a href="/dietTipList.diet?type=all" style="color: rgb(250, 40, 40);">
								<i class="plus square outline icon"></i>
							</a>
						</span>
					</th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="column">
		<table id="boardTbl3" class="ui table">
			<thead>
				<tr align="center">
					<th>
						공지사항
						<span style="margin-left: 20px;">
							<a href="/notice.diet" style="color: rgb(250, 40, 40);">
								<i class="plus square outline icon"></i>
							</a>
						</span>
					</th>
				</tr>
			</thead>
		</table>
	</div>
</div>


<div id="size2" class="ui one column grid">
	<div class="column">
		<table id="mobile-boardTbl1" class="ui table">
			<thead>
				<tr align="center">
					<th>
						커뮤니티
						<span style="margin-left: 20px;">
							<a href="/communityWholeBoard.diet?type=comAll" style="color: rgb(250, 40, 40);">
								<i class="plus square outline icon"></i>
							</a>
						</span>
					</th>
				</tr>
			</thead>
		</table>
	</div>
</div>




<br>
<hr>
<br>
<label class="ui large header">레시피 & 식단</label>
<br>
<br>
<hr>
<br>
	<div class="ui three column grid" align="center" id="mainRecipe"></div>
	<div class="ui one column grid" align="center" id="mainRecipe2"></div>
	<br>
	<hr>
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

	function bmiCal() {
		window.location.href = "/bmiCal.diet";
	}

	function bmrCal() {
		window.location.href = "/bmrCal.diet";
	}

	function healthCenter() {
		window.location.href = "/healthCenter.diet?location=all";
	}

	function findTrainer() {
		window.location.href = "/trainerMatch.diet";
	}

	$(document).ready(
		function() {
			var title = [ '동물이 되고 싶은가 인간이 되고 싶은가', '인생을 걸고 다이어트를 하라',
			'먹어서 살이 찌는게 아니라 많이 먹어서 살이 찌는 것이다',
			'먹어서 살이 찌는게 아니라 많이 먹어서 살이 찌는 것이다',
			'먹어봤자 내가 알고 있는 그 맛이다', '다이어트란 체중 감량이 아닌 싸이즈의 축소이다',
			'운동할때 고통은 잠깐이지만 성공후의 즐거움은 평생이다',
			'자기전에 이빨은 안닦아도 운동은 해라', '다이어트의 완성은 많은 움직임이다',
			'맛과 멋은 같이 갈 수 없다', '먹기 위해서 사는 것이 아니라 살기 위해서 먹는 것이다',
			'실패안에서 나를 발견한다.', '인생이란 결코 공평하지 않다. 이 사실에 익숙해져라',
			'돈 주고 살찌는 것 보다 남기는게 낫다', '포기란 실패를 뜻한다',
			'내 몸을 속여야 살을 뺄 수 있다.', '살찌는건 한 순간 살빼는건 피눈물...',
			'자기자신에게 투자하라.', '한번 사는 인생이다. 폼나게 살고 싶지 않는가.',
			'한번 사는 인생이다. 폼나게 살고 싶지 않는가.', '사람은 스타일을 입는다.',
			'일하는 것을 귀찮아 하지 말고 먹는 것을 귀찮아 해라.',
			'인생은 살이 쪘을 때와 안쪘을 때로 나뉘어 진다.',
			'너 자신을 보아라! 시간은 언제나 너를 환영해 준다.',
			'음식은 맛있을 수록 비례하고 칼로리도 높아진다.',
			'노력의 의미를 모르면 함부로 말하지 마라.', '세상에서 가장 안전한 성형은 다이어트다.',
			'내가 결심한 순간 반은 성공한 것이다.', '내 사전엔 불가능이란 없다.',
			'탄산음료와 커피도 물이다. 음료와 커피를 끊고 물을 마셔라.' ];
			var randomNum = Math.floor(Math.random() * (title.length));
			var fs = $('#fs').html(title[randomNum]);
		});

	// 슬라이드
	$(function() {
		$(".rslides").responsiveSlides({
			auto : true,
			timeout : 1500,
			random : true,
		});
	});

	/* 메인 페이지 - 홈트레이닝 출력 */
	$.ajax({
		url : '/mainHomeTraining.diet',
		type : 'post',
		success : function(data){
			for (var i = 0; i < 3; i++) {
				$('#matchedImg'+i).attr("src",data[i].htMainPhoto);
				$('#matchedTitle'+i).html(data[i].htTitle);
				switch(data[i].htType){
					case '1' : $('#matchedType'+i).html("전신");
					break;
					case '2' : $('#matchedType'+i).html("복부");
					break;
					case '3' : $('#matchedType'+i).html("상체");
					break;
					case '4' : $('#matchedType'+i).html("하체");
					break;
					case '5' : $('#matchedType'+i).html("스트레칭");
					break;
					case '6' : $('#matchedType'+i).html("요가");
					break;
					case '7' : $('#matchedType'+i).html("댄스");
					break;
					case '8' : $('#matchedType'+i).html("4주 챌린지");
					break;
				}
				
				$('#matchedExplain'+i).html(data[i].htExplain);
				$('#matchedWriterImg'+i).attr("src",data[i].htWriterPhoto)
				$('#matchedWriter'+i).append(data[i].htNickname);
				
				$('#matchedImg'+i).attr("onclick", "goInfo(" + data[i].indexNo + "," + data[i].htType + ");");
				$('#matchedTitle'+i).attr("onclick", "goInfo(" + data[i].indexNo + "," + data[i].htType + ");");
				$('#matchedExplain'+i).attr("onclick", "goInfo(" + data[i].indexNo + "," + data[i].htType + ");");
			}
		},
		error : function(){
			console.log('[Error] 메인 - 자유게시판 출력 실패');
		}
	});

	/* 메인 페이지 - 자유게시판 출력 */
	$.ajax({
		url : '/mainCommunity.diet',
		type : 'post',
		success : function(data) {
			for (var i = 0; i < 10; i++) {
				var tr = $('<tr>');
				

				var tempChar = '';
				var charSize = (data.comList[i].postTitle).length;

				if (charSize > 21) {
					var value = data.comList[i].postTitle;
					tempChar = value.substring(0, 21) + '...';
				} else {
					tempChar = data.comList[i].postTitle;
				}
				var link = data.comList[i].postIndex;
				var title = $('<td>').html(
					'ㆍ ' + "<a href='/postedCommunity.diet?postIndex="
					+ link + "'>" + tempChar + "</a>");

				tr.append(title);
				
				$('#boardTbl1').append(tr);
				
				
				// 모바일 용
				var tr2 = $('<tr>');
				

				var tempChar2 = '';
				var charSize2 = (data.comList[i].postTitle).length;

				if (charSize2 > 21) {
					var value2 = data.comList[i].postTitle;
					tempChar2 = value2.substring(0, 21) + '...';
				} else {
					tempChar2 = data.comList[i].postTitle;
				}
				var link2 = data.comList[i].postIndex;
				var title2 = $('<td>').html(
					'ㆍ ' + "<a href='/postedCommunity.diet?postIndex="
					+ link2 + "'>" + tempChar2 + "</a>");

				tr2.append(title2);
				
				
				
				$('#mobile-boardTbl1').append(tr2);
			}
		},
		error : function() {
			console.log('[Error] 메인 - 자유게시판 출력 실패');
		}
	});

	/* 메인 페이지 - 다이어트꿀팁 출력 */
	$.ajax({
		url : '/mainDietTip.diet',
		type : 'post',
		success : function(data) {
			for (var i = 0; i < 10; i++) {
				var tr = $('<tr>');

				var tempChar = data.dtList[i].dtTitle;
				var charSize = (data.dtList[i].dtTitle).length;

				if (charSize > 21) {
					var value = data.dtList[i].dtTitle;
					tempChar = value.substring(0, 21) + '...';
				} else {
					tempChar = data.dtList[i].dtTitle;
				}
				var link = data.dtList[i].dtIndex;
				var title = $('<td>').html(
					'ㆍ ' + "<a href='/dietTipInfo.diet?indexNo=" + link
					+ "'>" + tempChar + "</a>");

				tr.append(title);
				$('#boardTbl2').append(tr);
			}
		},
		error : function() {
			console.log('[Error] 메인 - 다이어트꿀팁 출력 실패');
		}
	});

	/* 메인 페이지 - 공지사항 출력 */
	$.ajax({
		url : '/mainNotice.diet',
		type : 'post',
		success : function(data) {
			for (var i = 0; i < 10; i++) {
				var tr = $('<tr>');

				var tempChar = data.noList[i].noticeTitle;
				var charSize = (data.noList[i].noticeTitle).length;

				if (charSize > 21) {
					var value = data.noList[i].noticeTitle;
					tempChar = value.substring(0, 21) + '...';
				} else {
					tempChar = data.noList[i].noticeTitle;
				}
				var link = data.noList[i].noticeIndex;
				var title = $('<td>').html(
					'ㆍ ' + "<a href='/noticeContent.diet?index=" + link
					+ "'>" + tempChar + "</a>");

				tr.append(title);
				$('#boardTbl3').append(tr);
			}
		},
		error : function() {
			console.log('[Error] 메인 - 공지사항  출력 실패');
		}
	});
	
	function goInfo(me, me2){
		var type;
		if(me2==1){
			type = "wholeBody";
		}else if(me2==2){
			type = "abdomen";
		}else if(me2==3){
			type = "upperBody";
		}else if(me2==4){
			type = "lowerBody";
		}else if(me2==5){
			type = "stretching";
		}else if(me2==6){
			type = "dance";
		}else if(me2==7){
			type = "yoga";
		}else if(me2==8){
			type = "fourChallenge";
		}
		
		location.href="/homeTrainingInfo.diet?indexNo="+me+"&type="+type;
	}
	
	/* 메인 페이지 - 레시피&식단 출력 */
	$.ajax({
				url : '/mainRecipe.diet',
				type : 'post',
				data : {'type' : 16},
				success : function(data) {
					
					/* 웹용 레시피식단 출력 */
					for (var i = 0; i < 3; i++) {
						var column = $("<div>").attr("class","column");
						
						var card = $("<div>").attr("class","ui card");
						card.attr("onclick","recipeLink("+data.comList[i].postIndex+")");
						card.attr("style","cursor:pointer;");
						var imgDiv = $("<div>").attr("class","image");
						
						 if(data.comList[i].postImage!=null){
		                     var img = $('<img>').attr("src",data.comList[i].postImage);
		                     img.attr("style","height: 200px;");
		                  }else{
		                     var img = $('<img>').attr("src","/resources/image/300x400.png");
		                     img.attr("style","height: 200px;");
		                  }

						imgDiv.append(img);
						var content = $("<div>").attr("class","content");
						var header = $("<a>").attr("class","header");
						header.attr("href","/postedCommunity.diet?postIndex="+data.comList[i].postIndex);
						
						var tempChar = data.comList[i].postTitle;
						var charSize = (data.comList[i].postTitle).length;
						if (charSize > 15) {
							var value = data.comList[i].postTitle;
							tempChar = value.substring(0, 14) + '...';
						} else {
							tempChar = data.comList[i].postTitle;
						}
						header.html(tempChar);
						
						var metaDiv = $("<div>").attr("class","meta");
						var dateSpan = $("<span>").attr("class","date");
						var date = new Date(data.comList[i].postDateTime);
						var dateFor = date.getFullYear() + "-"+
						doublePos((date.getMonth() + 1)) +"-"+doublePos(date.getDate()) + " " + doublePos(date.getHours())+":"+
						doublePos(date.getMinutes()) 
								+":"+ doublePos(date.getSeconds());
						dateSpan.html(dateFor);
						
						metaDiv.append(dateSpan);
						
						var description = $("<div>").attr("class","description");
						var eyeIcon = $("<i>").attr("class","eye icon");
						var boldHit = $("<b>").html(data.comList[i].postHit);
						
						var heartIcon = $("<i>").attr("class","heart outline icon");
						heartIcon.attr("id","emptyHeart");
						var boldLike = $("<b>").html(data.comList[i].postLike);
						description.append(eyeIcon);
						description.append("조회&nbsp;&nbsp;");
						description.append(boldHit);
						description.append("&emsp;|| &emsp;");
						description.append(heartIcon);
						description.append("좋아요&nbsp;&nbsp;");
						description.append(boldLike);
						
						content.append(header);
						content.append(metaDiv);
						content.append(description);
						
						var extraDiv = $("<div>").attr("class","extra content");
						var mbImage = $("<img>").attr("class","ui avatar image");
						mbImage.attr("src",data.comList[i].mbImage);
						mbImage.attr("onerror",'this.src="/resources/image/avatar.png"');
						var mbA = $("<a>").append(mbImage);
						mbA.attr("href","/postedCommunity.diet?postIndex="+data.comList[i].postIndex);
						mbA.append(data.comList[i].postNickname);
						
						extraDiv.append(mbA);
						
						card.append(imgDiv);
						card.append(content);
						card.append(extraDiv);
						
						column.append(card);
						
						$('#mainRecipe').append(column);
						
					}
					
					
					/* 모바일용 레시피 식단 출력 */
					for (var i = 0; i < 3; i++) {
						var column = $("<div>").attr("class","column");
						
						var card = $("<div>").attr("class","ui card");
						card.attr("onclick","recipeLink("+data.comList[i].postIndex+")");
						card.attr("style","cursor:pointer;");
						var imgDiv = $("<div>").attr("class","image");
						
						 if(data.comList[i].postImage!=null){
		                     var img = $('<img>').attr("src",data.comList[i].postImage);
		                     img.attr("style","height: 200px;");
		                  }else{
		                     var img = $('<img>').attr("src","/resources/image/300x400.png");
		                     img.attr("style","height: 200px;");
		                  }

						imgDiv.append(img);
						var content = $("<div>").attr("class","content");
						var header = $("<a>").attr("class","header");
						header.attr("href","/postedCommunity.diet?postIndex="+data.comList[i].postIndex);
						
						var tempChar = data.comList[i].postTitle;
						var charSize = (data.comList[i].postTitle).length;
						if (charSize > 15) {
							var value = data.comList[i].postTitle;
							tempChar = value.substring(0, 14) + '...';
						} else {
							tempChar = data.comList[i].postTitle;
						}
						header.html(tempChar);
						
						var metaDiv = $("<div>").attr("class","meta");
						var dateSpan = $("<span>").attr("class","date");
						var date = new Date(data.comList[i].postDateTime);
						var dateFor = date.getFullYear() + "-"+
						doublePos((date.getMonth() + 1)) +"-"+doublePos(date.getDate()) + " " + doublePos(date.getHours())+":"+
						doublePos(date.getMinutes()) 
								+":"+ doublePos(date.getSeconds());
						dateSpan.html(dateFor);
						
						metaDiv.append(dateSpan);
						
						var description = $("<div>").attr("class","description");
						var eyeIcon = $("<i>").attr("class","eye icon");
						var boldHit = $("<b>").html(data.comList[i].postHit);
						
						var heartIcon = $("<i>").attr("class","heart outline icon");
						heartIcon.attr("id","emptyHeart");
						var boldLike = $("<b>").html(data.comList[i].postLike);
						description.append(eyeIcon);
						description.append("조회&nbsp;&nbsp;");
						description.append(boldHit);
						description.append("&emsp;|| &emsp;");
						description.append(heartIcon);
						description.append("좋아요&nbsp;&nbsp;");
						description.append(boldLike);
						
						content.append(header);
						content.append(metaDiv);
						content.append(description);
						
						var extraDiv = $("<div>").attr("class","extra content");
						var mbImage = $("<img>").attr("class","ui avatar image");
						mbImage.attr("src",data.comList[i].mbImage);
						mbImage.attr("onerror",'this.src="/resources/image/avatar.png"');
						var mbA = $("<a>").append(mbImage);
						mbA.attr("href","/postedCommunity.diet?postIndex="+data.comList[i].postIndex);
						mbA.append(data.comList[i].postNickname);
						
						extraDiv.append(mbA);
						
						card.append(imgDiv);
						card.append(content);
						card.append(extraDiv);
						
						column.append(card);
						
						$('#mainRecipe2').append(column);
					}
					
				},
				error : function() {
					console.log('[Error] 메인 - 다이어트꿀팁 출력 실패');
				}
			});
	
	function doublePos(num)
	{
		return num>9?num:"0"+num;
	}
	
	/* 카드 클릭시 각 페이지로 이동 */
	function recipeLink(pi){
		 location.href="/postedCommunity.diet?postIndex="+pi;
	 }
</script>
<style type="text/css" media="screen">

@media ( max-width : 1200px) {		/* 1200px 이하 */
	.disappear {
		display: none;
	}
}

@media ( max-width : 768px) {		/* 768 이하 */
	#mainBoard {
		display: none;
	}
	.rslides {
		margin-top: 15px;
	}
	#mainRecipe{
		display: none;
	}
	#mainRecipe2{
		display: block;
	}
}

@media ( min-width : 768px) {		/* 768 이상 */
	#mainBoardResize {
		display: none;
	}
	#mainRecipe{
		display: block;
	}
	#mainRecipe2{
		display: none;
	}
}
	
@media ( max-width : 1000px) {
	#size11 {
		display: none;
	}
	#size2{
		display:block;
	}
	
}


</style>
</html>