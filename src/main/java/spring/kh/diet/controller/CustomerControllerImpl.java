package spring.kh.diet.controller;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.kh.diet.model.service.CustomerService;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.NoticePDVO;
import spring.kh.diet.model.vo.NoticeVO;

@Controller
public class CustomerControllerImpl implements CustomerController {

	public CustomerControllerImpl() {
	}

	@Resource(name = "customerService")
	private CustomerService cs;

	/* 공지사항 페이징 */
	@Override
	@RequestMapping(value = "/notice.diet")
	public String notice(HttpServletRequest request, HttpServletResponse response) {

		int currentPage;

		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		NoticePDVO nData = cs.getNoticeList(currentPage);

		nData.setType(request.getParameter("type"));
		request.setAttribute("npd", nData);

		return "customer/notice";
	}

	/* 공지사항 글 가져오기 */
	@Override
	@RequestMapping(value = "/noticeContent")
	public Object noticeContent(HttpSession sessionCheck, @RequestParam int index, HttpServletResponse response,
			HttpServletRequest request) {
		
		// 쿠키등록 메소드
		configCookie(sessionCheck,request,response,index);
		
		NoticeVO nVo = cs.noticeContent(sessionCheck, index, response, request);
		ModelAndView view = new ModelAndView();
		view.addObject("nvo", nVo);
		view.setViewName("customer/noticeContent");
		
		
		
		return view;

	}
	
	// 쿠키저장 메소드
	public void configCookie(HttpSession sessionCheck, HttpServletRequest request, HttpServletResponse response,
			int index) {
		String mbIndex = "";
		int sessionIndex = 0;
		if (sessionCheck.getAttribute("member") != null) {
			mbIndex = String.valueOf(((MemberVO) sessionCheck.getAttribute("member")).getMbIndex());
			sessionIndex = ((MemberVO) sessionCheck.getAttribute("member")).getMbIndex();
		} else {
			mbIndex = request.getRemoteAddr();
			if (mbIndex.equals("0:0:0:0:0:0:0:1")) {
				mbIndex = "localHost";
			}
		}
		boolean isGet = false;

		// 조회수 카운트 시작
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {//
				// 쿠키가 있는 경우
				if (c.getName().equals(String.valueOf(index))) {
					isGet = true;
				}
			}
			// 쿠키가 없는 경우
			if (!isGet) {
				cs.noticeHit(index);// 조회수증가
				Cookie c1 = new Cookie(String.valueOf(index), String.valueOf(index));
				c1.setMaxAge(1 * 24 * 60 * 60);// 하루저장
				response.addCookie(c1);
			}
		}
	}

}
