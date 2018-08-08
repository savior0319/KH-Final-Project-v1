<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>다이어트 꿀팁</title>
<script src="/resources/slider/responsiveslides.min.js"></script>
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
	<input id="indexNo" type="hidden" value="${requestScope.dt.dtIndex }">
	<!-- CONTENTS -->
	<div class="ui container">
		<!-- 슬라이드-->
               <ul class="rslides" style="padding-bottom: 15px;">
                  <li>
                     <img src="#" id="image1" style="height:300px;">
                  </li>
                  <li>
                     <img src="#" id="image2" style="height:300px;">
                  </li>
                  <li>
                     <img src="#" id="image3" style="height:300px;">
                  </li>
                  <li>
                     <img src="#" id="image4" style="height:300px;">
                  </li>
                  <li>
                     <img src="/resources/image/advertise.png" style="height:300px;">
                  </li>
               </ul>
		<br>
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
		<!-- 모바일용이 아닌 사이즈 -->
		<div id="size1" class="ui black segment">
				<div class="ui grid">
					<div class="three wide column"> 
						<span class="ui left aligned"> 
							<img class="ui avatar image" src="${requestScope.dt.dtWriterPhoto }">
							${requestScope.dt.dtNickname }
						</span>
					</div> 
					<div class="three wide column"></div>
					<div class="ten wide column"> <!-- 날짜 -->
						<div style="float:right; padding-right:20px;"> 
						<span class="ui right aligned"> 
							<i class="calendar icon"></i> 
							<fmt:formatDate value="${requestScope.dt.dtDate }" pattern="yyyy-MM-dd HH:mm" />
						</span> &nbsp;&nbsp;|&nbsp;&nbsp; <!-- 뷰수 --> 
						<span class="ui right aligned"> 
							<i class="eye icon"></i> ${requestScope.dt.dtSee }
						</span> &nbsp;&nbsp;|&nbsp;&nbsp; <!-- 댓글수 --> 
						<span class="ui right aligned"> 
							<i class="pen square icon"></i> ${requestScope.bcpd.totalCommentNo }
						</span>
						</div>
					</div>
				</div>
		</div>
		
		<!-- 모바일용 사이즈 -->
		<div id="size2" class="ui black segment">
			<div class="ui grid" style="padding-top:7px;">
					<div class="ui left aligned" style="margin-right:15%;"> 
						<img class="ui avatar image" src="${requestScope.dt.dtWriterPhoto }">
							${requestScope.dt.dtNickname }
					</div>
					 <!-- 날짜, 조회수, 댓글 수 --> 
					 <div>
						<span class="ui right aligned"> 
							<i class="calendar icon"></i> 
							<fmt:formatDate value="${requestScope.dt.dtDate }" pattern="yyyy-MM-dd HH:mm" />
						</span> &nbsp;&nbsp;|&nbsp;&nbsp; <!-- 뷰수 --> 
						<span class="ui right aligned"> 
							<i class="eye icon"></i> ${requestScope.dt.dtSee }
						</span> &nbsp;&nbsp;|&nbsp;&nbsp; <!-- 댓글수 --> 
						<span class="ui right aligned"> 
							<i class="pen square icon"></i> ${requestScope.bcpd.totalCommentNo }
						</span>
					</div>
			</div>
		</div>

		<!-- 내용 들어가는 부분! -->
		<div class="ui clearing segment" style="word-break:break-all;">
			${requestScope.dt.dtExplain } <br> <br> <br> <br>
			<hr style="border: 1px dashed #D5D5D5;">
			<br> <br>

			<!-- 사이즈 455px 보다 클때 -->
			<div id="rediv1" class="ui center aligned container" style="margin: 0; padding: 0;">
				<!-- 북마크 버튼 -->
				<button class="ui yellow button" id="bookMark" style="height: 40px;">
					<c:choose>
						<c:when test="${requestScope.dt.bookMarkYN==0}">
							<i class="bookmark outline icon" id="bookMarkOff"></i>
						</c:when>
						<c:when test="${requestScope.dt.bookMarkYN==1}">
							<i class="bookmark icon" id="bookMarkOn"></i>
						</c:when>
					</c:choose>
					북마크
				</button>


				<!-- 좋아요 버튼 -->
				<div class="ui labeled button" tabindex="0">
					<button class="ui red button" id="heartBtn" style="height: 40px;">
						<c:choose>
							<c:when test="${requestScope.dt.likeYN==0}">
								<i class="heart outline icon" id="emptyHeart"></i>
							</c:when>
							<c:when test="${requestScope.dt.likeYN==1}">
								<i class="heart icon" id="heart"></i>
							</c:when>
						</c:choose>
						좋아요
					</button>
					<a class="ui basic red left pointing label" id="postLike"> ${requestScope.dt.dtLike } </a>
				</div>


				<!-- 신고 버튼 -->
				<!-- <button class="ui black button" style="height: 40px;" id="reportBtn">
					<i class="bullhorn icon"></i> 신고
				</button> -->
			</div>

			<!-- 사이즈 455px 보다 작을 때 -->
			<div id="rediv2" style="margin: 0; padding: 0; display: none;">
				<!-- 북마크 버튼 -->
				<button class="ui yellow button" id="bookMark" style="height: 40px;">
					<c:choose>
						<c:when test="${requestScope.dt.bookMarkYN==0}">
							<i class="bookmark outline icon" id="bookMarkOff"></i>
						</c:when>
						<c:when test="${requestScope.dt.bookMarkYN==1}">
							<i class="bookmark icon" id="bookMarkOn"></i>
						</c:when>
					</c:choose>
					북마크
				</button>


				<!-- 좋아요 버튼 -->
				<div class="ui labeled button" tabindex="0">
					<button class="ui red button" id="heartBtn" style="height: 40px;">
						<c:choose>
							<c:when test="${requestScope.dt.likeYN==0}">
								<i class="heart outline icon" id="emptyHeart"></i>
							</c:when>
							<c:when test="${requestScope.dt.likeYN==1}">
								<i class="heart icon" id="heart"></i>
							</c:when>
						</c:choose>
						좋아요
					</button>
					<a class="ui basic red left pointing label" id="postLike"> ${requestScope.dt.dtLike } </a>
				</div>

			</div>
			<br> <br> <br>

		</div>


		<!-- 글쓰기, 목록으로 돌아가기 버튼 -->
		<div class="ui right aligned container">
			<button class="ui black basic button" id="listBtn">
				<i class="list ul icon"></i>목록
			</button>
		</div>
		<br> <br>
		<table class="ui very basic table">

			<tbody>
				<tr></tr>

				<c:choose>
					<c:when test="${requestScope.dt.dtNo!=1 }">
						<tr style="cursor: pointer;" onclick="goInfo(${requestScope.nextPreDt[0].dtIndex })">
							<td>이전글 <i class="angle up icon"></i></td>
							<td>${requestScope.nextPreDt[0].dtTitle }</td>
							<td><fmt:formatDate value="${requestScope.nextPreDt[0].dtDate }" pattern="yyyy-MM-dd" /></td>
							<td>조회수 : ${requestScope.nextPreDt[0].dtSee }</td>
						</tr>

						<c:if test="${requestScope.nextPreDt[1]!=null }">
							<tr style="cursor: pointer;" onclick="goInfo(${requestScope.nextPreDt[1].dtIndex})">
								<td>다음글 <i class="angle down icon"></i></td>
								<td>${requestScope.nextPreDt[1].dtTitle }</td>
								<td><fmt:formatDate value="${requestScope.nextPreDt[1].dtDate }" pattern="yyyy-MM-dd" /></td>
								<td>조회수 : ${requestScope.nextPreDt[1].dtSee }</td>
							</tr>
						</c:if>

					</c:when>
					<c:when test="${requestScope.dt.dtNo==1 }">
						<tr style="cursor: pointer;" onclick="goInfo(${requestScope.nextPreDt[0].dtIndex})">
							<td>다음글 <i class="angle down icon"></i></td>
							<td>${requestScope.nextPreDt[0].dtTitle }</td>
							<td><fmt:formatDate value="${requestScope.nextPreDt[0].dtDate }" pattern="yyyy-MM-dd" /></td>
							<td>조회수 : ${requestScope.nextPreDt[0].dtSee }</td>
						</tr>

					</c:when>
				</c:choose>

				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<br>


		<!-- 댓글 -->
		<div class="ui comments" style="max-width: 1220px;">
			<h3 class="ui dividing header" style="margin-top: 8px">
				<i class="chevron red circle right icon"> </i>댓글 쓰기
			</h3>


			<c:choose>
				<c:when test="${sessionScope.member!=null}">
				<!-- 로그인 한경우 -->
				<form class="ui reply form">
					<div class="field">
						<textarea style="resize: none;" id="commentContent"></textarea>
					</div>
					<div class="ui right aligned container">
						<div class="ui labeled submit icon button"
							style="background-color: #fa2828; color: white;"
							onclick="addComment();">
							<i class="icon edit"></i> 등록
						</div>
					</div>
				</form>
				</c:when>
				<c:otherwise>
					<!-- 로그인 하지 않았을 경우 -->
					<form class="ui reply form">
						<div class="field">
							<textarea id="commentContent" style="resize: none;" name="content" placeholder="로그인 후 이용이 가능합니다." readonly></textarea>
						</div>

					</form>
				</c:otherwise>
				</c:choose>
			
			
			
			
			<br> <br>

			<div id="comment">
				<c:if test="${requestScope.bcpd.bcList[0]!=null }">
					<!-- 작성된 댓글 리스트 -->
					<c:forEach items="${requestScope.bcpd.bcList }" var="bc">
						<input type="hidden" value="${bc.cmtLike}" id="cmtLike_${bc.cmtIndex}" />

						<div class="comment">
							<a class="avatar"> <img src="${bc.mbImage }" style="width: 40px; height: 40px; border-radius: 25px;">
							</a>
							<div class="content" style="width: 93%;">
								<div class="author" style="position: absolute; width: 90px;">${bc.mbNickname }</div>
								<div class="metadata" style="width: 100%;">
									<span class="date" style="width: 30%; display: inline; margin-left: 100px;"><fmt:formatDate value="${bc.cmtDateTime }" pattern="yyyy-MM-dd HH:mm:ss" /></span>

									<div id="modiDelete_${bc.cmtIndex}">
									
									<c:if test="${bc.mbNickname eq sessionScope.member.mbNickName}">
										<input type="hidden" value="${bc.cmtIndex}" name="cmdIndex" id="cmdIndex_${bc.cmtIndex}" /> <a class="modifyComment" style="cursor: pointer;" id="changeCmd_${bc.cmtIndex}">수정</a>
										&nbsp;&nbsp;|&nbsp;&nbsp; <a class="deleteComment" onclick="deleteComment(${bc.cmtIndex});" style="cursor: pointer;">삭제</a>
										</c:if>
									</div>
									<a class="cancleComment" id="cancleComment_${bc.cmtIndex}" onclick="cancleComment(${bc.cmtIndex});" style="cursor: pointer; display: none;" href="javascript:void(0)">취소</a>

									<div class="ui right aligned container" align="right" style="width: 70%; float: right; margin-top:10px;">
										<button class="ui red basic tiny button" style="margin-right: 10px;" onclick="cmtLike(${bc.cmtIndex},${bc.mbIndex})">
											<i class="thumbs up outline icon"></i>좋아요 <label id="cmtLikeCount_${bc.cmtIndex}">${bc.cmtLike}</label>
										</button>
										<button class="ui black basic tiny button" id="cmdReportBtn_${bc.cmtIndex}" onclick="cmdBlame(${bc.cmtIndex});">
											<i class="ban icon"></i>신고<label id="cmtBlame_${bc.cmtIndex}">${bc.cmtBlame}</label>
										</button>
										<!-- 신고 수정 ☆-->
											<input type="hidden" value="${bc.mbIndex}" id="cmdWriter_${bc.cmtIndex}" />
									</div>
								</div>
								<div class="text" id="cmd_${bc.cmtIndex}">
									<pre style="white-space: pre-wrap;">${bc.cmtContent }</pre>
								</div>
							</div>
						</div>

						<!-- 수정 -->
						<form class="ui reply form" id="modifyContents_${bc.cmtIndex}" style="display: none;">
							<div class="field" style="margin-top:8px">
								<textarea id="modifyText_${bc.cmtIndex}" style="resize: none;" name="content">${bc.cmtContent}</textarea>
							</div>
							<div class="ui right aligned container" id="rightContainer">
								<div class="ui labeled submit icon button" style="background-color: #fa2828; color: white;" onclick="modifyComment(${bc.cmtIndex});">
									<i class="icon edit"></i> 수정
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

		<!-- 댓글 신고 모달 -->
		<div class="ui basic modal" id="reportCmdModal">
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
										<input type="radio" id="blame" name="blameText" checked="checked" value="광고/상업성 게시글" /> <label>&emsp;&emsp;광고/상업성 게시글</label>
									</div>
								</div>
								<br>
								<div class="field singo">
									<div class="ui radio checkbox">
										<input type="radio" id="blame" name="blameText" value="비방/욕설 게시글" /> <label>&emsp;&emsp;비방/욕설 게시글</label>
									</div>
								</div>
								<br>
								<div class="field singo">
									<div class="ui radio checkbox">
										<input type="radio" id="blame" name="blameText" value="개인정보 유출 게시물" /> <label>&emsp;&emsp;개인정보 유출 게시물</label>
									</div>
								</div>
								<br>
								<div class="field singo">
									<div class="ui radio checkbox">
										<input type="radio" id="blame" name="blameText" value="청소년 유해(음란) 게시물"> <label>&emsp;&emsp;청소년 유해(음란) 게시물</label>
									</div>
								</div>
								<br>
								<div class="field singo">
									<div class="ui radio checkbox">
										<input type="radio" id="blame" name="blameText" value="명예훼손/저작권 침해 게시물"> <label>&emsp;&emsp;명예훼손/저작권 침해 게시물</label>
									</div>
								</div>
								<br>
								<div class="field singo">
									<div class="ui radio checkbox">
										<input type="radio" id="blame" name="blameText" value="도배성 게시물"> <label>&emsp;&emsp;도배성 게시물</label>
									</div>
								</div>
								<br>
								<div class="field singo">
									<div class="ui radio checkbox">
										<input type="radio" id="blame" name="blameText" value="불명확/추측성 게시물"> <label>&emsp;&emsp;불명확/추측성 게시물</label>
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
					<div class="ui red ok inverted button" onclick="sendCmdBlame();">
						<i class="checkmark icon"></i> 신고
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
         $("#mobile-image1").attr("src",img[0].path1);
         $("#mobile-image2").attr("src",img[1].path1);
         $("#mobile-image3").attr("src",img[2].path1);
         $("#mobile-image4").attr("src",img[3].path1);
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

	var category = '${requestScope.dt.dtType}';
	var check = '${requestScope.dt.bookMarkYN}';

	/* 북마크 버튼*/
	$('#bookMark').click(
			function() {
				var postIndex = '${requestScope.dt.dtIndex}';
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
						if (check == 0) {
							$('#bookMarkOff').removeClass(
									"bookmark outline icon").addClass(
									"bookmark icon");
							$('#bookMarkOff').attr('id', 'bookMarkOn');
							check = 1;
						} else if (check == 1) {
							$('#bookMarkOn').removeClass("bookmark icon")
									.addClass("bookmark outline icon");
							$('#bookMarkOn').attr('id', 'bookMarkOff');
							check = 0;
						}
					},
					error : function() {
						alert('로그인 후 이용가능합니다.');
					}
				});
			});

	var likeCheck;

	var likeYN = '${requestScope.dt.likeYN}';
	var postLike = '${requestScope.dt.dtLike}';

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
				var targetIndex = '${requestScope.dt.dtIndex}';
				var targetType = 1;
				var targetMbIndex = '${requestScope.dt.dtWriterNo}';

				$.ajax({
					url : '/dtLike.diet',
					type : 'post',
					data : {
						'targetIndex' : targetIndex,
						'targetType' : targetType,
						'targetMbIndex' : targetMbIndex
					},
					success : function(data) {
						if (data == 'success') {
							if (likeCheck) {
								$('#emptyHeart').removeClass(
										"heart outline icon").addClass(
										"heart icon");
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
						}else{
							alert('로그인 후 이용 가능합니다.');
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
		location.href = "/dietTipList.diet?type=${requestScope.type}";
	});

	/* 댓글 쓰기 버튼 */
	function addComment() {
		var mbId = '${sessionScope.member.mbId}';
		$.ajax({
			url : '/checkReport.diet',
			type : 'post',
			data : {
				'mbId' : mbId
			},
			success : function(data){
				if(data=='n'){
				
					var indexNo = $('#indexNo').val();
					var commentContent = $('#commentContent').val();
					if(commentContent==''){
						if(typeof Android !== "undefined" && Android !==null){
							Android.noComment();
						}else{
							alert('댓글을 입력해 주세요');
						}
						return;
					}

					$.ajax({
						url : '/addComment.diet',
						type : 'post',
						data : {
							'indexNo' : indexNo,
							'commentContent' : commentContent
						},

						success : function(data) {
							if (data > 0) {
								
							} else {
								alert('댓글을 등록하지 못했습니다.');
							}

							location.href = "/dietTipInfo.diet?indexNo=" + indexNo + "&type=${requestScope.type}";
						},
						error : function() {
							alert('댓글을 등록하지 못했습니다.');
						}
					});
				}else {
					alert('\n댓글쓰기 정지당한 회원입니다. \n\n관리자에게 문의하세요.');
				}
			}
		});
	}


	/* 댓글 삭제 */
	function deleteComment(ci){
		var indexNo = $('#indexNo').val();
		
		$.ajax({
			url : '/deleteComment.diet',
			type : 'post',
			data : {
				'commentIndex' : ci,
				'indexNo' : indexNo
			},
			success : function() {
				location.href = "/dietTipInfo.diet?indexNo=" + indexNo;

			},
			error : function() {
				alert('삭제에 실패하였습니다.');
			}
		});
	} 

	
	
	/* 댓글 수정 */
	

	$("body").on("click", "[id^=changeCmd_]", function(event) { 
		/* 해당 댓글 번호 */
		var cmdIndex = $(this).siblings('input').val(); 
		// 수정 해야할 코멘트
		$('#cmd_'+cmdIndex).attr("style","display:none;");
		var modifyContents = $('#modifyContents_'+cmdIndex).attr("style","display:inline;");
		var modiDelete = $("#modiDelete_"+cmdIndex).attr("style","display:none;");
		var cancleComment = $('#cancleComment_'+cmdIndex).attr("style","display:inline;");
    });
	
	function modifyComment(ci){
		var indexNo = $('#indexNo').val();
		//내용가져오기
		var comment = $('#modifyText_'+ci).val();
		
		if(comment==''){
			alert('댓글을 입력해 주세요');
			return;
		}
		
		 $.ajax({
			url : '/modifyComment.diet',
			type : 'post',
			data : {
				'commentIndex' : ci,
				'comment' : comment
			},
			success : function() {
				//alert('수정 성공');
				$('#cmd_'+ci).attr("style","display:inline;");
				var modifyContents = $('#modifyContents_'+ci).attr("style","display:none;");
				var modiDelete = $("#modiDelete_"+ci).attr("style","display:inline;");
				var cancleComment = $('#cancleComment_'+ci).attr("style","display:none;");
				location.href = "/dietTipInfo.diet?indexNo=" + indexNo;

			},
			error : function() {
				alert('수정에 실패하였습니다.');
			}
		}); 
	}
	
	function cancleComment(ci){
		$('#cmd_'+ci).attr("style","display:inline;");
		var modifyContents = $('#modifyContents_'+ci).attr("style","display:none;");
		var modiDelete = $("#modiDelete_"+ci).attr("style","display:inline;");
		var cancleComment = $('#cancleComment_'+ci).attr("style","display:none;");
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
					var aAuthor = $("<span>").attr("class", "author");
					aAuthor.attr("style", "position: absolute; width: 90px;");
					aAuthor.html(data.bcList[i].mbNickname);
					var metadataDiv = $("<div>").attr("class", "metadata");
					metadataDiv.attr("style", "width:100%;");
					var span = $("<span>").attr("class", "date");
					span.attr("style",
							"width: 30%; display: inline; margin-left: 100px;");
					span.html(data.bcList[i].cmtDateTime);
					
					/* 날짜 형식 추가! */
					 var date = new Date(data.bcList[i].cmtDateTime);
					var dateFor = date.getFullYear() + "-"+
					doublePos((date.getMonth() + 1)) +"-"+doublePos(date.getDate()) + " " + doublePos(date.getHours())+":"+
					doublePos(date.getMinutes()) 
							+":"+ doublePos(date.getSeconds());
					span.html(dateFor);
					
					var modiDelete = $("<div>").attr("id","modiDelete_"+data.bcList[i].cmtIndex);
					
					
					/* ☆지현 추가  - 히든값*/
					var hiddenInput = $("<input>").attr("type","hidden");
					hiddenInput.attr("value",data.bcList[i].cmtIndex);
					hiddenInput.attr("id","cmdIndex_"+data.bcList[i].cmtIndex);
					
					/* ☆지현 추가  - 수정*/
					var modifyA = $("<a>").attr("class","modifyComment");
					//modifyA.attr("onclick","changeCmd_data.bcList[i].cmtIndex();");
					modifyA.attr('id','changeCmd_'+data.bcList[i].cmtIndex+'()')
					modifyA.attr("style","cursor:pointer;");
					modifyA.append("수정");
				
					
					
					/* ☆지현 추가 - 삭제*/
					var deleteA = $("<a>").attr("class","deleteComment");
					deleteA.attr("onclick","deleteComment("+data.bcList[i].cmtIndex+")");
					deleteA.attr("style","cursor:pointer;");
					deleteA.append("삭제");
					
					/* ☆지현 추가 - 취소*/					
					var cancelA = $("<a>").attr("class","canelComment");
					cancelA.attr("onclick","cancelComment("+data.bcList[i].cmtIndex+");");
					cancelA.attr("id","cancelComment_"+data.bcList[i].cmtIndex);
					cancelA.attr("style","cursor: pointer; display: none;");
					cancelA.attr("href","javascript:void(0);")
					cancelA.append("취소");
					
					
										
					var containerDiv = $("<div>").attr("class",
							"ui right aligned container");
					containerDiv.attr("align", "right");
					containerDiv.attr("style", "width: 70%; float: right; margin-top:10px;");
					var likeBtn = $("<button>").attr("class",
							"ui red basic tiny button");
					likeBtn.attr("style", "margin-right: 10px;");
					var likeI = $("<i>")
							.attr("class", "thumbs up outline icon");
					var blameBtn = $("<button>").attr("class",
							"ui black basic tiny button");
					blameBtn.attr("id","cmdReportBtn_"+data.bcList[i].cmtIndex);
					blameBtn.attr("onclick","cmdBlame("+data.bcList[i].cmtIndex+");");
											
					var blameI = $("<i>").attr("class", "ban icon");
					/* 지현_신고 카운트 추가  */
					var blameCount = $("<label>").attr("id","cmtBlame_"+data.bcList[i].cmtIndex);
					blameCount.html(data.bcList[i].cmtBlame);
					
					//<!-- 신고 수정 ☆-->
					//<input type="hidden" value="${bc.mbIndex}" id="cmdWriter_${bc.cmtIndex}" />
					var blameIndex = $("<input>").attr("type","hidden");
					blameIndex.attr("value",data.bcList[i].mbIndex);	
					blameIndex.attr("id","cmdWriter_"+data.bcList[i].cmtIndex);
					
					
					var textDiv = $("<div>").attr("class", "text");
					textDiv.attr("id","cmd_"+data.bcList[i].cmtIndex);
					
					var pre = $("<pre>").html(data.bcList[i].cmtContent);
					pre.css('white-space','pre-wrap');
					
					likeBtn.append(likeI);
					likeBtn.append("좋아요" + data.bcList[i].cmtLike);
					blameBtn.append(blameI);
					blameBtn.append("신고");
					/* 지현_신고 카운트 추가  */
					blameBtn.append(blameCount);
					//<!-- 신고 수정 ☆ : index 추가-->
					blameBtn.append(blameIndex);
					containerDiv.append(likeBtn);
					containerDiv.append(blameBtn);
					metadataDiv.append(span);
					
					/* <button class="ui black basic tiny button" id="cmdReportBtn_${bc.cmtIndex}" onclick="cmdBlame(${bc.cmtIndex});">
												<i class="ban icon"></i> 신고 <label id="cmtBlame_${bc.cmtIndex}">${bc.cmtBlame}</label>
											</button> */
					/* ☆지현 추가 - 수정 삭제 버튼 */
					metadataDiv.append(modiDelete);
					var getNickName = '${sessionScope.member.mbNickName}';
					if(getNickName == data.bcList[i].mbNickname){
					modiDelete.append(hiddenInput);
					modiDelete.append(modifyA);
					modiDelete.append('&nbsp;&nbsp;|&nbsp;&nbsp;');
					modiDelete.append(deleteA);
					}
					metadataDiv.append(cancelA);
					
					
					metadataDiv.append(containerDiv);
					
					textDiv.append(pre);
					contentDiv.append(aAuthor);
					contentDiv.append(metadataDiv);
					contentDiv.append(textDiv);
					aAvatar.append(img);
					commentDiv.append(aAvatar);
					commentDiv.append(contentDiv);
					$('#comment').append(commentDiv);
					
					/* 지현 추가  - 수정하는 부분*/
					var modifyContents = $("<form>").attr("class","ui reply form");
					modifyContents.attr("id","modifyContents_"+data.bcList[i].cmtIndex);
					modifyContents.attr("style","display:none;");
					
					var modifyField = $("<div>").attr("class","field");
					modifyField.css('margin-top','8px');
					
					var textArea = $("<textarea>").attr("id","modifyText_"+data.bcList[i].cmtIndex);
					textArea.attr("style","resize:none;");
					textArea.attr("name","content");
					textArea.append(data.bcList[i].cmtContent);
					
					var divRight = $("<div>").attr("class","ui right aligned container");
					divRight.attr("id","rightnContainer");
					
					var divLabel = $("<div>").attr("class","ui labeled submit icon button");
					divLabel.attr("style","background-color: #fa2828; color: white;");
					divLabel.attr("onclick","modifyComment("+data.bcList[i].cmtIndex+");")
					
					var editIcon = $("<i>").attr("class","icon edit");
					
			
					$('#comment').append(modifyContents);
					modifyContents.append(modifyField);
					modifyField.append(textArea);
					modifyContents.append(divRight);
					divRight.append(divLabel);
					divLabel.append(editIcon);
					divLabel.append("수정");
					
					
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
	
	/* 날짜 형식 추가하기 */
	function doublePos(num)
	{
		return num>9?num:"0"+num;
	}
	
	// 이전글 다음글
	function goInfo(me){
		location.href="/dietTipInfo.diet?indexNo=" + me + "&type=" + '${requestScope.dt.dtType}';
	}
	
	//댓글 신고 - 라디오 체크후 신고 버튼
	function sendCmdBlame(){
		//해당 댓글 번호 가져오기!☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆ 
		var blameReport = $(':input:radio[name=blameText]:checked').val();
		/* 신고 수정☆ */
		var targetMbIndex = $('#cmdWriter_'+blameCmd).val();
 		$.ajax({
			url : '/blameCmd.diet',
			type : 'post',
			data : {
				'targetIndex' : blameCmd,
				'targetMbIndex' : targetMbIndex,
				'targetContents' : blameReport
			},
			success : function() {
				alert('신고가 완료되었습니다.');
				location.reload();
			},
			error : function() {
					alert('실패');
				}
			}); 
	}
	
	var blameCmd ;
	/* 댓글신고버튼 : 댓글 신고 여부 확인 -> 댓글 Index,  신고 회원 */
	function cmdBlame(ci){
		var mbIndex = '${sessionScope.member.mbIndex}';
		blameCmd = ci;
		$.ajax({
			url : '/checkBlameCmd.diet',
			type : 'post',
			data : {
				'mbIndex' : mbIndex,
				'targetIndex' : ci
			},
			success : function(data) {
				/* 클릭시 신고 내용 체크 띄운다! */
				if(data == "success" ){
				$('#reportCmdModal').modal('show').modal('setting', 'closable', false);
				}else if(data == "used"){
					alert("이미 신고한 댓글입니다.");
				}
			},
			error : function() {
					alert('실패');
				}
			});
	}
	
	/* 댓글 좋아요 버튼 */
	function cmtLike(index,mbIndex){
		var targetIndex = index;
		var targetType = 2;
		var targetMbIndex = mbIndex;
		var cmtLike = $("#cmtLike_"+index).val();
		console.log(cmtLike);
		$.ajax({
			url : '/cmtLike.diet',
			type : 'post',
			data : {
				'targetIndex' : targetIndex,
				'targetType' : targetType,
				'targetMbIndex' : targetMbIndex
			},
			success : function(data){
				if(data=='success'){
					$('#cmtLikeCount_'+index).text(++cmtLike);
				} else if(data=='failed') {
					alert('페이지에 오류가 발생하였습니다.');
				} else if(data=='used') {
					if(typeof Android !== "undefined" && Android !==null){
						Android.alreadyLike();
					}else{
						alert('이미 추천한 댓글 입니다.');
					}
				}
			}
		})
	}
</script>

<!-- 미디어 태그 1200px 보다 작아질 때-->
<style type="text/css" media="screen">
@media ( min-width : 650px) {
	#size1 {
		display: block;
	}
	#size2 {
		display: none;
	}
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

@media ( max-width : 649px) {
	#size1 {
		display: none;
	}
	#size2 {
		display: block;
	}
	#bookMark {
		display: none;
	}
	#heartBtn {
		display: block;
	}
	#removePadding {
		padding: 0;
		margin: 0;
	}
	button[id^="cmdReportBtn_"]{
		display:none !important;
	}
	
	
}
</style>
</html>