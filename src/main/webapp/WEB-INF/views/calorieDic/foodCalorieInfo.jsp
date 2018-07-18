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
		
		<h1 class="ui left aligned header">음식칼로리</h1><hr>  
  
			
			<!-- 음식 검색 -->
			
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
		
		<!-- 음식 검색 결과 -->
      <h3 class="ui left aligned header"><span class="foodName" style="color:red; text-align:left;">쌀밥</span> 검색 결과</h3>
      
      
      <table border="2" bordercolor="#a1a0a0" style="width:100%; height:120px; border-collapse:collapse;" >
          <colgroup>
              <col style="width:165px">
              <col style="width:auto">
          </colgroup>
          <tbody>
             <tr>
              <th>음식명</th>
              <td>쌀밥</td>
              </tr>
              <tr>
                  <th>단위</th>
                  <td>1공기(210g)</td>
              </tr>
              <tr>
                  <th>칼로리</th>
                  <td>310 kcal</td>
              </tr>
          </tbody>
      </table>
      
      <h5 class="ui left aligned header"><span style="color:red;">·&ensp;[주의]</span> 음식 칼로리는 사용되는 재료와 1인 분량 기준의 차이에 의해 다소 차이가 있을 수 있습니다.</h5>
      
      <br><br>
      
      <h3 class="ui left aligned header">영양소 구성</h3>
      
      <!-- 프로그레스 바 들어가는곳 입니다. -->
      
      <div class="ui red progress">
        <div class="bar"></div>
        </div>
        <div class="ui orange progress">
          <div class="bar"></div>
        </div>
        <div class="ui yellow progress">
          <div class="bar"></div>
        </div>
        <div class="ui olive progress">
          <div class="bar"></div>
        </div>
        <div class="ui teal progress">
           <div class="bar"></div>
    </div>
      
        <br><br>
                
      <h4 class="ui left aligned header"><span style="color:#4776c9;">쌀밥</span> 칼로리<span style="color:#4776c9;">(310kcal)</span>와 동일한 운동을 확인해 보세요.</h4>
         		  		
      		  		  		  		
      <ul class="exercise">
          <li>
              <strong>걷기</strong>
              <span>155분</span>
          </li>
          <li>
              <strong>달리기</strong>
              <span>44분</span>
          </li>
          <li>
              <strong>줄넘기</strong>
              <span>31분</span>
          </li>
          <li>
              <strong>수영</strong>
              <span>34분</span>
          </li>
          <li>
              <strong>자전거</strong>
              <span>39분</span>
          </li>
      </ul>	
       
              
       
    </div>
		
		</div>

	 
	<!-- 음식과 동일한 운동  --> 
	<style>
      .exercise {background:url("http://www.dietshin.com/img/calorie_dc/bg_exercise.gif") no-repeat;height:200px;padding:102px 14px 0 14px}
      .exercise li{text-align:center;float:left;width:133px;margin-left:9px; list-style: none;}
      .exercise li:first-child{margin-left:0}
      .exercise li strong{display:block;color:#595959;font-weight:normal;margin-bottom:7px}
      .exercise li span{display:block;font-weight:bold;color:#ff7302}
      </style>
      
      <!-- 검색결과 테이블 -->
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
	
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	
</script>

</html>