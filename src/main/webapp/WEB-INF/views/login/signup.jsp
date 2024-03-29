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
								<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 계정<div style="font-size: 12px;">(이메일 주소)</div>
									<td>
										<div class="ui form">
											<input type="text" name="mbId" id="mbId" placeholder="이메일 주소입력" required maxlength="30">
											<div id="idMessage" style="display: none;"></div>
										</div>
									</td>
								</tr>
								<tr>
									<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 닉네임<div style="font-size: 12px;">(한글 2~5글자)</div>
										<td>
											<div class="ui form">
												<input type="text" name="mbNickName" id="mbNickName" placeholder="닉네임 입력" required maxlength="5">
												<div id="nickNameMessage" style="display: none;"></div>
											</div>
										</td>
									</tr>
									<tr>
										<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 비밀번호<div style="font-size: 12px;">(영대소문자 및 숫자를 모두 포함한 6~16자리)</div>
										</th>
										<td>
											<div class="ui form">
												<input type="password" name="mbPwd" id="mbPwd" placeholder="비밀번호 입력" required maxlength="16">
												<div id="pwdMessage" style="display: none;"></div>
											</div>
										</td>
									</tr>
									<tr>
										<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 비밀번호 재확인</th>
										<td>
											<div class="ui form">
												<input type="password" id="mbPwdRe" placeholder="비밀번호 재확인 입력" required maxlength="16">
												<div id="pwdReMessage" style="display: none;"></div>
											</div>
										</td>
									</tr>
									<tr>
										<th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;">*</span> 성별</th>
										<td>
											<div class="ui form">
												<input type="radio" name="gender" class="rbtn" value="f" style="margin-left: 5px;" required> 여자
												<input type="radio" name="gender" class="rbtn" value="m" style="margin-left: 15px;" required> 남자 
											</div>
										</td>
									</tr>
							<!-- 		<tr> -->
										<!-- <th><span style="color:red; margin-left: 15px; font-size: 15px; margin-bottom: 0px; margin-top: 0px;"> </span> 관심항목</th>
										<td>
											<div class="ui form"> -->
												<input type="checkbox" name="interest" value=" " style="margin-left: 5px; display: none;" checked="true">
											<!-- 	<input type="checkbox" name="interest" value="다이어트 식품" style="margin-left: 5px;"> 다이어트 식품
											<input type="checkbox" name="interest" value="다이어트 레시피" style="margin-left: 5px;"> 다이어트 레시피
											<input type="checkbox" name="interest" value="다이어트 경험" style="margin-left: 5px;"> 다이어트 경험<br>  
											<input type="checkbox" name="interest" value="운동 방법" style="margin-left: 5px; margin-top: 5px;"> 운동 방법
											<input type="checkbox" name="interest" value="연예인 다이어트" style="margin-left: 5px; margin-top: 5px;"> 연예인 다이어트
											<input type="checkbox" name="interest" value="운동 도구" style="margin-left: 5px; margin-top: 5px;"> 운동 도구 -->
					<!-- 						</div>
															</td> -->
									<!-- </tr> -->
								</thead>
							</table>
							<hr style="width: 70%;">
							<div class="ui left aligned basic segment" style="padding-left: 15%; margin-top: 0px;">
								<span id="term1" style="color:rgb(250, 40, 40); cursor: pointer;">이용약관</span> 및 <span id="term2" style="color:rgb(250, 40, 40); cursor: pointer;">개인정보 취급방침</span>에 동의합니다.(필수)
								<input type="checkbox" id="termCheck" required>
							</div>
							
							
							<!-- 모바일 이용 약관 -->
			<div id="mobile-modal1" style="display:none;">
				<div class="ui large header">이용약관
					<button type="button" class="ui black button" id="mobile-modal1Off" style="float:right;">닫기</button>
				</div>
				<div style="overflow: auto; height: 500px; text-align: left;" class="ui tiny header">
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
				<br>
			</div>
			
			<!-- 모바일 개인정보 취급방침 -->
			<div id="mobile-modal2" style="display:none;">
				<div class="ui large header">개인정보 취급방침
					<button type="button" class="ui black button" id="mobile-modal2Off" style="float:right;">닫기</button>
				</div>
				<div style="overflow: auto; height: 500px; text-align: left;" class="ui tiny header">
					'다부해'은 (이하 ‘회사’는) 회원의 개인정보 보호를 매우 중요시하며, 이를 효과적으로 보호하기 위하여 항상 최선을 다해 노력하고 있습니다. <br>
					회사는 '정보통신망 이용촉진 및 정보보호 등에 관한 법률'을 비롯한 모든 개인정보보호 관련 법률규정 및 정보통신부가 제정한 '개인정보보호정책'을 준수하고 있습니다.<br>
					또한 아래에 게시된 개인정보보호 정책을 통하여 회원이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br>
					<br><br>
					본 개인정보보호정책은 홈페이지에 공개되며, 고객이 언제나 쉽게 찾아볼 수 있도록 하고 있습니다.<br>
					<br><br>
					개인정보 보호정책은 다음의 내용을 포함합니다.<br>
					<br><br>
					가. 수집하는 개인정보 항목 및 수집 방법<br>
					나. 개인정보의 이용 목적<br>
					다. 개인정보의 수집에 대한 동의<br>
					라. 개인정보의 제 3자 제공 및 공유에 대한 동의<br>
					마. 만 14세 미만의 개인정보보호<br>
					바. 개인정보의 보유 기간 및 파기절차와 방법<br>
					사. 쿠키(Cookie)의 운용 및 거부<br>
					아. 이용자 및 법정 대리인의 권리와 그 행사방법<br>
					자. 개인정보의 기술적/관리적 보호 대책<br>
					차. 개인정보 보호 관련 책임자 및 담당자<br>
					카. 개인정보 침해 관련 상담 및 신고<br>
					타. 정책 변경에 따른 공지 의무<br>
					가. 수집하는 개인정보 항목 및 수집 방법<br>
					회사는 회원가입, 상담, 상품 구매, 통계 및 분석을 통해 최적의 서비스를 제공하기 위한 목적으로 아래와 같은 최소한의 개인정보를 수집, 이용하고 있습니다.<br>
					<br><br>
					첫째. 수집하는 개인정보 항목 및 수집 목적<br>
					① 회원가입 시 : 성별, 로그인 메일계정, 비밀번호, 헬스앱(Health app) 건강 정보<br>
					- 헬스앱(Health app) 건강 정보 : 아이폰 사용자에 한해 만보계 걸음 수 제공을 위해 수집<br>
					(Healthkits API 또는 건강 및 피트니스 정보를 걸음 수 제공 이외의 다른 목적으로 사용하지 않습니다.)<br>
					② 상품구매 시 : 이름, 휴대전화번호, 로그인 메일계정, 주소, 결제 정보<br>
					둘째. 수집하는 정보<br>
					- 서비스 이용 과정에서 생성 수집되는 서비스이용기록, 접속로그, 쿠키, 접속IP, 결제기록<br>
					<br><br>
					셋째. 수집 방법<br>
					- 홈페이지, 휴대폰 접속 로그에 의한 정보 수집<br>
					<br><br>
					나. 개인정보의 이용 목적<br>
					회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>
					<br><br>
					첫째. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금 정산<br>
					- 컨텐츠 제공, 유료 컨텐츠, 상품 구매 및 요금 결제<br>
					<br><br>
					둘째. 회원 관리<br>
					- 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원 처리<br>
					<br><br>
					셋째. 마케팅 및 광고에 활용<br>
					- 회원의 서비스 이용에 대한 통계 및 접속빈도 파악, 새로운 서비스 및 이벤트 정보 제공<br>
					<br><br>
					다. 개인정보 수집에 대한 동의<br>
					회사는 적법하고 공정한 수단에 의하여 서비스 계약의 성립 및 이행에 필요한 최소한의 개인정보를 수집합니다.<br>
					회사는 이용자의 개인 식별이 가능한 개인정보를 수집하는 때는 반드시 아래의 적법한 절차에 따라 당해 이용자의 동의를 받습니다.<br>
					회원의 개인정보 수집과 관련하여 이용약관 또는 개인정보취급방침을 통해 그 내용을 고지하고 있으며, 회원이 위 내용에 대해 '동의' 버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.<br>
					<br><br>
					라. 개인정보의 제 3자 제공 및 공유에 대한 동의<br>
					회사는 회원이 공개를 동의한 경우나 회사의 이용약관, 회사가 별도로 정한 정책 및 운영규정에 어긋나는 행위를 하여 법적인 조치가 요구되거나관련 정부 기관의 요구가 있는 경우를 제외하고는 어떠한 <br>
					<br><br>
					경우에도 본 개인정보 보호정책에서 고지한 범위를 넘어 회원의 개인정보를 이용하거나타인 또는 타기업, 기관에 제공하지 않습니다.<br>
					본 개인정보 보호정책에 의한 회원의 개인정보 제공 및 공유에 추가하여 개인정보를 제공하거나 공유하는 경우에는 사전에 회원에게 제공받거나공유하는 자가 누구이며 주된 사업이 무엇인지, 제공 또는 <br>
					<br><br>
					공유되는 개인정보 항목이 무엇인지, 개인정보를 제공하거나 공유하는 목적이 무엇인지등에 대해 이용약관, 개인정보 보호정책, 이메일 또는 서면을 통해 고지한 후 이에 대한 동의를 구합니다.<br>
					다만, 다음의 경우에는 관련 법령의 규정에 의하여 회원의 동의 없이 개인정보를 제공하는 것이 가능합니다.<br>
					<br><br>
					첫째. 서비스 제공에 따른 요금정산을 위하여 필요한 경우<br>
					둘째. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우<br>
					셋째. 금융실명거래 및 비밀보장에 관한 법률, 신용정보의 이용 및 보호에 관한 법률, 전기통신기본법, 전기통신사업법, 지방세법, 소비자기본법,한국은행법, 형사소송법 등 법률에 특별한 규정이 있는 경
					<br>
					우 회사는 서비스 제공을 위하여 제공된 개인 정보는 별도 동의를 득한 경우를 제외하고는 서비스 해지(탈퇴 신청 포함) 후 30일까지 보관합니다.<br>
					마. 만 14세 미만의 개인정보보호<br>
					만 14세 미만의 아동은 회원으로 가입하기 전에 반드시 법정대리인의 동의를 받아야 합니다.<br>
					법정대리인은 언제든지 아동의 개인정보 열람, 정정, 일부 정보 삭제, 동의 철회 등을 회사에 요청할 수 있으며, 이러한 요청에 대하여 회사는 지체 없이 필요한 조치를 취하여야 합니다.
					<br>
					바. 개인정보의 보유 기간 및 파기절차와 방법<br>
					회사는 개인정보의 수집 목적 또는 제공받은 목적이 달성된 때에는 회원의 개인정보를 지체 없이 폐기합니다.<br>
					<br>
					첫째. 파기 대상<br>
					① 고객이 서비스 해지(탈퇴 신청 포함)를 요청한 경우 지체 없이 폐기<br>
					단, 수집 목적 또는 제공받은 목적이 달성된 경우에도 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우에는 예외적으로 회원의개인정보를 보유할 수 있습니다.<br>
					② 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우<br>
					③ 정당한 절차에 따라 보유 기간을 미리 회원에게 고지하거나 명시한 경우<br>
					④ 개별적으로 회원의 동의를 받은 경우<br>
					⑤ 고객상담 및 회원의 추가적인 피해 방지를 위해 30일간 보관하는 경우<br>
					둘째. 파기 방법<br>
					① 종이에 출력된 개인정보 : 분쇄기로 분쇄<br>
					② 전자적 파일 형태로 저장된 개인정보 : 기록을 재생할 수 없는 기술적 방법으로 삭제<br>
					사. 쿠키(Cookie)의 운용 및 거부<br>
					첫째. 쿠키의 정의<br>
					- 쿠키(cookie)란 웹 서버가 웹 브라우저에 보내어 저장했다가 서버의 부가적인 요청이 있을 때 다시 서버로 보내주는 문자열 정 보(텍스트 파일)로 회원의 컴퓨터 하드디스크에 저장되며 쿠키에는 사용한 <br>
					<br><br>
					웹사이트의 정보 및 이용자의 개인정보가 담길 수 있습니다.<br>
					<br><br>
					둘째. 쿠키의 사용 목적<br>
					- 회사는 인터넷 서비스를 통하여 회원의 정보를 저장하고 수시로 찾아내는 쿠키를 설치 운용하고 있습니다. 회원이 웹사이트에 접속을 하면 회원의 브라우저에 있는 쿠키의 내용을 읽고, 접속 빈도나 방<br>
					<br>
					문시간 <br>등 고객의 이용 행태에 대한 정보를 저장하 여 보다 나은 서비스 제공을 위해 사용하고 있습니다.

					셋째. 쿠키 설정 거부 방법<br>
					- 회원은 쿠키 설치에 대한 선택권을 가지고 있으며, 회원은 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 또 는 쿠키가 저장될 때마다 확인을 거치거나, 혹은 모든 쿠키의 저장을 거부할 
					<br>
					수도 있습니다.<br>
					단, 회원님께서 쿠키 설치를 거부 하였을 경우 서비스 제공에 어려움이 발생할 수 있습니다.<br>
					<br><br>
					① Internet Explorer의 경우 : 웹 브라우저 상단의 도구 메뉴 > 인터넷 옵션 > 개인정보 > 설정<br>
					② Chrome의 경우 : 웹 브라우저 우측의 설정 메뉴 > 화면 하단의 고급 설정 표시 > 개인정보의 콘텐츠 설정 버튼 > 쿠키<br>
					아. 이용자 및 법정 대리인의 권리와 그 행사방법<br>
					첫째. 개인정보의 삭제 요청<br>
					- 회원은 언제든지 등록되어 있는 회원의 개인정보를 삭제 요청할 수 있습니다. 개인정보 관련 담당자에게 전화 또는 이메일로 연락하시면지체 없이 조치하겠습니다. 만일 회원의 대리인이 요청하는 경우<br>
					<br><br>
					에는 회원의 진정한 대리인인지 여부를 확인하기 위해, 대리관계를 나타내는증표를 제시하도록 요구할 수 있습니다.<br>
					단, 다음과 같은 경우에는 예외적으로 개인정보의 삭제 요청을 제한할 수 있습니다.<br>
					<br>
					① 당해 서비스 제공자의 업무에 현저한 지장을 미칠 우려가 있는 경우<br>
					② 분쟁중이거나 법령에 위반되는 경우<br>
					둘째. 동의 철회 및 회원 탈퇴 방법<br>
					- 회원은 회원가입 시 개인정보의 수집, 이용 및 제공에 대해 동의한 내용을 언제든지 철회할 수 있습니다.<br>
					<br><br>
					자. 개인정보의 기술적/관리적 보호 대책<br>
					회사는 회원의 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 개인정보 보호를 위해 다음과 같은 기술적/관리적 대 책을 시행하고 있습니다.<br>
					<br>
					첫째. 비밀번호의 암호화<br>
					- 회원의 비밀번호(Password)는 암호화되어 저장 및 관리되고 있습니다. 비밀번호는 오직 회원 본인만 알 수 있으며 개인정보를 확인 및 변경할 경우에도 비밀번호를 알고 있는 본인에 의해서만 가능합니

					다.<br>

					둘째. 해킹 및 컴퓨터 바이러스 등에 대비<br>
					- 회사는 해킹이나 컴퓨터 바이러스에 의하여 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위하여 필요한 보안조치를 이 용하고 있으며, 더욱 향상된 보안조치를 확보할 수 있도록 가능한 모든 기
					<br>
					술적 방법을 구비하기 위하여 노력하고 있습니다.<br>
					<br>
					셋째. 개인정보 취급자의 제한 및 교육<br>
					- 회사는 개인정보를 취급하는 직원을 최소한으로 제한하고 있으며, 관련 직원들에 대한 교육을 수시로 실시하여 본 방침의 이 행 및 준수여부를 확인하고 있습니다.<br>
					<br>
					차. 개인정보 관리 책임자 및 담당자<br>
					회원의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.<br>
					서비스를 이용하시면서 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당자에게 신고하시면 신속하게 답변해드리도록하겠습니다.<br>
					<br><br>
					가. 개인정보관리책임자<br>
					1) 성명 : ㅇㅇㅇ<br>
					2) 이메일 : admin@admin.com<br>
					3) 전화번호 : 1555-1515<br>
					나. 개인정보관리담당자<br>
					1) 성명 : ㅁㅁㅁ<br>
					2) 이메일 : admin2@admin.com<br>
					3) 전화번호 : 1555-1516<br>
					카. 개인정보 침해 관련 상담 및 신고<br>
					개인정보 침해에 대한 상담 및 신고가 필요하신 경우에는 개인정보 관련 담당자에게 전화 또는 이메일로 연락하시거나, 정보통신부 산하 공공기관인한국정보보호진흥원(KISA) 내에 설치된 개인정보 침해 <br>
					<br>
					신고센터로 문의하시기 바랍니다.<br>
					<br><br>
					☞ 개인정보침해신고센터 전화 : (국번없이)118 / 홈페이지 : http://www.118.or.kr<br>
					☞ 정보보호마크인증위원회 전화 : 02-580-0533~4 / 홈페이지 : http://www.eprivacy.or.kr<br>
					☞ 대검찰청 첨단범죄수사과 전화 : 02-3480-2000 / 홈페이지 : http://www.spo.go.kr<br>
					☞ 경찰청 사이버테러대응센터 전화 : 02-392-0330 / 홈페이지 : http://www.ctrc.go.kr<br>
					타. 정책 변경에 따른 공지 의무<br>
					본 개인정보 보호정책은 관련 법률 및 정부 지침의 변경과 회사의 내부 정책 변경에 의하여 수시로 변경될 수 있습니다.<br>
					회사의 개인정보 보호정책이 변경될 경우에는 변경되는 정책을 시행하기 최소 7일 전, 회사가 서비스를 제공하는 각 웹사이트에 공지합니다.<br>
					변경 관련 문의 사항은 개인정보 관리 책임자 및 담당자에게 문의하거나 회사의 웹사이트 고객센터를 통해 할 수 있습니다.<br>
					<br><br>
					① 개인정보 보호정책 변경 일자 : 2018년 8월 1일<br>
					② 이전 개인정보 보호정책 시행 일자 : 2018년 8월 1일<br>
				</div>
				<br>
			</div>
							<button type="submit" class="ui red button" id="signupCheck">가입하기</button>
							<button type="button" class="ui black button" onclick="back();">뒤로가기</button>
						</form>
					</div>
				</div>
			</div>

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

			<!-- 개인정보 취급방침 -->
			<div class="ui modal" id="modal2">
				<div class="ui large header">개인정보 취급방침</div>
				<div style="overflow: auto; height: 700px;" class="ui tiny header">
					'다부해'은 (이하 ‘회사’는) 회원의 개인정보 보호를 매우 중요시하며, 이를 효과적으로 보호하기 위하여 항상 최선을 다해 노력하고 있습니다. <br>
					회사는 '정보통신망 이용촉진 및 정보보호 등에 관한 법률'을 비롯한 모든 개인정보보호 관련 법률규정 및 정보통신부가 제정한 '개인정보보호정책'을 준수하고 있습니다.<br>
					또한 아래에 게시된 개인정보보호 정책을 통하여 회원이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.<br>
					<br><br>
					본 개인정보보호정책은 홈페이지에 공개되며, 고객이 언제나 쉽게 찾아볼 수 있도록 하고 있습니다.<br>
					<br><br>
					개인정보 보호정책은 다음의 내용을 포함합니다.<br>
					<br><br>
					가. 수집하는 개인정보 항목 및 수집 방법<br>
					나. 개인정보의 이용 목적<br>
					다. 개인정보의 수집에 대한 동의<br>
					라. 개인정보의 제 3자 제공 및 공유에 대한 동의<br>
					마. 만 14세 미만의 개인정보보호<br>
					바. 개인정보의 보유 기간 및 파기절차와 방법<br>
					사. 쿠키(Cookie)의 운용 및 거부<br>
					아. 이용자 및 법정 대리인의 권리와 그 행사방법<br>
					자. 개인정보의 기술적/관리적 보호 대책<br>
					차. 개인정보 보호 관련 책임자 및 담당자<br>
					카. 개인정보 침해 관련 상담 및 신고<br>
					타. 정책 변경에 따른 공지 의무<br>
					가. 수집하는 개인정보 항목 및 수집 방법<br>
					회사는 회원가입, 상담, 상품 구매, 통계 및 분석을 통해 최적의 서비스를 제공하기 위한 목적으로 아래와 같은 최소한의 개인정보를 수집, 이용하고 있습니다.<br>
					<br><br>
					첫째. 수집하는 개인정보 항목 및 수집 목적<br>
					① 회원가입 시 : 성별, 로그인 메일계정, 비밀번호, 헬스앱(Health app) 건강 정보<br>
					- 헬스앱(Health app) 건강 정보 : 아이폰 사용자에 한해 만보계 걸음 수 제공을 위해 수집<br>
					(Healthkits API 또는 건강 및 피트니스 정보를 걸음 수 제공 이외의 다른 목적으로 사용하지 않습니다.)<br>
					② 상품구매 시 : 이름, 휴대전화번호, 로그인 메일계정, 주소, 결제 정보<br>
					둘째. 수집하는 정보<br>
					- 서비스 이용 과정에서 생성 수집되는 서비스이용기록, 접속로그, 쿠키, 접속IP, 결제기록<br>
					<br><br>
					셋째. 수집 방법<br>
					- 홈페이지, 휴대폰 접속 로그에 의한 정보 수집<br>
					<br><br>
					나. 개인정보의 이용 목적<br>
					회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>
					<br><br>
					첫째. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금 정산<br>
					- 컨텐츠 제공, 유료 컨텐츠, 상품 구매 및 요금 결제<br>
					<br><br>
					둘째. 회원 관리<br>
					- 회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원 처리<br>
					<br><br>
					셋째. 마케팅 및 광고에 활용<br>
					- 회원의 서비스 이용에 대한 통계 및 접속빈도 파악, 새로운 서비스 및 이벤트 정보 제공<br>
					<br><br>
					다. 개인정보 수집에 대한 동의<br>
					회사는 적법하고 공정한 수단에 의하여 서비스 계약의 성립 및 이행에 필요한 최소한의 개인정보를 수집합니다.<br>
					회사는 이용자의 개인 식별이 가능한 개인정보를 수집하는 때는 반드시 아래의 적법한 절차에 따라 당해 이용자의 동의를 받습니다.<br>
					회원의 개인정보 수집과 관련하여 이용약관 또는 개인정보취급방침을 통해 그 내용을 고지하고 있으며, 회원이 위 내용에 대해 '동의' 버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.<br>
					<br><br>
					라. 개인정보의 제 3자 제공 및 공유에 대한 동의<br>
					회사는 회원이 공개를 동의한 경우나 회사의 이용약관, 회사가 별도로 정한 정책 및 운영규정에 어긋나는 행위를 하여 법적인 조치가 요구되거나관련 정부 기관의 요구가 있는 경우를 제외하고는 어떠한 <br>
					<br><br>
					경우에도 본 개인정보 보호정책에서 고지한 범위를 넘어 회원의 개인정보를 이용하거나타인 또는 타기업, 기관에 제공하지 않습니다.<br>
					본 개인정보 보호정책에 의한 회원의 개인정보 제공 및 공유에 추가하여 개인정보를 제공하거나 공유하는 경우에는 사전에 회원에게 제공받거나공유하는 자가 누구이며 주된 사업이 무엇인지, 제공 또는 <br>
					<br><br>
					공유되는 개인정보 항목이 무엇인지, 개인정보를 제공하거나 공유하는 목적이 무엇인지등에 대해 이용약관, 개인정보 보호정책, 이메일 또는 서면을 통해 고지한 후 이에 대한 동의를 구합니다.<br>
					다만, 다음의 경우에는 관련 법령의 규정에 의하여 회원의 동의 없이 개인정보를 제공하는 것이 가능합니다.<br>
					<br><br>
					첫째. 서비스 제공에 따른 요금정산을 위하여 필요한 경우<br>
					둘째. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우<br>
					셋째. 금융실명거래 및 비밀보장에 관한 법률, 신용정보의 이용 및 보호에 관한 법률, 전기통신기본법, 전기통신사업법, 지방세법, 소비자기본법,한국은행법, 형사소송법 등 법률에 특별한 규정이 있는 경
					<br>
					우 회사는 서비스 제공을 위하여 제공된 개인 정보는 별도 동의를 득한 경우를 제외하고는 서비스 해지(탈퇴 신청 포함) 후 30일까지 보관합니다.<br>
					마. 만 14세 미만의 개인정보보호<br>
					만 14세 미만의 아동은 회원으로 가입하기 전에 반드시 법정대리인의 동의를 받아야 합니다.<br>
					법정대리인은 언제든지 아동의 개인정보 열람, 정정, 일부 정보 삭제, 동의 철회 등을 회사에 요청할 수 있으며, 이러한 요청에 대하여 회사는 지체 없이 필요한 조치를 취하여야 합니다.
					<br>
					바. 개인정보의 보유 기간 및 파기절차와 방법<br>
					회사는 개인정보의 수집 목적 또는 제공받은 목적이 달성된 때에는 회원의 개인정보를 지체 없이 폐기합니다.<br>
					<br>
					첫째. 파기 대상<br>
					① 고객이 서비스 해지(탈퇴 신청 포함)를 요청한 경우 지체 없이 폐기<br>
					단, 수집 목적 또는 제공받은 목적이 달성된 경우에도 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우에는 예외적으로 회원의개인정보를 보유할 수 있습니다.<br>
					② 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우<br>
					③ 정당한 절차에 따라 보유 기간을 미리 회원에게 고지하거나 명시한 경우<br>
					④ 개별적으로 회원의 동의를 받은 경우<br>
					⑤ 고객상담 및 회원의 추가적인 피해 방지를 위해 30일간 보관하는 경우<br>
					둘째. 파기 방법<br>
					① 종이에 출력된 개인정보 : 분쇄기로 분쇄<br>
					② 전자적 파일 형태로 저장된 개인정보 : 기록을 재생할 수 없는 기술적 방법으로 삭제<br>
					사. 쿠키(Cookie)의 운용 및 거부<br>
					첫째. 쿠키의 정의<br>
					- 쿠키(cookie)란 웹 서버가 웹 브라우저에 보내어 저장했다가 서버의 부가적인 요청이 있을 때 다시 서버로 보내주는 문자열 정 보(텍스트 파일)로 회원의 컴퓨터 하드디스크에 저장되며 쿠키에는 사용한 <br>
					<br><br>
					웹사이트의 정보 및 이용자의 개인정보가 담길 수 있습니다.<br>
					<br><br>
					둘째. 쿠키의 사용 목적<br>
					- 회사는 인터넷 서비스를 통하여 회원의 정보를 저장하고 수시로 찾아내는 쿠키를 설치 운용하고 있습니다. 회원이 웹사이트에 접속을 하면 회원의 브라우저에 있는 쿠키의 내용을 읽고, 접속 빈도나 방<br>
					<br>
					문시간 <br>등 고객의 이용 행태에 대한 정보를 저장하 여 보다 나은 서비스 제공을 위해 사용하고 있습니다.

					셋째. 쿠키 설정 거부 방법<br>
					- 회원은 쿠키 설치에 대한 선택권을 가지고 있으며, 회원은 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 또 는 쿠키가 저장될 때마다 확인을 거치거나, 혹은 모든 쿠키의 저장을 거부할 
					<br>
					수도 있습니다.<br>
					단, 회원님께서 쿠키 설치를 거부 하였을 경우 서비스 제공에 어려움이 발생할 수 있습니다.<br>
					<br><br>
					① Internet Explorer의 경우 : 웹 브라우저 상단의 도구 메뉴 > 인터넷 옵션 > 개인정보 > 설정<br>
					② Chrome의 경우 : 웹 브라우저 우측의 설정 메뉴 > 화면 하단의 고급 설정 표시 > 개인정보의 콘텐츠 설정 버튼 > 쿠키<br>
					아. 이용자 및 법정 대리인의 권리와 그 행사방법<br>
					첫째. 개인정보의 삭제 요청<br>
					- 회원은 언제든지 등록되어 있는 회원의 개인정보를 삭제 요청할 수 있습니다. 개인정보 관련 담당자에게 전화 또는 이메일로 연락하시면지체 없이 조치하겠습니다. 만일 회원의 대리인이 요청하는 경우<br>
					<br><br>
					에는 회원의 진정한 대리인인지 여부를 확인하기 위해, 대리관계를 나타내는증표를 제시하도록 요구할 수 있습니다.<br>
					단, 다음과 같은 경우에는 예외적으로 개인정보의 삭제 요청을 제한할 수 있습니다.<br>
					<br>
					① 당해 서비스 제공자의 업무에 현저한 지장을 미칠 우려가 있는 경우<br>
					② 분쟁중이거나 법령에 위반되는 경우<br>
					둘째. 동의 철회 및 회원 탈퇴 방법<br>
					- 회원은 회원가입 시 개인정보의 수집, 이용 및 제공에 대해 동의한 내용을 언제든지 철회할 수 있습니다.<br>
					<br><br>
					자. 개인정보의 기술적/관리적 보호 대책<br>
					회사는 회원의 개인정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 개인정보 보호를 위해 다음과 같은 기술적/관리적 대 책을 시행하고 있습니다.<br>
					<br>
					첫째. 비밀번호의 암호화<br>
					- 회원의 비밀번호(Password)는 암호화되어 저장 및 관리되고 있습니다. 비밀번호는 오직 회원 본인만 알 수 있으며 개인정보를 확인 및 변경할 경우에도 비밀번호를 알고 있는 본인에 의해서만 가능합니

					다.<br>

					둘째. 해킹 및 컴퓨터 바이러스 등에 대비<br>
					- 회사는 해킹이나 컴퓨터 바이러스에 의하여 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위하여 필요한 보안조치를 이 용하고 있으며, 더욱 향상된 보안조치를 확보할 수 있도록 가능한 모든 기
					<br>
					술적 방법을 구비하기 위하여 노력하고 있습니다.<br>
					<br>
					셋째. 개인정보 취급자의 제한 및 교육<br>
					- 회사는 개인정보를 취급하는 직원을 최소한으로 제한하고 있으며, 관련 직원들에 대한 교육을 수시로 실시하여 본 방침의 이 행 및 준수여부를 확인하고 있습니다.<br>
					<br>
					차. 개인정보 관리 책임자 및 담당자<br>
					회원의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 관련 부서 및 개인정보관리책임자를 지정하고 있습니다.<br>
					서비스를 이용하시면서 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당자에게 신고하시면 신속하게 답변해드리도록하겠습니다.<br>
					<br><br>
					가. 개인정보관리책임자<br>
					1) 성명 : ㅇㅇㅇ<br>
					2) 이메일 : admin@admin.com<br>
					3) 전화번호 : 1555-1515<br>
					나. 개인정보관리담당자<br>
					1) 성명 : ㅁㅁㅁ<br>
					2) 이메일 : admin2@admin.com<br>
					3) 전화번호 : 1555-1516<br>
					카. 개인정보 침해 관련 상담 및 신고<br>
					개인정보 침해에 대한 상담 및 신고가 필요하신 경우에는 개인정보 관련 담당자에게 전화 또는 이메일로 연락하시거나, 정보통신부 산하 공공기관인한국정보보호진흥원(KISA) 내에 설치된 개인정보 침해 <br>
					<br>
					신고센터로 문의하시기 바랍니다.<br>
					<br><br>
					☞ 개인정보침해신고센터 전화 : (국번없이)118 / 홈페이지 : http://www.118.or.kr<br>
					☞ 정보보호마크인증위원회 전화 : 02-580-0533~4 / 홈페이지 : http://www.eprivacy.or.kr<br>
					☞ 대검찰청 첨단범죄수사과 전화 : 02-3480-2000 / 홈페이지 : http://www.spo.go.kr<br>
					☞ 경찰청 사이버테러대응센터 전화 : 02-392-0330 / 홈페이지 : http://www.ctrc.go.kr<br>
					타. 정책 변경에 따른 공지 의무<br>
					본 개인정보 보호정책은 관련 법률 및 정부 지침의 변경과 회사의 내부 정책 변경에 의하여 수시로 변경될 수 있습니다.<br>
					회사의 개인정보 보호정책이 변경될 경우에는 변경되는 정책을 시행하기 최소 7일 전, 회사가 서비스를 제공하는 각 웹사이트에 공지합니다.<br>
					변경 관련 문의 사항은 개인정보 관리 책임자 및 담당자에게 문의하거나 회사의 웹사이트 고객센터를 통해 할 수 있습니다.<br>
					<br><br>
					① 개인정보 보호정책 변경 일자 : 2018년 8월 1일<br>
					② 이전 개인정보 보호정책 시행 일자 : 2018년 8월 1일<br>
				</div>
			</div>
			
			
				
			
			<jsp:include page="/resources/layout/footer.jsp"></jsp:include>
		</body>

		<!-- SCRIPT -->
		<script type="text/javascript">

			var idRegExp = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			var pwdRegExp = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\S+$).{6,16}$/;
			var nickNameRegExp = /^[가-힣]{2,5}$/;

			var idPass = false;
			var nickNamePass = false;
			var pwdRePass = false;

			function back(){
				location.href="/";
			}

			$(document).ready(function() {
				$('#term1').click(function(){
					if(typeof Android !== "undefined" && Android !==null){
						$('#mobile-modal2').css('display','none');
						$('#mobile-modal1').css('display','block');
					}else{ 
						$('#modal1').modal({
							centered: false
						}).modal('show')
						;
					}
				});

				$('#term2').click(function(){
					if(typeof Android !== "undefined" && Android !==null){
						$('#mobile-modal1').css('display','none');
						$('#mobile-modal2').css('display','block');
					}else{ 
						$('#modal2').modal({
							centered: false
						}).modal('show')
						;
					}
				});

				// 아이디 중복 확인
				$('#mbId').keyup(function() {

					var id = $('#mbId').val();
					idCheck = idRegExp.test(id);

					if(idCheck == true){
						$.ajax({
							url : '/idCheck.diet',
							data : {'id' : id},
							type : 'post',
							success : function(data){
							
								if(data == '0'){
									$('#idMessage').html('* 사용 가능한 아이디 입니다').css('display', 'block').css('color', 'blue');
									idPass = true;
								} else 	{
									$('#idMessage').html('* 이미 사용 중인 아이디 입니다').css('display', 'block').css('color', 'red');
									idPass = false;
								}
							},
						});
					} else {
						$('#idMessage').html('* 아이디 형식을 확인해주세요').css('display', 'block').css('color', 'red');
					}
				});

				// 닉네임 중복 확인
				$('#mbNickName').keyup(function() {

					var nickName = $('#mbNickName').val();
					nickNameCheck = nickNameRegExp.test(nickName);

					if(nickNameCheck == true){
						$.ajax({
							url : '/nickNameCheck.diet',
							data : {'nickName' : nickName},
							type : 'post',
							success : function(data){
								if(data == '0'){
									$('#nickNameMessage').html('* 사용 가능한 닉네임 입니다').css('display', 'block').css('color', 'blue');
									nickNamePass = true;
								} else 	{
									$('#nickNameMessage').html('* 이미 사용 중인 닉네임 입니다').css('display', 'block').css('color', 'red');
									nickNamePass = false;
								}
							}
						});
					} else {
						$('#nickNameMessage').html('* 닉네임 형식을 확인해주세요').css('display', 'block').css('color', 'red');
					}
				});
			});

			// 비밀번호 확인
			$('#mbPwd').focus(function(){
				$('#mbPwd').keyup(function(){
					var pwd = $('#mbPwd').val();
					pwdCheck = pwdRegExp.test(pwd);
					if(pwdCheck == true){
						$('#pwdMessage').html('* 사용 가능한 비밀번호 입니다').css('display', 'block').css('color', 'blue');
						if($('#mbPwdRe').val() == $('#mbPwd').val()){
							$('#pwdReMessage').html('* 비밀번호가 일치합니다').css('display', 'block').css('color', 'blue');
							pwdRePass = true;
						} else {
							$('#pwdReMessage').html('* 비밀번호를 확인해주세요').css('display', 'block').css('color', 'red');
							pwdRePass = false;
						}
					} else {
						$('#pwdMessage').html('* 비밀번호 형식을 확인해주세요').css('display', 'block').css('color', 'red');
					}
				});

			})

			// 비밀번호 재 확인
			$('#mbPwdRe').focus(function(){
				$('#mbPwdRe').keyup(function(){
					if($('#mbPwd').val() == $('#mbPwdRe').val()){
						$('#pwdReMessage').html('* 비밀번호가 일치합니다').css('display', 'block').css('color', 'blue');
						pwdRePass = true;
					} else {
						$('#pwdReMessage').html('* 비밀번호를 확인해주세요').css('display', 'block').css('color', 'red');
						pwdRePass = false;
					}
				});
			})

			// 가입하기 확인
			$('#signupCheck').click(function(){

				var radio = $('input:radio[class=rbtn]').is(':checked');

				if(idPass == false || nickNamePass == false || pwdCheck == false || pwdRePass == false || radio == false){
					if(typeof Android !== "undefined" && Android !==null){
						Android.checkEnrollForm();
					}else{
						alert('가입 형식을 확인해주세요');
					}
					return false;
				} else if($('#termCheck').is(":checked") == false){
					if(typeof Android !== "undefined" && Android !==null){
						Android.checkAgree();
					}else{
						alert('약관동의를 해주세요')
					}
					return false;
				} else {
					if(typeof Android !== "undefined" && Android !==null){
						Android.enrollOK();
					}else{
						alert('가입이 완료 되었습니다');
					}
					return true;
				}
			});
			
			/* 모바일용 모달 창 종료 */
			$("#mobile-modal1Off").click(function() {
				$("#mobile-modal1").css('display','none');
			});
			
			$("#mobile-modal2Off").click(function() {
				$("#mobile-modal2").css('display','none');
			});

		</script>
<style type="text/css" media="screen">
/* 모바일용 아닌 사이즈 */
@media ( min-width : 650px) {
	#size2 {
		display: none;
	}
}
/* 모바일용 사이즈 */
@media ( max-width : 649px) {
	#size2 {
		display: block;
	}
}
</style>
</html>