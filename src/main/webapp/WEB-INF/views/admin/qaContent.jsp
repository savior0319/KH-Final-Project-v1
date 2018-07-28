<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	<br>
	<div class="ui container">
		<h2 class="ui center aligned container">
			<i class="quote left icon"></i>
			${requestScope.qData.qsTitle}
			<i class="quote right icon"></i>
		</h2> 
		<br>
		<hr>
		<br>
		<div class="ui clearing segment">
			작성자 - ${requestScope.qData.mbNickName}<br>
			작성일 - <fmt:formatDate value="${qData.qsWriteTime}" pattern="yyyy-MM-dd HH:mm"/>
			<br>
			<hr>
			<h3>문의 내용</h3> 
			<br>
			${requestScope.qData.qsContent}
		</div>
		<br>
		<div class="ui clearing segment">
			<h3>답변 내용</h3> 
			<br>
			<c:choose>
			<c:when test="${requestScope.qData.ansContent eq null}">
			답변 대기 중
		</c:when>
		<c:otherwise>
		${requestScope.qData.ansContent}
	</c:otherwise>
</c:choose>
</div>
<div class="ui center aligned basic segment">
	<button id="btnCheck" class="ui button" type="button" style="background: rgb(250,40,40); color: white;" onclick="doAnswer();">답변하기</button>
</div>
</div>
</body>

<!-- 1:1 답변하기 -->
<div class="ui modal" id="answerModal">
	<i class="close icon"></i>
	<div class="ui large header">답변하기</div>
	<div class="ui left aligned basic segment">
		<br>
		<div class="ui form" style="font-weight: 600;">
			<div class="field">
				<label>내용</label>
				<textarea placeholder="내용 입력" style="height: 312px;" id="content"></textarea>
			</div>
		</div>
	</div>
	<div class="ui right aligned basic segment" style="padding-top: 0px; margin-top: 0px;">
		<button class="ui blue button" onclick="answerSub();">답변완료</button>
	</div>
</div>

<!-- SCRIPT -->
<script type="text/javascript">

	function doAnswer(){
		$('#answerModal').modal({ centered: false }).modal('show');
	}

	function answerSub(){
		var content = $('#content').val();
		var index = '${requestScope.qData.qsIndex}';

		$.ajax({
			url : '/answerReg.diet',
			type : 'POST',
			data : {'content' : content, 'index' : index},
			success : function(value){
				if(value == '1'){
					alert('답변하기 완료');
					location.href="/answer.diet";
				} else {
					alert('답변하기 실패');
					location.href="/answer.diet";
				}
			},
			error : function(){
				alert('답변하기 실패');
				location.href="/answer.diet";
			}
		});
	}

	$(document).ready(function() {
		var btnCheck = '${requestScope.qData.ansContent}';
		if(btnCheck != ''){
			$('#btnCheck').css('display', 'none');
		} 
	});

</script>

</html>