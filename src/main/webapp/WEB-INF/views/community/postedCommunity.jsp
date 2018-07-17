<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>글등록된 페이지</title>
</head>

<!-- CSS -->
<style>
</style>



<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui center aligned container">
		<div class="ui panorama test ad" data-text="광고광고광고"></div>
		<br> <br>

		<!-- 상단 게시판 종류 -->
		<h2 class="ui header">
			<i class="comment icon"></i>
			<div class="content">
				자유게시판
				<div class="sub header">Community</div>
			</div>
		</h2>

		<hr style="border: 2px solid #D5D5D5;">
		<br> <br>
		
		
		<!-- 제목 -->
  
<h2><i class="quote left icon"></i>제목 제목 제목 제목<i class="quote right icon"></i>
</h2>

	  
	  <!-- 닉네임, 날짜, 뷰수, 댓글 수 -->
		<div class="ui black segment">
		<span class="ui left aligned container" style="">
			<span class="ui left aligned">
				<a> <img class="ui avatar image"
					src="/resources/image/mainPic.jpg"> 닉네임
				</a>
			</span>
		</span>	
		
		<span class="ui right aligned container">
			<!-- 날짜 -->
			<span class="ui right aligned">
			<i class="calendar icon"></i>
			2018.07.16
			</span>
			&nbsp;&nbsp;|&nbsp;&nbsp;
			<!-- 뷰수 -->
			<span class="ui right aligned">
			<i class="eye icon"></i> 3211561
			</span>
			&nbsp;&nbsp;|&nbsp;&nbsp;
			<!-- 댓글수 -->
			<span class="ui right aligned">
			<i class="pen square icon"></i>
			85
			</span>
		</span>	
			
		</div>

		<!-- 내용 들어가는 부분! -->
		<div class="ui clearing segment">
		 서플리미트 체험단 신청하기 Go!!!  서플리미트 체험단 신청하기 Go!!!  서플리미트 체험단 신청하기 Go!!!  서플리미트 체험단 신청하기 Go!!!  서플리미트 체험단 신청하기 Go!!!  서플리미트 체험단 신청하기 Go!!!  
		 서플리미트 체험단 신청하기 Go!!!  서플리미트 체험단 신청하기 Go!!! 
			<br> 서플리미트 체험단 신청하기 Go!!! <br> 서플리미트 체험단 신청하기 Go!!! <br>
			서플리미트 체험단 신청하기 Go!!! <br> 서플리미트 체험단 신청하기 Go!!! <br> 서플리미트
			체험단 신청하기 Go!!! <br> 서플리미트 체험단 신청하기 Go!!! <br> 서플리미트 체험단
			신청하기 Go!!! <br> <img src="/resources/image/mainPic.jpg"
				style="height: 200px;"> <br> 서플리미트 체험단 신청하기 Go!!! <br>
			서플리미트 체험단 신청하기 Go!!! <br> 서플리미트 체험단 신청하기 Go!!! <br> 서플리미트
			체험단 신청하기 Go!!! <br> 서플리미트 체험단 신청하기 Go!!! <br> 서플리미트 체험단
			신청하기 Go!!! <br> 서플리미트 체험단 신청하기 Go!!! <br> 서플리미트 체험단 신청하기
			Go!!! <br>
		</div>

<br>
		<!-- 북마크 버튼 -->
		<button class="ui yellow button" id="bookMark" style="height: 40px;">
			<i class="bookmark outline icon" id="emptyBookMark"></i> 북마크
		</button>


		<!-- 좋아요 버튼 -->
		<div class="ui labeled button" tabindex="0">
			<button class="ui red button" id="heartBtn" style="height: 40px;">
				<i class="heart outline icon" id="emptyHeart"></i> 공감
			</button>
			<a class="ui basic red left pointing label"> 1,048 </a>
		</div>


		<!-- 신고 버튼 -->
		<button class="ui black button" style="height: 40px;" id="reportBtn">
			<i class="bullhorn icon"></i> 신고
		</button>

<br><br><br>

<div class="ui basic modal">
  <div class="ui icon header">
   <i class="exclamation triangle icon"></i>
    신고하기
  </div>
      <h5>(신고 사유를 선택해 주세요.)</h5><br>
  <div class="ui left aligned container">
  <div class="content">
    <div class="ui form">
  <div class="grouped fields" style="margin-left: 29%;">

    <div class="ui clearing segment" style="width:400px;">
    <div class="field">
      <div class="ui radio checkbox">
        <input type="radio" name="example2" checked="checked">
        <label style="color:white;">광고/상업성 게시글</label>
      </div>
    </div>
    <div class="field">
      <div class="ui radio checkbox">
        <input type="radio" name="example2">
        <label style="color:white;">비방/욕설 게시글</label>
      </div>
    </div>
    <div class="field">
      <div class="ui radio checkbox">
        <input type="radio" name="example2">
        <label style="color:white;">개인정보 유출 게시물</label>
      </div>
    </div>
    <div class="field">
      <div class="ui radio checkbox">
        <input type="radio" name="example2">
        <label style="color:white;">청소년 유해(음란) 게시물</label>
      </div>
    </div>
        <div class="field">
      <div class="ui radio checkbox">
        <input type="radio" name="example2">
        <label style="color:white;">명예훼손/저작권 침해 게시물</label>
      </div>
    </div>
        <div class="field">
      <div class="ui radio checkbox">
        <input type="radio" name="example2">
        <label style="color:white;">도배성 게시물</label>
      </div>
    </div>
            <div class="field">
      <div class="ui radio checkbox">
        <input type="radio" name="example2">
        <label style="color:white;">불명확/추측성 게시물</label>
      </div>
    </div>
    </div>
    
  </div>
</div>
  </div>
  </div>
  <br><br>
  <div class="actions">
    <div class="ui red basic cancel inverted button">
      <i class="remove icon"></i>
      취소
    </div>
    <div class="ui red ok inverted button">
      <i class="checkmark icon"></i>
      신고
    </div>
  </div>


	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">

var check=true;
	/* 북마크 버튼*/
	$('#bookMark').click(function() {
		if(check==true){
		$('#emptyBookMark').removeClass("bookmark outline icon").addClass("bookmark icon");
		return check=false;
		}else if(check==false){
			$('#emptyBookMark').removeClass("bookmark icon").addClass("bookmark outline icon");	
			return check=true;
		}
		
	});

var likeCheck=true;
	/* 좋아요 버튼 */
	$('#heartBtn').click(function() {
		if(likeCheck==true){
				$('#emptyHeart').removeClass("heart outline icon").addClass("heart icon");
				return likeCheck=false;
		}else if(likeCheck==false){
			$('#emptyHeart').removeClass("heart icon").addClass("heart outline icon");
			return likeCheck=true;
		}
			});
	
	/* 신고버튼 */
	$('#reportBtn').click(function(){
		
		$('.ui.basic.modal')
		  .modal('show')
		;
	});
	

</script>

</html>