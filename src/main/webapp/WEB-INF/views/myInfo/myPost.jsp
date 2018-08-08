<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>마이페이지-나의게시물</title>
</head>

<!-- CSS -->
<style>
html, body {
	margin: 0 auto;
	font-family: 'Nanum Gothic', sans-serif;
}

.myActivity1 {
	border-radius: 30px;
	position: relative;
}

.myActivity2 a {
	width: 20%;
	margin: auto 0;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>
	<c:if test="${sessionScope.member!=null}">
		<!-- CONTENTS -->
		<div class="ui container">
			<div class="ui center aligned basic segment">
				<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
				<br>
				<c:if test="${!myPost.comList.isEmpty()}">
					<table class="ui gray table">
						<thead>
						<div class="ui red message" style="margin-top:-10px;font-size:10px; width:350px; float:right;">※ 댓글 신고 5번이상이 되면 활동제한(게시글,댓글작성금지)됩니다.</div>
							<tr id="title" align="center" class="warningT">
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<div class="ui checkbox">
										<input type="checkbox" name="allCheck" id="allCheck1">
										<label></label>
									</div>
								</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);"><i class="star icon"></i> 게 시 물 번 호</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);"><i class="clipboard outline icon"></i> 게 시 판</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);"><i class="clipboard outline icon"></i> 제 목</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);"><i class="clipboard outline icon"></i> 작 성 일</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${myPost.comList}" var="m">
								<tr align="center">
									<td style="width: 7%;">
										<div class="ui checkbox">
											<input type="checkbox" name="chk[]" value="${m.postIndex}"
												class="checkSelect"> <label></label>
										</div>
									</td>
									<td style="width: 13%;">${m.postIndex }</td>
									<td style="width: 18%;"><c:choose>
											<c:when test="${m.bcaIndex=='15'}">
												<label> <a href="recipeBoard.diet?type=15">자유게시판</a>
												</label>
											</c:when>
											<c:when test="${m.bcaIndex=='16' }">
												<label> <a href="recipeBoard.diet?type=16">레시피&#38;식단</a>
												</label>
											</c:when>
											<c:when test="${m.bcaIndex=='17' }">
												<label> <a href="recipeBoard.diet?type=16">팁&#38;노하우</a>
												</label>
											</c:when>
											<c:when test="${m.bcaIndex=='18' }">
												<label> <a href="recipeBoard.diet?type=16">고민&#38;질문</a>
												</label>
											</c:when>
											<c:when test="${m.bcaIndex=='19' }">
												<label> <a href="recipeBoard.diet?type=16">비포&#38;애프터</a>
												</label>
											</c:when>
										</c:choose></td>
									<td style="width: 40%;" ><a 
										href="/postedCommunity.diet?postIndex=${m.postIndex }">${m.postTitle }</a>
									</td>
									<td style="width: 20%;"><c:set var="TextValue"
													value="${m.postDateTime}" /> ${fn:substring(TextValue,0,11)}&nbsp;
												${fn:substring(TextValue,11,16)}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button class="ui red button" style="float: right;"
						onclick="deleteMyPost();">삭제하기</button>
					<br>
					<br>
					<div class="ui grid">
						<div class="three column row">
							<div class="column"></div>
							<div class="column">
								<div class="ui center aligned basic segment">
									<div class="ui pagination menu">${requestScope.myPost.pageNavi}</div>
								</div>
							</div>
							<div class="column"></div>
						</div>
						<br>
					</div>
				</c:if>
				<c:if test="${myPost.comList.isEmpty()}">
					<div class="ui small red message">
						<div class="ui small header">※ 현재 등록된 게시물이 없습니다 ~ ^^</div>
					</div>
				</c:if>

			</div>
		</div>
	</c:if>
	<!--  ui container 닫기  -->

	<br>
	<c:if test="${sessionScope.member==null}">
		<script>
			alert("로그인 후 이용해주세요~");
			location.href = "/";
		</script>
	</c:if>
	<input type="hidden" value="${member.mbId}" id="mbId" />
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	/* 나의 게시물 삭제하기 */
	function deleteMyPost() {
		var send_array = Array();
		var send_cnt = 0;
		var chkbox = $(".checkSelect");
		var result = confirm("작성한 게시물을 삭제하시겠습니까?");
		for (i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked == true) {
				send_array[send_cnt] = chkbox[i].value;
				send_cnt++;
			}
		}
		
		if(result){
			$.ajaxSettings.traditional = true;
			$.ajax({
				url : "/deleteMyPost.diet",
				type : 'POST',
				data : {
					'postIndex' : send_array
				},
				success : function(data) {
					if (data != 0) {
						alert("게시물을 삭제하였습니다. 감사합니다. ");
						for (i = 0; i < data.length; i++) {
							$(data[i]).parent().parent().parent().remove();
							location.reload();
						}
					} else {
						alert("게시물 삭제 실패하였습니다. 관리자에게 문의해주세요 ~");
					}
				},
				error : function() {
					alert("게시물 삭제 실패하였습니다. 관리자에게 문의해주세요 ~");
				}
			});

		}else{
			alert("게시물 삭제 실패하였습니다. 관리자에게 문의해주세요 ~");
			
		}
	
	}

	$(document).ready(function() {
		$(".warning").hide();
		$("#allCheck1").click(function() {
			if ($("#allCheck1").prop("checked")) {
				$("input[name='chk[]']").prop("checked", true);
			} else {
				$("input[name='chk[]']").prop("checked", false);
			}
		});
	});

	/* 헤더 클릭시 active */
	$(function() {
		var sBtn = $("#myActivity2");
		sBtn.find('a').click(function() {
			sBtn.find('a').removeClass("active");
			$(this).addClass("active");
		});
	});
	
	$(document).ready(function() {
		$(".warningT").mouseleave(function() {
			$(".warning").hide();
		});
		$(".warningT").mouseenter(function() {
			$(".warning").show();
		});

	});
</script>

</html>