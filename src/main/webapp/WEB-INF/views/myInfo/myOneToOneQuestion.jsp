<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			    <tr id="title">
			    <th style="width:25%; padding-left:100px;"><i class="question circle icon"></i>문의유형</th>
			    <th style="width:50%; padding-left:220px;"><i class="question circle icon"></i>제목</th>
			    <th style="width:25%; padding-left:60px;"><i class="question circle icon"></i>작성일</th>
			  
			   </tr>
			  </thead>
			  
			  <tbody>
				<c:forEach items="${list}" var = "m" >
				    <tr>
				      <td style="width:25%; padding-left:100px;">문의유형적기</td>
				      <td style="width:50%; padding-left:180px;"><a href="#">${m.title}</a></td>
				      <td style="width:25%; padding-left:40px;">${m.content}</td>
				    </tr>
			    </c:forEach>
			  </tbody>
	
			</table>
   			</div>	
   		</div>	
   		<br><br>
   	</c:if>
   	<c:if test="${sessionScope.member==null}">
   			<script>	
						location.href="/index.jsp";
						alert("로그인 후 이용해주세요");
			</script>
   	</c:if>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>	
</body>
</html>