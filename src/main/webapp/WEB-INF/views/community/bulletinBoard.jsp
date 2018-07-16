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


<div class="ui center aligned container">
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
  <tfoot>
    <tr><th colspan="4">
      <div class="ui right floated pagination menu">
        <a class="icon item">
          <i class="left chevron icon"></i>
        </a>
        <a class="item">1</a>
        <a class="item">2</a>
        <a class="item">3</a>
        <a class="item">4</a>
        <a class="icon item">
          <i class="right chevron icon"></i>
        </a>
      </div>
    </th>
  </tr></tfoot>
</table>
   </div>

<a class="ui card" href="http://www.dog.com">
  <div class="content">
    <div class="header">Cute Dog</div>
    <div class="meta">
      <span class="category">Animals</span>
    </div>
    <div class="description" style="display: inline-block;">
      <p >sdfdsfasfafdafasfasfadfafafafafafdfaadfasdfafafadfadsfasdffffffffffffffffffffffdddddddddddddddddddddddddddddfa</p>
    </div>
  </div>
  <div class="extra content">
    <div class="right floated author">
      <img class="ui avatar image" src="/resources/image/mainPic.jpg"> Matt
    </div>
  </div>
</a>

<div class="ui pagination menu">
  <a class="active item">
    1
  </a>
  <a class="item">
    2
  </a>
  <a class="item">
    3
  </a>
  <div class="disabled item">
    ...
  </div>
  <a class="item">
    12
  </a>
</div>
<button class="ui red basic button">Red</button>
<br><br>



<!-- 검색 +  dropdown : 제목, 내용, 작성자 -->


<div class="ui right action left icon input">
  <i class="search icon"></i>
  <input type="text" placeholder="Search">
  <div class="ui basic floating dropdown button">
    <div class="text">선택</div>
    <i class="dropdown icon"></i>
    <div class="menu">
      <div class="item">제목</div>
      <div class="item">내용</div>
      <div class="item">작성자</div>
    </div>
  </div>
</div>
</div>

   <!-- FOOTER -->
   <jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
$('.ui.dropdown')
.dropdown({
  allowAdditions: true,
  allowCategorySelection: true
})
;
</script>

</html>