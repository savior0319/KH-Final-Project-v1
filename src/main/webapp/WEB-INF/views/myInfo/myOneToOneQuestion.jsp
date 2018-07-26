<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>
	<c:if test="${sessionScope.member!=null}">
		<!-- CONTENTS -->
		<div class="ui container">
			<div class="ui center aligned basic segment">
				<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
				<br>
				<table class="ui gray table">
					<thead>
						<tr id="title" align="center">
							<th>
								<i class="question circle icon"></i>
								문의번호
							</th>
							<th>
								<i class="question circle icon"></i>
								제 목
							</th>
							<th>
								<i class="question circle icon"></i>
								작 성 일
							</th>
							<th>
								<i class="question circle icon"></i>
								답 변 여 부
							</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${list}" var="m">
							<tr align="center">
								<td>${m.qsIndex}</td>
								<td>
									<a href="#">${m.qsTitle}</a>
								</td>
								<td>${m.qsWriteTime}</td>
								<c:if test="${m.qsAnswerCheck=='n'}">
									<td>답변대기중</td>
								</c:if>
								<c:if test="${m.qsAnswerCheck =='y'}">
									<td>답변완료</td>
								</c:if>



							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
		</div>
		<br>
		<br>
	</c:if>
	<c:if test="${sessionScope.member==null}">
		<script>
			location.href = "/index.jsp";
			alert("로그인 후 이용해주세요");
		</script>
	</c:if>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>
</html>