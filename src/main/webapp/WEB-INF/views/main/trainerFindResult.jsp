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
		<div class="ui center aligned basic segment">
			<div class="ui large header">
				<div class="ui large message">
					검색 결과
				</div>
			</div>
			<div class="ui red medium message"><div class="ui medium header">※ 트레이너 클릭하셉ㅁ</div></div>
			<c:forEach items="${tList}" var="tl">
			<div class="ui relaxed divided items test"  style="padding: 15px;">
				<input type="hidden" value="${tl.trIndex}">
				<div class="item" style="border-top-width: 0px; padding-top: 0px;">
					<div class="ui small image">
						<img src="${tl.trImagePath}">
					</div>
					<div class="content">
						<a class="header">트레이너 - ${tl.trName}</a>
						<div class="description">
							${tl.trContent}
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
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
		alert('인덱스 : ' + trIndex);
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
				console.log(data.proList);

				$('#programList').html('');
							var table = '<table class="ui very compact table">'+'<thead>'+'<tr align="center">'+'<th style="width: 10%;">PT 유형</th>'+'<th style="width: 40%;">프로그램 명</th>'
							+'<th style="width: 10%;">시작일</th>'+'<th style="width: 15%;">종료일</th>'+'<th style="width: 25%;">장소</th>'+'</tr>'+'</thead>'+'<tbody>';
							for (var i = 0; i < data.proList.length; i++) {
								table += '<tr align="center">';
								table += '<td>'+data.proList[i].tpTrainType+'</td>';
								table += '<td style="padding-top: 15px; padding-bottom: 15px;"><a class="item" href="#">';
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
			}
		});
	}

	/* 모달 창 종료 */
	$("#modalOff").click(function() {
		$("#programViews").modal('hide');
	});
  

</script>
</html>