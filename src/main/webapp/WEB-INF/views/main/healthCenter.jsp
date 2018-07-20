<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
	<title>인바디 측정 보건소 찾기</title>
</head>

<!-- CSS -->
<style>
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>



	<div class="ui center aligned container">
		<br>
		<br>
		<div class="ui left aligned container">
			<h1>&emsp;&nbsp;&nbsp;인바디 측정 보건소</h1>
		</div>
		<hr style="border: 2px solid #D5D5D5;">
		<br>
		<div class="ui left aligned container">
			<div class="ui small header">
				<span style="color: red;">&emsp;&nbsp;&nbsp;전체 인바디 측정 가능 보건소</span>
				254 곳이 있습니다.
			</div>
		</div>

		<table class="ui celled table">
			<tr>
				<td style="padding: 0px; margin: 0px;">
					<button onclick="locationBtn(this);" style="width:100%; height: 100%; padding: 8px; margin: 0px; border:0px; background: white; cursor: pointer;">서울특별시</button>
				</td>
				<td style="padding: 0px; margin: 0px;">
					<button onclick="locationBtn(this);" style="width:100%; height: 100%; padding: 8px; margin: 0px; border:0px; background: white; cursor: pointer;">부산광역시</button>
				</td>
				<td style="padding: 0px; margin: 0px;">
					<button onclick="locationBtn(this);" style="width:100%; height: 100%; padding: 8px; margin: 0px; border:0px; background: white; cursor: pointer;">인천광역시</button>
				</td>
				<td style="padding: 0px; margin: 0px;">
					<button onclick="locationBtn(this);" style="width:100%; height: 100%; padding: 8px; margin: 0px; border:0px; background: white; cursor: pointer;">대전광역시</button>
				</td>
				<td style="padding: 0px; margin: 0px;">
					<button onclick="locationBtn(this);" style="width:100%; height: 100%; padding: 8px; margin: 0px; border:0px; background: white; cursor: pointer;">대구광역시</button>
				</td>
			</tr>
			<tr>
				<td style="padding: 0px; margin: 0px;">
					<button onclick="locationBtn(this);" style="width:100%; height: 100%; padding: 8px; margin: 0px; border:0px; background: white; cursor: pointer;">광주광역시</button>
				</td>
				<td style="padding: 0px; margin: 0px;">
					<button onclick="locationBtn(this);" style="width:100%; height: 100%; padding: 8px; margin: 0px; border:0px; background: white; cursor: pointer;">울산광역시</button>
				</td>
				<td style="padding: 0px; margin: 0px;">
					<button onclick="locationBtn(this);" style="width:100%; height: 100%; padding: 8px; margin: 0px; border:0px; background: white; cursor: pointer;">경기도</button>
				</td>
				<td style="padding: 0px; margin: 0px;">
					<button onclick="locationBtn(this);" style="width:100%; height: 100%; padding: 8px; margin: 0px; border:0px; background: white; cursor: pointer;">전라도</button>
				</td>
				<td style="padding: 0px; margin: 0px;">
					<button onclick="locationBtn(this);" style="width:100%; height: 100%; padding: 8px; margin: 0px; border:0px; background: white; cursor: pointer;">경상도</button>
				</td>
			</tr>
			<tr>
				<td style="padding: 0px; margin: 0px;">
					<button onclick="locationBtn(this);" style="width:100%; height: 100%; padding: 8px; margin: 0px; border:0px; background: white; cursor: pointer;">강원도</button>
				</td>
				<td style="padding: 0px; margin: 0px;">
					<button onclick="locationBtn(this);" style="width:100%; height: 100%; padding: 8px; margin: 0px; border:0px; background: white; cursor: pointer;">충청도</button>
				</td>
				<td style="padding: 0px; margin: 0px;">
					<button onclick="locationBtn(this);" style="width:100%; height: 100%; padding: 8px; margin: 0px; border:0px; background: white; cursor: pointer;">제주도</button>
				</td>
				<td></td>
				<td></td>
			</tr>
		</tbody>
	</table>

	<!-- CONTENTS -->
	<div class="ui center aligned basic segment">
		<table class="ui very compact table">
			<thead>
				<tr align="center">
					<th style="width: 15%;">측정장소</th>
					<th style="width: 50%;">주소</th>
					<th style="width: 15%;">전화번호</th>
					<th style="width: 10%;">위치</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.hcpd.hcList}" var="hc">
				<tr align="center">
					<td style="padding-top: 15px; padding-bottom: 15px;">${hc.hcLocation}</td>
					<td id="address">${hc.hcAddress}</td>
					<td>${hc.hcPhone}</td>
					<td><div class="location"><i class="map marker icon" style="color : red;"></i></div></td>
				</tr>
			</c:forEach> 
		</tbody>
	</table>
</div>
<br>

<div class="ui center aligned basic segment">
	<div class="ui pagination menu">${requestScope.hcpd.pageNavi }</div>
</div>
<!-- 검색 +  dropdown : 제목, 내용, 작성자 -->
<br>
</div>

<!-- FOOTER -->
<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	$('.location').mouseenter(function() {
		$('.location').css('cursor', 'pointer');
	});

	$('.location').click(function(){
		var locationMap = ($(this).parent().siblings('td[id=address]').html());
		var openMap = window.open("about:blank");
		openMap.location.href = 'https://www.google.com/maps/place/' + locationMap;
	});


	function locationBtn(loc){
		var location = loc.innerHTML;
		$.ajax({
			url : '/healthCenter.diet',
			data : {'location' : location},
			success : function(){
				window.location.href= '/healthCenter.diet?location=' + location;
			}, 
		});
	}
</script>
</html>