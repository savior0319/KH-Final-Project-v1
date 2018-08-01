package spring.kh.diet.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.ApplicationScope;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import spring.kh.diet.model.service.CommunityService;
import spring.kh.diet.model.service.CustomerService;
import spring.kh.diet.model.service.DietTipService;
import spring.kh.diet.model.service.HomeTrainingServiceImpl;
import spring.kh.diet.model.service.MainService;
import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.BMIVO;
import spring.kh.diet.model.vo.BMRVO;
import spring.kh.diet.model.vo.CommunityPageDataVO;
import spring.kh.diet.model.vo.DietTipPDVO;
import spring.kh.diet.model.vo.HealthCenterPDVO;
import spring.kh.diet.model.vo.HomeTrainingPageDataVO;
import spring.kh.diet.model.vo.NoticePDVO;
import spring.kh.diet.model.vo.OnSessionVO;
import spring.kh.diet.model.vo.UpdateSSVO;

@Controller
public class MainControllerImpl implements MainController {
	@SuppressWarnings("all")
	private ApplicationScope Appscope;

	@Resource(name = "mainService")
	private MainService mService;

	@Resource(name = "communityService")
	private CommunityService communityService;

	@Resource(name = "customerService")
	private CustomerService cs;

	@Resource(name = "dietTipService")
	private DietTipService dietTipService;
	
	@Resource(name = "homeTrainingService")
	private HomeTrainingServiceImpl homeTrainingService;

	public MainControllerImpl() {
	}

	/* 메인페이지 - BMI 계산결과 */
	@Override
	@RequestMapping(value = "/bmiCalResult.diet")
	public Object BMICalResult(@RequestParam String[] gender, @RequestParam String age, @RequestParam String height,
			@RequestParam String weight) {

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
		String weightStrRs = String.valueOf((int) weightConvertDouble);
		String heightStrRs = String.valueOf((int) (heightConvertMeter * 100));
		String bmiStrRs = String.valueOf(Math.round(resultBMI * 10) / 10.0);

		// 성별, 나이, 키, 몸무게, BMI
		ModelAndView view = new ModelAndView();

		BMIVO bvo = new BMIVO(ageStrRs, genderRs, heightStrRs, weightStrRs, bmiStrRs);

		view.addObject("bmi", bvo);
		view.setViewName("main/bmiCalResult");

		return view;
	}

	/* 메인페이지 - 칼로리처방 */
	@Override
	@RequestMapping(value = "/bmrCalResult.diet")
	public Object BMRCalResult(@RequestParam String[] gender, @RequestParam String age, @RequestParam String height,
			@RequestParam String weight, @RequestParam String period, @RequestParam String[] periodUnit,
			@RequestParam String[] activeMass) {

		String genderVal = "";
		String periodUnitVal = "";
		String activeMassVal = "";
		String genderStr = "";
		String periodStr = "";
		String activeMassStr = "";

		for (int i = 0; i < gender.length; i++) {
			genderVal = gender[i];
		}

		for (int i = 0; i < periodUnit.length; i++) {
			periodUnitVal = periodUnit[i];
		}

		for (int i = 0; i < activeMass.length; i++) {
			activeMassVal = activeMass[i];
		}

		if (genderVal.equals("f")) {
			genderStr = "여자";
		} else
			genderStr = "남자";

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String ageCal = sdf.format(date);

		int ageRs = Integer.parseInt(ageCal) - Integer.parseInt(age);
		String ageStr = String.valueOf(ageRs);

		int heightD = Integer.parseInt(height);
		int weightD = Integer.parseInt(weight);

		double weightConvertDouble = (double) weightD;
		double heightConvertMeter = (double) heightD / (double) 100;

		String weightStr = String.valueOf((int) weightConvertDouble);
		String heightStr = String.valueOf((int) (heightConvertMeter * 100));

		if (periodUnitVal.equals("day")) {
			periodStr = "일";
		} else
			periodStr = "개월";

		double bmr = 0;
		double needCal = 0;

		if (genderStr.equals("남자")) {
			bmr = 66.47 + (13.75 * Double.parseDouble(weightStr)) + (5.0 * Double.parseDouble(heightStr))
					- (6.75 * (double) Integer.parseInt(ageStr));
		} else {
			bmr = 665.09 + (9.56 * Double.parseDouble(weightStr)) + (1.84 * Double.parseDouble(heightStr))
					- (4.67 * (double) Integer.parseInt(ageStr));
		}

		if (activeMassVal.equals("step1")) {
			activeMassStr = "활동안함";
			needCal = bmr * 1.2;
		} else if (activeMassVal.equals("step2")) {
			activeMassStr = "가벼운 활동";
			needCal = bmr * 1.375;
		} else if (activeMassVal.equals("step3")) {
			activeMassStr = "보통 활동";
			needCal = bmr * 1.55;
		} else if (activeMassVal.equals("step4")) {
			activeMassStr = "많은 활동";
			needCal = bmr * 1.725;
		} else {
			activeMassStr = "격심한 활동";
			needCal = bmr * 1.9;
		}

		String bmrStr = String.valueOf(Math.round(bmr));
		String needCalStr = String.valueOf(Math.round(needCal));

		/* BMR 정보 */
		// genderStr 성별
		// ageStr 만 나이
		// heightStr 키
		// weightStr 몸무게
		// period 기간
		// periodStr 기간 단위
		// activeMassStr 활동량

		ModelAndView view = new ModelAndView();

		BMRVO bvo = new BMRVO(genderStr, ageStr, heightStr, weightStr, period, periodStr, activeMassStr, bmrStr,
				needCalStr);

		view.addObject("bmr", bvo);
		view.setViewName("main/bmrCalResult");

		return view;

	}

	/* 메인 페이지 - 인바디 보건소 */
	@Override
	@RequestMapping(value = "/healthCenter.diet")
	public String redirectHealthCenter(HttpServletRequest request, @RequestParam String location,
			HttpServletResponse response) throws IOException {

		int currentPage;

		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		HealthCenterPDVO hcData = mService.getHealthCenterList(currentPage, location);
		hcData.setType(request.getParameter("type"));
		request.setAttribute("hcpd", hcData);

		return "main/healthCenter";

	}

	// 메인페이지에서 자유게시판 목록 출력
	@Override
	@RequestMapping(value = "/mainCommunity.diet")
	public void getMainCommunityList(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		String type = "comAll";

		int currentPage;
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		CommunityPageDataVO cpdv = communityService.allCommunityList(currentPage, type);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(cpdv, response.getWriter());
	}

	// 메인페이지에서 다이어트꿀팁 목록 출력
	@Override
	@RequestMapping(value = "/mainDietTip.diet")
	public void getList(HttpServletRequest request, HttpServletResponse response) throws JsonIOException, IOException {
		DietTipPDVO pdvo = new DietTipPDVO();
		String type = "all";
		pdvo.setType(type);

		if (request.getParameter("category") != null && request.getParameter("searchText") != null) {
			pdvo.setCategory(request.getParameter("category"));
			pdvo.setSearchText(request.getParameter("searchText"));
		}

		int currentPage;
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		DietTipPDVO dtpd = dietTipService.getDietTipList(currentPage, pdvo);
		dtpd.setType(pdvo.getType());
		dtpd.setCategory(pdvo.getCategory());
		dtpd.setSearchText(pdvo.getSearchText());

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(dtpd, response.getWriter());
	}

	// 메인페이지에서 공지사항 전체 목록 출력
	@Override
	@RequestMapping(value = "/mainNotice.diet")
	public void getMainNoticeList(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int currentPage;

		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		NoticePDVO nData = cs.getNoticeList(currentPage);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(nData, response.getWriter());
	}

	// 메인페이지에서 홈트레이닝 목록 출력
	@Override
	@RequestMapping(value = "/mainHomeTraining.diet")
	public void getMainHomeTraining(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HomeTrainingPageDataVO pdvo = new HomeTrainingPageDataVO();

		pdvo.setType("");

		int currentPage;
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		if (request.getParameter("category") != null && request.getParameter("searchText") != null) {
			pdvo.setCategory(request.getParameter("category"));
			pdvo.setSearchText(request.getParameter("searchText"));
		}

		HomeTrainingPageDataVO htpd = homeTrainingService.homeTrainingAll(currentPage, pdvo);
		htpd.setCategory(pdvo.getCategory());
		htpd.setSearchText(pdvo.getSearchText());

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(htpd, response.getWriter());
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////////////////////////////////////////////////////////////////////////////

	// 접속자 수를 가지고 있는 static 변수

	static int count = 0;

	/* 메인페이지 - 비로그인 세션 생성 */
	@Autowired
	ServletContext context;

	@SuppressWarnings("static-access")
	@ApplicationScope
	@Override
	@RequestMapping(value = "/createSession.diet")
	public void createSession(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session;
		session = request.getSession();
		this.count++;
		boolean result = false;
		ArrayList<OnSessionVO> list = mService.selectAllSessionList();
		if (!list.isEmpty()) {
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getSessionId().equals(session.getId())) {

					result = true;
				}
			}
			if (!result) {
				mService.insertSessionToList(session, request);
			} else {
				UpdateSSVO USSVO = new UpdateSSVO((String) request.getParameter("data"), session.getId(),
						(String) request.getParameter("device"));
				mService.updateAlreadyOnsession(USSVO);
			}
		} else {
			mService.insertSessionToList(session, request);
		}

		response.getWriter().println(session.toString());
		response.getWriter().println(this.count);
		response.getWriter().close();

	}

	@Override
	@RequestMapping(value = "/updateOnSession.diet")
	@ResponseBody
	public void updateOnsession(HttpServletRequest request) {
		HttpSession session = request.getSession();

		UpdateSSVO USSVO = new UpdateSSVO((String) request.getParameter("data"), session.getId(),
				(String) request.getParameter("device"));

		mService.updateOnsession(USSVO);
	}

	// 세션 자동 파기(1분단위로 실행 -> 실제로는 15분단위로변경하는게 맞을듯.)
	@Override
	@Scheduled(cron = "0 0/1 * * * ?")
	// @Scheduled(cron="0/1 * * * * ?") // 1초단위로 실행(테스트용)
	public void autoDeleteSession() {
		ArrayList<AllSessionVO> list = mService.selectAllSessionList2();
		for (int i = 0; i < list.size(); i++) {
			mService.autoTransSession(list.get(i));
			mService.autoDeleteSession(list.get(i));

		}
	}

}
