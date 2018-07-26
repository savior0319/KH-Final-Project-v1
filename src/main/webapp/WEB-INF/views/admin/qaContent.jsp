<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>다이어트</title>
</head>

<!-- CSS -->
<style>
body {
	margin-left: 240px;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/adminheader.jsp"></jsp:include>


	<!-- CONTENTS -->
	<br>
	<br>
	<div class="ui container">
		<h2 class="ui center aligned container">
			<i class="quote left icon"></i>
			${requestScope.qData.qsTitle}
			<i class="quote right icon"></i>
		</h2> 
		<div class="ui clearing segment">
			<h3>문의 내용</h3> 
			<br>
			${requestScope.qData.qsContent}
		</div>

		<hr>

		<div class="ui clearing segment">
			<h3>답변 내용</h3> 
			<br>
			답변대기중
		</div>
		<div class="ui center aligned basic segment">
			<button class="ui button" type="button" style="background: rgb(250,40,40); color: white;">답변하기</button>
		</div>


	</div>

	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">

</script>

</html>