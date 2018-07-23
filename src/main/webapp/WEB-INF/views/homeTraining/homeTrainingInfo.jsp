<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>다이어트</title>
</head>

<!-- CSS -->
<style>
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<input id="indexNo" type="hidden" value="${requestScope.ht.htIndex }">
	<!-- CONTENTS -->
	<div class="ui center aligned basic segment">

		<div class="ui  container">
			<div class="ui panorama test ad" data-text="Panorama"></div>
			<h1 class="ui left aligned header">홈트레이닝 >
				${requestScope.ht.htPart }</h1>
			<hr>
			<div class="homeTrainingTitle"
				style="font-size: 20px; margin-top: 5%; margin-bottom: 3%; text-align: left;">${requestScope.ht.htTitle }
			</div>
			<hr>
			<div style="text-align: left;">
				<i class="clock outline icon"></i>
				<fmt:formatDate value="${requestScope.ht.htDate}"
					pattern="yyyy-MM-dd HH:mm:ss" />
				&ensp;|&ensp; <i class="eye icon"></i> <span class="hits"
					style="color: red">${requestScope.ht.htHits }</span>&ensp;|&ensp; <i
					class="comment icon"></i> <span class="like" style="color: red">${requestScope.ht.htCommentNumber }</span>
				<hr>
			</div>
			<br>
			<br>

			<!-- 유튜브 영상 들어가는곳 -->

			<div class="homeTrainingVideo">
				<iframe width="760" height="455"
					src="https://www.youtube.com/embed/VGjk5SHY2ls" frameborder="0"
					allow="autoplay; encrypted-media" allowfullscreen></iframe>
			</div>
			<br>
			<br>

			<h2>프로그램 소개</h2>
			<br>
			<br>

			<div class="programIntroduction">
				<i class="big clock outline icon"></i>&ensp;${requestScope.ht.htVideoMinute }&emsp;&emsp;&emsp;&emsp;&emsp;
				<i class="big child icon"></i>&ensp;${requestScope.ht.htPart }&emsp;&emsp;&emsp;&emsp;&emsp;
				<i class="big male icon"></i>&ensp;${requestScope.ht.htLevel }&emsp;&emsp;&emsp;&emsp;&emsp;
				<i class="big tint icon"></i>&ensp;${requestScope.ht.htCalories }
			</div>
			<hr>

			<!-- 프로그램 설명 부분 -->
			<div class="programExplain" style="text-align: center">
				<pre>${requestScope.ht.htExplain }</pre>
			</div>
			<br>
			<br>
			<br>

			<div style="text-align: center;">
				※ 소모 칼로리는 개인 또는 운동자세 등에 따라 차이가 있습니다<br>
				<br>

				<!-- 좋아요 버튼 부분 -->
				<button class="ui big basic button"
					style="border-radius: 30px; text-align: center;">
					<i class="heart outline icon" style="color: red;"></i>${requestScope.ht.htLike}</button>
			</div>
			<br>
			<br>
			<br>
			<br>
			<hr>

			<div class="prev" style="height: 30px; width: 100%; margin: 2%;">
				<div class="prev" style="height: 100%; width: 20%; float: left;">이전글
					&ensp;▲</div>
				<a class="prevTitle" style="height: 100%; width: 50%; float: left;"
					href="#">10분 안에 지방 태우기</a> <a class="prevHits"
					style="height: 100%; width: 30%; float: left;" href="#">2018.07.18
					&ensp;| &ensp; 조회수 : 525</a>
			</div>
			<hr>
			<div class="next" style="height: 30px; width: 100%; margin: 2%;">
				<div class="next" style="height: 100%; width: 20%; float: left;">이전글
					&ensp;▼</div>
				<a class="nextTitle" style="height: 100%; width: 50%; float: left;"
					href="#">10분 안에 지방 태우기</a> <a class="nextHits"
					style="height: 100%; width: 30%; float: left;" href="#">2018.07.18
					&ensp;| &ensp; 조회수 : 525</a>
			</div>
			<hr>
			<br>

			<div class="listButton" style="text-align: right;">
				<button class="ui secondary button">
					<i class="list icon"></i>목록
				</button>
			</div>


			<div class="ui comments" style="max-width: 1220px;">
				<h3 class="ui dividing header" style="margin-top: 8px">
					<i class="chevron red circle right icon"> </i>댓글 쓰기
				</h3>


				<form class="ui reply form">
					<div class="field">
						<textarea style="resize: none;"></textarea>
					</div>
					<div class="ui right aligned container">
						<div class="ui labeled submit icon button"
							style="background-color: #fa2828; color: white;">
							<i class="icon edit"></i> 등록
						</div>
					</div>
				</form>
				<br>
				<br>

				<div class="comment">
					<a class="avatar"> <img src="/resources/image/mainPic.jpg"
						style="width: 40px; height: 40px; border-radius: 25px;">
					</a>
					<div class="content" style="width: 93%;">
						<a class="author" style="position: absolute; width: 10%;">Matt</a>
						<div class="metadata" style="width: 100%;">
							<span class="date"
								style="width: 30%; display: inline; margin-left: 10%;">Today
								at 5:42PM</span>
							<div class="ui right aligned container" align="right"
								style="width: 70%; float: right;">
								<button class="ui red basic tiny button"
									style="margin-right: 10px;">
									<i class="thumbs up outline icon"></i>공감
								</button>
								<button class="ui black basic tiny button">
									<i class="ban icon"></i>신고
								</button>
							</div>
						</div>
						<div class="text">How artistic!</div>
					</div>
				</div>
				<br>
				<hr style="border: 1px solid #F6F6F6">
				<br>


				<div class="comment">
					<a class="avatar"> <img src="/resources/image/mainPic.jpg"
						style="width: 40px; height: 40px; border-radius: 25px;">
					</a>
					<div class="content" style="width: 93%;">
						<a class="author" style="position: absolute; width: 10%;">Matt</a>
						<div class="metadata" style="width: 100%;">
							<span class="date"
								style="width: 30%; display: inline; margin-left: 10%;">Today
								at 5:42PM</span>
							<div class="ui right aligned container" align="right"
								style="width: 70%; float: right;">
								<button class="ui red basic tiny button"
									style="margin-right: 10px;">
									<i class="thumbs up outline icon"></i>공감
								</button>
								<button class="ui black basic tiny button">
									<i class="ban icon"></i>신고
								</button>
							</div>
						</div>
						<div class="text">How artistic!</div>
					</div>
				</div>

				<br>
				<hr style="border: 1px solid #F6F6F6">
				<br>

				<div class="comment">
					<a class="avatar"> <img src="/resources/image/logo.png"
						style="width: 40px; height: 40px; border-radius: 25px;">
					</a>
					<div class="content" style="width: 93%;">
						<a class="author" style="position: absolute; width: 10%;">Matt</a>
						<div class="metadata" style="width: 100%;">
							<span class="date"
								style="width: 30%; display: inline; margin-left: 10%;">Today
								at 5:42PM</span>
							<div class="ui right aligned container" align="right"
								style="width: 70%; float: right;">
								<button class="ui red basic tiny button"
									style="margin-right: 10px;">
									<i class="thumbs up outline icon"></i>공감
								</button>
								<button class="ui black basic tiny button">
									<i class="ban icon"></i>신고
								</button>
							</div>
						</div>
						<div class="text">How artistic!</div>
					</div>
				</div>


			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
   
</script>

</html>