package spring.kh.diet.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.annotation.ApplicationScope;

import com.sun.mail.iap.Response;

import spring.kh.diet.model.service.AdminService;
import spring.kh.diet.model.vo.AllSessionListPDVO;
import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.AnswerVO;
import spring.kh.diet.model.vo.HealthCenterPDVO;
import spring.kh.diet.model.vo.MemberListPDVO;
import spring.kh.diet.model.vo.NoticeVO;
import spring.kh.diet.model.vo.QuestionAnswerPDVO;
import spring.kh.diet.model.vo.QuestionVO;

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

		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		AllSessionListPDVO ASLPDVO = as.getSessionList(currentPage);

		ASLPDVO.setType(request.getParameter("type"));
		request.setAttribute("currentSession", ASLPDVO);
		request.setAttribute("size", ASLPDVO.getSsList().size());
		
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
	public String blackList() {
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

	
}
