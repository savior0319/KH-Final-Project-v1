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
					<button class="ui red button" id="heartBtn" style="height: 40px;">
						<c:choose>
							<c:when test="${requestScope.ht.likeYN==0}">
								<i class="heart outline icon" id="emptyHeart"></i>
							</c:when>
							<c:when test="${requestScope.ht.likeYN==1}">
								<i class="heart icon" id="heart"></i>
							</c:when>
						</c:choose>
				</button>
							
					<a class="ui basic red left pointing label" id="postLike">${requestScope.ht.htLike}</a>
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
				<h3 class="ui dividing header" style="margin-top: 8px">
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
								<div class="text" style="text-align:left; margin-left: 3%;">
									<pre>${bc.cmtContent }</pre>
								</div>
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
					textDiv.attr("style", "margin-left:3%;");

					var pre = $("<pre>").html(data.bcList[i].cmtContent);

					likeBtn.append(likeI);
					likeBtn.append("공감" + data.bcList[i].cmtLike);

					blameBtn.append(blameI);
					blameBtn.append("신고" + data.bcList[i].cmtBlame);

					containerDiv.append(likeBtn);
					containerDiv.append(blameBtn);

					metadataDiv.append(span);
					metadataDiv.append(containerDiv);

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
				var targetIndex = '${requestScope.ht.likeIndex}';
				var targetType = 1;
				var targetMbIndex = '${requestScope.ht.mbIndex}';

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
	
 
	
</script>

</html>