<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>관리자 - 블랙리스트 신고 내역</title>
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
			<div class="ui center aligned segment">
				<div class="ui large message">
					<div class="ui large header">블랙리스트 신고 내역</div>
				</div>
				<table class="ui celled table">
						<thead>
						<tr align="center">
							<th>신고게시물 번호</th>
							<th>신고댓글</th>
							<th>신고사유</th>
							<th>신고자</th>
							<th>피신고자</th>
							<!-- <th>삭제</th> -->
						</tr>			
						</thead>
							<c:forEach items="${requestScope.content}" var="c">
							<tr class="sagi">
							<c:choose>
							<c:when test="${c.postIndex eq '0'}">
							<td>[댓글이 신고됨]</td>
							</c:when>
							<c:otherwise>
							<td><a href="/postedCommunity.diet?postIndex=${c.postIndex}" class="sagiNumber">${c.postIndex}</a></td>
							</c:otherwise>
							</c:choose>
							<c:choose>
							<c:when test="${c.targetContent eq null}">
							<td>[게시물이 신고됨]</td>
							</c:when>
							<c:otherwise>
							<td>${c.targetContent}</td>
							</c:otherwise>
							</c:choose>
							<td>${c.cmtContent}</td>
							<td>${c.mbNickName}</td>
							<td>${c.targetMbNickName}</td> 
	<!-- 						<c:if test="${c.postIndex eq '0'}">
	<td><button type="button" class="ui button" style="background: rgb(250,40,40); color: white;" onclick="deleteComment(${c.cmtIndex}, ${c.postIndex});">삭제</button></td>
	</c:if>
	<c:if test="${c.postIndex ne '0'}">
	<td><button type="button" class="ui button" style="background: rgb(250,40,40); color: white;" onclick="deletePost(${c.postIndex});">삭제</button></td>
	</c:if> -->
							</tr>
							</c:forEach>  
					</table>
				</div>
	<div align="center">
		<button onclick="back();" class="ui button" style="background: rgb(250,40,40); color: white;">뒤로가기</button>
	</div>
</div>

<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">

	/*$(document).ready(function() {
		if($('.sagiNumber').html() == '0'){
			$('.sagi').hide();
		}		
	});

*/
function back(){
	history.back(-1);
}

function deletePost(index){

	alert("게시글 삭제 : " + index);

	$.ajax({
		url : '/deletePost.diet',
		type : 'POST',
		data : {'postIndex' : index},
		success : function(){
			alert('삭제 성공');
			location.reload();
		},
		error : function(){
			alert('삭제 실패');
			location.reload();
		}
	});

}

function deleteComment(index, boardIndex){
	alert("댓글 삭제 : "  + index);

		$.ajax({
		url : '/deleteComment.diet',
		type : 'POST',
		data : {'commentIndex' : index, 'indexNo' : boardIndex},
		success : function(data){
			if(data == 1){
			alert('삭제 성공');
			location.reload();
			} else {
			alert('삭제 실패');
			location.reload();
			}
		},
		error : function(){
			alert('삭제 실패');
			location.reload();
		}
	});

}
</script>

</html>