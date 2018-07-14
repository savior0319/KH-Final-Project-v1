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
		<div class="ui center aligned basic segments">
			<div class="ui horizontal basic segments">
				<div class="ui basic segment" style="padding: 0;">
					<div class="ui left aligned basic segment" style="margin: 0;">
						<div class="ui message">
							<span class="ui small header"> <i class="book icon"></i>최고의 성형은 다이어트다
							</span>
						</div>
					</div>
					<div class="ui center aligned basic segment" style="margin: 0; padding: 0;">
						<img src="/resources/image/mainPic.jpg" style="width: 90%;">
					</div>
				</div>
				<div class="ui basic segment" align="center">
					<table class="ui celled table" style="width: 100%; height: 100%;">
						<tr align="center">
							<td style="padding: 0px; width: 70px;">
								<button onclick="bmiCal();" type="button" style="height: 100%; width: 100%; background: rgb(250, 40, 40); border: 0; color: white; font-weight: 600; font-size: 15px;">
									<i class="large calculator icon"></i>
									<br>
									내 BMI 지수는?
									<br>
									(비만도 계산)
								</button>
							</td>
							<td style="padding: 0px; width: 70px;">
								<button type="button" style="height: 100%; width: 100%; background: orange; border: 0; color: white; font-weight: 600; font-size: 15px;">
									<i class="large sticky note outline icon"></i>
									<br>
									칼로리처방
									<br>
									받기
								</button>
							</td>
						</tr>
						<tr align="center">
							<td style="padding: 0px; width: 70px;">
								<button type="button" style="height: 100%; width: 100%; background: gray; border: 0; color: white; font-weight: 600; font-size: 15px;">
									<i class="large mobile alternate icon"></i>
									<br>
									다이어트
									<br>
									어플리케이션
								</button>
							</td>
							<td style="padding: 0px; width: 70px;">
								<button type="button" style="height: 100%; width: 100%; background: rgb(250, 40, 40); border: 0; color: white; font-weight: 600; font-size: 15px;">
									<i class="large sistrix icon"></i>
									<br>
									인바디 측정
									<br>
									보건소 찾기
								</button>
							</td>
						</tr>
					</table>
				</div>
			</div>

			<div class="ui horizontal basic segments">
				<div class="ui basic segment">
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
				</div>
				<div class="ui basic segment">
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
				</div>
				<div class="ui basic segment">
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
					<p>내용들어감</p>
				</div>
			</div>

		</div>
	</div>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	function bmiCal() {
		window.location.href = "/bmiCal.diet";
	}
</script>


</html>