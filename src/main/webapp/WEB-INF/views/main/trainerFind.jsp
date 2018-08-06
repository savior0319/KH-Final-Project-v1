<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>트레이너 찾기</title>
	<script src="/resources/slider/responsiveslides.min.js"></script>
</head>

<!-- CSS -->
<style>


.rslides {
	position: relative;
	list-style: none;
	overflow: hidden;
	width: 100%;
	padding: 0;
	margin: 0;
}

.rslides li {
	-webkit-backface-visibility: hidden;
	position: absolute;
	display: none;
	width: 100%;
	left: 0;
	top: 0;
}

.rslides li:first-child {
	position: relative;
	display: block;
	float: left;
}

.rslides img {
	display: block;
	height: auto;
	float: left;
	width: 100%;
	border: 0;
}

</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<div class="ui container">
		<!-- 슬라이드-->
		<ul class="rslides">
			<li>
				<img src="#" id="image1" style="height: 300px;">
			</li>
			<li>
				<img src="#" id="image2" style="height: 300px;">
			</li>
			<li>
				<img src="#" id="image3" style="height: 300px;">
			</li>
			<li>
				<img src="#" id="image4" style="height: 300px;">
			</li>
			<li>
				<img src="/resources/image/advertise.png" style="height: 300px;">
			</li>
		</ul>
		<div class="ui center aligned basic segment">
			
			<div class="ui large message">
				<div class="ui large header"><i class="sistrix icon"></i>트레이너 찾기</div>
			</div>
			<br>
			<div class="ui red message"><div class="ui medium header">※ 해당 지역의 트레이너를 검색합니다</div></div>
			<br>
			<div class="ui small header">시선택</div>
			<select name="skills" class="ui fluid normal dropdown" id="dropdown1">
				<option value="서울특별시">서울특별시</option>
				<option value="인천광역시">인천광역시</option>
			</select>
			<br>  
			<div id="ifSeoul">
				<div class="ui small header" >구선택(최대 3개까지 선택가능)</div>
				<select multiple="" name="skills" class="ui fluid normal dropdown" id="dropdown2">
					<option value="">선택</option>
					<option value="강남구">강남구</option>
					<option value="강동구">강동구</option>
					<option value="강북구">강북구</option>
					<option value="강서구">강서구</option>
					<option value="관악구">관악구</option>
					<option value="광진구">광진구</option>
					<option value="구로구">구로구</option>
					<option value="금천구">금천구</option>
					<option value="노원구">노원구</option>
					<option value="도봉구">도봉구</option>
					<option value="동대문구">동대문구</option>
					<option value="동작구">동작구</option>
					<option value="마포구">마포구</option>
					<option value="서대문구">서대문구</option>
					<option value="서초구">서초구</option>
					<option value="성동구">성동구</option>
					<option value="성북구">성북구</option>
					<option value="송파구">송파구</option>
					<option value="양천구">양천구</option>
					<option value="영등포구">영등포구</option>
					<option value="용산구">용산구</option>
					<option value="은평구">은평구</option>
					<option value="종로구">종로구</option>
					<option value="중구">중구</option>
				</select>
			</div>
			<div id="ifIncheon" style="display: none;">
				<div class="ui small header" >구선택(최대 3개까지 선택가능)</div>
				<select multiple="" name="skills" class="ui fluid normal dropdown" id="dropdown3">
					<option value="">선택</option>	
					<option value="강화군">강화군</option>
					<option value="계양구">계양구</option>
					<option value="남동구">남동구</option>
					<option value="동구">동구</option>
					<option value="미추홀구">미추홀구</option>
					<option value="부평구">부평구</option>
					<option value="서구">서구</option>
					<option value="연수구">연수구</option>
					<option value="옹진군">옹진군</option>
					<option value="중구">중구</option>
				</select>
			</div>
			<br>
			<br>
			<button type="button" class="ui button" style="background: rgb(250,40,40); color: white;" onclick="trainerSearch();">트레이너 검색</button>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	$('#dropdown1')
	.dropdown();

	$('#dropdown2')
	.dropdown({
		maxSelections: 3
	});

	$('#dropdown3')
	.dropdown({
		maxSelections: 3
	});


	$('.delete .icon').click(function(){
		alert(1);
	})

	$('#dropdown1').change(function() {
		var loc = $('#dropdown1').val();
		if(loc == '서울특별시'){
			$('#ifIncheon').hide();
			$('#ifSeoul').show();
		} else if(loc == '인천광역시'){
			$('#ifSeoul').hide();
			$('#ifIncheon').show();
		}
	});

	function trainerSearch(){
		var city = $('#dropdown1').val();
		var area1 = $('#dropdown2').val();
		var area2 = $('#dropdown3').val();
		if(city == '서울특별시'){
			location.href = "/trainerSearchResult.diet?city=" + city + "&area=" + area1;
		} else if(city == '인천광역시'){
			location.href = "/trainerSearchResult.diet?city=" + city + "&area=" + area2;
		}
	}
	

	// 슬라이드
	$(function() {
		$(".rslides").responsiveSlides({
			auto : true,
			timeout : 1500,
		});
	});


   /* 광고 이미지 불러오기 */
   $(document).ready(function() {
      $.ajax({
         url : '/advertiseImageLoad.diet',
         type : 'post',
         success : function(img){
            $("#image1").attr("src",img[0].path1);
            $("#image2").attr("src",img[1].path1);
            $("#image3").attr("src",img[2].path1);
            $("#image4").attr("src",img[3].path1);
         },
         error : function(){
            console.log('[ERROR] - 이미지 불러오기 오류');
         }
      });
   });
</script>

</html>