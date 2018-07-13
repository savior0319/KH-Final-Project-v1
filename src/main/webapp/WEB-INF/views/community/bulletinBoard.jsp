<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>자유게시판</title>
</head>

<!-- CSS -->
<style>

</style>


<body>
   <!-- HEADER -->
   <jsp:include page="/resources/layout/header.jsp"></jsp:include>

<div class="ui panorama test ad" data-text="Panorama"></div>
<h1>자유게시판</h1>

   <!-- CONTENTS -->
   <div class="ui center aligned basic segment">
   
<table class="ui very compact table">
  <thead>
    <tr><th>Name</th>
    <th>Status</th>
    <th>Another Status</th>
    <th>Notes</th>
  </tr></thead>
  <tbody>
    <tr>
      <td>John</td>
      <td>Approved</td>
      <td>Approved</td>
      <td>None</td>
    </tr>
    <tr>
      <td>Jamie</td>
      <td>Approved</td>
      <td>Approved</td>
      <td>Requires call</td>
    </tr>
    <tr>
      <td>John</td>
      <td>Approved</td>
      <td>Approved</td>
      <td>None</td>
    </tr>
    <tr>
      <td>Jamie</td>
      <td>Approved</td>
      <td>Approved</td>
      <td>Requires call</td>
    </tr>
    <tr>
      <td>John</td>
      <td>Approved</td>
      <td>Approved</td>
      <td>None</td>
    </tr>
    <tr>
      <td>Jamie</td>
      <td>Approved</td>
      <td>Approved</td>
      <td>Requires call</td>
    </tr>
    <tr>
      <td>John</td>
      <td>Approved</td>
      <td>Approved</td>
      <td>None</td>
    </tr>
    <tr>
      <td>Jamie</td>
      <td>Approved</td>
      <td>Approved</td>
      <td>Requires call</td>
    </tr>
  </tbody>
</table>
   </div>


   <!-- FOOTER -->
   <jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
   
</script>

</html>