<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>내정보게시판</title>
</head>

<!-- CSS -->
<style>
</style>


<body>
	<!-- HEADER -->

	<!-- CONTENTS -->
	<div class="ui center aligned basic segment">
		<div class="container">
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
				<c:forEach items="${requestScope.cpdv.comList}" var="c">
						<tr align="center" >
							<td>
							<c:choose>
							<c:when test="${c.bcaIndex==15}">자유게시판</c:when>
							<c:when test="${c.bcaIndex==17}">팁&노하우</c:when>
							<c:when test="${c.bcaIndex==18 }">고민&질문</c:when>
							<c:when test="${c.bcaIndex==19 }">비포&애프터</c:when>
							</c:choose> 
							
							</td>
							<td style="padding-top: 15px; padding-bottom: 15px;" onclick="recipeLink(${c.postIndex});" >
								<a class="item" href="/postedCommunity.diet">${c.postTitle}</a>
							</td>
							<td>
								<img class="ui avatar image" src="${c.postImage}">
								닉네임
							</td>
							<td>${c.postHit}</td>
							<td>${c.postDateTime}</td>
						</tr>
					</c:forEach>
					<%-- <c:forEach items="${list}" var="c">
						<tr align="center" style="height: 50px;">
							<td>비포&애프터</td>
							<td>
								<a class="item" href="/postedCommunity.diet">${c.postTitle}</a>
							</td>
							<td>
								<img class="ui avatar image" src="${c.postImage}">
								닉네임
							</td>
							<td>${c.postHit}</td>
							<td>${c.postDateTime}</td>
						</tr>
					</c:forEach> --%>
				</tbody>
			</table>
		</div>

		<br>



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
						<button class="ui right red basic button" style="margin-top: 19px;" id="writeBtn">
							<i class="edit icon"></i>
							등록
						</button>
					</div>
				</div>
			</div>
			<br>
		</div>
		<!-- 검색 +  dropdown : 제목, 내용, 작성자 -->
		<br>
		<div class="ui secondary segment">
			<div class="ui right action left icon input">
				<i class="search icon"></i>
				<input type="text" placeholder="Search">
				<div class="ui basic floating dropdown button">
					<div class="text">선택</div>
					<i class="dropdown icon"></i>
					<div class="menu">
						<div class="item">제목</div>
						<div class="item">내용</div>
						<div class="item">작성자</div>
					</div>
				</div>
			</div>
		</div>
			<!-- <table class="ui gray table">
				<thead>
					<tr align="center">
						<th>게시판</th>
						<th>제목</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr align="center">
						<td>게시판구분</td>
						<td><a href="#">게시물 제목 불러오기</a></td>
						<td>조회수넣기</td>
						<td>등록날짜넣기</td>
					</tr>
				</tbody>
			</table> -->
		</div>
	</div>

	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>