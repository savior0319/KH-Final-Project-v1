<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>커뮤니티</title>
<script src="/resources/slider/responsiveslides.min.js"></script>
</head>

<!-- CSS -->
<style>
.ui.card {
	width: 400px;
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
	<input type="hidden" id="boardTime" value="${requestScope.cpdv.type}">
	<input type="hidden" id="category" value="${requestScope.cpdv.category}">
	<input type="hidden" id="searchT" value="${requestScope.cpdv.searchText}">

	<div class="ui center aligned container">
		<!-- 슬라이드-->
		<ul class="rslides" style="padding-bottom: 15px;">
			<li>
				<img src="#" id="image1" style="height: 300px;">
			</li>
			<li>
				<img src="#" id="image2" style="height: 300px;">
			</li>
			<li>
				<img src="#" id="image3" style="height: 300px;">
			</li>
			<li>
				<img src="#" id="image4" style="height: 300px;">
			</li>
			<li>
				<img src="/resources/image/advertise.png" style="height: 300px;">
			</li>
		</ul>
		<br>
		<br>
		<div class="ui left aligned container">
			<h1>레시피&#38;식단</h1>
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


		<div id="size1" class="ui center aligned basic segment" style="margin-top: 0px; padding: 0px;">

			<div class="ui three column grid" align="center">
				<c:forEach items="${requestScope.cpdv.comList}" var="c">
					<div class="column">
						<div class="ui card" onclick="recipeLink(${c.postIndex});" style="cursor: pointer;">
							<div class="image">
								<img src="${c.postImage}" style="height: 200px;" onerror='this.src="/resources/image/300x400.png"'>
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
									<span class="date">
										<fmt:formatDate value="${c.postDateTime}" pattern="yyyy-MM-dd HH:mm" />
									</span>
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

		<div id="size2" class="ui center aligned basic segment">
			<div align="center">
				<c:forEach items="${requestScope.cpdv.comList}" var="c">
					<div class="ui card" onclick="recipeLink(${c.postIndex});" style="cursor: pointer;">
						<div class="image">
							<img src="${c.postImage}" style="height: 200px;" onerror='this.src="/resources/image/300x400.png"'>
						</div>
						<div class="content">
							<a class="header">
								<c:choose>
									<c:when test="${fn:length(c.postTitle)>15}">
										<c:out value="${fn:substring(c.postTitle,0,14)}" />...
								</c:when>
									<c:otherwise>
									${c.postTitle}
								</c:otherwise>
								</c:choose>
							</a>
							<div class="meta">
								<span class="date">
									<fmt:formatDate value="${c.postDateTime}" pattern="yyyy-MM-dd HH:mm" />
								</span>
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
				</c:forEach>
			</div>
		</div>

		<!-- 네비게이션 + 등록 -->
		<div id="size1" class="ui grid">
			<div class="three column row">
				<div class="column"></div>
				<div class="column">
					<c:if test="${requestScope.cpdv.comList[0] !=null}">
						<div class="ui center aligned basic segment">
							<div class="ui pagination menu">${requestScope.cpdv.pageNavi }</div>
						</div>
					</c:if>
				</div>
				<div class="column">
					<div class="ui right aligned container">
						<c:if test="${sessionScope.member!=null}">
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

		<div id="size2" class="ui center aligned grid">

			<c:if test="${requestScope.cpdv.comList[0]!=null }">
				<div class="ui center aligned basic segment" style="margin: 0; padding: 0;">
					<div class="ui pagination menu" align="center">${requestScope.cpdv.pageNavi }</div>
				</div>
			</c:if>
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
						<div class="item">제목+내용</div>
						<div class="item">작성자</div>
					</div>
				</div>

				<input type="text" placeholder="Search..." id="searchText" onkeypress="runScript(event)">
				<i class="circular search link icon" onclick="searchBtn()"></i>

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
      },
      error : function(){
         console.log('[ERROR] - 이미지 불러오기 오류');
      }
   });
});


	$('.ui.dropdown').dropdown({
		allowAdditions : true,
		allowCategorySelection : true
	});

	
	/* 글 등록 페이지로 이동 */
		$('#writeBtn').click(function() {
		var mbId = '${sessionScope.member.mbId}';
		$.ajax({
			url : '/checkReport.diet',
			type : 'post',
			data : {
				'mbId' : mbId
			},
			success : function(data) {
				if (data == 'n') {
					location.href = "/registCommunity.diet";
				} else {
					alert('\n글쓰기 정지당한 회원입니다. \n\n관리자에게 문의하세요.')
				}
			}
		});

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
	
	
	// 카테고리 선택
	var category = '';
	$('.menu > .item').click(function() {
		switch ($(this).text()) {
		case '제목':
			category = 'title';
			break;
		case '제목+내용':
			category = 'titleContents';
			break;
		case '작성자':
			category = 'writer';
			break;
		}
	});
	
	/* 검색  - 엔터*/
	function runScript(e) {
		if (e.keyCode == 13) {
			searchBtn();
		}
	}
	
	/* 검색 */
	function searchBtn(){
		$searchText = $('#searchText').val();
		
		if (category == "") {
			if(typeof Android !== "undefined" && Android !==null){
				Android.noCategory();
			}else{
				alert('분류를 선택해 주세요');
			}
		}else if($searchText==""){
			if(typeof Android !== "undefined" && Android !==null){
				Android.noSearchText();
			}else{
				alert('검색어를 입력해 주세요');
			}
		}else{
			location.href = "/communitySearch.diet?category="+ category +"&searchText=" + $searchText; 
		}
		
		
	}

			// 슬라이드
	$(function() {
		$(".rslides").responsiveSlides({
			auto: true,
			timeout: 1500,  
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
}
/* 모바일용 사이즈 */
@media ( max-width : 649px) {
	#size1 {
		display: none;
	}
	#size2 {
		display: block;
	}
}
</style>
</html>