<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>다이어트 꿀팁</title>
</head>

<!-- CSS -->
<style>
.singo {
	text-align: left;
}

p>span {
	text-indent: 10px;
	display: inline-block;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>
	<!-- 댓글입력을 위해 게시물번호를 넣어둘 태그를 hidden으로 만들어둠 -->
	<input id="indexNo" type="hidden" value="${requestScope.dt.dtIndex }">
	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui panorama test ad" data-text="광고광고광고"></div>
		<br> <br>

		<!-- 상단 게시판 종류 -->
		<h2 class="ui header">
			<i class="comment icon"></i>
			<div class="content">다이어트 꿀팁</div>
		</h2>

		<hr style="border: 2px solid #D5D5D5;">
		<br> <br>


		<!-- 제목 -->

		<h2 class="ui center aligned container">
			<i class="quote left icon"></i>${requestScope.dt.dtTitle }<i class="quote right icon"></i>
		</h2>


		<!-- 닉네임, 날짜, 뷰수, 댓글 수 -->
		<div class="ui black segment">
			<div class="ui grid">
				<div class="four column row">
					<span class="left floated column" style=""> <span class="ui left aligned"> <a> <img class="ui avatar image" src="/resources/image/mainPic.jpg">
								${requestScope.dt.dtNickname }
						</a>
					</span>
					</span> <span class="right floated column"> <!-- 날짜 --> <span class="ui right aligned"> <i class="calendar icon"></i> ${requestScope.dt.dtDate }
					</span> &nbsp;&nbsp;|&nbsp;&nbsp; <!-- 뷰수 --> <span class="ui right aligned"> <i class="eye icon"></i> ${requestScope.dt.dtSee }
					</span> &nbsp;&nbsp;|&nbsp;&nbsp; <!-- 댓글수 --> <span class="ui right aligned"> <i class="pen square icon"></i> ${requestScope.bcpd.totalCommentNo }
					</span>
					</span>
				</div>
			</div>
		</div>

		<!-- 내용 들어가는 부분! -->
		<div class="ui clearing segment">
			${requestScope.dt.dtExplain } <br> <br> <br> <br>
			<hr style="border: 1px dashed #D5D5D5;">
			<br> <br>

			<div class="ui center aligned container">
				<!-- 북마크 버튼 -->
				<button class="ui yellow button" id="bookMark" style="height: 40px;">
					<i class="bookmark outline icon" id="emptyBookMark"></i> 북마크
				</button>


				<!-- 좋아요 버튼 -->
				<div class="ui labeled button" tabindex="0">
					<button class="ui red button" id="heartBtn" style="height: 40px;">
						<i class="heart outline icon" id="emptyHeart"></i> 공감
					</button>
					<a class="ui basic red left pointing label"> ${requestScope.dt.dtLike } </a>
				</div>


				<!-- 신고 버튼 -->
				<button class="ui black button" style="height: 40px;" id="reportBtn">
					<i class="bullhorn icon"></i> 신고
				</button>
			</div>
			<br> <br> <br>

			<!-- 신고 모달 -->
			<div class="ui basic modal" id="reportModal">
				<div class="ui icon header">
					<i class="exclamation triangle icon"></i> 신고하기
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
											<input type="radio" name="example2" checked="checked"> <label>&emsp;&emsp;광고/상업성 게시글</label>
										</div>
									</div>
									<br>
									<div class="field singo">
										<div class="ui radio checkbox">
											<input type="radio" name="example2"> <label>&emsp;&emsp;비방/욕설 게시글</label>
										</div>
									</div>
									<br>
									<div class="field singo">
										<div class="ui radio checkbox">
											<input type="radio" name="example2"> <label>&emsp;&emsp;개인정보 유출 게시물</label>
										</div>
									</div>
									<br>
									<div class="field singo">
										<div class="ui radio checkbox">
											<input type="radio" name="example2"> <label>&emsp;&emsp;청소년 유해(음란) 게시물</label>
										</div>
									</div>
									<br>
									<div class="field singo">
										<div class="ui radio checkbox">
											<input type="radio" name="example2"> <label>&emsp;&emsp;명예훼손/저작권 침해 게시물</label>
										</div>
									</div>
									<br>
									<div class="field singo">
										<div class="ui radio checkbox">
											<input type="radio" name="example2"> <label>&emsp;&emsp;도배성 게시물</label>
										</div>
									</div>
									<br>
									<div class="field singo">
										<div class="ui radio checkbox">
											<input type="radio" name="example2"> <label>&emsp;&emsp;불명확/추측성 게시물</label>
										</div>
									</div>
									<br> <br>
								</div>

							</div>
						</div>
					</div>
				</div>


				<br> <br>
				<div class="ui center aligned container">
					<div class="actions">
						<div class="ui red basic cancel inverted button">
							<i class="remove icon"></i> 취소
						</div>
						<div class="ui red ok inverted button">
							<i class="checkmark icon"></i> 신고
						</div>
					</div>
				</div>

			</div>
		</div>


		<!-- 글쓰기, 목록으로 돌아가기 버튼 -->
		<div class="ui right aligned container">
			<button class="ui right red basic button" style="margin-top: 19px;" id="writeBtn">
				<i class="edit icon"></i>글쓰기
			</button>
			<button class="ui black basic button" id="listBtn">
				<i class="list ul icon"></i>목록
			</button>
		</div>

		<!-- 댓글 -->
		<div class="ui comments" style="max-width: 1220px;">
			<h3 class="ui dividing header" style="margin-top: 8px">
				<i class="chevron red circle right icon"> </i>댓글 쓰기
			</h3>


			<form class="ui reply form">
				<div class="field">
					<textarea id="commentContent" style="resize: none;" name="content"></textarea>
				</div>
				<div class="ui right aligned container">
					<div class="ui labeled submit icon button" style="background-color: #fa2828; color: white;" onclick="addComment();">
						<i class="icon edit"></i>등록
					</div>
				</div>
			</form>

			<!-- 작성된 댓글 리스트 -->
			<c:forEach items="${requestScope.bcpd.bcList }" var="bc">

				<div class="comment">
					<a class="avatar"> <img src="${bc.mbImage }" style="width: 40px; height: 40px; border-radius: 25px;">
					</a>
					<div class="content" style="width: 93%;">
						<a class="author" style="position: absolute; width: 10%;">${bc.mbNickname }</a>
						<div class="metadata" style="width: 100%;">
							<span class="date" style="width: 30%; display: inline; margin-left: 10%;">${bc.cmtDateTime }</span>
							<div class="ui right aligned container" align="right" style="width: 70%; float: right;">
								<button class="ui red basic tiny button" style="margin-right: 10px;">
									<i class="thumbs up outline icon"></i>공감 ${bc.cmtLike }
								</button>
								<button class="ui black basic tiny button">
									<i class="ban icon"></i>신고 ${bc.cmtBlame }
								</button>
							</div>
						</div>
						<div class="text">${bc.cmtContent }</div>
					</div>
				</div>
				<br>
				<hr style="border: 1px solid #F6F6F6">
				<br>

			</c:forEach>

			<div class="ui center aligned basic segment">
				<div class="ui pagination menu">${requestScope.bcpd.pageNavi }</div>
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
		location.href = "/dietTipList.diet?type=all";
	});
	
	/* 댓글 쓰기 버튼 */
	function addComment(){
		var indexNo = $('#indexNo').val();
		var commentContent = $('#commentContent').val();
		
		$.ajax({
			url : '/addComment.diet',
			type : 'post',
			data : {
				'indexNo' : indexNo,
				'commentContent' : commentContent
			},
			
			success : function(data){
				if(data>0){
					alert('댓글을 작성하였습니다.');
				}else{
					alert('댓글을 등록하지 못했습니다.');
				}
				
				location.href = "/dietTipInfo.diet?indexNo=" + indexNo;
			},
			error : function(){
				alert('댓글을 등록하지 못했습니다.');
			}
		});
	}
	
	
	function naviMove(currentPage, indexNo, servletName){
		$.ajax({
			url : "/commentNavi?currentPage="+currentPage+"&indexNo=" + indexNo + "&servletName=" + servletName,
			type : "get",
			success : function(data){
				
				
				
				
			},
			error : function(){
				alert('실패');
			}
		});
	}
	
	
	
	
	
</script>

</html>