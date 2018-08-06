<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>프로그램 소개</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="/resources/slider/responsiveslides.min.js"></script>

</head>

<!-- CSS -->
<style>
.rslides {
	position: relative;
	list-style: none;
	overflow: hidden;
	width: 100%;
	padding: 0;
	margin: 0;
}

.rslides li {
	-webkit-backface-visibility: hidden;
	position: absolute;
	display: none;
	width: 100%;
	left: 0;
	top: 0;
}

.rslides li:first-child {
	position: relative;
	display: block;
	float: left;
}

.rslides img {
	display: block;
	height: auto;
	float: left;
	width: 100%;
	border: 0;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui container" style="border: 0;">
		<!-- 슬라이드-->
		<ul class="rslides">
			<li>
				<img src="#" id="image1" style="height: 300px;">
			</li>
			<li>
				<img src="#" id="image2" style="height: 300px;">
			</li>
			<li>
				<img src="#" id="image3" style="height: 300px;">
			</li>
			<li>
				<img src="#" id="image4" style="height: 300px;">
			</li>
			<li>
				<img src="/resources/image/advertise.png" style="height: 300px;">
			</li>
		</ul>
		<div class="ui center aligned basic segment">
			<div class="ui large message">
				<div class="ui large header" align="center">프로그램 소개</div>
			</div>
			<br>


			<div class="ui grid" style="border: 1px solid rgba(34, 36, 38, .22);">
				<div class="row">
					<div class="ten wide column" style="border-right: 1px dashed rgba(34, 36, 38, .22)">
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
									<span style="color: gray">시작일 </span>
									&nbsp;&nbsp; :&nbsp;
									<span>${requestScope.tpv.tpActiveStart}</span>
								</div>
								<br>
								<div class="column">
									<span style="color: gray">종료일 </span>
									&nbsp;&nbsp; :&nbsp;
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
									<span style="color: red; font-size: 30px;">${requestScope.tpv.tpRemainingPersonnel }</span>
									명
								</div>
								<br>
								<div class="column">
									<span style="color: gray">가&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;격</span>
									:&nbsp;
									<span>
										<fmt:formatNumber value="${requestScope.tpv.tpCost}" pattern="#,##0" />
									</span>
									원
								</div>
								<br>
								<br>
								<br>
								<div class="column">
									<c:choose>
										<c:when test="${requestScope.tpv.tpRemainingPersonnel==0}">
											<button class="ui button" style="background: rgb(250, 40, 40); color: white;" onclick="pricePayment();" disabled>마감</button>
										</c:when>
										<c:otherwise>
											<button class="ui button" style="background: rgb(250, 40, 40); color: white;" onclick="pricePayment();">결제하기</button>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<br>
			<br>
			<div class="ui grid" style="border: 1px solid rgba(34, 36, 38, .22);">
				<div class="row" style="word-break: break-all;">
					<div class="column">${requestScope.tpv.tpContent}</div>
				</div>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	function pricePayment() {
		var mbId = '${sessionScope.member.mbNickName}';
		if (mbId != '') {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp27415949'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

			IMP.request_pay({
				pg : 'inicis', // version 1.1.0부터 지원.
				pay_method : 'card',
				merchant_uid : 'merchant_' + new Date().getTime(),
				name : '주문명:' + '${requestScope.tpv.tpTitle}',
				amount : '${requestScope.tpv.tpCost}',
				buyer_email : '${sessionScope.member.mbId}',
				buyer_name : '${sessionScope.member.mbName}',
				buyer_tel : '${sessionScope.member.mbPhone}',
				buyer_addr : '${sessionScope.member.mbAddress}',
				buyer_postcode : '123-456',
				custom_data : '${sessionScope.member.mbIndex}' + ','
						+ '${requestScope.tpv.tpIndex}' + ','
						+ '${requestScope.tpv.trIndex}',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
				if (rsp.success) {
					var msg = '결제가 완료되었습니다. \n';
					msg += '고유ID : ' + rsp.imp_uid + '\n';
					msg += '상점 거래ID : ' + rsp.merchant_uid + '\n';
					msg += '결제 금액 : ' + rsp.paid_amount + '\n';
					msg += '카드 승인번호 : ' + rsp.apply_num + '\n';
					$.ajax({
						url : '/paymentSuccess.diet',
						data : {
							'mbtptr' : rsp.custom_data,
							'price' : rsp.paid_amount
						},
						type : 'post',
						success : function(data) {
							if (data == 'success') {
								alert('결제가 완료되었습니다.');
								location.href='/requestTrainer.diet';
							}
						}
					});
				} else {
					var msg = '결제에 실패하였습니다. \n';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
				}

				
			});
		} else {
			alert('로그인 후 이용해주세요.');
		}
	}

	// 슬라이드
	$(function() {
		$(".rslides").responsiveSlides({
			auto : true,
			timeout : 1500,
		});
	});

	/* 광고 이미지 불러오기 */
	$(document).ready(function() {
		$.ajax({
			url : '/advertiseImageLoad.diet',
			type : 'post',
			success : function(img) {
				$("#image1").attr("src", img[0].path1);
				$("#image2").attr("src", img[1].path1);
				$("#image3").attr("src", img[2].path1);
				$("#image4").attr("src", img[3].path1);
			},
			error : function() {
				console.log('[ERROR] - 이미지 불러오기 오류');
			}
		});
	});
</script>

</html>