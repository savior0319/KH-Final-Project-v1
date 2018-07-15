<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>성공후기</title>
</head>

<!-- CSS -->
<style>

</style>



<body>
   <!-- HEADER -->
   <jsp:include page="/resources/layout/header.jsp"></jsp:include>


<div class="ui center aligned container">
<div class="ui panorama test ad" data-text="Panorama"></div>
<h1>성공후기 게시판</h1>

   <!-- CONTENTS -->
   <div class="ui center aligned basic segment">
<div class="ui card">
  <div class="content">
    <div class="right floated meta">14h</div>
    <img class="ui avatar image" src="/resources/image/logo.png"> Elliot
  </div>
  <div class="image">
    <img  src="/resources/image/mainPic.jpg">
  </div>
  <div class="content">
    <span class="right floated">
      <i class="heart outline like icon"></i>
      17 likes
    </span>
    <i class="comment icon"></i>
    3 comments
  </div>
  <div class="extra content">
    <div class="ui large transparent left icon input">
      <i class="heart outline icon"></i>
      <input type="text" placeholder="Add Comment...">
    </div>
  </div>
</div>


<div class="ui card">
  <div class="content">
    <div class="right floated meta">14h</div>
    <img class="ui avatar image" src="/resources/image/logo.png"> Elliot
  </div>
  <div class="image">
    <img  src="/resources/image/mainPic.jpg">
  </div>
  <div class="content">
    <span class="right floated">
      <i class="heart outline like icon"></i>
      17 likes
    </span>
    <i class="comment icon"></i>
    3 comments
  </div>
  <div class="extra content">
    <div class="ui large transparent left icon input">
      <i class="heart outline icon"></i>
      <input type="text" placeholder="Add Comment...">
    </div>
  </div>
</div>


<div class="ui card">
  <div class="content">
    <div class="right floated meta">14h</div>
    <img class="ui avatar image" src="/resources/image/logo.png"> Elliot
  </div>
  <div class="image">
    <img  src="/resources/image/mainPic.jpg">
  </div>
  <div class="content">
    <span class="right floated">
      <i class="heart outline like icon"></i>
      17 likes
    </span>
    <i class="comment icon"></i>
    3 comments
  </div>
  <div class="extra content">
    <div class="ui large transparent left icon input">
      <i class="heart outline icon"></i>
      <input type="text" placeholder="Add Comment...">
    </div>
  </div>
</div>




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