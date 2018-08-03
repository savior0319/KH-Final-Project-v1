<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>트레이너 회원 관리</title>
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
			<h1>트레이너 회원 관리</h1>
		</div>

		<table class="ui very compact table">
			<thead>
				<tr align="center">
					<th>트레이너번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>연락처</th>
					<th>성별</th>
					<th>회원등급</th>
					<th>트레이너 등록일</th>
					<th>회원 등급 변경</th>
				</tr>
			</thead>
			<c:if test="${requestScope.trpdv.trList[0] !=null}">
				<tbody>
					<c:forEach items="${requestScope.trpdv.trList}" var="tr">
						<input type="hidden" id="" />
						<tr align="center">
							<td>${tr.trIndex}</td>
							<td>${tr.mbId}</td>
							<td>${tr.trName}</td>
							<td>${tr.mbNickName}</td>
							<td>${tr.trPhone}</td>
							<c:choose>
								<c:when test="${tr.trGender eq 'f'}">
									<td>여자</td>
								</c:when>
								<c:otherwise>
									<td>남자</td>
								</c:otherwise>
							</c:choose>
							<td>${tr.mbGrade}</td>
							<td>
								<fmt:formatDate value="${tr.trRegDate}" pattern="yyyy-MM-dd HH:mm" />
							</td>
							<td>
								<button id="trInfo_${tr.trIndex}" onclick="gradeChange(${tr.mbIndex});" class="ui red button"
									style="margin-right: 0px; padding-top: 8px; padding-bottom: 8px; padding-left: 18px; padding-right: 18px;">
									<i class="exchange alternate icon" style="margin-left: 0px; margin-right: 0px;"></i>
								</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</c:if>
		</table>



		<c:if test="${requestScope.trpdv.trList[0] !=null}">
			<div class="ui center aligned basic segment">
				<div class="ui pagination menu">${requestScope.trpdv.pageNavi }</div>
			</div>
		</c:if>


	</div>





	<!-- FOOTER -->
</body>

<!-- SCRIPT -->
<script type="text/javascript">

/* 각 신청 페이지 이동 */
		 function gradeChange(mi){
			 var check = window.confirm("일반 회원으로 변경 하시겠습니까?");
				if(check == true){
				
				$.ajax({
					url : '/changeGrade.diet',
					type : 'post',
					data : {
						'mbIndex' : mi
					},
					success : function(data) {
						if (data=='success') {
							alert('일반 회원으로 등급이 변경 되었습니다.');
							location.href = "/trainerChange.diet";
						} else {
							alert('승인 실패!!');
						}
					},
					error : function() {
						alert('처리실패!!');
					}
				});	
				}else{
					
				}
				
		 }
	
</script>

</html>