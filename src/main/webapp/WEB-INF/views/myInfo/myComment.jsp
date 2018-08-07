<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>마이페이지-댓글</title>
</head>

<!-- CSS -->
<style>
html, body {
	margin: 0 auto;
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
	<!-- CONTENTS -->
	<c:if test="${sessionScope.member!=null}">
		<div class="ui container">
			<div class="ui center aligned basic segment">
				<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
				<br>
				<c:if test="${!myComment.comList.isEmpty()}">
					<table class="ui gray table">
						<thead>
							<tr id="title" align="center">
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<div class="ui checkbox">
										<input type="checkbox" name="allCheck" id="allCheck1">
										<label></label>
									</div>
								</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="star icon"></i>
									게 시 물 제 목
								</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="comment outline icon"></i>
									댓 글 내 용
								</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="comment outline icon"></i>
									작 성 일
								</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="heart icon"></i>
									댓 글 좋 아 요
								</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="heart icon"></i>
									댓 글 신 고
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${myComment.comList}" var="m">
								<tr align="center">
									<td style="width: 7%;">
										<div class="ui checkbox">
											<input type="checkbox" name="chk[]" value="${m.cmtIndex}" class="checkSelect">
											<label></label>
										</div>
									</td>
									<td style="width: 21%;">
										<c:set var="postTitle" value="${m.postTitle}" />
										<c:if test="${m.dtTitle==null&&m.htTitle==null}">
											<a href="/postedCommunity.diet?postIndex=${m.postIndex}">${fn:substring(postTitle,0,18)}..</a>
										</c:if>
										<c:set var="htTitle" value="${m.htTitle}" />
										<c:if test="${m.dtTitle==null&&m.postTitle==null}">
											<a href="/homeTrainingInfo.diet?indexNo=${m.indexNo}">${fn:substring(htTitle,0,18)}..</a>
										</c:if>
										<c:set var="dtTitle" value="${m.dtTitle}" />
										<c:if test="${m.postTitle==null&&m.htTitle==null}">
											<a href="/dietTipInfo.diet?indexNo=${m.dtIndex}">${fn:substring(dtTitle,0,18)}..</a>
										</c:if>
									</td>
									<td style="width: 25%;">
										<c:set var="cmtContent" value="${m.cmtContent}" />
										${fn:substring(cmtContent,0,18)}..
									</td>
									<td style="width: 17%;">
										<c:set var="TextValue" value="${m.cmtDateTime}" />
										${fn:substring(TextValue,0,11)}일 ${fn:substring(TextValue,11,16)}분
									</td>
									<td style="width: 13%;">${m.cmtLike}&nbsp;개</td>
									<td style="width: 13%;">${m.cmtBlame}&nbsp;개</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
						<div class="ui red message">※ 댓글 신고 5번이 되면 강제 탈퇴 처리됩니다.</div>
					<button class="ui red button" style="float: right;" onclick="deleteMyComment();">삭제하기</button>
					<br>
					<div class="ui grid">
						<div class="three column row">
							<div class="column"></div>
							<div class="column">
								<div class="ui center aligned basic segment">
									<div class="ui pagination menu">${myComment.pageNavi}</div>
								</div>
							</div>
							<div class="column">
								<div class="ui right aligned container"></div>
							</div>

						</div>
						<br>

					</div>
				</c:if>
				<c:if test="${myComment.comList.isEmpty()}">
					<div class="ui small red message">
						<div class="ui small header">※등록된 댓글이 없습니다 ~ ^^</div>
					</div>
				</c:if>
			</div>
			<!--  ui container 닫기  -->
		</div>
	</c:if>
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
	$(document).ready(function() {
		$("#allCheck1").click(function() {
			if ($("#allCheck1").prop("checked")) {
				$("input[name='chk[]']").prop("checked", true);
			} else {
				$("input[name='chk[]']").prop("checked", false);
			}
		});
	});

	function deleteMyComment() {

		var send_array = Array();
		var send_cnt = 0;
		var chkbox = $(".checkSelect");
		var result = confirm("북마크 게시물을 삭제하시겠습니까?");

		for (i = 0; i < chkbox.length; i++) {
			if (chkbox[i].checked == true) {
				send_array[send_cnt] = chkbox[i].value;
				send_cnt++;
			}
		}

		if (result) {
			$.ajaxSettings.traditional = true;
			$.ajax({
				url : "/deleteMyComment.diet",
				type : 'POST',
				data : {
					'cmtIndex' : send_array
				},
				success : function(data) {
					if (data != 0) {
						alert("댓글을 삭제하였습니다. 감사합니다.")
						for (i = 0; i < data.length; i++) {
							$(data[i]).parent().parent().parent().remove();
							location.reload();
						}
					} else {
						alert("댓글 삭제 실패하였습니다. 관리자에게 문의해주세요 ~");
					}
				},
				error : function() {
					alert("댓글 삭제 실패하였습니다. 관리자에게 문의해주세요 ~");
				}
			});
		} else {
			alert("댓글 삭제 실패하였습니다. 관리자에게 문의해주세요 ~");
		}

	}

	$(function() {
		var sBtn = $("#myActivity2");
		sBtn.find('a').click(function() {
			sBtn.find('a').removeClass("active");
			$(this).addClass("active");
		});
	});
	;
</script>

</html>