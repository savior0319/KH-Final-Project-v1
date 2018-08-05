<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<script src="/resources/slider/responsiveslides.min.js"></script>
<title>다이어트</title>
</head>

<!-- CSS -->
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


	<input id="indexNo" type="hidden" value="${requestScope.ht.indexNo }">
	<input id="htType" type="hidden" value="${requestScope.ht.htType }">
	
	<!-- CONTENTS -->
    <div class="ui  container">
		<!-- 슬라이드-->
		<ul class="rslides">
			<li><img src="/resources/image/mainPic.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic1.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic2.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic3.jpg" style="height: 250px;"></li>
		</ul>
			
			<h1 class="ui left aligned header">홈트레이닝 >
				${requestScope.ht.htPart }</h1>
			<hr>
			<div class="homeTrainingTitle"
				style="font-size: 20px; margin-top: 5%; margin-bottom: 3%; text-align: left;">${requestScope.ht.htTitle }
			</div>
			<hr>
			<div style="text-align: left;">
				<i class="clock outline icon"></i>
				<fmt:formatDate value="${requestScope.ht.htEnrollDate}"
					pattern="yyyy-MM-dd HH:mm:ss" />
				&ensp;|&ensp; <i class="eye icon"></i> <span class="hits"
					style="color: red">${requestScope.ht.htHits }</span>&ensp;|&ensp; <i
					class="comment icon"></i> <span class="like" style="color: red">${requestScope.ht.htCommentNo }</span>
				<hr>
			</div>
			<br> <br>
			
			<!-- 유튜브 영상 들어가는곳 -->

			<div id="size1" class="homeTrainingVideo" style="text-align:center">
				<iframe width="760" height="455"
					src="${requestScope.ht.htVideo }" frameborder="0"
					allow="autoplay; encrypted-media" allowfullscreen></iframe>
			</div>
			
			<div id="size2" class="homeTrainingVideo" style="text-align:center">
				<iframe width="350px" height="300px"
					src="${requestScope.ht.htVideo }" frameborder="0"
					allow="autoplay; encrypted-media" allowfullscreen></iframe>
			</div>
			<br> <br>

			<h2 style="text-align:center" >프로그램 소개</h2>
			<br> <br>

			<div id="size1" class="programIntroduction" style="text-align:center">
				<i class="big clock outline icon"></i>&ensp;${requestScope.ht.htStepTime }&emsp;&emsp;&emsp;&emsp;&emsp;
				<i class="big child icon"></i>&ensp;${requestScope.ht.htStepType }&emsp;&emsp;&emsp;&emsp;&emsp;
				<i class="big male icon"></i>&ensp;${requestScope.ht.htStepHard }&emsp;&emsp;&emsp;&emsp;&emsp;
				<i class="big tint icon"></i>&ensp;${requestScope.ht.htStepKal }
			</div>
			
			<div id="size2" class="programIntroduction" align="center">
				<i class="big clock outline icon"></i>&ensp;${requestScope.ht.htStepTime }&emsp;&emsp;
				<i class="big child icon"></i>&ensp;&emsp;${requestScope.ht.htStepType }&emsp;&emsp;&emsp;&emsp;&emsp;
				<br><br>
				&emsp;<i class="big male icon"></i>&ensp;&emsp;${requestScope.ht.htStepHard }&emsp;&emsp;&emsp;&emsp;&emsp;
				<i class="big tint icon"></i>${requestScope.ht.htStepKal }&emsp;&emsp;&emsp;&emsp;
			</div>
			
			<hr style="border: 1px solid #D5D5D5;">
			<br>
			<!-- 프로그램 설명 부분 -->
			<div class="programExplain" style="text-align:center; font-family: 나눔고딕, NanumGothic, sans-serif; font-size: 12pt;">
				<pre id="size1">${requestScope.ht.htExplain }</pre>
				<p id="size2" style="text-indent:10px;">${requestScope.ht.htExplain }</p>
			</div>
			<br> <br> <br>

			<div style=text-align:center;>
				※ 소모 칼로리는 개인 또는 운동자세 등에 따라 차이가 있습니다<br> <br>

				<!-- 좋아요 버튼 부분 -->
				<div class="ui big basic button" tabindex="0" style="border-radius: 30px; text-align: center;" >
					<div id="heartBtn" style="height: 20px; width:100px;">
						<c:choose>
							<c:when test="${requestScope.ht.likeYN==0}">
								<i class="large heart outline icon" id="emptyHeart" style="color:red;"></i>
							</c:when>
							<c:when test="${requestScope.ht.likeYN==1}">
								<i class="large heart icon" id="heart" style="color:red;"></i>
							</c:when>
						</c:choose>
				
							
					<a class="ui basic left" id="postLike">${requestScope.ht.htLike}</a>
					</div>
			</div>
			<br> <br> <br> <br>
			<hr>
			
			
			
		<div id="size1">	
		
		<c:if test="${requestScope.list[0]!=null }">
			<div class="next" onclick="goInfo(${requestScope.list[0].indexNo})" style="height: 30px; width: 100%; margin: 2%; cursor: pointer;">
				<div class="next" style="height: 100%; width: 20%; float: left;">이전글
					&ensp;▲</div>
				<a class="nextTitle" style="height: 100%; width: 50%; float: left;">${requestScope.list[0].htTitle } </a> 
				<a class="nextHits"	style="height: 100%; width: 30%; float: left;">
				<fmt:formatDate value="${requestScope.list[0].htEnrollDate }" pattern="yyyy-MM-dd" />
					&ensp;| &ensp; 조회수 : ${requestScope.list[0].htHits }</a>
			</div>
		</c:if>
		<hr>
		<c:if test="${requestScope.list[1]!=null }">
			<div class="next" onclick="goInfo(${requestScope.list[1].indexNo})" style="height: 30px; width: 100%; margin: 2%; cursor: pointer;">
				<div class="next" style="height: 100%; width: 20%; float: left;">다음글
					&ensp;▼</div>
				<a class="nextTitle" style="height: 100%; width: 50%; float: left;">${requestScope.list[1].htTitle } </a> 
				<a class="nextHits"	style="height: 100%; width: 30%; float: left;">
				<fmt:formatDate value="${requestScope.list[1].htEnrollDate }" pattern="yyyy-MM-dd" />
					&ensp;| &ensp; 조회수 : ${requestScope.list[1].htHits }</a>
			</div>
		</c:if>
		</div>
		
		<div id="size2">	
		
		<c:if test="${requestScope.list[0]!=null }">
			<div class="next" onclick="goInfo(${requestScope.list[0].indexNo})" style="height: 30px; width: 100%; margin: 2%; cursor: pointer;">
				<div class="next" style="height: 100%; width: 20%; float: left;">이전글
					&ensp;▲</div>
				<a class="nextTitle" style="height: 100%; width: 50%; float: left;">${requestScope.list[0].htTitle } </a> 
				<a class="nextHits"	style="height: 100%; width: 30%; float: left;">
				<fmt:formatDate value="${requestScope.list[0].htEnrollDate }" pattern="yyyy-MM-dd" /></a>
			</div>
		</c:if>
		<hr>
		<c:if test="${requestScope.list[1]!=null }">
			<div class="next" onclick="goInfo(${requestScope.list[1].indexNo})" style="height: 30px; width: 100%; margin: 2%; cursor: pointer;">
				<div class="next" style="height: 100%; width: 20%; float: left;">다음글
					&ensp;▼</div>
				<a class="nextTitle" style="height: 100%; width: 50%; float: left;">${requestScope.list[1].htTitle } </a> 
				<a class="nextHits"	style="height: 100%; width: 30%; float: left;">
				<fmt:formatDate value="${requestScope.list[1].htEnrollDate }" pattern="yyyy-MM-dd" /></a>
			</div>
		</c:if>
		</div>
			
			<hr>
			<br>

		<div class="ui right aligned container">
				<button onclick="back(${requestScope.ht.htType })" class="ui secondary button">
					<i class="list icon"></i>목록
				</button>
			</div>
		</div>

			<div class="ui comments" style="max-width: 1220px;">
				<h3 class="ui dividing header" style="margin-top: 8px; text-align:left;">
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
				<c:if test="${requestScope.bcpd.bcList[0] !=null}">
					<!-- 작성된 댓글 리스트 -->
					<c:forEach items="${requestScope.bcpd.bcList }" var="bc">
						<input type="hidden" value="${bc.cmtLike}" id="cmtLike_${bc.cmtIndex }"/>
						<div class="comment">
							<a class="avatar"> <img src="${bc.mbImage }"
								style="width: 40px; height: 40px; border-radius: 25px;">
							</a>
							<div class="content" style="width: 93%;">
								<a class="author" style="position: absolute; width: 90px; text-align:center;">${bc.mbNickname}</a>
								<div class="metadata" style="width: 100%; text-align:left;">
									<span class="date"
										style="width: 30%; display: inline; margin-left: 100px;">
										<fmt:formatDate value="${bc.cmtDateTime }"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</span>
									
									<div id="modiDelete_${bc.cmtIndex}">
									
									<c:if test="${bc.mbNickname eq sessionScope.member.mbNickName}">
										<input type="hidden" value="${bc.cmtIndex}" name="cmdIndex"
											id="cmdIndex_${bc.cmtIndex}" /> <a class="modifyComment"
											style="cursor: pointer;" id="changeCmd_${bc.cmtIndex}">수정</a>
										&nbsp;&nbsp;|&nbsp;&nbsp; <a class="deleteComment"
											onclick="deleteComment(${bc.cmtIndex});"
											style="cursor: pointer;">삭제</a>
									</c:if>
									</div>
									<a class="cancleComment" id="cancleComment_${bc.cmtIndex}"
										onclick="cancleComment(${bc.cmtIndex});"
										style="cursor: pointer; display: none;"
										href="javascript:void(0)">취소</a>
										
									<c:if test="${sessionScope.member!=null}">
									<div class="ui right aligned container" align="right" style="width: 70%; float: right; margin-top:10px;">
										<button class="ui red basic tiny button" onclick="cmtLike(${bc.cmtIndex},${bc.mbIndex})" style="margin-right: 10px;">
											<i class="thumbs up outline icon"></i>
											좋아요 <label id="cmtLikeCount_${bc.cmtIndex}">${bc.cmtLike}</label>
										</button>
				        			  	<button class="ui black basic tiny button" id="cmdReportBtn_${bc.cmtIndex}" onclick="cmdBlame(${bc.cmtIndex});">
												<i class="ban icon"></i> 신고 <label id="cmtBlame_${bc.cmtIndex}">${bc.cmtBlame}</label>
										</button>
										<!-- 신고 수정 ☆-->
											<input type="hidden" value="${bc.mbIndex}" id="cmdWriter_${bc.cmtIndex}" />
									</div>
									</c:if>
								</div>
								<div class="text" style="text-align:left; margin-left: 3%;" id="cmd_${bc.cmtIndex}">
									<pre>${bc.cmtContent }</pre>
								</div>
							</div>
						</div>
						
						<!-- 수정 -->
						<form class="ui reply form" id="modifyContents_${bc.cmtIndex}"
							style="display: none;">
							<div class="field">
								<textarea id="modifyText_${bc.cmtIndex}" style="resize: none;"
									name="content">${bc.cmtContent}</textarea>
							</div>
							<div class="ui right aligned container" id="rightContainer">
								<div class="ui labeled submit icon button"
									style="background-color:#fa2828; color: white;"
									onclick="modifyComment(${bc.cmtIndex});">
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
		</div>
	

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	/* 댓글 쓰기 버튼 */
	function addComment() {
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
					// 모달 띄우기
					//$('.ui.basic.modal').modal('show');

					alert('댓글을 작성하였습니다.');
				} else {
					alert('댓글을 등록하지 못했습니다.');
				}

				location.href = "/homeTrainingInfo.diet?indexNo=" + indexNo;
			},
			error : function() {
				alert('댓글을 등록하지 못했습니다.');
			}
		});
	}

	function naviMove(currentPage, indexNo, servletName) {
		$.ajax({
			/* url : "/naviMove.diet?currentPage=" + currentPage + "&indexNo="
					+ indexNo + "&servletName=" + servletName, */
			url : '/naviMove.diet',
			type : 'post',
			data : {
				'currentPage' : currentPage,
				'indexNo' : indexNo,
				'servletName' : servletName
			},
			success : function(data) {
				$('#comment').html("");
				for (var i = 0; i < data.bcList.length; i++) {
					var commentDiv = $("<div>").attr("class", "comment");

					var aAvatar = $("<a>").attr("class", "avatar");

					var img = $("<img>").attr("style",
							"width: 40px; height: 40px; border-radius: 25px;");
					img.attr("src", data.bcList[i].mbImage);

					var contentDiv = $("<div>").attr("style", "width:93%;");
					contentDiv.attr("class", "content");

					var aAuthor = $("<a>").attr("class", "author");
					aAuthor.attr("style", "position: absolute; width: 90px; text-align:center;");
					aAuthor.html(data.bcList[i].mbNickname);

					var metadataDiv = $("<div>").attr("class", "metadata");
					metadataDiv.attr("style", "width:100%; text-align:left;");
				
					var span = $("<span>").attr("class", "date");
					span.attr("style","width: 30%; display: inline; margin-left: 100px;");
					var date = new Date(data.bcList[i].cmtDateTime);
					var dateFor = date.getFullYear() + "-"+
					doublePos((date.getMonth() + 1)) +"-"+doublePos(date.getDate()) + " " + doublePos(date.getHours())+":"+
					doublePos(date.getMinutes()) 
							+":"+ doublePos(date.getSeconds());
					span.html(dateFor);
					
					var modiDelete = $("<div>").attr("id","modiDelete_"+data.bcList[i].cmtIndex);
					
					
					var hiddenInput = $("<input>").attr("type","hidden");
					hiddenInput.attr("value",data.bcList[i].cmtIndex);
					hiddenInput.attr("id","cmdIndex_"+data.bcList[i].cmtIndex);
					
					
					var modifyA = $("<a>").attr("class","modifyComment");
					//modifyA.attr("onclick","changeCmd_data.bcList[i].cmtIndex();");
					modifyA.attr('id','changeCmd_'+data.bcList[i].cmtIndex+'()')
					modifyA.attr("style","cursor:pointer;");
					modifyA.append("수정");
					
					
					var deleteA = $("<a>").attr("class","deleteComment");
					deleteA.attr("onclick","deleteComment("+data.bcList[i].cmtIndex+")");
					deleteA.attr("style","cursor:pointer;");
					deleteA.append("삭제");
					
										
					var cancleA = $("<a>").attr("class","cancleComment");
					cancleA.attr("onclick","cancleComment("+data.bcList[i].cmtIndex+")");
					cancleA.attr("id","cancleComment_"+data.bcList[i].cmtIndex);
					cancleA.attr("style","cursor: pointer; display: none;");
					cancleA.attr("href","javascript:void(0);")
					cancleA.append("취소");
					
					
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
					blameBtn.attr("id","cmdReportBtn_" + data.bcList[i].cmtIndex);

					var blameI = $("<i>").attr("class", "ban icon");

					//<!-- 신고 수정 ☆-->
					//<input type="hidden" value="${bc.mbIndex}" id="cmdWriter_${bc.cmtIndex}" />
					var blameIndex = $("<input>").attr("type","hidden");
					blameIndex.attr("value",data.bcList[i].mbIndex);	
					blameIndex.attr("id","cmdWriter_"+data.bcList[i].cmtIndex);
					
					
					
					var textDiv = $("<div>").attr("class", "text");
					textDiv.attr("align", "left");
					textDiv.attr("style", "margin-left:3%;");

					var pre = $("<pre>").html(data.bcList[i].cmtContent);

					likeBtn.append(likeI);
					likeBtn.append("좋아요" + data.bcList[i].cmtLike);

					blameBtn.append(blameI);
					blameBtn.append("신고" + data.bcList[i].cmtBlame);
					//<!-- 신고 수정 ☆ : index 추가-->
					blameBtn.append(blameIndex);
					
					containerDiv.append(likeBtn);
					containerDiv.append(blameBtn);

					metadataDiv.append(span);
				
					metadataDiv.append(modiDelete);
					modiDelete.append(hiddenInput);
					modiDelete.append(modifyA);
					modiDelete.append('&nbsp;&nbsp;|&nbsp;&nbsp;');
					modiDelete.append(deleteA);
									
					metadataDiv.append(cancleA);
					metadataDiv.append(containerDiv);

					textDiv.append(pre);
					
					contentDiv.append(aAuthor);
					contentDiv.append(metadataDiv);
					contentDiv.append(textDiv);

					aAvatar.append(img);

					commentDiv.append(aAvatar);
					commentDiv.append(contentDiv);

					$('#comment').append(commentDiv);
					
					var modifyContents = $("<form>").attr("class","ui reply form");
					modifyContents.attr("id","modifyContents_"+data.bcList[i].cmtIndex);
					modifyContents.attr("style","display:none;");
					
					var modifyField = $("<div>").attr("class","field");
					
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
	
	function doublePos(num)
	{
		return num>9?num:"0"+num;
	}
	
	 var likeCheck;
	 
	 var likeYN = '${requestScope.ht.likeYN}';
	 var postLike = '${requestScope.ht.htLike}';
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
				var targetIndex = '${requestScope.ht.indexNo}';
				var targetType = 1;
				var targetMbIndex = '${requestScope.ht.htWriterNo}';

				$.ajax({
					url : '/homeTrainingLike.diet',
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
						alert('로그인을 해주세요.');
					}
				});
			});	
	
 
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
				location.href = "/homeTrainingInfo.diet?indexNo=" + indexNo;

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
				location.href = "/homeTrainingInfo.diet?indexNo=" + indexNo;

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
	
	// 목록 버튼
	function back(me2){
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
	
		location.href="/homeTrainingList.diet?type="+type;
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
	
		
	//댓글 신고 - 라디오 체크후 신고 버튼
	function sendCmdBlame(){
		//해당 댓글 번호 가져오기!☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆☆ 
		//alert(blameCmd);
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
		//alert(ci);
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
	
	
	// 이전글 다음글
	function goInfo(me){
		location.href="/homeTrainingInfo.diet?indexNo="+me;
	}
	
	//슬라이드
	$(function() {
		$(".rslides").responsiveSlides({
			auto : true,
			timeout : 1500,
		});
	});
	
</script>
<style type="text/css" media="screen">
/* 모바일용 아닌 사이즈 */
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
/* 모바일용 사이즈 */
@media ( max-width : 649px) {
	#size1 {
		display: none;
	}
	#size2 {
		display: block;
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