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
	<div class="ui center aligned basic segment">

		<div class="ui center aligned container">
			<div class="ui panorama test ad" data-text="Panorama"></div>
		
		<h1 class="ui left aligned header">홈트레이닝 > 
			
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
				
				</h1><hr><br>				
				
				<!-- 운동부위별 값 넣을곳 -->
				<div class="ui three column grid">	
				<c:forEach items="${requestScope.htpd.htList }" var="ht">
				
				
					<div class="column">
						<div class="ui card" onclick="InfoPage(${ht.indexNo})">
							<div class="image">
								<img src="${ht.htMainPhoto}" style="width: 290px;height:200px;">
							</div>
							<div class="content">
								<a class="header">${ht.htTitle }</a>
								<div class="meta">
									<span class="date">${ht.htPart } |</span> <i class="heart outline icon"></i>
									좋아요 <span class="like" style="color: red">${ht.htHits }</span>
								</div>
							</div>
						</div>
					</div>
				
				
				</c:forEach>
				</div>	

				<br> <br>


				<div class="ui center aligned basic segment">
				<div class="ui pagination menu">${requestScope.htpd.pageNavi }</div>
				</div>
				
				<!-- 검색 +  dropdown : 제목, 내용, 작성자 -->
				<div class="ui basic floating dropdown button">
					<div class="text">선택</div>
					<i class="dropdown icon"></i>
					<div class="menu">
						<div class="item">제목</div>
						<div class="item">내용</div>
						<div class="item">작성자</div>
					</div>

				</div>

				<div class="ui right action left icon input">
					<i class="search icon"></i> <input type="text" placeholder="Search">

					<button class="ui right red basic button"
						style="margin-left: 4px; margin-right: 40px;">검색</button>

				</div>
			</div>
		</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<script type="text/javascript">
	function InfoPage(me){
		location.href="/homeTrainingInfo.diet?indexNo="+me;
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

</script>
</html>


