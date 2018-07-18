<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>글등록된 페이지</title>
</head>

<!-- CSS -->
<style>
.singo {
	text-align: left;
}
</style>



<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui panorama test ad" data-text="광고광고광고"></div>
		<br>
		<br>

		<!-- 상단 게시판 종류 -->
		<h2 class="ui header">
			<i class="comment icon"></i>
			<div class="content">
				자유게시판
				<div class="sub header">Community</div>
			</div>
		</h2>

		<hr style="border: 2px solid #D5D5D5;">
		<br>
		<br>


		<!-- 제목 -->

		<h2 class="ui center aligned container">
			<i class="quote left icon"></i>
			${list[0].postTitle}
			<i class="quote right icon"></i>
		</h2>


		<!-- 닉네임, 날짜, 뷰수, 댓글 수 -->
		<div class="ui black segment">
			<div class="ui grid">
				<div class="four column row">
					<span class="left floated column" style="">
						<span class="ui left aligned">
							<a>
								<img class="ui avatar image" src="/resources/image/mainPic.jpg">
								닉네임
							</a>
						</span>
					</span>
					<span class="right floated column">
						<!-- 날짜 -->
						<span class="ui right aligned">
							<i class="calendar icon"></i>
							${list[0].postDateTime}
						</span>
						&nbsp;&nbsp;|&nbsp;&nbsp;
						<!-- 뷰수 -->
						<span class="ui right aligned">
							<i class="eye icon"></i>
							3211561
						</span>
						&nbsp;&nbsp;|&nbsp;&nbsp;
						<!-- 댓글수 -->
						<span class="ui right aligned">
							<i class="pen square icon"></i>
							85
						</span>
					</span>
				</div>
			</div>
		</div>

		<!-- 내용 들어가는 부분! -->
		<div class="ui clearing segment">
			${list[16].postContent}
			<br>
			<br>
			<br>
			<br>
			<hr style="border: 1px dashed #D5D5D5;">
			<br>
			<br>

			<div class="ui center aligned container">
				<!-- 북마크 버튼 -->
				<button class="ui yellow button" id="bookMark" style="height: 40px;">
					<i class="bookmark outline icon" id="emptyBookMark"></i>
					북마크
				</button>


				<!-- 좋아요 버튼 -->
				<div class="ui labeled button" tabindex="0">
					<button class="ui red button" id="heartBtn" style="height: 40px;">
						<i class="heart outline icon" id="emptyHeart"></i>
						공감
					</button>
					<a class="ui basic red left pointing label"> 1,048 </a>
				</div>


				<!-- 신고 버튼 -->
				<button class="ui black button" style="height: 40px;" id="reportBtn">
					<i class="bullhorn icon"></i>
					신고
				</button>
			</div>
			<br>
			<br>
			<br>

			<!-- 신고 모달 -->
			<div class="ui basic modal" id="reportModal">
				<div class="ui icon header">
					<i class="exclamation triangle icon"></i>
					신고하기
				</div>
				<h5 class="ui center aligned container">(신고 사유를 선택해 주세요.)</h5>
				<br>


				<div class="ui container" align="center">
					<div class="content">
						<div class="ui form">
							<div class="grouped fields">

								<div class="ui clearing segment" style="width: 350px; padding-left: 60px;">
									<br>
									<div class="field singo">
										<div class="ui radio checkbox">
											<input type="radio" name="example2" checked="checked">
											<label>&emsp;&emsp;광고/상업성 게시글</label>
										</div>
									</div>
									<br>
									<div class="field singo">
										<div class="ui radio checkbox">
											<input type="radio" name="example2">
											<label>&emsp;&emsp;비방/욕설 게시글</label>
										</div>
									</div>
									<br>
									<div class="field singo">
										<div class="ui radio checkbox">
											<input type="radio" name="example2">
											<label>&emsp;&emsp;개인정보 유출 게시물</label>
										</div>
									</div>
									<br>
									<div class="field singo">
										<div class="ui radio checkbox">
											<input type="radio" name="example2">
											<label>&emsp;&emsp;청소년 유해(음란) 게시물</label>
										</div>
									</div>
									<br>
									<div class="field singo">
										<div class="ui radio checkbox">
											<input type="radio" name="example2">
											<label>&emsp;&emsp;명예훼손/저작권 침해 게시물</label>
										</div>
									</div>
									<br>
									<div class="field singo">
										<div class="ui radio checkbox">
											<input type="radio" name="example2">
											<label>&emsp;&emsp;도배성 게시물</label>
										</div>
									</div>
									<br>
									<div class="field singo">
										<div class="ui radio checkbox">
											<input type="radio" name="example2">
											<label>&emsp;&emsp;불명확/추측성 게시물</label>
										</div>
									</div>
									<br>
									<br>
								</div>

							</div>
						</div>
					</div>
				</div>


				<br>
				<br>
				<div class="ui center aligned container">
					<div class="actions">
						<div class="ui red basic cancel inverted button">
							<i class="remove icon"></i>
							취소
						</div>
						<div class="ui red ok inverted button">
							<i class="checkmark icon"></i>
							신고
						</div>
					</div>
				</div>

			</div>
		</div>


		<!-- 글쓰기, 목록으로 돌아가기 버튼 -->
		<div class="ui right aligned container">
			<button class="ui right red basic button" style="margin-top: 19px;" id="writeBtn">
				<i class="edit icon"></i>
				글쓰기
			</button>
			<button class="ui black basic button" id="listBtn">
				<i class="list ul icon"></i>
				목록
			</button>
		</div>

		<br>
		<br>



		<!-- 댓글 -->
		<div class="ui comments" style="max-width: 1220px;">
			<h3 class="ui dividing header" style="margin-top: 8px">
				<i class="chevron red circle right icon"> </i>
				댓글 쓰기
			</h3>


			<form class="ui reply form">
				<div class="field">
					<textarea style="resize: none;"></textarea>
				</div>
				<div class="ui right aligned container">
					<div class="ui labeled submit icon button" style="background-color: #fa2828; color: white;">
						<i class="icon edit"></i>
						등록
					</div>
				</div>
			</form>
			<br>
			<br>

			<div class="comment">
				<a class="avatar">
					<img src="/resources/image/mainPic.jpg" style="width: 40px; height: 40px; border-radius: 25px;">
				</a>
				<div class="content" style="width: 93%;">
					<a class="author" style="position: absolute; width: 10%;">Matt</a>
					<div class="metadata" style="width: 100%;">
						<span class="date" style="width: 30%; display: inline; margin-left: 10%;">Today at 5:42PM</span>
						<div class="ui right aligned container" align="right" style="width: 70%; float: right;">
							<button class="ui red basic tiny button" style="margin-right: 10px;">
								<i class="thumbs up outline icon"></i>
								공감
							</button>
							<button class="ui black basic tiny button">
								<i class="ban icon"></i>
								신고
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
				<a class="avatar">
					<img src="/resources/image/mainPic.jpg" style="width: 40px; height: 40px; border-radius: 25px;">
				</a>
				<div class="content" style="width: 93%;">
					<a class="author" style="position: absolute; width: 10%;">Matt</a>
					<div class="metadata" style="width: 100%;">
						<span class="date" style="width: 30%; display: inline; margin-left: 10%;">Today at 5:42PM</span>
						<div class="ui right aligned container" align="right" style="width: 70%; float: right;">
							<button class="ui red basic tiny button" style="margin-right: 10px;">
								<i class="thumbs up outline icon"></i>
								공감
							</button>
							<button class="ui black basic tiny button">
								<i class="ban icon"></i>
								신고
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
				<a class="avatar">
					<img src="/resources/image/logo.png" style="width: 40px; height: 40px; border-radius: 25px;">
				</a>
				<div class="content" style="width: 93%;">
					<a class="author" style="position: absolute; width: 10%;">Matt</a>
					<div class="metadata" style="width: 100%;">
						<span class="date" style="width: 30%; display: inline; margin-left: 10%;">Today at 5:42PM</span>
						<div class="ui right aligned container" align="right" style="width: 70%; float: right;">
							<button class="ui red basic tiny button" style="margin-right: 10px;">
								<i class="thumbs up outline icon"></i>
								공감
							</button>
							<button class="ui black basic tiny button">
								<i class="ban icon"></i>
								신고
							</button>
						</div>
					</div>
					<div class="text">How artistic!</div>
				</div>
			</div>


		</div>
	</div>


	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	var check = true;
	/* 북마크 버튼*/
	$('#bookMark').click(
			function() {
				if (check == true) {
					$('#emptyBookMark').removeClass("bookmark outline icon")
							.addClass("bookmark icon");
					return check = false;
				} else if (check == false) {
					$('#emptyBookMark').removeClass("bookmark icon").addClass(
							"bookmark outline icon");
					return check = true;
				}

			});

	var likeCheck = true;
	/* 좋아요 버튼 */
	$('#heartBtn').click(
			function() {
				if (likeCheck == true) {
					$('#emptyHeart').removeClass("heart outline icon")
							.addClass("heart icon");
					likeCheck = false;
				} else if (likeCheck == false) {
					$('#emptyHeart').removeClass("heart icon").addClass(
							"heart outline icon");
					likeCheck = true;
				}
			});

	/* 신고버튼 */
	$('#reportBtn').click(function() {

		$('.ui.basic.modal').modal('show').modal('setting', 'closable', false);
	});

	/* 글쓰기 등록하기 버튼 */
	$('#writeBtn').click(function() {
		location.href = "/registCommunity.diet";
	});

	/* 목록으로 돌아가기 버튼 */
	$('#listBtn').click(function() {
		location.href = "/communityWholeBoard.diet";
	});
</script>

</html>