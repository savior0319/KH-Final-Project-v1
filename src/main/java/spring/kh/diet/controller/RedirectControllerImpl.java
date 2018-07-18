package spring.kh.diet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedirectControllerImpl implements RedirectController {

	@SuppressWarnings("unused")
	private final String redirectMain = "redirect:/";

	public RedirectControllerImpl() {
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

	/* 마이페이지 - 내 활동 정보 */
	@Override
	@RequestMapping(value = "/myActivityInfo.diet")
	public String redirectMyActivityInfo() {
		return "myInfo/myActivityInfo";
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

	/* 마이페이지 - 찜한 상품 */
	@Override
	@RequestMapping(value = "/myWishList.diet")
	public String redirectMyWishList() {
		return "myInfo/myWishList";
	}

	/* 홈트레이닝 - 목록 */
	@Override
	@RequestMapping(value = "/homeTrainingList.diet")
	public String redirectHomeTraining() {
		return "homeTraining/homeTrainingList";
	}

	/* 홈트레이닝 - 상세정보 */
	@Override
	@RequestMapping(value = "/homeTrainingInfo.diet")
	public String redirectHomeTrainingInfo() {
		return "homeTraining/homeTrainingInfo";
	}

	/* 마이페이지 - 나의 다이어리 */
	@Override
	@RequestMapping(value = "/myDiary.diet")
	public String redirectMyDiary() {
		return "myInfo/myDiary";
	}

	/* 다이어트팁 */
	@Override
	// @RequestMapping(value = "/dietTipList.diet")
	public String redirectDietTipList() {
		return "dietTip/dietTipList";
	}


	/* 커뮤니티 - 글등록할 페이지 */
	@Override
	@RequestMapping(value = "/registCommunity.diet")
	public String redirectRegistCommunity() {
		return "community/registCommunity";
	}

	/* 커뮤니티 - 레시피&식단 */
	@Override
	@RequestMapping(value = "/recipeBoard.diet")
	public String redirectRecipeBoard() {
		return "community/recipeBoard";
	}
	
	/* 칼로리 -푸드칼로리단 */
	@Override
	@RequestMapping(value = "/foodCalorieInfo.diet")
	public String redirectFoodCalorieInfo() {
		return "calorieDic/foodCalorieInfo";
	}

}
