<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<div class="ui container">
		<!-- 슬라이드-->
               <ul class="rslides" style="padding-bottom: 15px;">
                  <li>
                     <img src="#" id="image1" style="height:250px;">
                  </li>
                  <li>
                     <img src="#" id="image2" style="height:250px;">
                  </li>
                  <li>
                     <img src="#" id="image3" style="height:250px;">
                  </li>
                  <li>
                     <img src="#" id="image4" style="height:250px;">
                  </li>
                  <li>
                     <img src="/resources/image/advertise.png" style="height:250px;">
                  </li>
               </ul>
		<div id="size1" class="ui center aligned basic segment">

			<h1 class="ui left aligned header">홈트레이닝</h1>
			<hr>
			
			<c:choose>
			<c:when test="${requestScope.htpd.htList[0].indexNo !=null }">

			<c:if test="${sessionScope.member!=null  }">
				<h3 class="ui left aligned header">맞춤 홈트레이닝 동영상</h3>

				<!-- 제목 이미지 출력  -->
				<div class="ui three column grid">
					<div class="column">
						<div class="ui card">
							<div class="image">
								<img src="${requestScope.matchedList[0].htMainPhoto}" onclick="InfoPage(${requestScope.matchedList[0].indexNo}, ${requestScope.matchedList[0].htType })"
									style="width: 100%; height: 200px; cursor: pointer;"  onerror='this.src="/resources/image/300x400.png"'>
							</div>
							<div class="content">
								<a class="header" onclick="InfoPage(${requestScope.matchedList[0].indexNo}, ${requestScope.matchedList[0].htType })" style="height: 50px;">${requestScope.matchedList[0].htTitle }</a>
								<div class="meta">
									<span class="date"> <c:choose>
											<c:when test="${requestScope.matchedList[0].htType==1 }">
										전신
										</c:when>
											<c:when test="${requestScope.matchedList[0].htType==2 }">
										복부
										</c:when>
											<c:when test="${requestScope.matchedList[0].htType==3 }">
										상체
										</c:when>
											<c:when test="${requestScope.matchedList[0].htType==4 }">
										하체
										</c:when>
											<c:when test="${requestScope.matchedList[0].htType==5 }">
										스트레칭
										</c:when>
											<c:when test="${requestScope.matchedList[0].htType==6 }">
										댄스
										</c:when>
											<c:when test="${requestScope.matchedList[0].htType==7 }">
										요가
										</c:when>
											<c:when test="${requestScope.matchedList[0].htType==8 }">
										4주챌린지
										</c:when>
										</c:choose>

									</span> <span class="date">${ht.htPart } |</span> <i class="heart outline icon"></i> 좋아요 <span class="like" style="color: red">${requestScope.matchedList[0].htLike }</span>
									<c:if test="${ht.htWriterNo == sessionScope.member.mbIndex }">
										<div class="four wide column">
											<a style="cursor: pointer;" onclick="updateHomeTraining(${ht.indexNo})">수정</a> &nbsp;|&nbsp;&nbsp; <a style="cursor: pointer;" onclick="deleteHomeTraining(${ht.indexNo});">삭제</a>
										</div>
									</c:if>

								</div>
							</div>
						</div>
					</div>
					<div class="column">
						<div class="ui card">
							<div class="image">
								<img src="${requestScope.matchedList[1].htMainPhoto} " onclick="InfoPage(${requestScope.matchedList[1].indexNo}, ${requestScope.matchedList[1].htType } )"
									style="width: 100%; height: 200px; cursor: pointer;"  onerror='this.src="/resources/image/300x400.png"'>
							</div>
							<div class="content">
								<a class="header" onclick="InfoPage(${requestScope.matchedList[1].indexNo}, ${requestScope.matchedList[1].htType })" style="height: 50px;">${requestScope.matchedList[1].htTitle }</a>
								<div class="meta">
									<span class="date"> <c:choose>
											<c:when test="${requestScope.matchedList[1].htType==1 }">
										전신
										</c:when>
											<c:when test="${requestScope.matchedList[1].htType==2 }">
										복부
										</c:when>
											<c:when test="${requestScope.matchedList[1].htType==3 }">
										상체
										</c:when>
											<c:when test="${requestScope.matchedList[1].htType==4 }">
										하체
										</c:when>
											<c:when test="${requestScope.matchedList[1].htType==5 }">
										스트레칭
										</c:when>
											<c:when test="${requestScope.matchedList[1].htType==6 }">
										댄스
										</c:when>
											<c:when test="${requestScope.matchedList[1].htType==7 }">
										요가
										</c:when>
											<c:when test="${requestScope.matchedList[1].htType==8 }">
										4주챌린지
										</c:when>
										</c:choose>

									</span> <span class="date">${ht.htPart } |</span> <i class="heart outline icon"></i> 좋아요 <span class="like" style="color: red">${requestScope.matchedList[1].htLike }</span>
									<c:if test="${ht.htWriterNo == sessionScope.member.mbIndex }">
										<div class="four wide column">
											<a style="cursor: pointer;" onclick="updateHomeTraining(${ht.indexNo})">수정</a> &nbsp;|&nbsp;&nbsp; <a style="cursor: pointer;" onclick="deleteHomeTraining(${ht.indexNo});">삭제</a>
										</div>
									</c:if>

								</div>
							</div>
						</div>
					</div>
					<div class="column">
						<div class="ui card">
							<div class="image">
								<img src="${requestScope.matchedList[2].htMainPhoto} " onclick="InfoPage(${requestScope.matchedList[2].indexNo}, ${requestScope.matchedList[2].htType } )"
									style="width: 100%; height: 200px; cursor: pointer;" onerror='this.src="/resources/image/300x400.png"'>
							</div>
							<div class="content">
								<a class="header" onclick="InfoPage(${requestScope.matchedList[2].indexNo}, ${requestScope.matchedList[2].htType })" style="height: 50px;">${requestScope.matchedList[2].htTitle }</a>
								<div class="meta">
									<span class="date"> <c:choose>
											<c:when test="${requestScope.matchedList[2].htType==1 }">
										전신
										</c:when>
											<c:when test="${requestScope.matchedList[2].htType==2 }">
										복부
										</c:when>
											<c:when test="${requestScope.matchedList[2].htType==3 }">
										상체
										</c:when>
											<c:when test="${requestScope.matchedList[2].htType==4 }">
										하체
										</c:when>
											<c:when test="${requestScope.matchedList[2].htType==5 }">
										스트레칭
										</c:when>
											<c:when test="${requestScope.matchedList[2].htType==6 }">
										댄스
										</c:when>
											<c:when test="${requestScope.matchedList[2].htType==7 }">
										요가
										</c:when>
											<c:when test="${requestScope.matchedList[2].htType==8 }">
										4주챌린지
										</c:when>
										</c:choose>

									</span> <span class="date">${ht.htPart } |</span> <i class="heart outline icon"></i> 좋아요 <span class="like" style="color: red">${requestScope.matchedList[2].htLike }</span>
									<c:if test="${ht.htWriterNo == sessionScope.member.mbIndex }">
										<div class="four wide column">
											<a style="cursor: pointer;" onclick="updateHomeTraining(${ht.indexNo})">수정</a> &nbsp;|&nbsp;&nbsp; <a style="cursor: pointer;" onclick="deleteHomeTraining(${ht.indexNo});">삭제</a>
										</div>
									</c:if>

								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			
			

			<h3 class="ui left aligned header">최신 홈트레이닝 동영상</h3>
			<hr>
			<br>

			<div class="ui three column grid">
				<c:forEach items="${requestScope.htpd.htList }" var="ht">


					<div class="column">
						<div class="ui card">
							<div class="image">
								<img src="${ht.htMainPhoto}" onclick="InfoPage(${ht.indexNo}, ${ht.htType })" style="width: 290px; height: 200px; cursor: pointer;"  onerror='this.src="/resources/image/300x400.png"'>
							</div>
							<div class="content">
								<a class="header" onclick="InfoPage(${ht.indexNo}, ${ht.htType })" style="height: 50px;">${ht.htTitle }</a>
								<div class="meta">
									<span class="date">${ht.htPart } |</span> <i class="heart outline icon"></i> 좋아요 <span class="like" style="color: red">${ht.htLike }</span>
								</div>
								<c:if test="${ht.htWriterNo == sessionScope.member.mbIndex }">
									<div class="four wide column">
										<a style="cursor: pointer;" onclick="updateHomeTraining(${ht.indexNo})">수정</a> &nbsp;|&nbsp;&nbsp; <a style="cursor: pointer;" onclick="deleteHomeTraining(${ht.indexNo});">삭제</a>
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
						<c:if test="${requestScope.htpd.htList[0]!=null }">
							<div class="ui center aligned basic segment">
								<div class="ui pagination menu">${requestScope.htpd.pageNavi }</div>
							</div>
						</c:if>
					</div>
					<div class="four wide column">
					<c:choose>
					<c:when test="${sessionScope.member != null }">
						<div class="ui right aligned container">
							<button class="ui right red basic button" style="margin-top: 19px;" id="writeBtn" onclick="homeTrainingWrite();">
								<i class="edit icon"></i> 등록
							</button>
						</div>
						</c:when>
						</c:choose>
					</div>
				</div>
				<br> <br>
			</div>
			
			</c:when>
			<c:otherwise>
			
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
						<input type="text" placeholder="Search..." id="searchText" style="width: 70%;" onkeypress="runScript(event)" > <i class="circular search link icon" onclick="searchBtn()"></i>
					</div>
				</div>

			</div>
		</div>


		<div id="size2" class="ui center aligned basic segment">

			<h1 class="ui left aligned header">홈트레이닝</h1>
			<hr>

			<c:if test="${sessionScope.member!=null  }">
				<h3 class="ui left aligned header">맞춤 홈트레이닝 동영상</h3>

				<!-- 제목 이미지 출력  -->
				<div align="center">
					<div class="ui card">
						<div class="image">
							<img src="${requestScope.matchedList[0].htMainPhoto}" onclick="InfoPage(${requestScope.matchedList[0].indexNo}, ${requestScope.matchedList[0].htType })"
								style="width: 100%; height: 200px; cursor: pointer;" onerror='this.src="/resources/image/300x400.png"'>
						</div>
						<div class="content">
							<a class="header" onclick="InfoPage(${requestScope.matchedList[0].indexNo}, ${requestScope.matchedList[0].htType })" style="height: 50px;">${requestScope.matchedList[0].htTitle }</a>
							<div class="meta">
								<span class="date"> <c:choose>
										<c:when test="${requestScope.matchedList[0].htType==1 }">
										전신
										</c:when>
										<c:when test="${requestScope.matchedList[0].htType==2 }">
										복부
										</c:when>
										<c:when test="${requestScope.matchedList[0].htType==3 }">
										상체
										</c:when>
										<c:when test="${requestScope.matchedList[0].htType==4 }">
										하체
										</c:when>
										<c:when test="${requestScope.matchedList[0].htType==5 }">
										스트레칭
										</c:when>
										<c:when test="${requestScope.matchedList[0].htType==6 }">
										댄스
										</c:when>
										<c:when test="${requestScope.matchedList[0].htType==7 }">
										요가
										</c:when>
										<c:when test="${requestScope.matchedList[0].htType==8 }">
										4주챌린지
										</c:when>
									</c:choose>

								</span> <span class="date">${ht.htPart } |</span> <i class="heart outline icon"></i> 좋아요 <span class="like" style="color: red">${requestScope.matchedList[0].htLike }</span>
								<c:if test="${ht.htWriterNo == sessionScope.member.mbIndex }">
									<div class="four wide column">
										<a style="cursor: pointer;" onclick="updateHomeTraining(${ht.indexNo})">수정</a> &nbsp;|&nbsp;&nbsp; <a style="cursor: pointer;" onclick="deleteHomeTraining(${ht.indexNo});">삭제</a>
									</div>
								</c:if>

							</div>
						</div>
					</div>
					<div class="ui card">
						<div class="image">
							<img src="${requestScope.matchedList[1].htMainPhoto} " onclick="InfoPage(${requestScope.matchedList[1].indexNo}, ${requestScope.matchedList[1].htType } )"
								style="width: 100%; height: 200px; cursor: pointer;" onerror='this.src="/resources/image/300x400.png"'>
						</div>
						<div class="content">
							<a class="header" onclick="InfoPage(${requestScope.matchedList[1].indexNo}, ${requestScope.matchedList[1].htType })" style="height: 50px;">${requestScope.matchedList[1].htTitle }</a>
							<div class="meta">
								<span class="date"> <c:choose>
										<c:when test="${requestScope.matchedList[1].htType==1 }">
										전신
										</c:when>
										<c:when test="${requestScope.matchedList[1].htType==2 }">
										복부
										</c:when>
										<c:when test="${requestScope.matchedList[1].htType==3 }">
										상체
										</c:when>
										<c:when test="${requestScope.matchedList[1].htType==4 }">
										하체
										</c:when>
										<c:when test="${requestScope.matchedList[1].htType==5 }">
										스트레칭
										</c:when>
										<c:when test="${requestScope.matchedList[1].htType==6 }">
										댄스
										</c:when>
										<c:when test="${requestScope.matchedList[1].htType==7 }">
										요가
										</c:when>
										<c:when test="${requestScope.matchedList[1].htType==8 }">
										4주챌린지
										</c:when>
									</c:choose>

								</span> <span class="date">${ht.htPart } |</span> <i class="heart outline icon"></i> 좋아요 <span class="like" style="color: red">${requestScope.matchedList[1].htLike }</span>
								<c:if test="${ht.htWriterNo == sessionScope.member.mbIndex }">
									<div class="four wide column">
										<a style="cursor: pointer;" onclick="updateHomeTraining(${ht.indexNo})">수정</a> &nbsp;|&nbsp;&nbsp; <a style="cursor: pointer;" onclick="deleteHomeTraining(${ht.indexNo});">삭제</a>
									</div>
								</c:if>

							</div>
						</div>
					</div>
					<div class="ui card">
						<div class="image">
							<img src="${requestScope.matchedList[2].htMainPhoto} " onclick="InfoPage(${requestScope.matchedList[2].indexNo}, ${requestScope.matchedList[2].htType } )"
								style="width: 100%; height: 200px; cursor: pointer;" onerror='this.src="/resources/image/300x400.png"'>
						</div>
						<div class="content">
							<a class="header" onclick="InfoPage(${requestScope.matchedList[2].indexNo}, ${requestScope.matchedList[2].htType })" style="height: 50px;">${requestScope.matchedList[2].htTitle }</a>
							<div class="meta">
								<span class="date"> <c:choose>
										<c:when test="${requestScope.matchedList[2].htType==1 }">
										전신
										</c:when>
										<c:when test="${requestScope.matchedList[2].htType==2 }">
										복부
										</c:when>
										<c:when test="${requestScope.matchedList[2].htType==3 }">
										상체
										</c:when>
										<c:when test="${requestScope.matchedList[2].htType==4 }">
										하체
										</c:when>
										<c:when test="${requestScope.matchedList[2].htType==5 }">
										스트레칭
										</c:when>
										<c:when test="${requestScope.matchedList[2].htType==6 }">
										댄스
										</c:when>
										<c:when test="${requestScope.matchedList[2].htType==7 }">
										요가
										</c:when>
										<c:when test="${requestScope.matchedList[2].htType==8 }">
										4주챌린지
										</c:when>
									</c:choose>

								</span> <span class="date">${ht.htPart } |</span> <i class="heart outline icon"></i> 좋아요 <span class="like" style="color: red">${requestScope.matchedList[2].htLike }</span>
								<c:if test="${ht.htWriterNo == sessionScope.member.mbIndex }">
									<div class="four wide column">
										<a style="cursor: pointer;" onclick="updateHomeTraining(${ht.indexNo})">수정</a> &nbsp;|&nbsp;&nbsp; <a style="cursor: pointer;" onclick="deleteHomeTraining(${ht.indexNo});">삭제</a>
									</div>
								</c:if>

							</div>
						</div>
					</div>
				</div>
			</c:if>

			<h3 class="ui left aligned header">최신 홈트레이닝 동영상</h3>
			<hr>
			<br>

			<div align="center">
				<c:forEach items="${requestScope.htpd.htList }" var="ht">


					<div class="ui card">
						<div class="image">
							<img src="${ht.htMainPhoto}" onclick="InfoPage(${ht.indexNo}, ${ht.htType })" style="width: 290px; height: 200px; cursor: pointer;" onerror='this.src="/resources/image/300x400.png"'>
						</div>
						<div class="content">
							<a class="header" onclick="InfoPage(${ht.indexNo}, ${ht.htType })" style="height: 50px;">${ht.htTitle }</a>
							<div class="meta">
								<span class="date">${ht.htPart } |</span> <i class="heart outline icon"></i> 좋아요 <span class="like" style="color: red">${ht.htLike }</span>
							</div>
							<c:if test="${ht.htWriterNo == sessionScope.member.mbIndex }">
								<div class="four wide column">
									<a style="cursor: pointer;" onclick="updateHomeTraining(${ht.indexNo})">수정</a> &nbsp;|&nbsp;&nbsp; <a style="cursor: pointer;" onclick="deleteHomeTraining(${ht.indexNo});">삭제</a>
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
	location.href = "/homeTrainingAll.diet?category="+ category +"&searchText=" + $searchText;
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

function InfoPage(me, me2){
	var type;
	if(me2==1){
		type = "wholeBody";
	}else if(me2==2){
		type = "abdomen";
	}else if(me2==3){
		type = "upperBody";
	}else if(me2==4){
		type = "lowerBody";
	}else if(me2==5){
		type = "stretching";
	}else if(me2==6){
		type = "dance";
	}else if(me2==7){
		type = "yoga";
	}else if(me2==8){
		type = "fourChallenge";
	}
	
	
	location.href="/homeTrainingInfo.diet?indexNo="+me+"&type="+type;
}


//슬라이드
$(function() {
	$(".rslides").responsiveSlides({
		auto : true,
		timeout : 1500,
	});
});

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