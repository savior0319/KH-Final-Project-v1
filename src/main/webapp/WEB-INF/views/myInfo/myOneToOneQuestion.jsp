<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>
	

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
			
			    <tr>
			      <td style="width:25%; padding-left:95px;">일대일 문의유형</td>
			      <td style="width:50%; padding-left:150px;"><a href="#">일대일 문의 제목을 가져와요~!</a></td>
			      <td style="width:25%; padding-left:40px;">2018년 00월 00일 </td>
			    </tr>
			
			    <c:forEach var="item" items="${list}">
			    <tr>
			      <td style="width:25%; padding-left:95px;">${sessionScope.list}</td>
			      <td style="width:50%; padding-left:150px;"><a href="#">${sessionScope.list}</a></td>
			      <td style="width:25%; padding-left:40px;">${sessionScope.list}</td>
			    </tr>
			    </c:forEach>
			  </tbody>
		
			</table>
   			</div>	
   		</div>	
   		<br><br>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>	
</body>
</html>