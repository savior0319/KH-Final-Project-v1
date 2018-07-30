<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>트레이너 찾기</title>
</head>

<!-- CSS -->
<style>
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
		<div class="ui center aligned container">
		트레이너 찾기
		
		</div>
		
		
				<!-- 검색 -->
		<div class="ui fluid action input">
  <input type="text" placeholder="Search...">
  <div class="ui button">Search</div>
</div>
		
		
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

			<div class="ui link items">
  <div class="item">
    <div class="ui tiny image">
      <img src="/resources/image/user.png">
    </div>
    <div class="content">
      <div class="header">Stevie Feliciano</div>
      <div class="description">
        <p>ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>
      </div>
    </div>
  </div><br>
  <div class="item">
    <div class="ui tiny image">
      <img src="/resources/image/user.png">
    </div>
    <div class="content">
      <div class="header">Veronika Ossi</div>
      <div class="description">
        <p>ㄴㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>
      </div>
    </div>
  </div><br>
  <div class="item">
    <div class="ui tiny image">
      <img src="/resources/image/user.png">
    </div>
    <div class="content">
      <div class="header">Jenny Hess</div>
      <div class="description">
        <p>ㄶㅀㄶㄴㅀㄹㄶㄶㅎㅇㅎㄴㅀ</p>
      </div>
    </div>
  </div>
</div>

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

</script>

</html>