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
  	 <div class="ui center aligned basic segment">
		<div class="ui container">
		<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
		<br>
   		<table class="ui gray table">
			  <thead>
			    <tr id="title">
			    <th style="width:20%; padding-left:100px;">쿠폰정보</th>
			    <th style="width:20%; padding-left:100px;">할인액</th>
			    <th style="width:30%; padding-left:140px;">사용조건</th>
			    <th style="width:30%; padding-left:100px;">유효기간</th>
			   </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td style="width:20%; padding-left:100px;">쿠폰명</td>
			      <td style="width:20%; padding-left:100px;">쿠폰할인액</td>
			      <td style="width:30%; padding-left:100px;">최소사용금액 :<br>최대할인금액     </td>
			      <td style="width:30%; padding-left:100px;">유효기간</td>
			    </tr>
			  </tbody>
		
		</table>
   		</div>			
	</div>

   <!-- FOOTER -->
   <jsp:include page="/resources/layout/footer.jsp"></jsp:include>
   
   
</body>

<!-- SCRIPT -->
<script type="text/javascript">
   
</script>

</html>