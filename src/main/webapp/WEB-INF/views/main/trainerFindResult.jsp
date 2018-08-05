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
.test{
	cursor: pointer;
	border: 1px solid rgb(171,171,171);
}

.test:hover{
	background : rgba(171,171,171,0.1);
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>

	<!-- CONTENTS -->
	<div class="ui container">
		<br>
		<div class="ui center aligned basic segment">
			<div class="ui large header">
				<div class="ui large message">
					<i class="map marker alternate icon"></i><span style="color:rgb(0,0,0);">${city}</span><br>
					<span style="color:rgb(250,40,40);">'${areaList}'</span>에 해당하는 트레이너 검색 결과
				</div>
			</div>
			<c:choose>
			<c:when test="${tList[0].trArea != null}">
					<div class="ui red medium message"><div class="ui medium header">※ 원하는 트레이너를 클릭하세요. </div></div>
			<!-- 트레이너가 검색 됐을 경우 -->
			<c:forEach items="${tList}" var="tl">
			<div class="ui relaxed divided items test"  style="padding: 15px;">
				<input type="hidden" value="${tl.trIndex}">
				<div class="item" style="border-top-width: 0px; padding-top: 0px;">
					<div class="ui small image">
						<img src="${tl.trImagePath}" style="height: 100px;">
					</div>
					<div class="content">
						<div class="ui medium header">
						<i class="user icon"></i>트레이너명 - ${tl.trName}
						</div><br>
						<div class="ui medium header">
						<i class="map marker alternate icon"></i>트레이닝 가능지역 - ${tl.trArea}
						</div><br>
						<div class="ui medium header">
						<i class="map icon"></i>주소 - ${tl.trAddress}
						</div><br>
					<div class="description">
						트레이너 소개 - ${tl.trContent}
					</div>
					</div>
				</div>
			</div>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<br>
				<br>
					<div class="ui red medium message"><br><i class="exclamation huge icon"></i><div class="ui medium header"><br>※ 해당지역에 트레이너가 어ㅄ습니다<br>다른 지역을 선택해주세요<br><br><br></div></div>
				<br>
				<br>
				<br>
				<br>
			</c:otherwise>
			</c:choose>
			</div>
		</div>
<!-- FOOTER -->
<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<div class="ui longer modal" id="programViews">
	<i class="close icon"></i>
	<div class="header">프로그램 리스트</div>
	<div class="scrolling longer content">
		<div id="programList"></div>
	</div>
</div>


<!-- SCRIPT -->
<script type="text/javascript">

	/* 트레이너 선택 */
	$('.test').click(function(){
		var trIndex = $(this).children('input').val();
		findPrograms(trIndex);
	});

	/* 모달 창 오픈 */
	function findPrograms(trIndex) {
		$("#programViews").modal('show');
		$.ajax({
			url : '/getProgramList.diet',
			type : 'post',
			data : {
				'trIndex' : trIndex
			},success : function(data){
				var dataLength = data.proList.length;
				$('#programList').html('');
				if(dataLength!=0){
				var table = '<table class="ui very compact table">'+'<thead>'+'<tr align="center">'+'<th style="width: 10%;">PT 유형</th>'+'<th style="width: 45%;">프로그램 명</th>'
				+'<th style="width: 15%;">시작일</th>'+'<th style="width: 15%;">종료일</th>'+'<th style="width: 25%;">장소</th>'+'</tr>'+'</thead>'+'<tbody>';
				for (var i = 0; i < data.proList.length; i++) {
					table += '<tr align="center">';
					table += '<td>'+data.proList[i].tpTrainType+'</td>';
					table += '<td style="padding-top: 15px; padding-bottom: 15px;"><a class="item" href="/programDetail.diet?tpIndex='+data.proList[i].tpIndex+'">';
					table += data.proList[i].tpTitle;
					table += '</a></td>';
					table += '<td>' + data.proList[i].tpActiveStart+ '</td>';
					table += '<td>' + data.proList[i].tpActiveEnd + '</td>';
					table += '<td>' + data.proList[i].tpLocation + '</td>';
					table += '</tr>';
				}
				table += '</tbody>';
				table += '</table>';
				$('#programList').html(table);
				}else{
					var result = '<div class="ui center red medium message" align="center"><br><i class="exclamation huge icon"></i><div class="ui medium header"><br>※ 진행중인 프로그램이 없습니다.<br>다른 트레이너를 선택해주세요<br><br><br></div></div>';
					$('#programList').html(result);
				}
			}
		});
	}

	/* 모달 창 종료 */
	$("#modalOff").click(function() {
		$("#programViews").modal('hide');
	});


</script>
</html>