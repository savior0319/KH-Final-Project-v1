package spring.kh.diet.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import spring.kh.diet.model.vo.AllSessionListPDVO;
import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.AnswerVO;
import spring.kh.diet.model.vo.BlackListContentVO;
import spring.kh.diet.model.vo.BlackListRegVO;
import spring.kh.diet.model.vo.CurrentDate;
import spring.kh.diet.model.vo.DelMemberVO;
import spring.kh.diet.model.vo.MemberListPDVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.NoticeVO;
import spring.kh.diet.model.vo.OffSessionVO;
import spring.kh.diet.model.vo.OnSessionVO;
import spring.kh.diet.model.vo.QuestionAnswerPDVO;
import spring.kh.diet.model.vo.QuestionVO;
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
			HttpServletResponse response) throws IOException {

		NoticeVO nv = new NoticeVO();
		nv.setNoticeTitle(title);
		nv.setNoticeContent(content);

		int result = as.noticeRegisterData(nv);

		if (result > 0) {
			System.out.println("공지등록 완료");
		} else {
			System.out.println("공지등록 실패");
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

	/* 배너 이미지 업로드 */
	@Override
	@RequestMapping(value = "/logoImageUpload.diet", method = RequestMethod.POST, produces = "text/plain")
	public void logoImageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest req) throws IOException {
		req.setCharacterEncoding("utf-8");

		// 파일 경로
		String path = request.getSession().getServletContext().getRealPath("imageUpload");

		Map<String, MultipartFile> file = req.getFileMap();

		String reName1 = "";
		String reName2 = "";
		String reName3 = "";
		String reName4 = "";

		System.out.println(file.get("uploadfile2").getOriginalFilename());
		System.out.println(file.get("uploadfile3").getOriginalFilename());
		System.out.println(file.get("uploadfile4").getOriginalFilename());

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
		response.getWriter().print("/imageUpload" + "/" + reName1);

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
		response.getWriter().print("/imageUpload" + "/" + reName2);

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
		response.getWriter().print("/imageUpload" + "/" + reName3);

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
		response.getWriter().print("/imageUpload" + "/" + reName4);

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
		ModelAndView view = new ModelAndView();

		// view.addObject("currentTime",timeType);
		view.setViewName("admin/errorLogManage");
		return view;
	}

	/* 관리자 - 에러로그관리 페이지 > 디테일 페이진 호출 매핑 */
	@Override
	@RequestMapping(value = "/errorLogManageDetail.diet")
	public Object errorLogManageDetail(HttpServletRequest request) {
		ModelAndView view = new ModelAndView();

		// view.addObject("currentTime",timeType);
		view.setViewName("admin/errorLogManageDetail");
		return view;

	}

}
