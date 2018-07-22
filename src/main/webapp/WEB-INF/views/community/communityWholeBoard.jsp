<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>성공후기</title>
</head>

<!-- CSS -->
<style>
.ui.card {
	width: 400px;
}
</style>



<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<div class="ui center aligned container">
		<div class="ui panorama test ad" data-text="Panorama" align="center"></div>
		<br>
		<br>
		<div class="ui left aligned container">
			<c:choose>
				<c:when test="${requestScope.cpdv.type.equals('comAll') }"><h1>전체</h1></c:when>
				<c:when test="${requestScope.cpdv.type.equals('15') }"><h1>자유게시판</h1></c:when>
				<c:when test="${requestScope.cpdv.type.equals('16') }"><h1>레시피&#38;식단</h1></c:when>
				<c:when test="${requestScope.cpdv.type.equals('17') }"><h1>팁&#38;노하우</h1></c:when>
				<c:when test="${requestScope.cpdv.type.equals('18') }"><h1>고민&#38;질문</h1></c:when>
				<c:when test="${requestScope.cpdv.type.equals('19') }"><h1>비포&#38;애프터</h1></c:when>
			</c:choose>

		</div>
		<hr style="border: 2px solid #D5D5D5;">
		<br>
		<!-- CONTENTS -->

		<!-- 최신순, 조회순 -->
		<br>
		<div class="ui right aligned basic segment" style="margin: 0px; padding: 0px;">
			<div class="small ui basic buttons">
				<div class="ui button" style="padding-top: 7px; padding-bottom: 7px; padding-right: 10px; padding-left: 10px;" onclick="recentlyviewBtn(this);">최신순</div>
				<div class="ui button" style="padding-top: 7px; padding-bottom: 7px; padding-right: 10px; padding-left: 10px;" onclick="recentlyviewBtn(this);">조회순</div>
			</div>
		</div>
		<br>
		<!-- 글목록 -->
		<div class="ui center aligned basic segment" style="margin-top: 0px; padding: 0px;">

			<table class="ui very compact table">
				<thead>
					<tr align="center">
						<th style="width: 15%;">게시판</th>
						<th style="width: 50%;">제목</th>
						<th style="width: 15%;">작성자</th>
						<th style="width: 10%;">조회수</th>
						<th style="width: 10%;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.cpdv.comList}" var="c">
						<tr align="center">
							<td>${c.bcaName}</td>
							<td style="padding-top: 15px; padding-bottom: 15px;" >
								<a class="item" href="/postedCommunity.diet?postIndex=${c.postIndex}">
								<c:choose>
								<c:when test="${fn:length(c.postTitle)>30}">
									<c:out value="${fn:substring(c.postTitle,0,29)}" />...
								</c:when>
								<c:otherwise>
									${c.postTitle}
								</c:otherwise>
								</c:choose>
								</a>
							</td>
							<td>
								<img class="ui avatar image" src="${c.mbImage}" onerror='this.src="/resources/image/avatar.png"' >
								${c.postNickname}
							</td>
							<td>${c.postHit}</td>
							<td>${c.postDateTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<br>



		<div class="ui grid">
			<div class="three column row">
				<div class="column"></div>
				<div class="column">
					<div class="ui center aligned basic segment">
						<div class="ui pagination menu">${requestScope.cpdv.pageNavi }</div>
					</div>
				</div>
				<div class="column">
					<div class="ui right aligned container">
						<button class="ui right red basic button" style="margin-top: 19px;" id="writeBtn">
							<i class="edit icon"></i>
							등록
						</button>
					</div>
				</div>
			</div>
			<br>
		</div>
		<!-- 검색 +  dropdown : 제목, 내용, 작성자 -->
		<br>
		<div class="ui secondary segment">
			<div class="ui right action left icon input">
				<i class="search icon"></i>
				<input type="text" placeholder="Search">
				<div class="ui basic floating dropdown button">
					<div class="text">선택</div>
					<i class="dropdown icon"></i>
					<div class="menu">
						<div class="item">제목</div>
						<div class="item">내용</div>
						<div class="item">작성자</div>
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
	$('.ui.dropdown').dropdown({
		allowAdditions : true,
		allowCategorySelection : true
	});

	$('#writeBtn').click(function() {
		location.href = "/registCommunity.diet";
	});
	
	/* 클릭시 각 페이지로 이동 */
	function recipeLink(pi){
		location.href="/postedCommunity.diet?postIndex="+pi;
	 }
	
	
	
	var type = ${requestScope.cpdv.type};
	function recentlyviewBtn(rtb){
		var postSort = rtb.innerHTML;
		$.ajax({
			url : '/communityViewBoard.diet',
			type : 'post',
			data : {
				'type' : '${requestScope.cpdv.type}',
				'postSort' : postSort
			},
			success : function() {
				alert('최신순 성공!');
				location.href = "/communityWholeBoard.diet?type="+ ${requestScope.cpdv.type}+"&postSort="+postSort;

			},
			error : function() {
				alert('최신순 실패!');
			}
		});
	}
	
	
	/* 최신순 */
/* 	function recentlyBtn(){
		
		$.ajax({
			url : '/communityRecentlyBoard.diet',
			type : 'post',
			data : {
				'type' : '${requestScope.cpdv.type}'
			},
			success : function() {
				alert('최신순 성공!');
				location.href = "/communityWholeBoard.diet?type="+ ${requestScope.cpdv.type};

			},
			error : function() {
				alert('최신순 실패!');
			}
		});
	} */
	
	/* 조회순 */
/* 	function viewBtn(){
		
		$.ajax({
			url : '/communityViewBoard.diet',
			type : 'post',
			data : {
				'type' : '${requestScope.cpdv.type}'
			},
			success : function() {
				//alert('조회순 성공!');
				location.href = "/communityWholeBoard.diet?type="+ ${requestScope.cpdv.type};

			},
			error : function() {
				alert('조회순 실패!');
			}
		});
	} */
	
</script>

</html>