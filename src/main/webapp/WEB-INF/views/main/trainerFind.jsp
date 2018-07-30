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
			<br>
			<div class="ui large message">
				<div class="ui large header">트레이너 찾기</div>
			</div>
			<br>
			<div class="ui red message"><div class="ui medium header">※ 트레이닝 받을 지역을 선택합니다</div></div>
			<br>
			<div class="ui small header">시선택</div>
			<select name="skills" class="ui fluid normal dropdown" id="dropdown1">
				<option value="seoul">서울특별시</option>
				<option value="incheon">인천광역시</option>
			</select>

			<br>

			<div id="ifSeoul">
				<div class="ui small header" >구선택(최대 3개까지 선택가능)</div>
				<select multiple="" name="skills" class="ui fluid normal dropdown" id="dropdown2">
					<option value="">선택</option>
					<option value="1">강남구</option>
					<option value="2">강동구</option>
					<option value="3">강북구</option>
					<option value="4">강서구</option>
					<option value="5">관악구</option>
					<option value="6">광진구</option>
					<option value="7">광진구</option>
					<option value="8">구로구</option>
					<option value="9">금천구</option>
					<option value="10">노원구</option>
					<option value="11">도봉구</option>
					<option value="12">동대문구</option>
					<option value="13">동작구</option>
					<option value="14">마포구</option>
					<option value="15">서대문구</option>
					<option value="16">서초구</option>
					<option value="17">성동구</option>
					<option value="18">성북구</option>
					<option value="19">송파구</option>
					<option value="20">양천구</option>
					<option value="21">영등포구</option>
					<option value="22">용산구</option>
					<option value="23">은평구</option>
					<option value="24">종로구</option>
					<option value="25">중구</option>
				</select>
			</div>

			<div id="ifIncheon" style="display: none;">
				<div class="ui small header" >구선택(최대 3개까지 선택가능)</div>
				<select multiple="" name="skills" class="ui fluid normal dropdown" id="dropdown3">
					<option value="">선택</option>	
					<option value="26">강화군</option>
					<option value="27">계양구</option>
					<option value="28">남동구</option>
					<option value="29">동구</option>
					<option value="30">미추홀구</option>
					<option value="31">부평구</option>
					<option value="32">서구</option>
					<option value="33">연수구</option>
					<option value="34">옹진군</option>
					<option value="35">중구</option>
				</select>
			</div>

			<br>
			<br>
			<button type="button" class="ui button" style="background: rgb(250,40,40); color: white;">트레이너 검색</button>
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


	$('#dropdown1').change(function() {
		var loc = $('#dropdown1').val();

		if(loc == 'seoul'){
			$('#ifIncheon').hide();
			$('#ifSeoul').show();
		} else if(loc = 'incheon'){
			$('#ifSeoul').hide();
			$('#ifIncheon').show();
		}
	});

</script>

</html>