package spring.kh.diet.controller;

public interface RedirectController {

	String RedirectAdminPage();

	String RedirectNoticeRegisterPage();

	String RedirectLoginPage();

	String RedirectMyInfo();

	String RedirectMyInfoUpdate();

	String RedirectMyActivityInfo();

	String RedirectBMICal();

	String RedirectBulletinBoard();

	String RedirectSecession();

	Object RedirectBMICalResult(String[] gender, String age, String height, String weight);

	String RedirectMyPoint();

	String RedirectMyCoupon();

	String RedirectCalCal();

	String RedirectMyOneToOneQuestion();

	String RedirectMyWishList();
	
	String RedirectBeforeAfterBoard();

	String RedirectDietTipList();
  
	String RedirectWorryNQnABoard();

	String RedirectTipKnowhowBoard();

	String RedirectCommunityWholeBoard();

	String RedirectPostedCommunity();

	String RedirectRegistCommunity();
  
}
