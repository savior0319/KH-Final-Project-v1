package spring.kh.diet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedirectControllerImpl implements RedirectController {

	public RedirectControllerImpl() {
	}

	/* 메인 페이지 */
	@Override
	@RequestMapping(value = "/bmiCal.diet")
	public String RedirectBMICal() {
		return "main/bmiCal";
	}

	/* 관리자 페이지 */
	@Override
	@RequestMapping(value = "/admin.diet")
	public String RedirectAdminPage() {
		return "admin/admin";
	}

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

	@Override
	@RequestMapping(value = "/myInfo.diet")
	public String RedirectMyInfo() {
		return "myInfo/myInfo";
	}

	@Override
	@RequestMapping(value = "/myInfoUpdate.diet")
	public String RedirectMyInfoUpdate() {
		return "myInfo/myInfoUpdate";
	}

	@Override
	@RequestMapping(value="/myActivityInfo.diet")
	public String RedirectMyActivityInfo(){
		return "myInfo/myActivityInfo";
	}
	
}



