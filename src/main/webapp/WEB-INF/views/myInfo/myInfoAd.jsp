<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>마이페이지광고</title>
</head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<!-- CSS -->
<style>
</style>


<body>


	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">
			<div class="ui cube shape">
				<div class="sides">
					<div class="active side"
						style="width: 100%; height: 100%; background-color: white;">
						<div class="content">
							<div class="center">
								<img style="width: 100%; height: 100%;"
									src="http://data.0app0.com/diet/banner/1740_1531481047.jpg"
									alt="First slide">
							</div>
						</div>
					</div>
					<div class="side"
						style="width: 100%; height: 100%; background-color: white;">
						<div class="content">
							<div class="center">
								<img style="width: 100%; height: 100%;"
									src="http://data.0app0.com/diet/banner/1722_1530876593.jpg"
									alt="Second slide">
							</div>
						</div>
					</div>
					<div class="side">
						<div class="content">
							<div class="center">3</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>

<!-- SCRIPT -->
<script type="text/javascript">
<!-- 광고 이미지 스크립트 -->
	$('.shape').shape('set next side', '.second.side').shape('flip down');
</script>

</html>