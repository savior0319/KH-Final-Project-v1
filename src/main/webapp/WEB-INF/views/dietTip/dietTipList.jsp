<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<img src="/resources/image/mainPic.jpg" style="width: 90%;">
		</div>
		<div class="ui celled grid" style="box-shadow: 0 0 0 0px #d4d4d5;">
			<div class="row" id="main_title" style="padding-bottom: 10px; padding-top: 10px; border-bottom: 3px solid black">
				<div class="ui large header">
					다이어트꿀팁
					<c:choose>
						<c:when test="${requestScope.dtpd.type.equals('all') }"></c:when>
						<c:when test="${requestScope.dtpd.type.equals('column') }">(칼럼)</c:when>
					</c:choose>
				</div>
			</div>

			<c:forEach items="${requestScope.dtpd.dtList }" var="dt">

				<div class="row" style="padding-top: 20px; padding-bottom: 20px;" onclick="goInfo(${dt.dtIndex});">
					<div class="four wide column">
						<img src="${dt.dtMainPhoto }" style="width: 100%; height: 100%; cursor:pointer;" onclick="goInfo(${dt.dtIndex});">
					</div>
					<div class="twelve wide column" style="cursor:pointer;">
						<strong>${dt.dtTitle }</strong>
						<div style="width: 100%; height: 55px; overflow: hidden; text-overflow: ellipsis; text-indent:5px;">${dt.dtSammary }</div>
						<br>
						<div class="ui grid">
							<div class="four wide column">
								<i class="clock outline icon"></i> ${dt.dtDate }
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
		<div class="ui center aligned basic segment">
			<div class="ui pagination menu">${requestScope.dtpd.pageNavi }</div>
		</div>


		<div class="ui center aligned basic segment">
			<div class="ui action input">
				<select class="ui compact selection dropdown" style="padding-top: 2%">
					<option value="all">All</option>
					<option selected="" value="articles">제목</option>
					<option value="products">내용</option>
					<option value="products">작성자</option>
				</select> <input type="text">
				<div class="ui button">검색</div>
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
</script>

<!-- 
<script>
	$(document)
			.ready(
					function() {
						var val = $('.sammary>p>span');
						for (var i = 0; i < val.length; i++) {
							console.log(val[i].innerHTML);
							document.getElementsByName('sammary')[i].innerHTML = val[i].innerHTML;
						}
					});
</script>
 -->


</html>