<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>트레이너수락</title>
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
			<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
			<br>
			<c:if test="${sessionScope.member!=null}">

				<table class="ui gray table">
					<thead>
						<tr id="title" align="center">
							<th>
								<i class="h square icon"></i>
								번 호
							</th>
							<th>
								<i class="h square icon"></i>
								제 목
							</th>
							<th>
								<i class="h square icon"></i>
								요 청 자
							</th>
							<th>
								<i class="h square icon"></i>
								요 청 일
							</th>
							<th>
								<i class="h square icon"></i>
								수 락 여 부
							</th>

						</tr>
					</thead>
					<tbody>
						<tr align="center">
							<td style="width:10%;">111</td>
							<td style="width:30%;">
								<a href="javascript:void(0);" onclick="showMyTrainer();">test123214214214</a>
							</td>
							<td style="width:15%;">111</td>
							<td style="width:15%;">2018-18-182</td>
							<td style="width:23%;">
								<button class="ui red button">수락</button>
								<button class="ui grey button">거절</button>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="ui grid">
					<div class="three column row">
						<div class="column"></div>
						<div class="column">
							<div class="ui center aligned basic segment">
								<div class="ui pagination menu"></div>
							</div>
						</div>
						<div class="column"></div>
					</div>
					<br>
				</div>
			</c:if>
		</div>

		<div class="ui modal" id="questionModal2">
			<i class="close icon"></i>
			<div class="ui large header">트레이너 요청</div>
			<div class="ui left aligned basic segment">
				<br>
				<div class="ui form" style="font-weight: 600;">
					<label style="margin-right: 3%; font-size: 15px;">제목</label>
					<lavel id="mtTitle"></lavel>
					<br>
					<br>
					<div class="field">
						<label>내 용</label>
						<br>
						<textarea placeholder="내용 입력" style="height: 2px; overflow: hidden; resize: none;" id="contentQuestion"></textarea>
					</div>
					<br>
					<div class="field">
						<label>거 절 사 유</label>
						<br>
						<select style="width: 300px;">
							<option>거리가 멀어서 수락이 어렵습니다.</option>
							<option>요청 시간이 맞지 않아 어렵습니다.</option>
							<option>기타 - 직접 입력</option>
						</select>
						<br>
						<textarea placeholder="내용 입력" style="height: 2px; overflow: hidden; resize: none;" id="contentQuestion"></textarea>
					</div>
					<div class="ui small red message" style="width: 300px; float: left;">
						<div class="ui small header">※ 수락시 '수락'버튼을 눌러주세요 ~</div>
					</div>
					<button style="float: right; margin-top:13px;" class="ui red button">수락</button>
					<button style="float: right; margin-top:13px;" class="ui grey button">거절</button>

				</div>
				<br>
				<br>
			</div>
			<input type="hidden" value="" id="qsIndex" />
		</div>
	</div>
	<br>
	<c:if test="${sessionScope.member==null}">
		<script>
			alert("로그인 후 이용해주세요~");
			location.href = "/";
		</script>
	</c:if>
	<script>
		$(function() {
			var sBtn = $("#myActivity2");
			sBtn.find('a').click(function() {
				sBtn.find('a').removeClass("active");
				$(this).addClass("active");
			});
		});
	</script>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	function showMyTrainer() {
		$.ajax({
			url : "/myTrainer1.diet",
			type : 'POST',

			success : function(data) {
				$("#mtTitle").text(data.mtTitle);
				$("#contentQuestion").text(data.qsContent);
				$('#questionModal2').modal({
					centered : false
				}).modal('show');
			},
			error : function() {
				$('#questionModal2').modal({
					centered : false
				}).modal('show');
			}

		});
	}
</script>

</html>