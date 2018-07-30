package spring.kh.diet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.kh.diet.model.service.CustomerService;
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

		NoticeVO nVo = cs.noticeContent(sessionCheck, index, response, request);
		ModelAndView view = new ModelAndView();
		view.addObject("nvo", nVo);
		view.setViewName("customer/noticeContent");
		return view;

	}

}
