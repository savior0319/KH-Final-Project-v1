package spring.kh.diet.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSpinnerUI;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.ApplicationScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import spring.kh.diet.model.service.AdminService;
import spring.kh.diet.model.vo.AdvertiseVO;
import spring.kh.diet.model.vo.AllSessionListPDVO;
import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.AnswerVO;
import spring.kh.diet.model.vo.BlackListContentVO;
import spring.kh.diet.model.vo.BlackListRegVO;
import spring.kh.diet.model.vo.CurrentDate;
import spring.kh.diet.model.vo.DelMemberVO;
import spring.kh.diet.model.vo.ErrorLogVO;
import spring.kh.diet.model.vo.LoginLogVO;
import spring.kh.diet.model.vo.MemberListPDVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.NoticeVO;
import spring.kh.diet.model.vo.OffSessionVO;
import spring.kh.diet.model.vo.OnSessionVO;
import spring.kh.diet.model.vo.QuestionAnswerPDVO;
import spring.kh.diet.model.vo.QuestionVO;
import spring.kh.diet.model.vo.SevenDaysUserVO;
import spring.kh.diet.model.vo.TodayAnalyticsDetail;
import spring.kh.diet.model.vo.TrainingRegPageDataVO;
import spring.kh.diet.model.vo.TrainingRegVO;
import spring.kh.diet.model.vo.todayAnalyticPDVO;
import spring.kh.diet.model.vo.todayCommentsVO;
import spring.kh.diet.model.vo.todayHitsVO;
import spring.kh.diet.model.vo.todayLikeVO;
import spring.kh.diet.model.vo.todayPostVO;
import spring.kh.diet.model.vo.yesterdayAnalytic;
import spring.kh.diet.model.vo.yesterdayAnalyticsPDVO;

@SuppressWarnings("all")
@Controller
public class AdminControllerImpl implements AdminController {

	@Resource(name = "adminService")
	private AdminService as;

	@SuppressWarnings("unused")
	private final String redirectMain = "redirect:/";

	public AdminControllerImpl() {
	}

	/* 공지사항 등록 */
	@Override
	@RequestMapping(value = "/noticeRegisterData.diet")
	public void noticeRegisterData(@RequestParam String title, @RequestParam String content,
			@RequestParam String noticeType, HttpServletResponse response) throws IOException {

		NoticeVO nv = new NoticeVO();
		nv.setNoticeTitle(title);
		nv.setNoticeContent(content);
		nv.setNoticeType(noticeType);

		int result = as.noticeRegisterData(nv);

		if (result > 0) {
//			System.out.println("공지등록 완료");
		} else {
//			System.out.println("공지등록 실패");
		}

		response.getWriter().print("success");
		response.getWriter().close();

	}

	@Autowired
	ServletContext context;

	@RequestMapping(value = "/currentLoginUser.diet")
	@ApplicationScope
	public String currentLoginUser(HttpServletRequest request, HttpServletResponse response) {
		int currentPage;
		// 현재 접속중인인원
		// 페이징 처리 < 바꿧음 18년 8월 3일 -> 그냥 스크롤로 보여주는걸로
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		AllSessionListPDVO ASLPDVO = as.getSessionList(currentPage);

		// 오늘접속한 인원 (새션꺼진인원).

		ArrayList<OffSessionVO> list = as.getOfSesssionList();
		int PC = 0;
		int MOBILE = 0;
		int AtoBOn = 0;
		int BtoCOn = 0;
		int CtoDOn = 0;
		int DtoEOn = 0;
		int EtoFOn = 0;
		int AtoBOff = 0;
		int BtoCOff = 0;
		int CtoDOff = 0;
		int DtoEOff = 0;
		int EtoFOff = 0;
		if (!list.isEmpty()) {
			for (int i = 0; i < list.size(); i++) {
				int Time = Integer.parseInt(list.get(i).getFirstOn().substring(11, 13));
				int Minute = Integer.parseInt(list.get(i).getFirstOn().substring(14, 16));
				if (Time >= 0 && Time < 12) {
					if (list.get(i).getNickName().equals("") || list.get(i).getNickName().equals("NULL")) {
						AtoBOff++;
					} else {
						AtoBOn++;
					}
				}
				if (Time >= 12 && Time < 15) {
					if (list.get(i).getNickName().equals("") || list.get(i).getNickName().equals("NULL")) {
						BtoCOff++;
					} else {
						BtoCOn++;
					}
				}
				if (Time >= 15 && Time < 18) {
					if (list.get(i).getNickName().equals("") | !list.get(i).getNickName().equals("NULL")) {
						CtoDOff++;
					} else {
						CtoDOn++;
					}
				}
				if (Time >= 18 && Time < 21) {
					if (list.get(i).getNickName().equals("") || list.get(i).getNickName().equals("NULL")) {
						DtoEOff++;
					} else {
						DtoEOn++;
					}
				}
				if (Time >= 21 && Time < 24) {
					if (list.get(i).getNickName().equals("") || list.get(i).getNickName().equals("NULL")) {
						EtoFOff++;
					} else {
						EtoFOn++;
					}
				}
				if (list.get(i).getDevice().equals("pc")) {
					PC++;
				}
				if (list.get(i).getDevice().equals("mobile")) {
					MOBILE++;
				}
			}
		}

		CurrentDate CD = new CurrentDate(PC, MOBILE, AtoBOn, BtoCOn, CtoDOn, DtoEOn, EtoFOn, AtoBOff, BtoCOff, CtoDOff,
				DtoEOff, EtoFOff);
		// System.out.println(list.toString());

		// 그래프용 값가져오기
		ArrayList<SevenDaysUserVO> sevenList = as.select7Days();

//		for(int i=0; i<sevenList.size();i++) {
//			System.out.println(sevenList.get(i).toString());
//		}
		
		// 짝수가 비회원, 홀수가 회원  // a는 비회원 b는 회원
		// 1이 가장 먼날, 7이 가장가까운날 7은어제
		request.setAttribute("graph7a",sevenList.get(0));
		request.setAttribute("graph7b",sevenList.get(1));
		request.setAttribute("graph6a",sevenList.get(2));
		request.setAttribute("graph6b",sevenList.get(3));
		request.setAttribute("graph5a",sevenList.get(4));
		request.setAttribute("graph5b",sevenList.get(5));
		request.setAttribute("graph4a",sevenList.get(6));
		request.setAttribute("graph4b",sevenList.get(7));
		request.setAttribute("graph3a",sevenList.get(8));
		request.setAttribute("graph3b",sevenList.get(9));
		request.setAttribute("graph2a",sevenList.get(10));
		request.setAttribute("graph2b",sevenList.get(11));
		request.setAttribute("graph1a",sevenList.get(12));
		request.setAttribute("graph1b",sevenList.get(13));
		
		ASLPDVO.setType(request.getParameter("type"));

		request.setAttribute("currentSession", ASLPDVO);
		request.setAttribute("size", ASLPDVO.getSsList().size());
		request.setAttribute("totalSize", list.size());
		request.setAttribute("offList", ASLPDVO.getSsList());
		request.setAttribute("onList", list);
		request.setAttribute("CD", CD);
		return "admin/currentLoginUser";
		// System.out.println(session.getAttribute("key"));
	}

	/* 전체 회원 조회 */
	@Override
	@RequestMapping(value = "/memberList.diet")
	public String memberList(HttpServletRequest request, HttpServletResponse response) {

		int currentPage;

		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		MemberListPDVO mbData = as.getMemberList(currentPage);

		mbData.setType(request.getParameter("type"));
		request.setAttribute("mbpd", mbData);
		return "admin/memberList";
	}

	/* 탈퇴 회원 조회 */
	@Override
	@RequestMapping(value = "/deleteMemberList.diet")
	public String deleteMemberList(HttpServletRequest request, HttpServletResponse response) {

		int currentPage;

		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		MemberListPDVO mbData = as.getDeleteMemberList(currentPage);

		mbData.setType(request.getParameter("type"));
		request.setAttribute("mbpd", mbData);

		return "admin/deleteMemberList";
	}

	/* 블랙리스트 회원 관리 */
	@Override
	@RequestMapping(value = "/blackList.diet")
	public String blackList(HttpServletRequest request, HttpServletResponse response) {

		int currentPage;

		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		MemberListPDVO mbData = as.getBlackList(currentPage);

		mbData.setType(request.getParameter("type"));
		request.setAttribute("mbpd", mbData);

		return "admin/blackList";
	}

	/* 트레이너 등급 신청 회원 관리 */
	@Override
	@RequestMapping(value = "/trainer.diet")
	public String trainer(HttpServletRequest request, HttpServletResponse response) {

		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}

		TrainingRegPageDataVO trpdv = as.trainerRegList(currentPage);

		request.setAttribute("trpdv", trpdv);

		return "admin/trainer";
	}

	// 트레이너 등급 신청 회원 등록된 글 들어가는 곳
	@Override
	@RequestMapping(value = "/trainerRegContents.diet")
	public Object trainerRegContents(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		int trIndex = Integer.parseInt(request.getParameter("trIndex"));

		TrainingRegVO trv = as.trainerRegContents(trIndex);

		request.setAttribute("trv", trv);

		return "admin/trainerRegContents";
	}

	// 트레이너 등급 신청 거절
	@Override
	@ResponseBody
	@RequestMapping(value = "/denyTrainerReg.diet")
	public String denyTrainerReg(HttpServletRequest request, HttpSession session) {

		int trIndex = Integer.parseInt(request.getParameter("trIndex"));

		int result = as.denyTrainerReg(trIndex);

		if (result > 0) {
			return "success";
		} else {
			return "failed";
		}
	}

	// 트레이너 등급 신청 승인
	@Override
	@ResponseBody
	@RequestMapping(value = "/acceptTrainerReg.diet")
	public String acceptTrainerReg(HttpServletRequest request, HttpSession session) {

		int trIndex = Integer.parseInt(request.getParameter("trIndex"));

		int result = as.acceptTrainerReg(trIndex);

		if (result > 0) {
			int result2 = as.changeTrainerGrade(trIndex);

			if (result2 > 0) {
				return "success";
			} else {
				return "failed";
			}
		} else {
			return "denied";
		}

	}

	/* 트레이너 회원 관리 */
	@Override
	@RequestMapping(value = "/trainerChange.diet")
	public String trainerChange(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}

		TrainingRegPageDataVO trpdv = as.trainerChange(currentPage);

		request.setAttribute("trpdv", trpdv);

		return "admin/trainerChange";
	}

	// 트레이너 회원에서 일반 회원으로 전환
	@Override
	@ResponseBody
	@RequestMapping(value = "/changeGrade.diet")
	public String changeGrade(HttpServletRequest request, HttpSession session) {
		int mbIndex = Integer.parseInt(request.getParameter("mbIndex"));
		int result = as.changeGrade(mbIndex);
		if (result > 0) {
			return "success";
		} else {
			return "failed";
		}
	}

	/* 1:1문의 답변하기 */
	@Override
	@RequestMapping(value = "/answer.diet")
	public String answer(HttpServletRequest request, HttpServletResponse response) {

		int currentPage;

		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		QuestionAnswerPDVO qData = as.getAnswerList(currentPage);

		qData.setType(request.getParameter("type"));
		request.setAttribute("qpd", qData);

		return "admin/answer";
	}

	/* 1:1 문의 질문 내용 */
	@Override
	@RequestMapping(value = "/qaContent.diet")
	public String qaContent(int index, HttpServletRequest request) {

		QuestionVO qData = as.getQuestionContent(index);
		request.setAttribute("qData", qData);

		return "admin/qaContent";
	}

	/* 1:1문의 답변 등록 */
	@Override
	@RequestMapping(value = "/answerReg.diet")
	public void answerReg(@RequestParam String content, @RequestParam int index, HttpServletResponse response)
			throws IOException {

		AnswerVO avo = new AnswerVO(index, content);
		int result = as.answerReg(avo);
		response.getWriter().print(String.valueOf(result));
		response.getWriter().close();

	}

	/* 블랙리스트 등록 */
	@Override
	@RequestMapping(value = "/blackListReg.diet")
	public void blackListReg(@RequestParam int index, @RequestParam String status, HttpServletResponse response)
			throws IOException {

		BlackListRegVO bVo = new BlackListRegVO();

		bVo.setIndex(index);
		bVo.setStatus(status);

		int result = as.blackListReg(bVo);

		response.sendRedirect("/blackList.diet");
	}

	/* 블랙리스트 신고당한 회원 조회 */
	@Override
	@RequestMapping(value = "/blackListContent.diet")
	public String blackListContent(@RequestParam int index, HttpServletResponse response, HttpServletRequest request) {
		ArrayList<BlackListContentVO> bcv = as.blackListContent(index);
		request.setAttribute("content", bcv);
		return "admin/blackListContent";
	}

	/* 광고 이미지 업로드 */
	@Override
	@RequestMapping(value = "/logoImageUpload.diet", method = RequestMethod.POST, produces = "text/plain")
	public void advertiseImageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest req) throws IOException {
		req.setCharacterEncoding("utf-8");

		// 파일 경로
		String path = request.getSession().getServletContext().getRealPath("imageUpload/advertise");

		Map<String, MultipartFile> file = req.getFileMap();

		String reName1 = "";
		String reName2 = "";
		String reName3 = "";
		String reName4 = "";

		// 첫번째 파일
		UUID randomString1 = UUID.randomUUID();
		String getFile1 = file.get("uploadfile1").getOriginalFilename();
		int index1 = getFile1.lastIndexOf(".");
		String name1 = getFile1.substring(0, index1);
		String ext1 = getFile1.substring(index1, getFile1.length());
		reName1 = name1 + "_" + randomString1 + ext1;

		// 파일 저장
		File reFile1 = new File(path, reName1);
		file.get("uploadfile1").transferTo(reFile1);
		response.setCharacterEncoding("utf-8");
		response.getWriter().print("/imageUpload/advertise" + "/" + reName1);

		// 두번째 파일
		UUID randomString2 = UUID.randomUUID();
		String getFile2 = file.get("uploadfile2").getOriginalFilename();
		int index2 = getFile2.lastIndexOf(".");
		String name2 = getFile2.substring(0, index2);
		String ext2 = getFile2.substring(index2, getFile2.length());
		reName2 = name2 + "_" + randomString2 + ext2;

		// 파일 저장
		File reFile2 = new File(path, reName2);
		file.get("uploadfile2").transferTo(reFile2);
		response.setCharacterEncoding("utf-8");
		response.getWriter().print("/imageUpload/advertise" + "/" + reName2);

		// 세번째 파일
		UUID randomString3 = UUID.randomUUID();
		String getFile3 = file.get("uploadfile3").getOriginalFilename();
		int index3 = getFile3.lastIndexOf(".");
		String name3 = getFile3.substring(0, index3);
		String ext3 = getFile3.substring(index3, getFile3.length());
		reName3 = name3 + "_" + randomString3 + ext3;

		// 파일 저장
		File reFile3 = new File(path, reName3);
		file.get("uploadfile3").transferTo(reFile3);
		response.setCharacterEncoding("utf-8");
		response.getWriter().print("/imageUpload/advertise" + "/" + reName3);

		// 네번째 파일
		UUID randomString4 = UUID.randomUUID();
		String getFile4 = file.get("uploadfile4").getOriginalFilename();
		int index4 = getFile4.lastIndexOf(".");
		String name4 = getFile4.substring(0, index4);
		String ext4 = getFile4.substring(index4, getFile4.length());
		reName4 = name4 + "_" + randomString4 + ext4;

		// 파일 저장
		File reFile4 = new File(path, reName4);
		file.get("uploadfile4").transferTo(reFile4);
		response.setCharacterEncoding("utf-8");
		response.getWriter().print("/imageUpload/advertise" + "/" + reName4);

		AdvertiseVO adVo = new AdvertiseVO();
		adVo.setPath1("/imageUpload/advertise" + "/" + reName1);
		adVo.setPath2("/imageUpload/advertise" + "/" + reName2);
		adVo.setPath3("/imageUpload/advertise" + "/" + reName3);
		adVo.setPath4("/imageUpload/advertise" + "/" + reName4);

		// DB 이미지 저장
		as.advertiseImageUpload(adVo);

	}

	/* 엑셀 출력 POI */
	@Override
	@RequestMapping(value = "/excelOut.diet")
	public void excelOut(HttpServletRequest request, HttpServletResponse response) throws IOException {

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		String cellString = "";

		XSSFRow row;
		XSSFCell cell;

		XSSFWorkbook workbook = new XSSFWorkbook();

		XSSFSheet sheet = workbook.createSheet("memberAllList");

		// THEAD 출력
		row = sheet.createRow(0);

		row.createCell(0).setCellValue("아이디");
		row.createCell(1).setCellValue("이름");
		row.createCell(2).setCellValue("닉네임");
		row.createCell(3).setCellValue("성별");
		row.createCell(4).setCellValue("나이");
		row.createCell(5).setCellValue("전화번호");
		row.createCell(6).setCellValue("주소");
		row.createCell(7).setCellValue("회원등급");
		row.createCell(8).setCellValue("블랙리스트");
		row.createCell(9).setCellValue("가입일");

		// 전체 회원 리스트 가져오기
		ArrayList<MemberVO> aList = as.memberListExcel();

		// TBODY 출력
		for (int i = 0; i < aList.size(); i++) {

			MemberVO mv = aList.get(i);

			row = sheet.createRow(i + 1);

			row.createCell(0).setCellValue(mv.getMbId());
			row.createCell(1).setCellValue(mv.getMbName());
			row.createCell(2).setCellValue(mv.getMbNickName());
			row.createCell(3).setCellValue(mv.getMbGender());
			row.createCell(4).setCellValue(mv.getMbAge());
			row.createCell(5).setCellValue(mv.getMbPhone());
			row.createCell(6).setCellValue(mv.getMbAddress());
			row.createCell(7).setCellValue(mv.getMbGrade());
			row.createCell(8).setCellValue(mv.getMbReport());
			row.createCell(9).setCellValue(formatter.format(mv.getMbEnrollDate()));

		}

		String path = request.getSession().getServletContext().getRealPath("excelOut");

		FileOutputStream outFile;

		try {
			outFile = new FileOutputStream(path + "/memberAllList.xls");
			workbook.write(outFile);
			outFile.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			response.sendRedirect("memberList.diet");
		}
	}

	////////////////////////////
	////////////////////////////
	////////////////////////////
	////////////////////////////
	////////////////////////////
	////////////////////////////
	////////////////////////////

	/* 사이트 통계 */
	@Override
	@RequestMapping(value = "/todayAnalytics.diet")
	public Object todayAnalytics(HttpServletRequest request) {

		todayAnalyticPDVO tAPDVO = todayAutoAnalytics();
		tAPDVO.setType(request.getParameter("type"));
		request.setAttribute("Current", tAPDVO);
		
		// BEFORE_DAY_TBL 를 불러와서 데이터를 가져오는것.
		yesterdayAnalytic yAPDVO = yesterdayAnalytics();
		yAPDVO.setType(request.getParameter("type"));
		request.setAttribute("Before", yAPDVO);
		// System.out.println(yAPDVO.toString());

		// 오늘 가입한 맴버 가져오기
		ArrayList<MemberVO> MVO = as.searchMember();
		ArrayList<MemberVO> MVO2 = as.memberList();

		// 오늘 탈퇴한 멤버 가져오기
		ArrayList<DelMemberVO> DMVO = as.searchDelMember();
		ArrayList<DelMemberVO> DMVO2 = as.delmemberList();

		ArrayList<AllSessionVO> ASVO = as.searchOffSession();
		ArrayList<OffSessionVO> ASVO2 = as.getOfSesssionList();

		// 현재 접속중인 세션 가져오기 (가장 최근에 켜진 1~5명)
		ArrayList<OnSessionVO> OSVO = as.searchOnSession();
		ArrayList<OnSessionVO> OSVO2 = as.getOnSessionList();

		request.setAttribute("todayInsertMember", MVO2);
		request.setAttribute("todayInsertMemberSize", MVO2.size());
		request.setAttribute("todayDelMember", DMVO2);
		request.setAttribute("todayDelMemberSize", DMVO2.size());

		request.setAttribute("OnSession", OSVO);
		request.setAttribute("OnSessionSize", OSVO.size());
		request.setAttribute("AllSession", ASVO);
		request.setAttribute("AllSessionSize", ASVO.size());

		// 시간값가져오기

		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String totalDay = dayTime.format(new Date(time));
		StringTokenizer tD1 = new StringTokenizer(totalDay, " ");
		String yymmdd = tD1.nextToken();
		String hhmmss = tD1.nextToken();
		StringTokenizer tD3 = new StringTokenizer(hhmmss, ":");
		int todayHour = Integer.parseInt(tD3.nextToken());
		int todayMinute = Integer.parseInt(tD3.nextToken());
		int todaySecond = Integer.parseInt(tD3.nextToken());
		/// 그래프 분석할 자료들고오기.
		int timeType = 0;
		if (todayHour < 12) {
			timeType = 1;
		}
		if (12 <= todayHour && todayHour < 15) {
			timeType = 2;
		}
		if (15 <= todayHour && todayHour < 18) {
			timeType = 3;
		}
		if (18 <= todayHour && todayHour < 21) {
			timeType = 4;
		}
		if (21 <= todayHour && todayHour < 24) {
			timeType = 5;
		}
		/// 그래프 분석할 자료들고오기.
		ArrayList<TodayAnalyticsDetail> TotalList = as.TodayAnalyticsDetailList();
		ModelAndView view = new ModelAndView();
		int thits = 0;
		int tlike = 0;
		int tcomments = 0;
		int tpost = 0;
		int hhits = 0;
		int hlike = 0;
		int hcomments = 0;
		int hpost = 0;
		int chits = 0;
		int clike = 0;
		int ccomments = 0;
		int cpost = 0;
		for (int i = 0; i < TotalList.size(); i++) {
			int ListType = TotalList.get(i).getListType();
			int TimeType = TotalList.get(i).getTimeType();
//			System.out.println(TotalList.get(i).toString());
			switch (ListType) {
			case 1:
				// 다이어트 팁에 대한 전체 정보
				// System.out.println(TotalList.get(i).toString());
				thits += TotalList.get(i).getHits();
				tlike += TotalList.get(i).getLikes();
				tcomments += TotalList.get(i).getComments();
				tpost += TotalList.get(i).getPost();
				view.addObject("AT1", TotalList.get(i));
				switch (TimeType) {
				case 1:
					view.addObject("T1", TotalList.get(i));
					break;
				case 2:
					view.addObject("T2", TotalList.get(i));
					break;
				case 3:
					view.addObject("T3", TotalList.get(i));
					break;
				case 4:
					view.addObject("T4", TotalList.get(i));
					break;
				case 5:
					view.addObject("T5", TotalList.get(i));
					break;
				}
				break;
			case 2:
				hhits += TotalList.get(i).getHits();
				hlike += TotalList.get(i).getLikes();
				hcomments += TotalList.get(i).getComments();
				hpost += TotalList.get(i).getPost();
				view.addObject("AH1", TotalList.get(i));
				switch (TimeType) {
				case 1:
					view.addObject("H1", TotalList.get(i));
					break;
				case 2:
					view.addObject("H2", TotalList.get(i));
					break;
				case 3:
					view.addObject("H3", TotalList.get(i));
					break;
				case 4:
					view.addObject("H4", TotalList.get(i));
					break;
				case 5:
					view.addObject("H5", TotalList.get(i));
					break;
				}
				break;
			case 3:
				chits += TotalList.get(i).getHits();
				clike += TotalList.get(i).getLikes();
				ccomments += TotalList.get(i).getComments();
				cpost += TotalList.get(i).getPost();
				view.addObject("AC1", TotalList.get(i));
				switch (TimeType) {
				case 1:
					view.addObject("C1", TotalList.get(i));
					break;
				case 2:
					view.addObject("C2", TotalList.get(i));
					break;
				case 3:
					view.addObject("C3", TotalList.get(i));
					break;
				case 4:
					view.addObject("C4", TotalList.get(i));
					break;
				case 5:
					view.addObject("C5", TotalList.get(i));
					break;
				}
				break;

			}

		}
		view.addObject("thits", thits);
		view.addObject("tlike", tlike);
		view.addObject("tcomments", tcomments);
		view.addObject("tpost", tpost);
		//
		view.addObject("hhits", hhits);
		view.addObject("hlike", hlike);
		view.addObject("hcomments", hcomments);
		view.addObject("hpost", hpost);
		//
		view.addObject("chits", chits);
		view.addObject("clike", clike);
		view.addObject("ccomments", ccomments);
		view.addObject("cpost", cpost);
		view.addObject("currentTime", timeType);
		view.setViewName("admin/todayAnalytics");
//		System.out.println(tcomments);
//		System.out.println(hcomments);
//		System.out.println(ccomments);
		// request.setAttribute("TAD", TotalList);

		return view;
	}

	// 현재값 갱신용도
	@Override
	@Scheduled(cron = "0/15 * * * * ?") // 1분주기로 갱신 (테스트용) // @Scheduled(cron = "0 0 0 * * ?") 0 0/1 * * * ?
	public todayAnalyticPDVO todayAutoAnalytics() {
		// 현재 조회수 들고오기.
		todayHitsVO tHVO = as.searchHits();
		// 현재 댓글수 들고오기
		todayCommentsVO tCVO = as.searchComments();
		// 현재 게시물 수 들고오기
		todayPostVO tPVO = as.searchPost();

		// 현재 좋아요 가져오기
		todayLikeVO tLVO = as.searchLike();
		
		// 오늘 가입한 맴버 가져오기
		ArrayList<MemberVO> MVO = as.searchMember();

		// 오늘 탈퇴한 멤버 가져오기
		ArrayList<DelMemberVO> DMVO = as.searchDelMember();

		// 현재 꺼진 세션 들고오기
		ArrayList<AllSessionVO> ASVO = as.searchOffSession();

		// 현재 접속중인 세션 가져오기
		ArrayList<OnSessionVO> OSVO = as.searchOnSession();

		todayAnalyticPDVO tAPDVO = new todayAnalyticPDVO("type", tHVO, tCVO, tPVO, tLVO, MVO, DMVO, ASVO, OSVO);
		return tAPDVO;

	}

	// 매일 00시 00분 00 초에 값을 갱신 해두고 저장해둠
	// 테스트를위해서는 30초단위로 우선 값을 테이블에 한번집어넣고 날자값이 중복되지않을때, 그떄에만들어감.
	// 즉 서버가 동작하고 30초이내의값을 가져옴.
	@Override
	@Scheduled(cron = "0/10 * * * * ?") // 우선 1분주기로 테스트 @Scheduled(cron = "0 0/1 0 * * ?") // 30 초주기로 갱신.
	public void yesterdayAutoInsertAnalytics() {
		int result = as.yesterdayAutoInsertBefore();
		if (result != 1) {
			// 현재 조회수 들고오기.
			todayHitsVO tHVO = as.searchHits();
			// 현재 댓글수 들고오기
			todayCommentsVO tCVO = as.searchComments();
			// 현재 게시물 수 들고오기
			todayPostVO tPVO = as.searchPost();
			// 현재 좋아요 가져오기
			todayLikeVO tLVO = as.searchLike();

			yesterdayAnalyticsPDVO yAPDVO = new yesterdayAnalyticsPDVO("type", tHVO, tCVO, tPVO, tLVO);

			as.yesterdayInsert(yAPDVO);
		} else {

			int result2 = as.searchBeforeDayList();

			if (result2 > 0) {
				// 현재 조회수 들고오기.
				todayHitsVO tHVO = as.searchHits();
				// 현재 댓글수 들고오기
				todayCommentsVO tCVO = as.searchComments();
				// 현재 게시물 수 들고오기
				todayPostVO tPVO = as.searchPost();
				// 현재 좋아요 가져오기
				todayLikeVO tLVO = as.searchLike();

				yesterdayAnalyticsPDVO yAPDVO = new yesterdayAnalyticsPDVO("type", tHVO, tCVO, tPVO, tLVO);
				as.yesterdayUpdate(yAPDVO);
			}
		}

	}

	// 전날의 저장된값을 불러오는메소드
	@Override
	public yesterdayAnalytic yesterdayAnalytics() {

		yesterdayAnalytic yAPDVO = as.searchAllBefore();
		// System.out.println(yAPDVO.toString());
		return yAPDVO;
	}

	/* 관리자 - 에러로그관리 페이지 호출 매핑 */
	@Override
	@RequestMapping(value = "/errorLogManage.diet")
	public Object errorLogManage(HttpServletRequest request) {
		// 날자형식
		// (오늘날자 ) long time = System.currentTimeMillis()
		// 어제날자
		long time = System.currentTimeMillis() - (long) ((1000 * 60 * 60 * 24));
		// 스탬프형식
		SimpleDateFormat dayTimeTamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String toDayTamp = dayTimeTamp.format(new Date(time));
		// 데이터형식
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
		String toDay = dayTime.format(new Date(time));
		// System.out.println(totalDay);
		//

		ModelAndView view = new ModelAndView();

		// 1차 DB 접속해서 오늘 날자있는지 값 확인하기.
		// 없으면 insert, 있다면 다음로직
		//
		ErrorLogVO ELVO = new ErrorLogVO();
		ELVO.setType("before");
		// 하나의 값만 가져오는것 < 어제의 디비가 있는지만 확인함.
		ArrayList<ErrorLogVO> list = as.todayErrorLogSearch(ELVO);

		// 값이 있을경우
		if (!list.isEmpty()) {
			// 리스트 대상을 다시 전체로 바꿔서 들고옴
			ELVO.setType("list");
			list = as.todayErrorLogSearch(ELVO);
			if (!list.isEmpty()) {
				view.addObject("dAll", list);
			}

		}
		// 없을떄

		else {
			// 없으므로 어제의 파일을 것을 읽어서, 오늘것에 인설트하기.
			// 로직이 기므로 따로 빼서 작성하겠음.
		}

		// view.addObject("currentTime",timeType);
		view.setViewName("admin/errorLogManage");
		return view;
	}

	/* 관리자 - 에러로그관리 페이지 > 디테일 페이진 호출 매핑 */
	@Override
	@RequestMapping(value = "/errorLogManageDetail.diet")
	public Object errorLogManageDetail(HttpServletRequest request) {
		// 날자형식
		// (오늘날자 ) long time = System.currentTimeMillis()
		Date todayDate = new Date();
		// 데이터형식
		// System.out.println(totalDay);
		//

		ModelAndView view = new ModelAndView();
		String findType = "";
		String findDate = "";
		String listType = "";
		if (request.getParameter("findDate") != null) {
			findDate = (request.getParameter("findDate"));
		}
		if (request.getParameter("type") != null) {

			findType = (request.getParameter("type"));

		}
		switch (findType) {
		case "low":
			findType = "1";
			listType = "경도 : WARN";
			break;
		case "mid":
			findType = "2";
			listType = "중도 : ERROR";
			break;
		case "high":
			findType = "3";
			listType = "고도 : FATAL";
			break;
		}
		// 데이터형식
		java.sql.Date sqlDate;
		java.sql.Date sqlToday;
		Date SearchDate;
		try {
			SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
			// String toDay = dayTime.format(new Date(time));
			SearchDate = dayTime.parse(findDate);
			sqlDate = new java.sql.Date(SearchDate.getTime());
			sqlToday = new java.sql.Date(todayDate.getTime());
			ErrorLogVO ELVO = new ErrorLogVO();
			ELVO.setType(findType);
			ELVO.setErDate(sqlDate);
			// System.out.println(sqlToday);
			// System.out.println(sqlDate);
			// System.out.println((sqlToday.getTime()-sqlDate.getTime()) / (24 * 60 * 60 *
			// 1000));
			ELVO.setCh((int) ((sqlToday.getTime() - sqlDate.getTime()) / (24 * 60 * 60 * 1000)));
			ArrayList<ErrorLogVO> list = as.todayErrorLogSearchDetail(ELVO);

			view.addObject("listType", listType);
			view.addObject("list", list);
			view.addObject("findDate", findDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// System.out.println(totalDay);

		view.setViewName("admin/errorLogManageDetail");
		return view;
	}
	
	// 접속자 로그 관리 
	@Override
	@RequestMapping(value = "/loginLogManage.diet")
	public Object loginLogManage() {
		
		ModelAndView view = new ModelAndView();
		// 리스트 불러오기 최근 10일것. // TYPE으로 값이 있을떈 특정날, 없으면 10일치
		LoginLogVO LLVO = new LoginLogVO();
		LLVO.setType(0);
		ArrayList<LoginLogVO> list = as.loginLogManage(LLVO);
		
		// 어제부터 최근 10일치것을 가져오는것으로. 하나씩 하나씩 해야하는게 맞을듯.
		// 0~1 이 어제의날
		
		view.addObject("list",list); // 최근 10일 리스트넘기기
		

		view.setViewName("admin/loginManage");
		return view;
	}
	// 접속자 로그관리 - 상세페이지
	@Override
	@RequestMapping(value = "/loginLogManageDetail.diet")
	public Object loginLogManageDetail(HttpServletRequest request) {
		String findType = "non";
		ModelAndView view = new ModelAndView();
		String findDate = "";
		String search=null;
		if (request.getParameter("findDate") != null) {
			findDate = (request.getParameter("findDate")); // 특정 날자
		}
		if (request.getParameter("type") != null) {

			findType = (request.getParameter("type")); // 특정사람

		}
		if (request.getParameter("search") != null)
		{
			search = (request.getParameter("search")); // 서치
		}
//		System.out.println(findDate);
		
		LoginLogVO LLVO = new LoginLogVO();
		// 데이터형식
				java.sql.Date sqlDate;
				java.sql.Date sqlToday;
				Date SearchDate;
				Date todayDate = new Date();
				SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd");
				// String toDay = dayTime.format(new Date(time));
				try {
					SearchDate = dayTime.parse(findDate);// 받아온날자
					sqlDate = new java.sql.Date(SearchDate.getTime()); // 받아올날자
					sqlToday = new java.sql.Date(todayDate.getTime());
					 int num1 = (int) ((sqlToday.getTime() - sqlDate.getTime()) / (24 * 60 * 60 * 1000));
					LLVO.setType(num1);
					LLVO.setFindType(findType); // 사람 <  전체는 non, 일부는 다른값.
					// 타입 < 일자 ~ 
					if(search!=null)
					{
						LLVO.setFindType(search);
					}
					ArrayList<LoginLogVO> list = as.loginLogManageDetail(LLVO);
					
					view.addObject("list",list);
					view.addObject("today",findDate);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		
		
		
		view.setViewName("admin/loginLogManageDetail");
		return view;
	}
}
