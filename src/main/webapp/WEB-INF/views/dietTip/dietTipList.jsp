<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	<input type="hidden" id="type" value="${requestScope.dtpd.type }">
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">
			<img src="/resources/image/mainPic.jpg" style="width: 90%;">
		</div>
		<div class="ui celled grid" style="box-shadow: 0 0 0 0px #d4d4d5;">
			<div class="row" id="main_title" style="padding-bottom: 10px; padding-top: 10px; border-bottom: 3px solid black">
				<div class="ui large header" style="width: 80%; height: 100%;">
					다이어트꿀팁
					<c:choose>
						<c:when test="${requestScope.dtpd.type.equals('all') }"></c:when>
						<c:when test="${requestScope.dtpd.type.equals('column') }">(칼럼)</c:when>
					</c:choose>
				</div>
				<div style="width: 20%; height: 100%;"></div>
			</div>

			<c:forEach items="${requestScope.dtpd.dtList }" var="dt">

				<div class="row" style="padding-top: 20px; padding-bottom: 20px; border-bottom: 1px solid lightgrey;" onclick="goInfo(${dt.dtIndex});">
					<div class="four wide column">
						<img src="${dt.dtMainPhoto }" style="width: 100%; height: 100%; cursor: pointer;" onclick="goInfo();">
					</div>
					<div class="twelve wide column" style="cursor: pointer;">
						<strong>${dt.dtTitle }</strong>
						<div style="width: 100%; height: 55px; overflow: hidden; text-overflow: ellipsis; text-indent: 5px;">${dt.dtSammary }</div>
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
								<i class="comment icon"></i> 10
							</div>
						</div>
					</div>
				</div>

			</c:forEach>

		</div>


		<div class="ui grid">
			<div class="three column row">
				<div class="four wide column"></div>
				<div class="eight wide column">
					<div class="ui center aligned basic segment">
						<div class="ui pagination menu">${requestScope.dtpd.pageNavi }</div>
					</div>
				</div>
				<div class="four wide column">
					<div class="ui right aligned container">
						<button class="ui right red basic button" style="margin-top: 19px;" id="writeBtn" onclick="dietTipWrite();">
							<i class="edit icon"></i> 등록
						</button>
					</div>
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


	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	function goInfo(me){
		location.href="/dietTipInfo.diet?indexNo="+me;
	}
	
	function dietTipWrite(){
		location.href="/loadDietTipWrite.diet";
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
			alert('분류를 선택해 주세요');
			return;
		}
		$searchText = $('#searchText').val();
		$type = $('#type').val();
		location.href = "/dietTipList.diet?category="+ category +"&searchText=" + $searchText + "&type=" + $type;
	}
	
	function recentlyViewBtn(rtb) {
		var postSort = rtb.innerHTML;
		location.href = "/dietTipList.diet?type=" + type +"&postSort=" + postSort + "&searchText=" + st + "&category="+ cate;

	}
	
</script>


</html>