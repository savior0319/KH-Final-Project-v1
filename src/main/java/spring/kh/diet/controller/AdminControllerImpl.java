package spring.kh.diet.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.ApplicationScope;

import spring.kh.diet.model.service.AdminService;
import spring.kh.diet.model.vo.AllSessionListPDVO;
import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.AnswerVO;
import spring.kh.diet.model.vo.CurrentDate;
import spring.kh.diet.model.vo.DelMemberVO;
import spring.kh.diet.model.vo.MemberListPDVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.NoticeVO;
import spring.kh.diet.model.vo.OffSessionVO;
import spring.kh.diet.model.vo.OnSessionVO;
import spring.kh.diet.model.vo.QuestionAnswerPDVO;
import spring.kh.diet.model.vo.QuestionVO;
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

	/* 트레이너 회원 관리 */
	@Override
	@RequestMapping(value = "/trainer.diet")
	public String trainer() {
		return "admin/trainer";
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

	/* 사이트 통계 */
	@Override
	@RequestMapping(value = "/todayAnalytics.diet")
	public String todayAnalytics(HttpServletRequest request) {

		todayAnalyticPDVO tAPDVO = todayAutoAnalytics();
		tAPDVO.setType(request.getParameter("type"));
		request.setAttribute("Current", tAPDVO);
		// System.out.println(tAPDVO.toString());

		// BEFORE_DAY_TBL 를 불러와서 데이터를 가져오는것.
		yesterdayAnalytic yAPDVO = yesterdayAnalytics();
		yAPDVO.setType(request.getParameter("type"));
		request.setAttribute("Before", yAPDVO);

		// 오늘 가입한 맴버 가져오기
		ArrayList<MemberVO> MVO = as.searchMember();

		// 오늘 탈퇴한 멤버 가져오기
		ArrayList<DelMemberVO> DMVO = as.searchDelMember();
		// 현재 꺼진 세션 들고오기
		ArrayList<AllSessionVO> ASVO = as.searchOffSession();
		// 현재 접속중인 세션 가져오기
		ArrayList<OnSessionVO> OSVO = as.searchOnSession();

		// System.out.println(yAPDVO.toString());
		request.setAttribute("todayInsertMember", MVO);
		request.setAttribute("todayInsertMemberSize", MVO.size());
		request.setAttribute("todayDelMember", DMVO);
		request.setAttribute("todayDelMemberSize", DMVO.size());
		request.setAttribute("OnSession", OSVO);
		request.setAttribute("OnSessionSize", OSVO.size());
		request.setAttribute("AllSession", ASVO);
		request.setAttribute("AllSessionSize", ASVO.size());
		return "admin/todayAnalytics";
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
	@Scheduled(cron = "0/30 * * * * ?") // 우선 1분주기로 테스트 @Scheduled(cron = "0 0/1 0 * * ?") // 30 초주기로 갱신.
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
		}

	}

	// 전날의 저장된값을 불러오는메소드
	@Override
	public yesterdayAnalytic yesterdayAnalytics() {
		yesterdayAnalytic yAPDVO = as.searchAllBefore();
		// System.out.println(yAPDVO.toString());
		return yAPDVO;
	}

}
