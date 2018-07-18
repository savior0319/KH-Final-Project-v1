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
	<div class="ui container">
		<div class="ui center aligned basic segment">
		
		<h1 class="ui left aligned header">운동칼로리</h1><hr>  
  
			
			<!-- 운동 검색 -->
			
			<div class="ui secondary segment" >
			<div class="ui right action left icon input">
				<i class="search icon"></i> <input type="text" placeholder="검색어 입력" style="width:600px;">
				<div class="ui basic floating dropdown button">
					<div class="text">검색</div>
				</div>
			</div>
			<div style="text-align:center; margin-top:3%;  height:40px;"><i class="chevron circle right icon"></i>
                    다신 칼로리 사전은 <span style="color:skyblue;">음식의 칼로리 뿐만 아니라 영양소 구성도 함께</span> 나와 다이어트뿐 아니라 건강한 식습관 형성에도 도움이 됩니다.			        
                </div>
		</div>
		<br><hr><br>
		
	 <style>
      td{
          padding: 10px;
          text-align:left;
      }
          tr>th{
              background: #faede6;
              text-align: left;
              padding: 10px;
          }
      </style>
      
      <!-- 운동 강도와 시간 선택에 따른 칼로리 -->
		
        <table border="2" bordercolor="#a1a0a0" style="width:100%; height:120px; border-collapse:collapse;" >
          <colgroup>
              <col style="width:165px">
              <col style="width:auto">
          </colgroup>
          <tbody>
             <tr>
              <th>운동명</th>
              <td>보통 걷기</td>
              </tr>
              <tr>
                  <th>운동강도</th>
                  <td>
                     <select class="ui dropdown">
                      <option value="">가볍게</option>
                      <option value="1">느리게</option>
                      <option value="0">빠르게</option>
                      <option value="2">아주빠르게</option>
                    </select></td>
              </tr>
              <tr>
                  <th>운동시간(분)</th>
                  <td>
                  <div class="ui input" style=width:120px;height:30px;>
                  <input type="text">
                  <div class="mini ui basic buttons">
                  <div class="ui button" ><i class="angle left icon"></i></div>
                  <div class="ui button" ><i class="angle right icon"></i></div>
                  </div>
                    </div></td>
              </tr>
              <tr>
                  <th>칼로리</th>
                  <td>21 kcal</td>
              </tr>
          </tbody>
      </table>
          
          
          
          <h3 class="ui left aligned header">효과 및 참고사항</h3><hr>
          
          <!-- 효과 및 참고사항 들어가는 부분 -->
          <div class="notedItems" style="text-align:left;">
              <pre>※ 효과 : 전신 근육 발달
※ 유산소성 운동으로 심폐기능을 강화 할 수 있음</pre>
          </div><hr>
          
          <!-- 동영상 강좌 부분(영상이 있는페이지와 없는 페이지가 있음 있을시 영상 보이게 -->
          
          <h3 class="ui left aligned header">동영상 강좌</h3>
          <div class="videoLecture" style="width:700px; height:200px; border:2px solid grey;">
              <div class="youtube" style="width:40%;height:100%; float:left;">
                  <iframe width="100%;" height="100%;" src="https://www.youtube.com/embed/VGjk5SHY2ls" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
              </div>
              <div style="width:60%;height:100%;float:left;">
                  <div class="sprotTitle" style="width:100%; height:40%; padding:3%; padding-top:5%; border-bottom:1px solid grey;">
                      <h3>계단오르기 운동</h3>
                      </div>
              </div>
          </div>
		
		</div>
	</div>
	
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>