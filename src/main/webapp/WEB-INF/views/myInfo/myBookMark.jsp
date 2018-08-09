<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>마이페이지-북마크</title>
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
	<c:if test="${sessionScope.member!=null}">
		<!-- CONTENTS -->
		<div class="ui container">
			<div class="ui center aligned basic segment">
				<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
				<br>
				<c:if test="${!myBookMark.comList.isEmpty()}">
					<table class="ui gray table">
						<thead>
							<tr id="title" align="center">
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<div class="ui checkbox">
										<input type="checkbox" name="allCheck" id="allCheck1" />
										<label></label>
									</div>
								</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="bookmark outline icon"></i>
									게 시 판
								</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="bookmark outline icon"></i>
									제 목
								</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="bookmark outline icon"></i>
									작 성 자
								</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="bookmark outline icon"></i>
									조 회 수
								</th>
								<th style="background-color: rgba(255, 185, 185, 0.5);">
									<i class="heart icon"></i>
									좋 아 요
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${myBookMark.comList}" var="m">
								<tr align="center">
									<td style="width: 7%;">
										<div class="ui checkbox">
											<input type="checkbox" name="chk[]" value="${m.bmkIndex}" class="checkSelect" />
											<label></label>
										</div>
									</td>
									<td style="width: 20%;">
										<c:choose>
											<c:when test="${m.dtType=='1'}">
												<label>
													<a href="dietTipList.diet?type=column">칼럼</a>
												</label>
											</c:when>
											<c:when test="${m.dtType=='2' }">
												<label>
													<a href="dietTipList.diet?type=sport">운동</a>
												</label>
											</c:when>
											<c:when test="${m.dtType=='3' }">
												<label>
													<a href="dietTipList.diet?type=dietFood">식단</a>
												</label>
											</c:when>
											<c:when test="${m.dtType=='4' }">
												<label>
													<a href="dietTipList.diet?type=successLatter">성공</a>
												</label>
											</c:when>
											<c:when test="${m.bcaIndex=='15'}">
												<label> <a href="communityWholeBoard.diet?type=15">자유게시판</a>
												</label>
											</c:when>
											<c:when test="${m.bcaIndex=='16' }">
												<label> <a href="recipeBoard.diet?type=16">레시피&#38;식단</a>
												</label>
											</c:when>
											<c:when test="${m.bcaIndex=='17' }">
												<label> <a href="communityWholeBoard.diet?type=17">팁&#38;노하우</a>
												</label>
											</c:when>
											<c:when test="${m.bcaIndex=='18' }">
												<label> <a href="communityWholeBoard.diet?type=18">고민&#38;질문</a>
												</label>
											</c:when>
											<c:when test="${m.bcaIndex=='19' }">
												<label> <a href="communityWholeBoard.diet?type=19">비포&#38;애프터</a>
												</label>
											</c:when>
										</c:choose>
									</td>
									<td style="width: 40%;">
										<c:if test="${m.dtIndex==''}">
											<a href="/postedCommunity.diet?postIndex=${m.postIndex}">${m.postTitle}</a>
										</c:if>
										<c:if test="${m.dtIndex!=''}">
											<a href="/dietTipInfo.diet?indexNo=${m.dtIndex}">${m.dtTitle}</a>
										</c:if>
									</td>
									<td>${m.mbId}</td>
									
									
									<td style="width: 10%;">
										<c:if test="${m.dtSee==0}">
											<c:set var="index" value="${m.postHit}" />
											<c:if test="${index>99999}">
												99999+&nbsp;번
											</c:if>
											<c:if test="${index<=99998}">${m.postHit}&nbsp;번
											</c:if>
										</c:if>
										<c:if test="${m.dtSee!=0}">
											<c:set var="index1" value="${m.dtSee}" />
											<c:if test="${index1>99999}">
												99999<span style="color: red;">+</span>
											</c:if>
											<c:if test="${index1<=99998}">${m.dtSee}번
											</c:if>
										</c:if>
									</td>
									
									
									<td style="width: 10%;">
										<c:if test="${m.dtLike==0}">
											<c:set var="index2" value="${m.postLike}" />
											<c:if test="${index2>99998}">
												99999+&nbsp;번
											</c:if>
											<c:if test="${index2<=99998}">${m.postLike}&nbsp;번
											</c:if>
										</c:if>
										<c:if test="${m.dtLike!=0}">
											<c:set var="index3" value="${m.dtLike}" />
											<c:if test="${index3>99999}">
												99999<span style="color: red;">+</span>
											</c:if>
											<c:if test="${index3<=99998}">${m.dtLike}번
											</c:if>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button class="ui red button" style="float: right;" onclick="deleteMyBookMark();">삭제하기</button>
					<br>
					<br>

					<div class="ui grid">
						<div class="three column row">
							<div class="column"></div>
							<div class="column">
								<div class="ui center aligned basic segment">
									<div class="ui pagination menu">${requestScope.myBookMark.pageNavi }</div>
								</div>
							</div>
							<div class="column">
								<div class="ui right aligned container"></div>
							</div>
						</div>
						<br>
					</div>
				</c:if>
				<c:if test="${myBookMark.comList.isEmpty()}">
					<div class="ui small red message">
						<div class="ui small header">※북마크가 없습니다~ ^^</div>
					</div>
				</c:if>
				<br>
			</div>
		</div>
	</c:if>
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

	function deleteMyBookMark() {

		var send_array = Array();
		var send_cnt = 0;
		var chkbox = $(".checkSelect");
		var result = confirm("북마크 게시물을 삭제하시겠습니까?");
		if (result == true) {
			for (i = 0; i < chkbox.length; i++) {
				if (chkbox[i].checked == true) {
					send_array[send_cnt] = chkbox[i].value;
					send_cnt++;
				}
			}
			$.ajaxSettings.traditional = true;
			$.ajax({
				url : "/deleteMyBookMark.diet",
				type : 'POST',
				data : {
					'bmkIndex' : send_array
				},
				success : function(data) {
					if (data != 0) {
						alert("북마크 게시물을 삭제하였습니다.");
						for (i = 0; i < data.length; i++) {

							$(data[i]).parent().parent().parent().remove();
							location.reload();

						}

					} else {
						alert("북마크 삭제 실패하였습니다. 관리자에게 문의해주세요 ~");
					}
				},
				error : function() {
					alert("북마크 실패하였습니다. 관리자에게 문의해주세요 ~");
				}
			});

		} else {
			alert("북마크 게시물 삭제 취소하셨습니다.");
		}

	}

	$(function() {
		var sBtn = $("#myActivity2");
		sBtn.find('a').click(function() {
			sBtn.find('a').removeClass("active");
			$(this).addClass("active");
		});
	});
</script>

</html>