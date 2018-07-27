<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>${requestScope.bpv.postTitle}</title>
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


	<!-- 댓글입력을 위해 게시물번호를 넣어둘 태그를 hidden으로 만들어둠 -->
	<input type="hidden" id="postIndex" value="${requestScope.bpv.postIndex}">


	<!-- CONTENTS -->
	<div class="ui container">
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
		<span class="ui grid">
			<span class="four column row" style="padding-left: 20px;">
				<!-- 상단 게시판 종류 -->

				<h2 class="ui header">
					<i class="comment icon"></i>
					<div class="content">
						${requestScope.bpv.bcaName }
						<div class="sub header">Community</div>
					</div>
				</h2>

				<!-- 멤버 세션 넣기! -->
				<%-- <c:if test="${sessionScope.member!=null}"> --%>
				<!-- 수정&삭제 버튼 -->
				<span id="removePadding" class="right floated column" style="padding-top: 15px; padding-left: 140px;">
					<div class="ui buttons">
						<button class="ui grey basic button" id="modifyBtn" style="padding-top: 10px; padding-bottom: 10px; padding-left: 15px; padding-right: 15px;">수정</button>
						<button class="ui red basic button" onclick="return deleteBtn();" type="submit" style="padding-top: 10px; padding-bottom: 10px; padding-left: 15px; padding-right: 15px;">삭제</button>
					</div>
				</span>
				<%-- </c:if> --%>

			</span>
		</span>


		<hr style="border: 2px solid #D5D5D5;">
		<br>
		<br>


		<!-- 제목 -->

		<h2 class="ui center aligned container">
			<i class="quote left icon"></i>
			${requestScope.bpv.postTitle}
			<i class="quote right icon"></i>
		</h2>


		<!-- 닉네임, 날짜, 뷰수, 댓글 수 -->
		<div class="ui black segment">
			<div class="ui grid">
				<div class="three column row">
					<span class="left floated column">
						<span class="ui left aligned">
							<a>
								<!-- 프로필이미지 -->
								<img class="ui avatar image" src="${requestScope.bpv.mbImage}" onerror='this.src="/resources/image/avatar.png"'>
								<!-- 닉네임 -->
								${requestScope.bpv.postNickname}
							</a>
						</span>
					</span>
					<span id="resizeBlock" class="right floated column" style="padding-left: 7%;">
						<!-- 날짜 -->
						<span class="ui right aligned">
							<i class="calendar icon"></i>
							<fmt:formatDate value="${requestScope.bpv.postDateTime}" pattern="yyyy-MM-dd HH:mm" />
							<%-- <fmt:formatDate value="${requestScope.bpv.postDateTime}" pattern="yyyy-MM-dd HH:mm:ss" /> --%>
						</span>
						<!-- 뷰수 -->
						<span id="resize" class="ui right aligned">
							&nbsp;&nbsp;|&nbsp;&nbsp;
							<i class="eye icon"></i>
							${requestScope.bpv.postHit} &nbsp;&nbsp;|&nbsp;&nbsp;
						</span>
						<!-- 댓글수 -->
						<span id="resize" class="ui right aligned">
							<i class="pen square icon"></i>
							${requestScope.bpv.postComCount}
						</span>
					</span>
				</div>
			</div>
		</div>

		<!-- 내용 들어가는 부분! -->
		<div class="ui clearing segment">
			${requestScope.bpv.postContent}
			<br>
			<br>
			<br>
			<br>
			<hr style="border: 1px dashed #D5D5D5;">
			<br>
			<br>

			<!-- 사이즈 455px 보다 클 때 -->
			<div id="rediv1" class="ui center aligned basic segment" style="margin: 0; padding: 0;">
				<!-- 북마크 버튼 -->
				<button class="ui yellow button" id="bookMark" style="height: 40px;">
					<c:choose>
						<c:when test="${requestScope.bpv.bookMarkYN==0}">
							<i class="bookmark outline icon" id="bookMarkOff"></i>	
						</c:when>
						<c:when test="${requestScope.bpv.bookMarkYN==1}">
							<i class="bookmark icon" id="bookMarkOn"></i>
						</c:when>
						</c:choose>
					북마크
				</button>

				<!-- 좋아요 버튼 -->
				<div class="ui labeled button" tabindex="0">
					<button class="ui red button" id="heartBtn" style="height: 40px;">
						<c:choose>
							<c:when test="${requestScope.bpv.likeYN==0}">
								<i class="heart outline icon" id="emptyHeart"></i>
							</c:when>
							<c:when test="${requestScope.bpv.likeYN==1}">
								<i class="heart icon" id="heart"></i>
							</c:when>
						</c:choose>
						좋아요
					</button>
					<a class="ui basic red left pointing label" id="postLike"> ${requestScope.bpv.postLike} </a>
				</div>


				<!-- 신고 버튼 -->
				<button class="ui black button" style="height: 40px;" id="reportBtn">
					<i class="bullhorn icon"></i>
					신고
				</button>
			</div>

			<!-- 사이즈 455px 보다 작을 때 -->
			<div id="rediv2" style="margin: 0; padding: 0; display: none;">
				<!-- 북마크 버튼 -->
				<button class="ui yellow button" id="bookMark" style="height: 40px;">
					<c:choose>
						<c:when test="${requestScope.bpv.bookMarkYN==0}">
							<i class="bookmark outline icon" id="BookMarkOff"></i>	
						</c:when>
						<c:when test="${requestScope.bpv.bookMarkYN==1}">
							<i class="bookmark icon" id="bookMarkOn"></i>
						</c:when>
						</c:choose>
					
					북마크
				</button>

				<!-- 좋아요 버튼 -->
				<div class="ui labeled button" tabindex="0">
					<button class="ui red button" id="heartBtn" style="height: 40px;">
						<c:choose>
							<c:when test="${requestScope.bpv.likeYN==0}">
								<i class="heart outline icon" id="emptyHeart"></i>
							</c:when>
							<c:when test="${requestScope.bpv.likeYN==1}">
								<i class="heart icon" id="heart"></i>
							</c:when>
						</c:choose>
						좋아요
					</button>
					<a class="ui basic red left pointing label" id="postLike"> ${requestScope.bpv.postLike} </a>
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
					<textarea id="commentContent" style="resize: none;" name="content"></textarea>
				</div>
				<div class="ui right aligned container">
					<div class="ui labeled submit icon button" style="background-color: #fa2828; color: white;" onclick="addComment();">
						<i class="icon edit"></i>
						등록
					</div>
				</div>
			</form>
			<br>
			<br>



			<div id="comment">
				<c:if test="${requestScope.bcpd.bcList[0] !=null}">
					<!-- 작성된 댓글 리스트 -->
					<c:forEach items="${requestScope.bcpd.bcList }" var="bc">
						<input type="hidden" value="${bc.cmtIndex}" name="cmdIndex" id="cmdIndex" />
						<div class="comment">
							<a class="avatar">
								<img src="${bc.mbImage }" style="width: 40px; height: 40px; border-radius: 25px;">
							</a>
							<div class="content" style="width: 93%;">
								<a class="author" style="position: absolute; width: 10%;">${bc.mbNickname }</a>
								<div class="metadata" style="width: 100%;">
									<span class="date" style="width: 30%; display: inline; margin-left: 10%;">${bc.cmtDateTime }</span>
									<a class="modifyComment" onclick="modifyComment(${bc.cmtIndex});" style="cursor: pointer;">수정</a>
									&nbsp;|&nbsp;&nbsp;
									<a class="deleteComment" onclick="deleteComment(${bc.cmtIndex});" style="cursor: pointer;">삭제</a>
									<div class="ui right aligned container" align="right" style="width: 70%; float: right;">
										<button class="ui red basic tiny button" style="margin-right: 10px;">
											<i class="thumbs up outline icon"></i>
											좋아요 ${bc.cmtLike }
										</button>
										<button class="ui black basic tiny button">
											<i class="ban icon"></i>
											신고 ${bc.cmtBlame}
										</button>
									</div>
								</div>
								<div class="text">
									<pre id="${bc.cmtIndex}">${bc.cmtContent}</pre>

								</div>
							</div>
						</div>
						<!-- 수정 -->
						<form class="ui reply form" id="modifyContents" style="display: none;">
							<div class="field">
								<textarea id="commentContent" style="resize: none;" name="content"></textarea>
							</div>
							<div class="ui right aligned container">
								<div class="ui labeled submit icon button" style="background-color: #fa2828; color: white;" onclick="modifyComment();">
									<i class="icon edit"></i>
									수정
								</div>
							</div>
						</form>
						<br>
						<hr style="border: 1px solid #F6F6F6">
						<br>

					</c:forEach>

					<div class="ui center aligned basic segment">
						<div class="ui pagination menu">${requestScope.bcpd.pageNavi }</div>
					</div>
				</c:if>
			</div>

		</div>
	</div>


	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>


<!-- 성공시 모달 -->
<div class="ui modal" id="modal1">
	<div class="ui small header">댓글을 작성했습니다</div>
</div>



<!-- SCRIPT -->
<script type="text/javascript">
	// 슬라이드
	$(function() {
		$(".rslides").responsiveSlides({
			auto : true,
			timeout : 1500,
		});
	});

	var category = '${requestScope.bpv.bcaIndex}';
	var check = '${requestScope.bpv.bookMarkYN}';
	
	/* 북마크 버튼*/
	$('#bookMark').click(
			function() {
				var postIndex = '${requestScope.bpv.postIndex}';
				if (check == 0) {
				
				} else if (check == 1) {
					
				}
				$.ajax({
					url : '/postBookMark.diet',
					type : 'post',
					data : {
						'postIndex' : postIndex
					},
					success : function() {
						if(check==0){
							$('#bookMarkOff').removeClass("bookmark outline icon").addClass("bookmark icon");
							$('#bookMarkOff').attr('id', 'bookMarkOn');
							check = 1;
						}else if (check == 1){
							$('#bookMarkOn').removeClass("bookmark icon").addClass("bookmark outline icon");
							$('#bookMarkOn').attr('id', 'bookMarkOff');
							check = 0;
						}
					},
					error : function() {
						alert('실패');
					}
				});
			});

	var likeCheck;

	var likeYN = '${requestScope.bpv.likeYN}';
	var postLike = '${requestScope.bpv.postLike}';

	/* 좋아요 버튼 */
	$('#heartBtn').click(
			function() {				
				if (likeYN == 0) {
					likeCheck = true;
					likeYN = 1;
				} else {
					likeCheck = false;
					likeYN = 0;
				}
				var targetIndex = '${requestScope.bpv.postIndex}';
				var targetType = 1;
				var targetMbIndex = '${requestScope.bpv.mbIndex}';

				$.ajax({
					url : '/postLike.diet',
					type : 'post',
					data : {
						'targetIndex' : targetIndex,
						'targetType' : targetType,
						'targetMbIndex' : targetMbIndex
					},
					success : function() {
						if (likeCheck) {
							$('#emptyHeart').removeClass("heart outline icon")
									.addClass("heart icon");
							$('#emptyHeart').attr('id', 'heart')
							$('#postLike').text(++postLike);
							likeCheck = false;
						} else {
							$('#heart').removeClass("heart icon").addClass(
									"heart outline icon");
							$('#heart').attr('id', 'emptyHeart');
							$('#postLike').text(--postLike);
							likeCheck = true;
						}
					},
					error : function() {
						alert('실패');
					}
				});
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
		location.href = "/communityWholeBoard.diet?type=" + category;
	});

	/* 수정하기 버튼 */
	$('#modifyBtn').click(function() {
		location.href = "/modifyCommunity.diet";
	});

	/*글 삭제 확인*/
	function deleteBtn() {
		var postIndex = '${requestScope.bpv.postIndex}';

		var check = window.confirm("정말 삭제하시겠습니까?");

		if (check == true) {
			$.ajax({
				url : '/deletePost.diet',
				type : 'post',
				data : {
					'postIndex' : postIndex,
				},
				success : function() {
					alert('삭제를 완료하였습니다.');
					location.href = "/communityWholeBoard.diet?type="+ category;

				},
				error : function() {
					alert('삭제에 실패하였습니다.');
				}
			});
			return check;
		} else {
			//삭제 취소
			return false;
		}
	}

	
	/* 댓글 삭제 */
	function deleteComment(ci){
		var indexNo = $('#postIndex').val();
		//var cmdIndex = $('#cmdIndex').val();
		$.ajax({
			url : '/deleteComment.diet',
			type : 'post',
			data : {
				'commentIndex' : ci
			},
			success : function() {
				location.href = "/postedCommunity.diet?postIndex=" + indexNo;

			},
			error : function() {
				alert('삭제에 실패하였습니다.');
			}
		});
	} 

	
	/* 댓글 수정 */
	function modifyComment(ci){
		var cmdIndex = $('#cmdIndex').val();
		var indexNo = $('#postIndex').val();
		 
		/* 수정 해야할 코멘트  */		
		var commentPre = $('.comment').attr("style","display:none;");
		/* 수정하는 곳 */
		var modifyContents = $('#modifyContents').attr("style","display:inline");
		
		
		var kk = $('.text').html();
		alert(kk);
		
/* 		
		$.ajax({
			url : '/modifyComment.diet',
			type : 'post',
			data : {
				'commentIndex' : ci,
				'comment' : comment
				//내용 업데이트 
			},
			success : function() {
				alert('수정 성공');
				location.href = "/postedCommunity.diet?postIndex=" + indexNo;

			},
			error : function() {
				alert('수정에 실패하였습니다.');
			}
		}); */
	} 
	
	
	/* 댓글 쓰기 버튼 */
	function addComment() {
		var indexNo = $('#postIndex').val();
		var commentContent = $('#commentContent').val();

		$.ajax({
			url : '/addComment.diet',
			type : 'post',
			data : {
				'indexNo' : indexNo,
				'commentContent' : commentContent
			},

			success : function(data) {
				if (data > 0) {
					// 모달 띄우기
					//$('.ui.basic.modal').modal('show');

					//alert('댓글을 작성하였습니다.');
				} else {
					alert('댓글을 등록하지 못했습니다.');
				}

				location.href = "/postedCommunity.diet?postIndex=" + indexNo;
			},
			error : function() {
				alert('댓글을 등록하지 못했습니다.');
			}
		});
	}

	function naviMo(currentPage, indexNo, servletName) {
		location.href = "/" + servletName + "?indexNo=" + indexNo
				+ "&currentPage=" + currentPage;
	}

	/* 댓글 내비게이션 버튼 ajax 처리를 위한 코드 그대로 가져다 쓰시면 돼요 */
	function naviMove(currentPage, indexNo, servletName) {
		$.ajax({
			url : '/naviMove.diet',
			type : 'post',
			data : {
				'currentPage' : currentPage,
				'indexNo' : indexNo,
				'servletName' : servletName
			},
			success : function(data) {
				$('#comment').html("");
				/* 작성된 댓글 리스트 불러오는 부분  */
				for (var i = 0; i < data.bcList.length; i++) {
					var commentDiv = $("<div>").attr("class", "comment");

					var aAvatar = $("<a>").attr("class", "avatar");

					var img = $("<img>").attr("style",
							"width: 40px; height: 40px; border-radius: 25px;");
					img.attr("src", data.bcList[i].mbImage);

					var contentDiv = $("<div>").attr("style", "width:93%;");
					contentDiv.attr("class", "content");

					var aAuthor = $("<a>").attr("class", "author");
					aAuthor.attr("style", "position: absolute; width: 10%;");
					aAuthor.html(data.bcList[i].mbNickname);

					var metadataDiv = $("<div>").attr("class", "metadata");
					metadataDiv.attr("style", "width:100%;");

					var span = $("<span>").attr("class", "date");
					span.attr("style",
							"width: 30%; display: inline; margin-left: 10%;");
					span.html(data.bcList[i].cmtDateTime);

					/* ☆지현 추가 */
					var modifyA = $("<a>").attr("class","modifyComment");
					modifyA.attr("onclick","modifyComment(data.bcList[i].cmtIndex)");
					modifyA.attr("style","cursor:pointer;");
					modifyA.append("수정");
					
					/* ☆지현 추가*/
					var deleteA = $("<a>").attr("class","deleteComment");
					deleteA.attr("onclick","deleteComment(data.bcList[i].cmtIndex)");
					deleteA.attr("style","cursor:pointer;");
					deleteA.append("삭제");
										
					var containerDiv = $("<div>").attr("class",
							"ui right aligned container");
					containerDiv.attr("align", "right");
					containerDiv.attr("style", "width: 70%; float: right;");

					var likeBtn = $("<button>").attr("class",
							"ui red basic tiny button");
					likeBtn.attr("style", "margin-right: 10px;");

					var likeI = $("<i>")
							.attr("class", "thumbs up outline icon");

					var blameBtn = $("<button>").attr("class",
							"ui black basic tiny button");

					var blameI = $("<i>").attr("class", "ban icon");

					var textDiv = $("<div>").attr("class", "text");

					var pre = $("<pre>").html(data.bcList[i].cmtContent);

					likeBtn.append(likeI);
					likeBtn.append("좋아요" + data.bcList[i].cmtLike);

					blameBtn.append(blameI);
					blameBtn.append("신고" + data.bcList[i].cmtBlame);

					containerDiv.append(likeBtn);
					containerDiv.append(blameBtn);

					metadataDiv.append(span);
					metadataDiv.append(containerDiv);
					/* ☆지현 추가 */
					metadataDiv.append(modifyA);
					metadataDiv.append('&nbsp;|&nbsp;&nbsp;');
					metadataDiv.append(deleteA);
					
					textDiv.append(pre);

					contentDiv.append(aAuthor);
					contentDiv.append(metadataDiv);
					contentDiv.append(textDiv);

					aAvatar.append(img);

					commentDiv.append(aAvatar);
					commentDiv.append(contentDiv);

					$('#comment').append(commentDiv);
					$('#comment').append($("<br>"));
					$('#comment').append(
							$("<hr>").attr('style',
									'border: 1px solid #F6F6F6;'));
					$('#comment').append($("<br>"));
				}

				/* 댓글 리스트 불러오는 부분 */
				var naviDiv = $("<div>").attr("class",
						"ui center aligned basic segment");
				var menuDiv = $("<div>").attr("class", "ui pagination menu");
				menuDiv.html(data.pageNavi);

				naviDiv.append(menuDiv);
				$('#comment').append(naviDiv);
			},
			error : function() {
				alert('실패');
			}
		});
	}
	

</script>

<!-- 미디어 태그 1200px 보다 작아질 때-->
<style type="text/css" media="screen">
@media ( max-width : 1200px) {
	#resize {
		display: none;
	}
	#resizeBlock {
		margin-right: 50px;
		padding-left: 0px;
		padding-right: 0px;
		width: 200px;
	}
	#removePadding {
		margin-left: 500px;
	}
}

@media ( max-width : 455px) {
	#bookMark {
		display: block;
	}
	#heartBtn {
		display: block;
	}
	#reportBtn {
		display: block;
	}
	#removePadding {
		padding: 0;
		margin: 0;
	}
}
</style>

</html>