<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>프로그램 소개</title>
</head>

<!-- CSS -->
<style>
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui container" style="border: 0;">
		<div class="ui center aligned basic segment">
			<br>
			<div class="ui large message">
				<div class="ui large header" align="center">프로그램 소개</div>
			</div>
			<br>


			<div class="ui grid" style="border: 1px solid rgba(34,36,38,.22);">
				<div class="row">
					<div class="ten wide column" style="border-right: 1px dashed rgba(34,36,38,.22)">
						<div style="width: 100%;">
							<img id="img" style="width: 100%; height: 400px;" src="${requestScope.tpv.tpMainImage}" onerror='this.src="/resources/image/noimage.png"'>
						</div>
					</div>

					<div class="six wide column">
						<div class="ui row">
							<div class="nine column" align="left">
								<div class="column">
									<h2>
										<span style="color: gray">[${requestScope.tpv.tpTrainType}]</span>
										<span style="color: rgb(250, 40, 40)"> ${requestScope.tpv.tpTitle}</span>
									</h2>
								</div>
								<br>
								<div class="column">
									<span style="color: gray">시작일</span>&nbsp;&nbsp;&nbsp;&nbsp;
									:&nbsp;
									<span>${requestScope.tpv.tpActiveStart}</span>
								</div>
								<br>
								<div class="column">
									<span style="color: gray">종료일 </span>&nbsp;&nbsp;&nbsp;&nbsp;
									:&nbsp;
									<span>${requestScope.tpv.tpActiveEnd}</span>
								</div>
								<br>
								<div class="column">
									<span style="color: gray">진행요일</span>
									:&nbsp;
									<span>${requestScope.tpv.tpActiveDay}</span>
								</div>
								<br>
								<div class="column">
									<span style="color: gray">진행장소</span>
									:&nbsp;
									<span>${requestScope.tpv.tpLocation}</span>
								</div>
								<br>
								<div class="column">
									<span style="color: gray">모집인원</span>
									:&nbsp;
									<span>${requestScope.tpv.tpPersonnel}</span>
									명
								</div>
								<br>
								<div class="column">
									<span style="color: gray">남은인원</span>
									:&nbsp;
									<span style="color: red; font-size: 30px;">1</span>
									명
								</div>
								<br>
								<div class="column">
									<span style="color: gray">가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격</span>
									:&nbsp;
									<span>${requestScope.tpv.tpCost}</span>
									원
								</div>
								<br>
								<br>
								<br>
								<div class="column">
									<button class="ui button" style="background: rgb(250, 40, 40); color: white;">결제하기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="ui grid" style="border: 1px solid rgba(34,36,38,.22);">
				<div class="row" style="word-break:break-all;">
					<div class="column">
					${requestScope.tpv.tpContent}
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