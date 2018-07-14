package spring.kh.diet.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.kh.diet.model.vo.BMIVO;

@Controller
public class RedirectControllerImpl implements RedirectController {

	public RedirectControllerImpl() {
	}

	/* 메인 페이지 - BMI 계산하기 */
	@Override
	@RequestMapping(value = "/bmiCal.diet")
	public String RedirectBMICal() {
		return "main/bmiCal";
	}

	/* 메인페이지 - BMI 계산결과 */
	@Override
	@RequestMapping(value = "/bmiCalResult.diet")
	public Object RedirectBMICalResult(@RequestParam String[] gender, @RequestParam String age,
			@RequestParam String height, @RequestParam String weight) {

		String genderRs = "";

		for (int i = 0; i < gender.length; i++) {
			genderRs = gender[i];
		}

		if (genderRs.equals("f")) {
			genderRs = "여자";
		} else {
			genderRs = "남자";
		}

		int heightD = Integer.parseInt(height);
		int weightD = Integer.parseInt(weight);

		double weightConvertDouble = (double) weightD;
		double heightConvertMeter = (double) heightD / (double) 100;

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String ageStr = sdf.format(date);

		int ageInt = Integer.parseInt(ageStr);
		int ageRs = ageInt - Integer.parseInt(age);
		double resultBMI = weightConvertDouble / (heightConvertMeter * heightConvertMeter);

		String ageStrRs = String.valueOf(ageRs);
		String weightStrRs = String.valueOf(weightConvertDouble);
		String heightStrRs = String.valueOf(heightConvertMeter * 100);
		String bmiStrRs = String.valueOf(Math.round(resultBMI * 10) / 10.0);

		// 성별, 나이, 키, 몸무게, BMI
		ModelAndView view = new ModelAndView();

		BMIVO bvo = new BMIVO(ageStrRs, genderRs, heightStrRs, weightStrRs, bmiStrRs);

		view.addObject("bmi", bvo);
		view.setViewName("main/bmiCalResult");

		return view;
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

	/* 커뮤니티 - 자유게시판 */
	@Override
	@RequestMapping(value = "/bulletinBoard.diet")
	public String RedirectBulletinBoard() {
		return "community/bulletinBoard";
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
	

}
