<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>마이페이지</title>
</head>

<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>
	<c:if test="${sessionScope.member!=null}">
		<!-- CONTENTS -->
		<div class="ui container">
			<div class="ui center aligned basic segment">
				<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
				<br>
				<c:if test="${!myQuestion.comList.isEmpty()}">
					<table class="ui gray table">
						<thead>
							<tr id="title" align="center">
								<th>
									<div class="ui checkbox">
										<input type="checkbox" name="allCheck" id="allCheck1">
										<label></label>
									</div>
								</th>
								<th>
									<i class="question circle icon"></i>
									문의번호
								</th>
								<th>
									<i class="question circle icon"></i>
									제 목
								</th>
								<th>
									<i class="question circle icon"></i>
									작 성 일
								</th>
								<th>
									<i class="question circle icon"></i>
									답 변 여 부
								</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${myQuestion.comList}" var="m">
								<tr align="center">
									<td style="width: 7%;">
										<div class="ui checkbox">
											<input type="checkbox" name="chk[]" value="${m.qsIndex}" class="checkSelect">
											<label></label>
										</div>
									</td>
									<td>${m.qsIndex}</td>
									<td>
										<a href="javascript:void(0);" onclick="showMyQuestion(${m.qsIndex});">${m.qsTitle}</a>
									</td>
									<td>${m.qsWriteTime}</td>
									<c:if test="${m.qsAnswerCheck=='n'}">
										<td>답변대기중</td>
									</c:if>
									<c:if test="${m.qsAnswerCheck =='y'}">
										<td>답변완료</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<button class="ui red button" style="float: right;" onclick="deleteMyQuestion();">삭제하기</button>
					<br>
					<br>
					<div class="ui grid">
						<div class="three column row">
							<div class="column"></div>
							<div class="column">
								<div class="ui center aligned basic segment">
									<div class="ui pagination menu">${myQuestion.pageNavi}</div>
								</div>
							</div>
							<div class="column">
								<div class="ui right aligned container"></div>
							</div>
						</div>
						<br>
					</div>
					<!-- 1:1 문의하기 -->
					<div class="ui modal" id="questionModal1">
						<i class="close icon"></i>
						<div class="ui large header">일대일 문의</div>
						<div class="ui left aligned basic segment">
							<br>
							<div class="ui form" style="font-weight: 600;">
								<label style="margin-right: 3%;">제목</label>
								<lavel id="qsTitle12"></lavel>
								<br>
								<br>
								<div class="field">
									<label>문의내용</label>
									<textarea placeholder="내용 입력" style="height: 2px; overflow: hidden; resize: none;" id="contentQuestion"></textarea>
								</div>
								<div class="field">
									<label>관리자 답변 입니다.</label>
									<textarea placeholder="관리자 답변" style="height: 150px; overflow: hidden; resize: none;" id="contentAnswer"></textarea>
								</div>
							</div>
							<br>
							<br>
						</div>
						<input type="hidden" value="" id="qsIndex" />
					</div>
				</c:if>
				<c:if test="${myQuestion.comList.isEmpty()}">
					<div class="ui small red message">
						<div class="ui small header">※ 현재 등록된 문의가 없습니다 ~ ^^</div>
					</div>
				</c:if>
			</div>
		</div>

		<br>
		<br>
	</c:if>
	<c:if test="${sessionScope.member==null}">
		<script>
			location.href = "/index.jsp";
			alert("로그인 후 이용해주세요");
		</script>
	</c:if>
	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
	<input type="hidden" value="${m.qsIndex}" id="trIndex" />
</body>
<script type="text/javascript">
/* 나의 문의 삭제하기  */
 
	$(document).ready(function() {
		$("#allCheck1").click(function() {
			if ($("#allCheck1").prop("checked")) {
				$("input[name='chk[]']").prop("checked", true);
			} else {
				$("input[name='chk[]']").prop("checked", false);
			}
		});
	});
	
 
 	function deleteMyQuestion(){
 		
 		var send_array = Array();
 		var send_cnt = 0;
 		var chkbox = $(".checkSelect");

 		for(i=0;i<chkbox.length;i++) {
 		    if (chkbox[i].checked == true){
 		        send_array[send_cnt] = chkbox[i].value;
 		        send_cnt++;
 		    }
 		}
 		$.ajaxSettings.traditional = true;
 		$.ajax({
			url : "/deleteMyQuestion.diet",
			type : 'POST',
			data : {
				'qsIndex' : send_array
			},
			success : function(data) {
				if(data!=0){
					for(i = 0 ; i<data.length;i++){
						  $(data[i]).parent().parent().parent().remove();
						  location.reload();
					}
				}else{
					alert("일대일문의 삭제 실패하였습니다. 관리자에게 문의해주세요 ~");
				}
			},
			error : function() {
				alert("일대일문의 실패하였습니다. 관리자에게 문의해주세요 ~");
			}
		});

	}

	function showMyQuestion(qsIndex) {
		var mbId = '${sessionScope.member.mbNickName}';
		$.ajax({
			url : "/questionAnswer.diet",
			type : 'POST',
			data : {
				'qsIndex' : qsIndex
			},
			success : function(data) {
				$("#qsTitle12").text(data.qsTitle);
				$("#contentQuestion").text(data.qsContent);
				if(data.ansContent!=null){
					$("#contentAnswer").text(data.ansContent);
				}else{					
					$("#contentAnswer").text("답변 대기 중 입니다.");
				}
				$('#questionModal1').modal({
					centered : false
				}).modal('show');
			},
			error : function() {
				alert("실패");
			}
		});
	}

</script>

</html>