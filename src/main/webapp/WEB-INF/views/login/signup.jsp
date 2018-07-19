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
		<br><br>
		<div class="ui center aligned basic segment"> 
			<div class="ui huge header">회원가입</div>
			<br>
			회원가입은 무료이며 가입 후 다양한 서비스를 받으실 수 있습니다.
			<br><br>
			<hr style="height: 3px; width: 70%; background: red; border: 0px;">
			<div class="ui left aligned basic segment" style="padding-left: 15%;">
				<span class="ui medium header">정보입력</span> 
				<span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 필수입력항목
			</div>
			<div align="center">
				<form action="/signupsave.diet" method="POST" accept-charset="utf-8">
					<table class="ui celled table" style="width: 70%;">
						<thead>
							<tr>
								<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 계정(이메일 주소)</th>
								<td>
									<div class="ui form">
										<input type="text" name="mbId" placeholder="이메일 주소입력" required>
									</div>
								</td>
							</tr>
							<tr>
								<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 닉네임</th>
								<td>
									<div class="ui form">
										<input type="text" name="mbNickName" placeholder="닉네임 입력" required>
									</div>
								</td>
							</tr>
							<tr>
								<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 비밀번호</th>
								<td>
									<div class="ui form">
										<input type="password" name="mbPwd" id="pwd" placeholder="비밀번호 입력" required>
									</div>
								</td>
							</tr>
							<tr>
								<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 비밀번호 재확인</th>
								<td>
									<div class="ui form">
										<input type="password" id="pwdRe" placeholder="비밀번호 재확인 입력" required>
									</div>
								</td>
							</tr>
							<tr>
								<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 성별</th>
								<td>
									<div class="ui form">
										<input type="radio" name="gender" value="f" style="margin-left: 5px;" required> 여자
										<input type="radio" name="gender" value="m" style="margin-left: 15px;" required> 남자 
									</div>
								</td>
							</tr>
							<tr>
								<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;"> </span> 관심항목</th>
								<td>
									<div class="ui form">
										<input type="checkbox" name="interest" value="다이어트 식품" style="margin-left: 5px;"> 다이어트 식품
										<input type="checkbox" name="interest" value="다이어트 레시피" style="margin-left: 5px;"> 다이어트 레시피
										<input type="checkbox" name="interest" value="다이어트 경험" style="margin-left: 5px;"> 다이어트 경험<br>  
										<input type="checkbox" name="interest" value="운동 방법" style="margin-left: 5px; margin-top: 5px;"> 운동 방법
										<input type="checkbox" name="interest" value="연예인 다이어트" style="margin-left: 5px; margin-top: 5px;"> 연예인 다이어트
										<input type="checkbox" name="interest" value="운동 도구" style="margin-left: 5px; margin-top: 5px;"> 운동 도구
									</div>
								</td>
							</tr>
						</thead>
					</table>
					<hr style="width: 70%;">
					<div class="ui left aligned basic segment" style="padding-left: 15%; margin-top: 0px;">
						<span id="term1" style="color:rgb(250, 40, 40); cursor: pointer;">이용약관</span> 및 <span id="term2" style="color:rgb(250, 40, 40); cursor: pointer;">개인정보 취급방침</span>에 동의합니다.(필수)
						<input type="checkbox" id="termCheck" required>
					</div>
					<button type="submit" class="ui red button">가입하기</button>
					<button type="button" class="ui black button" onclick="back();">뒤로가기</button>
				</form>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
</body>

<!-- 이용약관 -->
<div class="ui modal" id="modal1">
	<div class="ui large header">이용약관</div>
	<div style="overflow: auto; height: 700px;" class="ui tiny header">
		제 1조 (목적)<br>
		본 약관은 다부해(이하 "회사"라 함)이 제공하는 서비스의 이용 조건 및 절차에 관한 사항과 기타 필요한 사항을 전기통신사업법 및 동법 시행령이 정하는 대로 준수하고 규정함을 목적으로 합니다.<br>
		<br><br>
		제 2조 (약관의 효력 및 변경)<br>
		1. 본 약관은 서비스를 이용하고자 하는 모든 회원에 대하여 그 효력을 발생합니다.<br>
		2. 본 약관의 내용은 서비스 화면에 게시하거나 기타 방법으로 이용자에게 공시함으로써 효력을 발생합니다.<br>
		3. 회사는 필요하다고 인정되는 경우 본 약관을 변경할 수 있으며, 약관이 변경된 경우에는 2항과 같은 방법으로 공지합니다.<br>
		다만 이용자의 권리 또는 의무에 관한 중요한 규정의 변경은 최소한 10일(이용자에게 불리하거나 중대한 사항의 변경은 30일전) 이전에 공지합니다.<br>
		4. 회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 할 수 있으며, 변경된 약관의 효력 발생 이후에도 서비스를 계속 이용할 경우 약관의 변경 사항에 동의한 것으로 간주됩니다.<br>
		5. 이 약관은 회원이 이 약관에 동의한 날로부터 회원 탈퇴 시까지 적용하는 것을 원칙으로 합니다. 단, 이 약관의 일부 조항은 회원이 탈퇴 후에도 유효하게 적용될 수 있습니다.<br>
		<br><br>
		제 3조 (약관 외 준칙)<br>
		본 약관에 명시되지 않은 사항이 관례 법령에 규정되어 있을 경우에는 그 규정에 따릅니다.<br>
		<br><br>
		제 4조 (용어의 정의)<br>
		1. 회원: 회사와 서비스 이용에 관한 계약을 체결한 자<br>
		<br><br>
		제 5조 (이용 신청, 승낙 및 거절, 계약의 성립)<br>
		1. 신청자는 본 약관의 동의여부에 대한 질의를 받고 "동의" 버튼을 누름으로써 이용할 수 있습니다.<br>
		2. 회사는 컨텐츠 등급에 따른 제공을 위해 회원에게 실명확인 및 본인인증을 요청할 수 있으며, 그 절차와 방식은 관계법령에 따릅니다.<br>
		3. 서비스이용<br>
		1) 이용동의: 회원이 약관에 동의하고 이용 신청을 한 후 회사가 이 신청에 대하여 승낙함으로써 이루어집니다.<br>
		2) 정보의 수집 : '회사'는 다음과 같은 정보를 수집하며, '회원'은 아래 정보를 제공해야만 '서비스'를 이용하실 수 있습니다.<br>
		① 이메일 주소<br>
		② 기타 회사가 필요하다고 인정하는 사항<br>
		4. 회사는 다음의 경우에 한하여 이용신청을 거절할 수 있습니다.<br>
		1) 회사의 업무상, 기술상의 사정으로 서비스 제공이 불가능한 경우<br>
		2) 이용신청에 필요한 사항을 양식에 맞게 기재하지 않은 경우<br>
		3) 이메일 등 중요 사항이 타인의 정보와 중복되는 경우<br>
		4) 이용자 등록 사항을 누락하거나 오기하여 신청하는 경우<br>
		5) 다른 회원의 아이디 및 비밀번호를 도용한 경우<br>
		6) 부정한 용도로 본 서비스를 이용하고자 하는 경우<br>
		7) 청소년보호법 취지에 위배되는 목적으로 본 서비스를 이용하고자 하는 경우<br>
		8) 영리를 추구할 목적으로 본 서비스를 이용하고자 하는 경우<br>
		9) 사회의 안녕질서 또는 미풍양속을 저해하거나, 저해할 목적으로 신청한 경우<br>
		10) 회원 자격을 상실한 자로서 회사가 정한 일정 가입보류 기간이 경과되지 아니한 자<br>
		11) 기타 회사가 별도로 정한 이용신청 기준에 부합되지 아니한 자<br>
		<br><br>
		제 6조 (서비스 내용 변경, 이용제한 및 중지)<br>
		1. 회사는 필요 시 서비스 내용을 변경할 수 있으며 이 경우 그 내용을 서비스 화면에 대한 게시함으로써 회원에게 고지할 수 있습니다.<br>
		2. 회사는 다음의 경우 서비스 이용을 제한하거나 중지할 수 있으며 그 내용을 사전에 고객에게 고지하여야 하나, 사전 고지가 어려울 경우 사후 최대한 빠른 시간 내에 고지할 수도 있습니다.<br>
		1) 서비스 업그레이드 및 사이트 유지보수 등을 위해 필요한 경우<br>
		2) 콘텐츠 제공업자와의 계약 종료 등 서비스 제공을 위한 원천 데이터 확보가 어려운 경우<br>
		3) 천재지변 등 불가항력에 의해 서비스 제공이 어려울 경우 제 6조 2항과 관련한 서비스 내용 변경, 이용제한 및 중지와 관련하여 발생하는 문제에 대해서 회사는 어떠한 책임도 지지 않습니다.<br>
		3. 회사는 무료로 제공되는 서비스의 일부 또는 전부를 회사의 정책 및 운영의 필요에 따라 변경 또는 중단할 수 있으며, 이에 대하여 회원에게 별도의 보상을 하지 않습니다.<br>
		<br><br>
		제 7조 (계약 변경 및 해지)<br>
		1. 회원이 이용을 원치 않는 경우에는 탈퇴 메뉴를 통해 해지할 수 있습니다.<br>
		2. 회사는 회원이 서비스 이용 내용에 있어서 본 약관 제 5조 3항 내용을 위반하거나, 다음 각 호에 해당하는 경우 사전통보 없이 이용 계약을해지할 수 있습니다.<br>
		1) 서비스에 위해를 가하거나 고의로 방해한 경우<br>
		2) 기타 정상적인 서비스 운영에 방해가 될 경우<br>
		3) 청소년보호법에 금지되어 있는 정보를 전송 또는 게시했을 경우<br>
		4) 정보통신 윤리위원회 등 관련 공공기관의 시정 요구가 있는 경우<br>
		5) 본 약관을 포함하여 기타 회사가 정한 제반 규정 또는 이용 조건을 위반한 경우<br>
		6) 기타 관계 법령에 위배되는 행위를 한 경우<br>
		<br><br>
		제 8조 (과오금 및 분쟁 해결)<br>
		1. 회사는 유료 컨텐츠에 대한 요금 안내 및 이용 동의 절차를 제공합니다..<br>
		2. 과오금이 발생한 경우, 사업자 또는 이용자가 발생사실을 안 때에는 이를 전화, SMS 등으로 상대방에게 통보하며, 과오금에 대해 환불할 수있습니다.<br>
		3. 회사와 회원간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제 신청이 있는 경우에는 공정거래위원회 또는 시, 도지사가 의뢰하는분쟁조정기관의 조정에 따를 수 있습니다.<br>
		4. 약관에 명시되지 않은 사항이 관계 법령에 규정되어 있을 경우에는 해당 규정에 따릅니다.<br>
		5. 회사와 회원간에 발생한 전자상거래 분쟁에 과한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는지방법원의 전속관할로 합니다.<br>
		다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의관할법원에 제기합니다.<br>
		<br><br>
		제 9조 (게시물의 관리)<br>
		1. 회사는 다음 각 호에 해당하는 게시물이나 자료를 사전 통지 없이 삭제하거나 이동 또는 등록을 거부할 수 있습니다.<br>
		<br>
		1) 다른 회원 또는 제삼자에게 심한 모욕을 주거나 중상모략으로 명예를 손상시키는 내용인 경우<br>
		2) 청소년보호법에 위반되는 내용의 정보, 문장, 도형 등을 게시하거나 링크 시키는 경우<br>
		3) 청소년보호법에 위반되는 음란한 내용이거나 음란사이트를 링크 시키는 경우<br>
		4) 불법복제 또는 해킹을 조장하는 내용인 경우<br>
		5) 영리를 목적으로 하는 광고일 경우<br>
		6) 범죄와 결부된다고 객관적으로 인정되는 내용일 경우<br>
		7) 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우<br>
		8) 회사에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우<br>
		9) 기타 관계 법령에 위배된다고 판단되는 경우<br>
		<br><br>
		제 9조 (광고 게재 및 광고주와의 거래)<br>
		1. 회사가 회원에게 서비스를 제공할 수 있는 서비스 투자 기반의 일부는 광고 게재를 통한 수익으로부터 나옵니다. 서비스를 이용하고자 하는회원은 서비스 이용 시 노출되는 광고 게재에 대해 동의하는 것으로 <br>간주됩니다.<br>
		2. 회사는 본 서비스에 게재되어 있거나 본 서비스를 통한 광고주의 판촉 활동에 회원이 참여하거나 교신 또는 거래의 결과로서 발생하는 모든손실 또는 손해에 대해 책임을 지지 않습니다.<br>
		<br><br>
		제 10조 (면책 조항)<br>
		1. 회사는 천재지변, 전쟁 및 기타 이에 준하는 불가항력으로 인해 서비스를 제공할 수 없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.<br>
		2. 회사는 기간통신 사업자가 전기통신 서비스를 중지하거나 정상적으로 제공하지 아니하여 손해가 발생한 경우 책임이 면제됩니다.<br>
		3. 회사는 회원의 귀책사유로 인한 서비스 이용의 장애 또는 손해에 대하여 책임지지 않습니다.<br>
		4. 회사는 회원이 신상정보 및 이메일 주소를 부실하게 기재하여 손해가 발생한 경우 책임을 지지 않습니다.<br>
		<br><br>
		제 11조 (손해배상)<br>
		1. 회사의 고의 또는 중대한 과실로 인하여 회원에게 손해가 발생한 경우 회사는 회원에게 발생한 손해를 배상합니다.<br>
		2. 회원이 본 약관상의 의무를 위반함으로 인하여 회사에 손해가 발생한 경우 회원은 회사에 그 손해를 배상하여야 합니다.<br>
		부칙<br>
		제 1조 (시행일) 본 약관은 2018년 8월 1일부터 시행합니다.<br>
	</div>
</div>


<!-- SCRIPT -->
<script type="text/javascript">
	function back(){
		location.href="/";
	}

	$(document).ready(function() {
		$('#term1').click(function(){
			$('#modal1')
			.modal({
				centered: false
			})
			.modal('show')
			;
		});
	});

	$(document).ready(function() {
		$('#term2').click(function(){
			alert(2);
		});
	});
</script>

</html>