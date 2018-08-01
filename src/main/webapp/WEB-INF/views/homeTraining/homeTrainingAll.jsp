<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">

			<h1 class="ui left aligned header">홈트레이닝</h1>
			<hr>
			
			<h3 class="ui left aligned header">맞춤 홈트레이닝 동영상</h3>
			
			<!-- 제목 이미지 출력  -->
			<div class="ui three column grid">
				<div class="column">
					<div class="ui card">
						<div class="image">
							<img src="${requestScope.matchedList[0].htMainPhoto} " style="width: 100%; height: 200px;">
						</div>
						<div class="content">
							<a class="header">${requestScope.matchedList[0].htTitle }</a>
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

								</span> 
								<a class="header" onclick="InfoPage(${ht.indexNo})" style="height: 50px;">${ht.htTitle }</a>
								<div class="meta">
								<span class="date">${ht.htPart } |</span>
								 <i	class="heart outline icon"></i> 좋아요
								  <span class="like" style="color: red">${requestScope.matchedList[2].htLike }</span>
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
					</div>
				</div>
				<div class="column">
					<div class="ui card">
						<div class="image">
							<img src="${requestScope.matchedList[1].htMainPhoto} " style="width: 100%; height: 200px;">
						</div>
						<div class="content">
							<a class="header">${requestScope.matchedList[1].htTitle }</a>
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

								</span> 
								<a class="header" onclick="InfoPage(${ht.indexNo})" style="height: 50px;">${ht.htTitle }</a>
								<div class="meta">
								<span class="date">${ht.htPart } |</span>
								 <i	class="heart outline icon"></i> 좋아요
								  <span class="like" style="color: red">${requestScope.matchedList[2].htLike }</span>
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
					</div>
				</div>
				<div class="column">
					<div class="ui card">
						<div class="image">
							<img src="${requestScope.matchedList[2].htMainPhoto} " style="width: 100%; height: 200px;">
						</div>
						<div class="content">
							<a class="header">${requestScope.matchedList[2].htTitle }</a>
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

								</span> 
								<a class="header" onclick="InfoPage(${ht.indexNo})" style="height: 50px;">${ht.htTitle }</a>
								<div class="meta">
								<span class="date">${ht.htPart } |</span>
								 <i	class="heart outline icon"></i> 좋아요
								  <span class="like" style="color: red">${requestScope.matchedList[2].htLike }</span>
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
					</div>
				</div>
			</div>
							

			<h3 class="ui left aligned header">최신 홈트레이닝 동영상</h3>
			<hr>
			<br>

			<div class="ui three column grid">
				<c:forEach items="${requestScope.htpd.htList }" var="ht">


					<div class="column">
						<div class="ui card" >
							<div class="image">
								<img src="${ht.htMainPhoto}" onclick="InfoPage(${ht.indexNo})"
									style="width: 290px; height: 200px; cursor: pointer;">
							</div>
							<div class="content">
								<a class="header" onclick="InfoPage(${ht.indexNo})" style="height: 50px;">${ht.htTitle }</a>
								<div class="meta">
									<span class="date">${ht.htPart } |</span>
									 <i	class="heart outline icon"></i> 좋아요
									  <span class="like" style="color: red">${ht.htLike }</span>
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
					<c:if test="${requestScope.htpd.htList[0]!=null }">
						<div class="ui center aligned basic segment">
							<div class="ui pagination menu">${requestScope.htpd.pageNavi }</div>
						</div>
					</c:if>
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
				<br> <br>
			</div>

			<!-- 검색 +  dropdown : 제목, 내용, 작성자 -->
			<div class="ui basic floating dropdown button">
				<div class="text">선택</div>
				<i class="dropdown icon"></i>
				<div class="menu">
					<div class="item">제목</div>
					<div class="item">작성자</div>
				</div>
			</div>

			<div class="ui right action left icon input">
				<i class="search icon"></i> <input id="searchText" type="text"
					placeholder="Search">

				<button class="ui right red basic button"
					style="margin-left: 4px; margin-right: 40px;"
					onclick="searchBtn();">검색</button>

			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<!-- SCRIPT -->
<script type="text/javascript">

function InfoPage(me){
	location.href="/homeTrainingInfo.diet?indexNo="+me;
}

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

/* 검색 */
function searchBtn(){
	if(category==''){
		alert('분류를 선택해 주세요');
		return;
	}
	$searchText = $('#searchText').val();
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

function InfoPage(me){
	location.href="/homeTrainingInfo.diet?indexNo="+me;
}

</script>

</html>