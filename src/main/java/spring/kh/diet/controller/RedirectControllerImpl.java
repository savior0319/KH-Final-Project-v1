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
	public String RedirectBMICal() {
		return "main/bmiCal";
	}

	/* 메인 페이지 - 칼로리 처방 이동 */
	@Override
	@RequestMapping(value = "/bmrCal.diet")
	public String RedirectCalCal() {
		return "main/bmrCal";
	}

	/* 관리자 페이지 - 이동 */
	@Override
	@RequestMapping(value = "/admin.diet")
	public String RedirectAdminPage() {
		return "admin/admin";
	}

	/* 관리자 페이지 - 공지사항 등록 */
	@Override
	@RequestMapping(value = "/noticeRegister.diet")
	public String RedirectNoticeRegisterPage() {
		return "admin/noticeRegister";
	}

	/* 로그인 */
	@Override
	@RequestMapping(value = "/login.diet")
	public String RedirectLoginPage() {
		return "login/login";
	}

	/* 마이페이지 - 회원 정보 */
	@Override
	@RequestMapping(value = "/myInfo.diet")
	public String RedirectMyInfo() {
		return "myInfo/myInfoUpdate";
	}

	/* 마이페이지 - 회원 정보 변경 */
	@Override
	@RequestMapping(value = "/myInfoUpdate.diet")
	public String RedirectMyInfoUpdate() {
		return "myInfo/myInfoUpdate";
	}

	/* 마이페이지 - 내 활동 정보 */
	@Override
	@RequestMapping(value = "/myActivityInfo.diet")
	public String RedirectMyActivityInfo() {
		return "myInfo/myActivityInfo";
	}

	/* 마이페이지 - 내 적립금 */
	@Override
	@RequestMapping(value = "/myPoint.diet")
	public String RedirectMyPoint() {
		return "myInfo/myPoint";
	}

	/* 마이페이지 - 회원 탈퇴 */
	@Override
	@RequestMapping(value = "/secession.diet")
	public String RedirectSecession() {
		return "myInfo/secession";
	}

	/* 마이페이지 - 쿠폰 */
	@Override
	@RequestMapping(value = "/myCoupon.diet")
	public String RedirectMyCoupon() {
		return "myInfo/myCoupon";
	}

	/* 마이페이지 - 일대일 문의 */
	@Override
	@RequestMapping(value = "/myOneToOneQuestion.diet")
	public String RedirectMyOneToOneQuestion() {
		return "myInfo/myOneToOneQuestion";
	}

	/* 마이페이지 - 찜한 상품 */
	@Override
	@RequestMapping(value = "/myWishList.diet")
	public String RedirectMyWishList() {
		return "myInfo/myWishList";
	}

	/* 마이페이지 - 나의 다이어리 */
	@Override
	@RequestMapping(value = "/myDiary.diet")
	public String RedirectMyDiary() {
		return "myInfo/myDiary";
	}

	/* 다이어트팁 */
	@Override
	//@RequestMapping(value = "/dietTipList.diet")
	public String RedirectDietTipList() {
		return "dietTip/dietTipList";
  }

	/* 커뮤니티 - 자유게시판 */
	@Override
	@RequestMapping(value = "/bulletinBoard.diet")
	public String RedirectBulletinBoard() {
		return "community/bulletinBoard";
	}

	/* 커뮤니티 - 비포&애프터 */
	@Override
	@RequestMapping(value = "/beforeAfterBoard.diet")
	public String RedirectBeforeAfterBoard() {
		return "community/beforeAfterBoard";
	}

	/* 커뮤니티 - 고민&질문 */
	@Override
	@RequestMapping(value = "/worryNQnABoard.diet")
	public String RedirectWorryNQnABoard() {
		return "community/worryNQnABoard";
	}

	/* 커뮤니티 - 팁&노하우 */
	@Override
	@RequestMapping(value = "/tipKnowhowBoard.diet")
	public String RedirectTipKnowhowBoard() {
		return "community/tipKnowhowBoard";
	}

	/* 커뮤니티 - 전체페이지 */
	@Override
	@RequestMapping(value = "/communityWholeBoard.diet")
	public String RedirectCommunityWholeBoard() {
		return "community/communityWholeBoard";
	}

	/* 커뮤니티 - 글등록된 페이지 */
	@Override
	@RequestMapping(value = "/postedCommunity.diet")
	public String RedirectPostedCommunity() {
		return "community/postedCommunity";
	}

	/* 커뮤니티 - 글등록할 페이지 */
	@Override
	@RequestMapping(value = "/registCommunity.diet")
	public String RedirectRegistCommunity() {
		return "community/registCommunity";
	}

	/* 커뮤니티 - 레시피&식단 */
	@Override
	@RequestMapping(value = "/recipeBoard.diet")
	public String RedirectRecipeBoard() {
		return "community/recipeBoard";
	}

}
