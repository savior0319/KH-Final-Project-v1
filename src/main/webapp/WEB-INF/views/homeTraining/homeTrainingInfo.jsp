<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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


	<input id="indexNo" type="hidden" value="${requestScope.ht.indexNo }">
	
	<!-- CONTENTS -->
	

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
				<fmt:formatDate value="${requestScope.ht.htEnrollDate}"
					pattern="yyyy-MM-dd HH:mm:ss" />
				&ensp;|&ensp; <i class="eye icon"></i> <span class="hits"
					style="color: red">${requestScope.ht.htHits }</span>&ensp;|&ensp; <i
					class="comment icon"></i> <span class="like" style="color: red">${requestScope.ht.htCommentNo }</span>
				<hr>
			</div>
			<br> <br>
			
			<!-- 유튜브 영상 들어가는곳 -->

			<div class="homeTrainingVideo" style="text-align:center">
				<iframe width="760" height="455"
					src="${requestScope.ht.htVideo }" frameborder="0"
					allow="autoplay; encrypted-media" allowfullscreen></iframe>
			</div>
			<br> <br>

			<h2 style="text-align:center">프로그램 소개</h2>
			<br> <br>

			<div class="programIntroduction" style="text-align:center">
				<i class="big clock outline icon"></i>&ensp;${requestScope.ht.htStepTime }&emsp;&emsp;&emsp;&emsp;&emsp;
				<i class="big child icon"></i>&ensp;${requestScope.ht.htStepType }&emsp;&emsp;&emsp;&emsp;&emsp;
				<i class="big male icon"></i>&ensp;${requestScope.ht.htStepHard }&emsp;&emsp;&emsp;&emsp;&emsp;
				<i class="big tint icon"></i>&ensp;${requestScope.ht.htStepKal }
			</div>
			<hr>

			<!-- 프로그램 설명 부분 -->
			<div class="programExplain" style=text-align:center;>
				<pre>${requestScope.ht.htExplain }</pre>
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
			
			
			<!-- <div class="prev" style="height: 30px; width: 100%; margin: 2%;">
				<div class="prev" style="height: 100%; width: 20%; float: left;">이전글
					&ensp;▲</div>
				<a class="prevTitle" style="height: 100%; width: 50%; float: left;"
					href="#">10분 안에 지방 태우기</a> <a class="prevHits"
					style="height: 100%; width: 30%; float: left;" href="#">2018.07.18
					&ensp;| &ensp; 조회수 : 525</a>
			</div> -->
			
				
			<c:choose>
				<c:when test="${fn:length(list) == 2 and list.index == list[0].index}">
			<div class="prev" style="height: 30px; width: 100%; margin: 2%;">
				<span>이전</span>이전글이 없습니다.
			</div>
			<hr>
			<div class="next" style="height: 30px; width: 100%; margin: 2%;">
				<div class="next" style="height: 100%; width: 20%; float: left;">다음글
					&ensp;▼</div>
				<a class="nextTitle" style="height: 100%; width: 50%; float: left;"
					href="/homeTrainingInfo.diet?index=${list[1].index }">${list[1].htTitle }</a> <a class="nextHits"
					style="height: 100%; width: 30%; float: left;" href="#">2018.07.18
					&ensp;| &ensp; 조회수 : 525</a>
			</div>
			</c:when>
			
			</c:choose>
			<hr>
			<br>

			<div class="listButton" style="text-align: right;">
				<button class="ui secondary button">
					<i class="list icon"></i>목록
				</button>
			</div>


			<div class="ui comments" style="max-width: 1220px;">
				<h3 class="ui dividing header" style="margin-top: 8px; text-align:left;">
					<i class="chevron red circle right icon"> </i>댓글 쓰기
				</h3>


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
				<br> <br>

				<div id="comment">
					<!-- 작성된 댓글 리스트 -->
					<c:forEach items="${requestScope.bcpd.bcList }" var="bc">

						<div class="comment">
							<a class="avatar"> <img src="${bc.mbImage }"
								style="width: 40px; height: 40px; border-radius: 25px;">
							</a>
							<div class="content" style="width: 93%;">
								<a class="author" style="position: absolute; width: 10%; text-align:center;">${bc.mbNickname}</a>
								<div class="metadata" style="width: 100%;">
									<span class="date"
										style="width: 30%; display: inline; margin-left: 10%;">
										<fmt:formatDate value="${bc.cmtDateTime }"
											pattern="yyyy-MM-dd HH:mm:ss" />
									</span>
									
									<div id="modiDelete_${bc.cmtIndex}">
										<input type="hidden" value="${bc.cmtIndex}" name="cmdIndex"
											id="cmdIndex_${bc.cmtIndex}" /> <a class="modifyComment"
											style="cursor: pointer;" id="changeCmd_${bc.cmtIndex}">수정</a>
										&nbsp;&nbsp;|&nbsp;&nbsp; <a class="deleteComment"
											onclick="deleteComment(${bc.cmtIndex});"
											style="cursor: pointer;">삭제</a>
									</div>
									<a class="cancleComment" id="cancleComment_${bc.cmtIndex}"
										onclick="cancleComment(${bc.cmtIndex});"
										style="cursor: pointer; display: none;"
										href="javascript:void(0)">취소</a>
										
									<div class="ui right aligned container" align="right"
										style="width: 70%; float: right;">
										<button class="ui red basic tiny button"
											style="margin-right: 10px;">
											<i class="thumbs up outline icon"></i>공감${bc.cmtLike }
										</button>
										<button class="ui black basic tiny button">
											<i class="ban icon"></i>신고${bc.cmtBlame }
										</button>
									</div>
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
									style="background-color: #fa2828; color: white;"
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
					aAuthor.attr("style", "position: absolute; width: 10%; text-align:center;");
					aAuthor.html(data.bcList[i].mbNickname);

					var metadataDiv = $("<div>").attr("class", "metadata");
					metadataDiv.attr("style", "width:100%;");

					var span = $("<span>").attr("class", "date");
					span.attr("style","width: 30%; display: inline; margin-left: 10%;");
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
					textDiv.attr("align", "left");
					textDiv.attr("style", "margin-left:3%;");

					var pre = $("<pre>").html(data.bcList[i].cmtContent);

					likeBtn.append(likeI);
					likeBtn.append("공감" + data.bcList[i].cmtLike);

					blameBtn.append(blameI);
					blameBtn.append("신고" + data.bcList[i].cmtBlame);

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
						alert('실패');
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
	
</script>

</html>