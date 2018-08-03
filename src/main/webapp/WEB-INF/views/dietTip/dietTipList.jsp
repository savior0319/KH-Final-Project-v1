<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<script src="/resources/slider/responsiveslides.min.js"></script>
<title>다이어트</title>
</head>

<!-- CSS -->
<style>
.singo {
	text-align: left;
}

p>span {
	text-indent: 10px;
	display: inline-block;
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


<body>
	<input type="hidden" id="type" value="${requestScope.dtpd.type }">
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div id="size1" class="ui container">
		<!-- 슬라이드-->
		<ul class="rslides">
			<li><img src="/resources/image/mainPic.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic1.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic2.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic3.jpg" style="height: 250px;"></li>
		</ul>

		<c:if test="${requestScope.dtpd.type.equals('all') && sessionScope.member!=null }">
			<h3 class="ui left aligned header">맞춤 다이어트 꿀팁</h3>

			<!-- 제목 이미지 출력  -->
			<div class="ui three column grid">
				<div class="column">
					<div class="ui card">
						<div class="image" style="cursor: pointer;" onclick="goInfo(${requestScope.matchedList[0].dtIndex}, ${requestScope.matchedList[0].dtType});">
							<img src="${requestScope.matchedList[0].dtMainPhoto} " style="width: 100%; height: 200px;">
						</div>
						<div class="content">
							<a class="header" onclick="goInfo(${requestScope.matchedList[0].dtIndex}, ${requestScope.matchedList[0].dtType});">${requestScope.matchedList[0].dtTitle }</a>
							<div class="meta">
								<span class="date"> <c:choose>
										<c:when test="${requestScope.matchedList[0].dtType==1 }">
										칼럼 |
									</c:when>
										<c:when test="${requestScope.matchedList[0].dtType==2 }">
										운동 |
									</c:when>
										<c:when test="${requestScope.matchedList[0].dtType==3 }">
										식단 |
									</c:when>
										<c:when test="${requestScope.matchedList[0].dtType==4 }">
										성공후기 |
									</c:when>
									</c:choose>

								</span> <i class="heart outline icon"></i> 좋아요 <span class="like" style="color: red">${requestScope.matchedList[0].dtLike }</span>
							</div>
						</div>
					</div>
				</div>
				<div class="column">
					<div class="ui card">
						<div class="image" style="cursor: pointer;" onclick="goInfo(${requestScope.matchedList[1].dtIndex}, ${requestScope.matchedList[1].dtType});">
							<img src="${requestScope.matchedList[1].dtMainPhoto} " style="width: 100%; height: 200px;">
						</div>
						<div class="content">
							<a class="header" onclick="goInfo(${requestScope.matchedList[0].dtIndex}, ${requestScope.matchedList[0].dtType});">${requestScope.matchedList[1].dtTitle }</a>
							<div class="meta">
								<span class="date"> <c:choose>
										<c:when test="${requestScope.matchedList[1].dtType==1 }">
										칼럼 |
									</c:when>
										<c:when test="${requestScope.matchedList[1].dtType==2 }">
										운동 |
									</c:when>
										<c:when test="${requestScope.matchedList[1].dtType==3 }">
										식단 |
									</c:when>
										<c:when test="${requestScope.matchedList[1].dtType==4 }">
										성공후기 |
									</c:when>
									</c:choose>

								</span> <i class="heart outline icon"></i> 좋아요 <span class="like" style="color: red">${requestScope.matchedList[1].dtLike }</span>
							</div>
						</div>
					</div>
				</div>
				<div class="column">
					<div class="ui card">
						<div class="image" style="cursor: pointer;" onclick="goInfo(${requestScope.matchedList[2].dtIndex}, ${requestScope.matchedList[2].dtType});">
							<img src="${requestScope.matchedList[2].dtMainPhoto} " style="width: 100%; height: 200px;">
						</div>
						<div class="content">
							<a class="header" onclick="goInfo(${requestScope.matchedList[0].dtIndex}, ${requestScope.matchedList[0].dtType});">${requestScope.matchedList[2].dtTitle }</a>
							<div class="meta">
								<span class="date"> <c:choose>
										<c:when test="${requestScope.matchedList[2].dtType==1 }">
										칼럼 |
									</c:when>
										<c:when test="${requestScope.matchedList[2].dtType==2 }">
										운동 |
									</c:when>
										<c:when test="${requestScope.matchedList[2].dtType==3 }">
										식단 |
									</c:when>
										<c:when test="${requestScope.matchedList[2].dtType==4 }">
										성공후기 |
									</c:when>
									</c:choose>

								</span> <i class="heart outline icon"></i> 좋아요 <span class="like" style="color: red">${requestScope.matchedList[2].dtLike }</span>
							</div>
						</div>
					</div>
				</div>
			</div>

		</c:if>



		<div class="ui celled grid" style="box-shadow: 0 0 0 0px #d4d4d5;">
			<div class="row" id="main_title" style="padding-bottom: 10px; padding-top: 10px; border-bottom: 3px solid black">
				<div class="ui large header" style="width: 80%; height: 100%;">
					다이어트꿀팁
					<c:choose>
						<c:when test="${requestScope.dtpd.type.equals('all') }"></c:when>
						<c:when test="${requestScope.dtpd.type.equals('column') }">(칼럼)</c:when>
						<c:when test="${requestScope.dtpd.type.equals('sport') }">(운동)</c:when>
						<c:when test="${requestScope.dtpd.type.equals('dietFood') }">(식단)</c:when>
						<c:when test="${requestScope.dtpd.type.equals('successLatter') }">(성공후기)</c:when>
					</c:choose>
				</div>
				<div style="width: 20%; height: 100%;"></div>
			</div>



			<c:forEach items="${requestScope.dtpd.dtList }" var="dt">

				<div class="row" style="padding-top: 20px; padding-bottom: 20px; border-bottom: 1px solid lightgrey;">
					<div class="four wide column">
						<img src="${dt.dtMainPhoto }" style="width: 100%; height: 100%; cursor: pointer;" onclick="goInfo(${dt.dtIndex}, ${dt.dtType });">
					</div>
					<div class="twelve wide column">
						<strong style="cursor: pointer;" onclick="goInfo(${dt.dtIndex}, ${dt.dtType });">${dt.dtTitle }</strong>
						<div style="cursor: pointer; width: 100%; height: 55px; overflow: hidden; text-overflow: ellipsis; text-indent: 5px;" onclick="goInfo(${dt.dtIndex}, ${dt.dtType });">${dt.dtSammary }</div>
						<br>
						<div class="ui grid">
							<div class="four wide column">
								<i class="clock outline icon"></i>
								<fmt:formatDate value="${dt.dtDate }" pattern="yyyy-MM-dd" />
							</div>
							<div class="four wide column">
								<i class="eye icon"></i> ${dt.dtSee }
							</div>
							<div class="four wide column">
								<i class="comment icon"></i> ${dt.dtCmtNo }
							</div>
							<c:if test="${dt.dtWriterNo == sessionScope.member.mbIndex }">
								<div class="four wide column">
									<a style="cursor: pointer;" onclick="updateDietTip(${dt.dtIndex})">수정</a> &nbsp;|&nbsp;&nbsp; <a style="cursor: pointer;" onclick="deleteDietTip(${dt.dtIndex});">삭제</a>
								</div>
							</c:if>
						</div>
					</div>
				</div>

			</c:forEach>

		</div>


		<div class="ui grid">
			<div class="three column row">
				<div class="four wide column"></div>
				<div class="eight wide column">
					<c:if test="${requestScope.dtpd.dtList[0]!=null }">
						<div class="ui center aligned basic segment">
							<div class="ui pagination menu">${requestScope.dtpd.pageNavi }</div>
						</div>
					</c:if>
				</div>
				<div class="four wide column">
					<c:choose>
						<c:when test="${sessionScope.member!=null }">
							<div class="ui right aligned container">
								<button class="ui right red basic button" style="margin-top: 19px;" id="writeBtn" onclick="dietTipWrite();">
									<i class="edit icon"></i> 등록
								</button>
							</div>
						</c:when>
					</c:choose>
				</div>
			</div>
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
							<div class="item">제목+내용</div>
							<div class="item">작성자</div>
						</div>
					</div>
					<input type="text" placeholder="Search..." id="searchText"> <i class="circular search link icon" onclick="searchBtn()"></i>
				</div>
			</div>

		</div>

	</div>




	<!-- 너비 400px 이하 -->
	<div id="size2" class="ui container">
		<!-- 슬라이드-->
		<ul class="rslides">
			<li><img src="/resources/image/mainPic.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic1.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic2.jpg" style="height: 250px;"></li>
			<li><img src="/resources/image/mainPic3.jpg" style="height: 250px;"></li>
		</ul>

		<c:if test="${requestScope.dtpd.type.equals('all') && sessionScope.member!=null }">
			<h3 class="ui left aligned header">맞춤 다이어트 꿀팁</h3>

			<!-- 제목 이미지 출력  -->
			<div align="center">
					<div class="ui card">
						<div class="image" style="cursor: pointer;" onclick="goInfo(${requestScope.matchedList[0].dtIndex}, ${requestScope.matchedList[0].dtType});">
							<img src="${requestScope.matchedList[0].dtMainPhoto} " style="width: 100%; height: 200px;">
						</div>
						<div class="content">
							<a class="header" onclick="goInfo(${requestScope.matchedList[0].dtIndex}, ${requestScope.matchedList[0].dtType});">${requestScope.matchedList[0].dtTitle }</a>
							<div class="meta">
								<span class="date"> <c:choose>
										<c:when test="${requestScope.matchedList[0].dtType==1 }">
										칼럼 |
									</c:when>
										<c:when test="${requestScope.matchedList[0].dtType==2 }">
										운동 |
									</c:when>
										<c:when test="${requestScope.matchedList[0].dtType==3 }">
										식단 |
									</c:when>
										<c:when test="${requestScope.matchedList[0].dtType==4 }">
										성공후기 |
									</c:when>
									</c:choose>

								</span> <i class="heart outline icon"></i> 좋아요 <span class="like" style="color: red">${requestScope.matchedList[0].dtLike }</span>
							</div>
						</div>
					</div>
					<div class="ui card">
						<div class="image" style="cursor: pointer;" onclick="goInfo(${requestScope.matchedList[1].dtIndex}, ${requestScope.matchedList[1].dtType});">
							<img src="${requestScope.matchedList[1].dtMainPhoto} " style="width: 100%; height: 200px;">
						</div>
						<div class="content">
							<a class="header" onclick="goInfo(${requestScope.matchedList[0].dtIndex}, ${requestScope.matchedList[0].dtType});">${requestScope.matchedList[1].dtTitle }</a>
							<div class="meta">
								<span class="date"> <c:choose>
										<c:when test="${requestScope.matchedList[1].dtType==1 }">
										칼럼 |
									</c:when>
										<c:when test="${requestScope.matchedList[1].dtType==2 }">
										운동 |
									</c:when>
										<c:when test="${requestScope.matchedList[1].dtType==3 }">
										식단 |
									</c:when>
										<c:when test="${requestScope.matchedList[1].dtType==4 }">
										성공후기 |
									</c:when>
									</c:choose>

								</span> <i class="heart outline icon"></i> 좋아요 <span class="like" style="color: red">${requestScope.matchedList[1].dtLike }</span>
							</div>
						</div>
					</div>
					<div class="ui card">
						<div class="image" style="cursor: pointer;" onclick="goInfo(${requestScope.matchedList[2].dtIndex}, ${requestScope.matchedList[2].dtType});">
							<img src="${requestScope.matchedList[2].dtMainPhoto} " style="width: 100%; height: 200px;">
						</div>
						<div class="content">
							<a class="header" onclick="goInfo(${requestScope.matchedList[0].dtIndex}, ${requestScope.matchedList[0].dtType});">${requestScope.matchedList[2].dtTitle }</a>
							<div class="meta">
								<span class="date"> <c:choose>
										<c:when test="${requestScope.matchedList[2].dtType==1 }">
										칼럼 |
									</c:when>
										<c:when test="${requestScope.matchedList[2].dtType==2 }">
										운동 |
									</c:when>
										<c:when test="${requestScope.matchedList[2].dtType==3 }">
										식단 |
									</c:when>
										<c:when test="${requestScope.matchedList[2].dtType==4 }">
										성공후기 |
									</c:when>
									</c:choose>

								</span> <i class="heart outline icon"></i> 좋아요 <span class="like" style="color: red">${requestScope.matchedList[2].dtLike }</span>
							</div>
						</div>
					</div>
				</div>
			<br>
		</c:if>

		<div class="ui center aligned celled grid" style="box-shadow: 0 0 0 0px #d4d4d5;">
			<div class="row" id="main_title" style="padding-bottom: 10px; padding-top: 10px; border-bottom: 3px solid black">
				<div class="ui large header" style="width: 80%; height: 100%;">
					다이어트꿀팁
					<c:choose>
						<c:when test="${requestScope.dtpd.type.equals('all') }"></c:when>
						<c:when test="${requestScope.dtpd.type.equals('column') }">(칼럼)</c:when>
						<c:when test="${requestScope.dtpd.type.equals('sport') }">(운동)</c:when>
						<c:when test="${requestScope.dtpd.type.equals('dietFood') }">(식단)</c:when>
						<c:when test="${requestScope.dtpd.type.equals('successLatter') }">(성공후기)</c:when>
					</c:choose>
				</div>
				<div style="width: 20%; height: 100%;"></div>
			</div>


			<c:forEach items="${requestScope.dtpd.dtList }" var="dt">

				<div class="ui card">
					<div class="image">
						<img src="${dt.dtMainPhoto }" onclick="goInfo(${dt.dtIndex}, ${dt.dtType });" style="cursor:pointer;">
					</div>
					<div class="content">
						<a class="header" onclick="goInfo(${dt.dtIndex}, ${dt.dtType });">${dt.dtTitle }</a>
						<div class="meta">
							<span class="date"><fmt:formatDate value="${dt.dtDate }" pattern="yyyy-MM-dd" /></span>
						</div>
						<div class="description" style="cursor: pointer; width: 100%; height: 55px; overflow: hidden; text-overflow: ellipsis; text-indent: 5px;" onclick="goInfo(${dt.dtIndex}, ${dt.dtType });">${dt.dtSammary }</div>
					</div>
					<div class="extra content">
						<i class="eye icon"></i> ${dt.dtSee } &nbsp;&nbsp;|&nbsp;&nbsp; <i class="comment icon"></i> ${dt.dtCmtNo }
						<c:if test="${dt.dtWriterNo == sessionScope.member.mbIndex }">
						<div style="float:right;">
								<a style="cursor: pointer; margin-right:10px" onclick="updateDietTip(${dt.dtIndex})">수정</a>
								<a style="cursor: pointer; " onclick="deleteDietTip(${dt.dtIndex});">삭제</a>
								</div>
						</c:if>
					</div>
				</div>

			</c:forEach>

		</div>


		<div class="ui center aligned grid">

			<c:if test="${requestScope.dtpd.dtList[0]!=null }">
				<div class="ui center aligned basic segment" style="margin: 0; padding: 0;">
					<div class="ui pagination menu" align="center">${requestScope.dtpd.pageNavi }</div>
				</div>
			</c:if>

			<!-- 모바일에서는 글 작성 못하게 -->
			<%-- <c:choose>
				<c:when test="${sessionScope.member!=null }">
					<div class="ui right aligned container">
						<button class="ui right red basic button" style="margin-top: 10px;" id="writeBtn" onclick="dietTipWrite();">
							<i class="edit icon"></i> 게시물 작성
						</button>
					</div>
				</c:when>
			</c:choose> --%>


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
							<div class="item">제목+내용</div>
							<div class="item">작성자</div>
						</div>
					</div>
					<input type="text" placeholder="Search..." id="searchText2" style="width: 70%;"> <i class="circular search link icon" onclick="searchBtn()"></i>
				</div>
			</div>

		</div>

	</div>


	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
//슬라이드
	$(function() {
		$(".rslides").responsiveSlides({
			auto : true,
			timeout : 1500,
		});
	});

	function goInfo(me, me2){
		var type;
		if(me2 == 1){
			type = "column";
		}else if(me2 == 2){
			type = "sport";
		}else if(me2 == 3){
			type = "dietFood";
		}else if(me2 == 4){
			type = "successLatter";
		}
		
		location.href="/dietTipInfo.diet?indexNo="+me+"&type="+type;
	}
	
	// 게시물 등록
	function dietTipWrite(){
		
		$.ajax({
			url : '/dtWriteAuthorityCheck.diet',
			type : 'post',
			success : function(result){
				if(result>0){
					location.href = "/loadDietTipWrite.diet";
				}else{
					alert('권한이 없습니다.');
				}
				
			},
			error : function(result){
				alert('권한이 없습니다.');
			}
		});
	}
	
	$('.ui.dropdown').dropdown({
	      allowAdditions : true,
	      allowCategorySelection : true
	   });
	
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
		
		location.href = "/dietTipList.diet?category="+ category +"&searchText=" + $searchText + "&type=" + $type;
	}
	
	// 게시물 삭제
	function deleteDietTip(me){
		var type = $('#type').val();
		$.ajax({
			url : "dietTipDelete.diet?indexNo="+me,
			type : 'post',
			success : function(data){
				if(data>0){
					alert('삭제 완료');
					location.href = 'dietTipList.diet?type='+type;
				}else{
					alert('삭제 실패');
					location.href = 'dietTipList.diet?type='+type;
				}
			},
			error : function(data){
				alert('에러 발생');
				location.href = 'dietTipList.diet?type='+type;
			}
		});
		
	}
	
	// 게시물 수정
	function updateDietTip(me){
		location.href = "loadUpdateDietTip.diet?indexNo=" + me;
	}
	
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