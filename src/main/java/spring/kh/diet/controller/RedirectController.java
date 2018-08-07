package spring.kh.diet.controller;

import javax.servlet.http.HttpServletRequest;

public interface RedirectController {

	String redirectAdminPage();

	String redirectNoticeRegisterPage();

	String redirectMyInfo();

	String redirectMyInfoUpdate();

	String redirectBMICal();

	String redirectSecession();

	String redirectMyPoint();

	String redirectMyCoupon();

	String redirectCalCal();

	String redirectMyOneToOneQuestion();

	String redirectMyDiary();

	String redirectSignup();

	String redirectLogin();

	String redirectMyTrainer();

	String redirectMyPageTrainer();

	String redirectTrainerMath();

	String redirectTrainerFind();

	String redirectPageManagement();

	String redirectFaq();

	String redirectLoginPage(HttpServletRequest request);
  
	String loginLogManageTest1();

	String loginLogManageDetailTest1();

}
