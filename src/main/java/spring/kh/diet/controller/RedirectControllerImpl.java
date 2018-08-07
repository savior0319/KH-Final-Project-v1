package spring.kh.diet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedirectControllerImpl implements RedirectController {

	@SuppressWarnings("unused")
	private final String redirectMain = "redirect:/";

	public RedirectControllerImpl() {
	}

	@Override
	@RequestMapping(value = "loginFailed.diet")
	public String redirectLogin() {
		return "login/login";
	}

	/* 메인 페이지 - 자주 묻는 질문 */
	@Override
	@RequestMapping(value = "/faq.diet")
	public String redirectFaq() {
		return "customer/faq";
	}

	/* 관리자 페이지 - 페이지 관리 */
	@Override
	@RequestMapping(value = "/pageManagement.diet")
	public String redirectPageManagement() {
		return "admin/pageManagement";
	}

	/* 메인 페이지 - 트레이너 찾기 */
	@Override
	@RequestMapping(value = "/trainerFind.diet")
	public String redirectTrainerFind() {
		return "main/trainerFind";
	}

	/* 메인 페이지 - 트레이너 매칭 */
	@Override
	@RequestMapping(value = "/trainerMatch.diet")
	public String redirectTrainerMath() {
		return "main/trainerMatch";
	}

	/* 메인 페이지 - BMI 계산하기 */
	@Override
	@RequestMapping(value = "/bmiCal.diet")
	public String redirectBMICal() {
		return "main/bmiCal";
	}

	/* 메인 페이지 - 칼로리 처방 이동 */
	@Override
	@RequestMapping(value = "/bmrCal.diet")
	public String redirectCalCal() {
		return "main/bmrCal";
	}

	/* 관리자 페이지 - 이동 */
	@Override
	@RequestMapping(value = "/admin.diet")
	public String redirectAdminPage() {
		return "admin/admin";
	}

	/* 관리자 페이지 - 공지사항 등록 */
	@Override
	@RequestMapping(value = "/noticeRegister.diet")
	public String redirectNoticeRegisterPage() {
		return "admin/noticeRegister";
	}

	/* 로그인 */
	@Override
	@RequestMapping(value = "/login.diet")
	public String redirectLoginPage() {
		return "login/login";
	}

	/* 회원가입 */
	@Override
	@RequestMapping(value = "/signup.diet")
	public String redirectSignup() {
		return "login/signup";
	}

	/* 마이페이지 - 회원 정보 */
	@Override
	@RequestMapping(value = "/myInfo.diet")
	public String redirectMyInfo() {
		return "myInfo/myInfoUpdate";
	}

	/* 마이페이지 - 회원 정보 변경 */
	@Override
	@RequestMapping(value = "/myInfoUpdate.diet")
	public String redirectMyInfoUpdate() {
		return "myInfo/myInfoUpdate";
	}

	/* 마이페이지 - 내 적립금 */
	@Override
	@RequestMapping(value = "/myPoint.diet")
	public String redirectMyPoint() {
		return "myInfo/myPoint";
	}

	/* 마이페이지 - 회원 탈퇴 */
	@Override
	@RequestMapping(value = "/secession.diet")
	public String redirectSecession() {
		return "myInfo/secession";
	}

	/* 마이페이지 - 쿠폰 */
	@Override
	@RequestMapping(value = "/myCoupon.diet")
	public String redirectMyCoupon() {
		return "myInfo/myCoupon";
	}

	/* 마이페이지 - 일대일 문의 */
	@Override
	@RequestMapping(value = "/myOneToOneQuestion.diet")
	public String redirectMyOneToOneQuestion() {
		return "myInfo/myOneToOneQuestion";
	}

	/* 마이페이지 - 나의 다이어리 */
	@Override
	@RequestMapping(value = "/myDiary.diet")
	public String redirectMyDiary() {
		return "myInfo/myDiary";
	}

	/* 커뮤니티 - 글등록할 페이지 */
	@Override
	@RequestMapping(value = "/registCommunity.diet")
	public String redirectRegistCommunity() {
		return "community/registCommunity";
	}

	/* 고객센터 - 트레이너 회원 등록 */
	@Override
	@RequestMapping(value = "/trainerReg.diet")
	public String trainerReg() {
		return "main/trainerReg";
	}

	/* 마이페이지 - 나의 트레이너(일반) */
	@Override
	@RequestMapping(value = "myTrainer.diet")
	public String redirectMyTrainer() {
		return "myInfo/myTrainer";
	}

	/* 마이페이지 - 트레이너 매칭 (트레이너) */
	@Override
	@RequestMapping(value = "imTrainer.diet")
	public String redirectMyPageTrainer() {
		return "myInfo/imTrainer";
	}

	/* 트레이너 상품 등록 */
	@Override
	@RequestMapping(value = "/programReg.diet")
	public String redirectSangpoom() {
		return "main/programReg";
	}


}
