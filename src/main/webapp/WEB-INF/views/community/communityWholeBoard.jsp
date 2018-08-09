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
	} else
		self.name = '';
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
		<div class="ui left aligned container">
			<c:choose>
				<c:when test="${requestScope.cpdv.type.equals('comAll') }">
					<h1>전체</h1>
				</c:when>
				<c:when test="${requestScope.cpdv.type.equals('15') }">
					<h1>자유게시판</h1>
				</c:when>
				<c:when test="${requestScope.cpdv.type.equals('16') }">
					<h1>레시피&#38;식단</h1>
				</c:when>
				<c:when test="${requestScope.cpdv.type.equals('17') }">
					<h1>팁&#38;노하우</h1>
				</c:when>
				<c:when test="${requestScope.cpdv.type.equals('18') }">
					<h1>고민&#38;질문</h1>
				</c:when>
				<c:when test="${requestScope.cpdv.type.equals('19') }">
					<h1>비포&#38;애프터</h1>
				</c:when>
				<c:when test="${requestScope.cpdv.type.equals('') }">
					<h1>검색</h1>
				</c:when>
			</c:choose>

		</div>
		<hr style="border: 2px solid #D5D5D5;">
		<br>
		<!-- CONTENTS -->

		<!-- 최신순, 조회순 -->
		<br>
		<c:choose>
			<c:when test="${requestScope.cpdv.comList[0].postIndex!=null}">
				<div class="ui right aligned basic segment" style="margin: 0px; padding: 0px;">
					<div class="small ui basic buttons">
						<div class="ui button" style="padding-top: 7px; padding-bottom: 7px; padding-right: 10px; padding-left: 10px;" onclick="recentlyViewBtn(this);">최신순</div>
						<div class="ui button" style="padding-top: 7px; padding-bottom: 7px; padding-right: 10px; padding-left: 10px;" onclick="recentlyViewBtn(this);">조회순</div>
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

<!-- 공지사항 넣기! -->


					<c:if test="${requestScope.cpdv.type.equals('15') }">
						<c:forEach items="${requestScope.nvList}" var="nv">
							<c:choose>
								<c:when test="${nv.noticeType eq'자유게시판'}">
									<tr align="center" style="background: rgba(171, 171, 171, 0.1);" class="aa">
										<td style="padding-top: 15px; padding-bottom: 15px; color: red;">공지</td>
										<td><a href="/noticeContent.diet?index=${nv.noticeIndex}">${nv.noticeTitle}</a></td>
										<td><img class="ui avatar image" src="/resources/image/admin.png" />${nv.noticeWriter}</td>
										<td>${nv.noticeView}</td>
										<td>
											<fmt:formatDate value="${nv.noticeWriteDay}" pattern="yyyy-MM-dd HH:mm" />
										</td>
									</tr>


								</c:when>
							</c:choose>
						</c:forEach>
					</c:if>




					<c:if test="${requestScope.cpdv.type.equals('17') }">
						<c:forEach items="${requestScope.nvList}" var="nv">
							<c:choose>
								<c:when test="${nv.noticeType eq'팁&노하우'}">
									<tr align="center" style="background: rgba(171, 171, 171, 0.1);" class="aa">
										<td style="padding-top: 15px; padding-bottom: 15px; color: red;">공지</td>
										<td><a href="/noticeContent.diet?index=${nv.noticeIndex}">${nv.noticeTitle}</a></td>
										<td><img class="ui avatar image" src="/resources/image/admin.png" />${nv.noticeWriter}</td>
										<td>${nv.noticeView}</td>
										<td>
											<fmt:formatDate value="${nv.noticeWriteDay}" pattern="yyyy-MM-dd HH:mm" />
										</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:if>

					<c:if test="${requestScope.cpdv.type.equals('18') }">
						<c:forEach items="${requestScope.nvList}" var="nv">
							<c:choose>
								<c:when test="${nv.noticeType eq'고민&질문'}">
									<tr align="center" style="background: rgba(171, 171, 171, 0.1);" class="aa">
										<td style="padding-top: 15px; padding-bottom: 15px; color: red;">공지</td>
										<td><a href="/noticeContent.diet?index=${nv.noticeIndex}">${nv.noticeTitle}</a></td>
										<td><img class="ui avatar image" src="/resources/image/admin.png" />${nv.noticeWriter}</td>
										<td>${nv.noticeView}</td>
										<td>
											<fmt:formatDate value="${nv.noticeWriteDay}" pattern="yyyy-MM-dd HH:mm" />
										</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:if>

					<c:if test="${requestScope.cpdv.type.equals('19') }">
						<c:forEach items="${requestScope.nvList}" var="nv">
							<c:choose>
								<c:when test="${nv.noticeType eq'비포&애프터'}">
									<tr align="center" style="background: rgba(171, 171, 171, 0.1);" class="aa">
										<td style="padding-top: 15px; padding-bottom: 15px; color: red;">공지</td>
										<td><a href="/noticeContent.diet?index=${nv.noticeIndex}">${nv.noticeTitle}</a></td>
										<td><img class="ui avatar image" src="/resources/image/admin.png" />${nv.noticeWriter}</td>
										<td>${nv.noticeView}</td>
										<td>
											<fmt:formatDate value="${nv.noticeWriteDay}" pattern="yyyy-MM-dd HH:mm" />
										</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:if>

					<c:if test="${requestScope.cpdv.type.equals('comAll') }">
						<c:forEach items="${requestScope.nvList}" var="nv">
							<c:choose>
								<c:when test="${nv.noticeType eq'전체'}">
									<tr align="center" style="background: rgba(171, 171, 171, 0.1);" class="aa">
										<td style="padding-top: 15px; padding-bottom: 15px; color: red;">공지</td>
										<td><a href="/noticeContent.diet?index=${nv.noticeIndex}">${nv.noticeTitle}</a></td>
										<td><img class="ui avatar image" src="/resources/image/admin.png" />${nv.noticeWriter}</td>
										<td>${nv.noticeView}</td>
										<td>
											<fmt:formatDate value="${nv.noticeWriteDay}" pattern="yyyy-MM-dd HH:mm" />
										</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</c:if>

					<!-- 공지사항 넣기 -->
					<%-- 게시판 공지 끝 --%>
							<c:forEach items="${requestScope.cpdv.comList}" var="c">
								<tr align="center">
									<td>${c.bcaName}</td>
									<td style="padding-top: 15px; padding-bottom: 15px;">
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
										<img class="ui avatar image" src="${c.mbImage}" onerror='this.src="/resources/image/avatar.png"'>
										${c.postNickname}
									</td>
									<td>${c.postHit}</td>
									<td>
										<fmt:formatDate value="${c.postDateTime}" pattern="yyyy-MM-dd HH:mm" />
									</td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>

				<br>
			</c:when>
			<c:otherwise>
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
				</table>

				<div class="ui red medium message">
					<br>
					<i class="exclamation huge icon"></i>
					<div class="ui medium header">
						<br>
						※게시물이 존재하지 않습니다.
						<br>
						다른 키워드로 검색을 해주세요.
						<br>
						<br>
						<br>
					</div>
				</div>


			</c:otherwise>
		</c:choose>


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
						<%-- <c:if test="${sessionScope.member!=null}"> --%>
							<button class="ui right red basic button" style="margin-top: 19px;" id="writeBtn" onclick="return loginCheck();">
								<i class="edit icon"></i>
								등록
							</button>
						<%-- </c:if> --%>
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


		<!-- 검색 +  dropdown : 제목, 내용, 작성자 -->
		<br>
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
				<input type="text" placeholder="Search..." id="searchText" onkeypress="runScript(event)" maxlength="30"  />
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

	$(document).ready(function() {
		$('.aa').hide();
		$('.aa').eq(0).show();
		$('.aa').eq(1).show();
	});

	var st = $('#searchT').val();
	var cate = $('#category').val();

	$('.ui.dropdown').dropdown({
		allowAdditions : true,
		allowCategorySelection : true
	});

	$('#writeBtn').click(function() {
		var mbId = '${sessionScope.member.mbId}';
		
		if(${sessionScope.member != null}){
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
		}else{
			alert('로그인 후 이용이 가능합니다.');
		}

	});

	/* 클릭시 각 페이지로 이동 ????????????????????????????????????????? */
	function recipeLink(pi) {
		location.href = "/postedCommunity.diet?postIndex=" + pi;
	}

	/* 최신순 & 조회순 클릭 */
	var type = $('#boardTime').val();
	function recentlyViewBtn(rtb) {
		var postSort = rtb.innerHTML;

		location.href = "/communityViewBoard.diet?type=" + type + "&postSort="
				+ postSort + "&searchText=" + st + "&category=" + cate;

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
	function searchBtn() {
		$searchText = $('#searchText').val();

		if (category == "") {
			alert('분류를 선택하여주세요.');
		} else {
			if($searchText != "")
			location.href = "/communitySearch.diet?category=" + category
					+ "&searchText=" + $searchText;
			else{
				alert('검색어를 입력해 주세요');
			}
		}

		/* + "&type=" + type */

	}

	function loginCheck() {
		var check = false;

		if ('${sessionScope.member!=null}') {
			check = true;
			return check;
		} else {
			return check;
		}
	}

	// 슬라이드
	$(function() {
		$(".rslides").responsiveSlides({
			auto : true,
			timeout : 1500,
		});
	});
</script>
<style type="text/css" media="screen">
/* 모바일용 아닌 사이즈 */
@media ( min-width : 550px) {
	#size1 {
		display: block;
	}
	#size2 {
		display: none;
	}
}
/* 모바일용 사이즈 */
@media ( max-width : 549px) {
	#size1 {
		display: none;
	}
	#size2 {
		display: block;
	}
}
</style>
</html>