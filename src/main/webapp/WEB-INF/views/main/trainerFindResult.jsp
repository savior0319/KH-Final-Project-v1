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
			트레이너 찾기 검색 결과
			<button type="button" class="ui button" onclick="findPrograms(1);" style="background: rgb(250, 40, 40); color: white;">프로그램 리스트</button>
		</div>

		<div class="ui modal" id="programViews">
			<i class="close icon"></i>
			<div class="header">프로그램 리스트</div>
			<div class="scrolling content">
				<c:if test="">
				<c:forEach items="" var="tp"></c:forEach>
				</c:if>
			</div>
		</div>

	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	/* 모달 창 오픈 */
	function findPrograms(trIndex) {
		$("#programViews").modal('show');
		$.ajax({
			url : '/getProgramList.diet',
			type : 'post',
			data : {
				 'trIndex' : trIndex
			},success : function(data){
				
			}
		});
	}

	/* 모달 창 종료 */
	$("#modalOff").click(function() {
		$("#programViews").modal('hide');
	});
</script>

</html>