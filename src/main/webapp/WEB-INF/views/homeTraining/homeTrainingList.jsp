<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	<input type="hidden" id="type" value="${requestScope.htpd.type }">
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui center aligned basic segment">

		<div id="size1" class="ui center aligned container">
			<!-- 슬라이드-->
		<ul class="rslides">
			<li><img src="/resources/image/mainPic.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic1.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic2.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic3.jpg" style="height: 250px;"></li>
		</ul>

			<h1 class="ui left aligned header">
				홈트레이닝 >

				<c:choose>
					<c:when test="${requestScope.htpd.type.equals('wholeBody') }">전신</c:when>
					<c:when test="${requestScope.htpd.type.equals('abdomen') }">복부</c:when>
					<c:when test="${requestScope.htpd.type.equals('upperBody') }">상체</c:when>
					<c:when test="${requestScope.htpd.type.equals('lowerBody') }">하체</c:when>
					<c:when test="${requestScope.htpd.type.equals('stretching') }">스트레칭</c:when>
					<c:when test="${requestScope.htpd.type.equals('dance') }">댄스</c:when>
					<c:when test="${requestScope.htpd.type.equals('yoga') }">요가</c:when>
					<c:when test="${requestScope.htpd.type.equals('fourChallenge') }">4주챌린지</c:when>
				</c:choose>

			</h1>
			<hr>
			<br>

			<!-- 운동부위별 값 넣을곳 -->
			<div class="ui three column grid">
				<c:forEach items="${requestScope.htpd.htList }" var="ht">


					<div class="column">
						<div class="ui card" >
							<div class="image">
								<img src="${ht.htMainPhoto}" onclick="InfoPage(${ht.indexNo})"
									style="width: 290px; height: 200px; cursor: pointer;"  onerror='this.src="/resources/image/300x400.png"'>
							</div>
							<div class="content">
								<a class="header" onclick="InfoPage(${ht.indexNo})" style="height: 50px;">${ht.htTitle }</a>
								<div class="meta">
									<span class="date">${ht.htPart } |</span> <i
										class="heart outline icon"></i> 좋아요 <span class="like"
										style="color: red">${ht.htLike }</span>
								</div>
								<c:if test="${ht.htWriterNo == sessionScope.member.mbIndex }">
							<div class="four wide column">
								<a style="cursor:pointer;" onclick="updateHomeTraining(${ht.indexNo})">수정</a>
								&nbsp;|&nbsp;&nbsp;
								<a style="cursor:pointer;" onclick="deleteHomeTraining(${ht.indexNo});">삭제</a>
							</div>
							</c:if>
							</div>
						</div>
					</div>


				</c:forEach>
			</div>

			<br> <br>


			<div class="ui grid">
				<div class="three column row">
					<div class="four wide column"></div>
					<div class="eight wide column">
						<div class="ui center aligned basic segment">
							<div class="ui pagination menu">${requestScope.htpd.pageNavi }</div>
						</div>
					</div>
					<div class="four wide column">
						<div class="ui right aligned container">
							<button class="ui right red basic button"
								style="margin-top: 19px;" id="writeBtn"
								onclick="homeTrainingWrite();">
								<i class="edit icon"></i> 등록
							</button>
						</div>
					</div>
				</div>
				<br>
			</div>

			<!-- 검색 +  dropdown : 제목, 내용, 작성자 -->
			<div class="ui center aligned basic segment">
			<div class="ui secondary segment">
				<div class="ui left action right icon input">
					<div class="ui basic floating dropdown button">
						<div class="text">선택</div>
						<i class="dropdown icon"></i>
						<div class="menu">
							<div class="item">제목</div>
							<div class="item">작성자</div>
						</div>
					</div>
					<input type="text" placeholder="Search..." id="searchText" style="width: 70%;"  onkeypress="runScript(event)" > <i class="circular search link icon" onclick="searchBtn()"></i>
				</div>
			</div>

		</div>
		</div>
		
		
		<div id="size2" class="ui center aligned container">
			<!-- 슬라이드-->
		<ul class="rslides">
			<li><img src="/resources/image/mainPic.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic1.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic2.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic3.jpg" style="height: 250px;"></li>
		</ul>

			<h1 class="ui left aligned header">
				홈트레이닝 >

				<c:choose>
					<c:when test="${requestScope.htpd.type.equals('wholeBody') }">전신</c:when>
					<c:when test="${requestScope.htpd.type.equals('abdomen') }">복부</c:when>
					<c:when test="${requestScope.htpd.type.equals('upperBody') }">상체</c:when>
					<c:when test="${requestScope.htpd.type.equals('lowerBody') }">하체</c:when>
					<c:when test="${requestScope.htpd.type.equals('stretching') }">스트레칭</c:when>
					<c:when test="${requestScope.htpd.type.equals('dance') }">댄스</c:when>
					<c:when test="${requestScope.htpd.type.equals('yoga') }">요가</c:when>
					<c:when test="${requestScope.htpd.type.equals('fourChallenge') }">4주챌린지</c:when>
				</c:choose>

			</h1>
			<hr>
			<br>

			<!-- 운동부위별 값 넣을곳 -->		
			<div align="center">
				<c:forEach items="${requestScope.htpd.htList }" var="ht">
						<div class="ui card" >
							<div class="image">
								<img src="${ht.htMainPhoto}" onclick="InfoPage(${ht.indexNo})"
									style="width: 290px; height: 200px; cursor: pointer;"  onerror='this.src="/resources/image/300x400.png"'>
							</div>
							<div class="content">
								<a class="header" onclick="InfoPage(${ht.indexNo})" style="height: 50px;">${ht.htTitle }</a>
								<div class="meta">
									<span class="date">${ht.htPart } |</span> <i
										class="heart outline icon"></i> 좋아요 <span class="like"
										style="color: red">${ht.htLike }</span>
								</div>
								<c:if test="${ht.htWriterNo == sessionScope.member.mbIndex }">
							<div class="four wide column">
								<a style="cursor:pointer;" onclick="updateHomeTraining(${ht.indexNo})">수정</a>
								&nbsp;|&nbsp;&nbsp;
								<a style="cursor:pointer;" onclick="deleteHomeTraining(${ht.indexNo});">삭제</a>
							</div>
							</c:if>
							</div>
						</div>
				</c:forEach>
			</div>
			<br> <br>


			<div class="ui center aligned grid">

				<c:if test="${requestScope.htpd.htList[0]!=null }">
					<div class="ui center aligned basic segment" style="margin: 0; padding: 0;">
						<div class="ui pagination menu" align="center">${requestScope.htpd.pageNavi }</div>
					</div>
				</c:if>


				<br>
			</div>

			<!-- 검색 +  dropdown : 제목, 내용, 작성자 -->
			<div class="ui center aligned basic segment">
			<div class="ui secondary segment">
				<div class="ui left action right icon input">
					<div class="ui basic floating dropdown button">
						<div class="text">선택</div>
						<i class="dropdown icon"></i>
						<div class="menu">
							<div class="item">제목</div>
							<div class="item">작성자</div>
						</div>
					</div>
					<input type="text" placeholder="Search..." id="searchText2" style="width: 70%;"  onkeypress="runScript(event)" > <i class="circular search link icon" onclick="searchBtn()"></i>
				</div>
			</div>

		</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<script type="text/javascript">
	function InfoPage(me){
		location.href="/homeTrainingInfo.diet?indexNo="+me+"&type=${requestScope.type }";
	}
</script>

<!-- SCRIPT -->
<!-- SCRIPT -->
<script type="text/javascript">
$('.ui.dropdown')
.dropdown({
  allowAdditions: true,
  allowCategorySelection: true
});

//카테고리 선택
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
	if(category==''){
		if(typeof Android !== "undefined" && Android !==null){
			Android.noCategory();
		}else{
			alert('분류를 선택해 주세요');
		}
		return;
	}
	$searchText = $('#searchText').val();
	$searchText2 = $('#searchText2').val();
	$type = $('#type').val();
	
	if($searchText==""){
		$searchText = $searchText2;
	}
	if($searchText==""){
		if(typeof Android !== "undefined" && Android !==null){
			Android.noSearchText();
		}else{
			alert('검색어를 입력해 주세요');
		}
		return;
	}
	
	location.href = "/homeTrainingList.diet?category="+ category +"&searchText=" + $searchText + "&type=" + $type;
}

//게시물 등록
function homeTrainingWrite(){
	
	$.ajax({
		url : '/htWriteAuthorityCheck.diet',
		type : 'post',
		success : function(result){
			if(result>0){
				location.href = "/loadHomeTrainingWrite.diet";
			}else{
				alert('권한이 없습니다.');
			}
			
		},
		error : function(result){
			alert('권한이 없습니다.');
		}
	});
}

//게시물 삭제
function deleteHomeTraining(me){
	var type = $('#type').val();
	$.ajax({
		url : "homeTrainingDelete.diet?indexNo="+me,
		type : 'post',
		success : function(data){
			if(data>0){
				alert('삭제 완료');
			}else{
				alert('삭제 실패');
			}
		},
		error : function(data){
			alert('에러 발생');
		}
	});
	
	location.href = 'homeTrainingList.diet?type='+type;
}

// 게시물 수정
function updateHomeTraining(me){
	location.href = "loadUpdateHomeTraining.diet?indexNo=" + me;
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