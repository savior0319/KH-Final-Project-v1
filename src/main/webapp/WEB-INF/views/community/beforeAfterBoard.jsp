<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>성공후기</title>
</head>

<!-- CSS -->
<style>
.ui.card {
	width: 400px;
}
</style>



<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<div class="ui center aligned container">
		<div class="ui panorama test ad" data-text="Panorama" align="center"></div>
		<br>
		<br>
		<div class="ui left aligned container">
			<h1>&emsp;&nbsp;&nbsp;BEFORE & AFTER</h1>
		</div>
		<hr style="border: 2px solid #D5D5D5;">
		<br>
		<!-- CONTENTS -->

		<!-- 최신순, 조회순 -->
		<br>
		<div class="ui right aligned basic segment" style="margin: 0px; padding: 0px;">
			<div class="small ui basic buttons">
				<div class="ui button" style="padding-top: 7px; padding-bottom: 7px; padding-right: 10px; padding-left: 10px;">최신순</div>
				<div class="ui button" style="padding-top: 7px; padding-bottom: 7px; padding-right: 10px; padding-left: 10px;">조회순</div>
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
					<c:forEach items="${list}" var="c">
						<tr align="center" style="height: 50px;">
							<td>${c.bcaName}</td>
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
					</c:forEach>
				</tbody>
			</table>
		</div>

		<br>



		<div class="ui grid">
			<div class="three column row">
				<div class="column"></div>
				<div class="column">
					<div class="ui center aligned basic segment">
						<div class="ui pagination menu">
							<a class="icon item">
								<i class="left chevron icon disabled" id="prevIcon"></i>
							</a>
							<a class="item active"> 1 </a>
							<a class="item"> 2 </a>
							<a class="item"> 3 </a>
							<a class="item"> 4 </a>
							<a class="item"> 5 </a>
							<a class="icon item">
								<i class="right chevron icon" id="nextIcon"></i>
							</a>

						</div>
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


	</div>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	$('.ui.dropdown').dropdown({
		allowAdditions : true,
		allowCategorySelection : true
	});

	$('#writeBtn').click(function() {
		location.href = "/registCommunity.diet";
	});
</script>

</html>