<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>레시피&#38;식단</title>
</head>

<!-- CSS -->
<style>
.ui.card {
	width: 400px;
}
</style>

<script>
if (self.name != 'reload') {
    self.name = 'reload';
    self.location.reload(true);
}
else self.name = '';
</script>

<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<div class="ui center aligned container">

		<div class="ui panorama test ad" data-text="광고광고광고"></div>

		<br>
		<br>
		<div class="ui left aligned container">
			<h1>&emsp;&nbsp;&nbsp;레시피&#38;식단</h1>
		</div>
		<hr style="border: 2px solid #D5D5D5;">
		<br>
		<!-- 최신순, 조회순 -->
		<br>
		<div class="ui right aligned basic segment" style="margin: 0px; padding: 0px;">
			<div class="small ui basic buttons">
				<div class="ui button" style="padding-top: 7px; padding-bottom: 7px; padding-right: 10px; padding-left: 10px;" onclick="recentlyViewBtn(this);">최신순</div>
				<div class="ui button" style="padding-top: 7px; padding-bottom: 7px; padding-right: 10px; padding-left: 10px;" onclick="recentlyViewBtn(this);">조회순</div>
			</div>
		</div>
		<br>
		<!-- 글목록 -->


		<div class="ui center aligned basic segment" style="margin-top: 0px; padding: 0px;">

			<div class="ui three column grid" align="center">
				<c:forEach items="${requestScope.cpdv.comList}" var="c">
					<div class="column">
						<div class="ui card" onclick="recipeLink(${c.postIndex});" style="cursor: pointer;">
							<div class="image">
								<img src="${c.postImage}" style="height: 200px;" onerror='this.src="/resources/image/logo.png"'>
							</div>
							<div class="content">
								<a class="header">
									<c:choose>
										<c:when test="${fn:length(c.postTitle)>20}">
											<c:out value="${fn:substring(c.postTitle,0,19)}" />...
								</c:when>
										<c:otherwise>
									${c.postTitle}
								</c:otherwise>
									</c:choose>
								</a>
								<div class="meta">
									<span class="date">${c.postDateTime}</span>
								</div>
								<div class="description">
									<i class="eye icon"></i>
									조회&nbsp;&nbsp;
									<b>${c.postHit}</b>
									&emsp;|| &emsp;
									<i class="heart outline icon" id="emptyHeart"></i>
									좋아요&nbsp;&nbsp;
									<b>${c.postLike}</b>
								</div>
							</div>
							<div class="extra content">
								<a>
									<!-- 프로필 & 이미지 -->
									<img class="ui avatar image" src="${c.mbImage}" onerror='this.src="/resources/image/avatar.png"'>
									${c.postNickname}
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<br>
			<br>
			<br>
		</div>


		<br>
		<br>


		<!-- 네비게이션 + 등록 -->
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
					<c:if test ="${sessionScope.member!=null}">
						<button class="ui right red basic button" style="margin-top: 19px;" id="writeBtn">
							<i class="edit icon"></i>
							등록
						</button>
						</c:if>
					</div>
				</div>
			</div>
			<br>
		</div>
		<br>
		<!-- 검색 +  dropdown : 제목, 내용, 작성자 -->
				<div class="ui secondary segment">
			<div class="ui left action right icon input">
				<div class="ui basic floating dropdown button">
					<div class="text">선택</div>
					<i class="dropdown icon"></i>
					<div class="menu">
						<div class="item">제목</div>
						<div class="item">내용</div>
						<div class="item">작성자</div>
					</div>
				</div>

				<input type="text" placeholder="Search...">
				<i class="circular search link icon"></i>

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

	
	/* 글 등록 페이지로 이동 */
	$('#writeBtn').click(function() {
		location.href = "/registCommunity.diet";
	});
	
	
	/* 카드 클릭시 각 페이지로 이동 */
	function recipeLink(pi){
		 location.href="/postedCommunity.diet?postIndex="+pi;
	 }
	

	/* 최신순 & 조회순 클릭 */
	var type = ${requestScope.cpdv.type};
	function recentlyViewBtn(rtb){
		var postSort = rtb.innerHTML;
		
		location.href = "/recipeView.diet?type=16&postSort="+postSort;

	}
	
	
</script>

</html>