<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/resources/common/preventDirectAccessUrl.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/resources/layout/cssjs.jsp"></jsp:include>
<title>다이어트</title>
</head>

<!-- CSS -->
<style>
html, body {
	margin: 0 auto;
}

ul li {
	list-style: none;
	float: left;
}

li:nth-child(2) {
	margin-top: 30px;
	margin-left: 10px;
}
</style>


<body>
	<!-- HEADER -->
	<jsp:include page="/resources/layout/header.jsp"></jsp:include>


	<!-- CONTENTS -->
	<div class="ui container">
		<div class="ui center aligned basic segment">
			<jsp:include page="/WEB-INF/views/myInfo/myInfoHeader.jsp"></jsp:include>
			<!-- 장바구니 상품 리스트 시작  -->
			<c:if test="${sessionScope.member!=null}">
				<div class="CartTable1_Wrap" id="cartTable_area">
					<br>
					<table class="ui celled table">
						<thead>
							<tr id="titleTr">
								<th class="chk" data-log-actionid-area="title">
									<div class="ui checkbox">
										<input type="checkbox" name="allCheckBox"> <label></label>
									</div>
								</th>
								<th>상품/옵션정보</th>
								<th>상품 금액</th>
								<th>할인 쿠폰</th>
								<th>주문하기</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>
									<div class="ui checkbox">
										<input type="checkbox" value="상품인덱스번호" name="checkbox">
										<label></label>
									</div>
								</td>
								<td style="width: 400px;">
									<ul>
										<li><img style="width: 100px; height: 100px;"
											src="https://t1.daumcdn.net/cfile/tistory/1449C34C507376F431" /></li>
										<li>
											<div>
												<span>상품설명입니다.</span> <span>상품설명입니다.</span>
											</div>
										</li>
									</ul>
								</td>
								<td>상품가격</td>
								<td>
									<button type="button" class="ui gray button">쿠폰사용</button>
								</td>
								<td>
									<button type="button" class="ui red button">주문하기</button>
								</td>
							</tr>

						</tbody>
					</table>
					<input type="button" class="ui red button" value="선택상품삭제"
						style="float: left;" /><br> <br> <input type="button"
						class="ui blue button" value="주문하기" /> <input type="button"
						class="ui gray button" value="홈으로" onclick="locationHome();" />

				</div>
			</c:if>
			<c:if test="${sessionScope.member==null}">
				<script type="text/javascript">
					alert("로그인 후 이용해주세요~");
					location.href = "/";
				</script>
			</c:if>
			<!-- div class ="ui container" 끝 -->
		</div>
	</div>


	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- SCRIPT -->
<script type="text/javascript">
	function locationHome() {
		location.href = "/index.jsp";
	}
</script>

</html>