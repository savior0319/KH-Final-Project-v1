package spring.kh.diet.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.kh.diet.model.service.CommonService;
import spring.kh.diet.model.service.DietTipServiceImpl;
import spring.kh.diet.model.vo.BoardCommentPDVO;
import spring.kh.diet.model.vo.DietTipPDVO;
import spring.kh.diet.model.vo.DietTipVO;
import spring.kh.diet.model.vo.MemberVO;

@Controller
public class DietTipControllerImpl implements DietTipController {

	@Resource(name = "dietTipService")
	private DietTipServiceImpl dietTipService;

	@Resource(name = "commonService")
	private CommonService commonService;

	@Override
	@RequestMapping(value = "/dietTipList.diet")
	public String getList(HttpServletRequest request) {
		System.out.println(request.getSession().getServletContext().getRealPath("imageUpload"));
		System.out.println(DietTipControllerImpl.class.getResource("/../..").getPath());
		String type = request.getParameter("type");

		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}

		DietTipPDVO dtpd = dietTipService.getDietTipList(currentPage, type);

		request.setAttribute("dtpd", dtpd);

		return "dietTip/dietTipList";
	}

	@Override
	@RequestMapping(value = "/dietTipInfo.diet")
	public String getInfo(HttpServletRequest request) {
		int indexNo = Integer.parseInt(request.getParameter("indexNo"));
		// 현재 호출하는 메소드(서블릿)의 이름을 담아서 같이 넘겨쥼 -> 슬래쉬(/)빼야 해요
		String servletName = "dietTipInfo.diet";

		DietTipVO dt = dietTipService.getDietTip(indexNo);

		request.setAttribute("dt", dt);

		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}

		BoardCommentPDVO bcpd = commonService.getComment(currentPage, servletName, indexNo);

		request.setAttribute("bcpd", bcpd);

		return "dietTip/dietTipInfo";
	}
	
	@Override
	@RequestMapping(value = "/registDietTip.diet")
	public void registDietTip(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("member");
		
		DietTipVO dt = new DietTipVO();

		dt.setDtWriterNo(m.getMbIndex());
		
		dt.setDtTitle(request.getParameter("title"));
		dt.setDtExplain(request.getParameter("content"));
		dt.setDtType(Integer.parseInt(request.getParameter("category")));
		dt.setDtSammary(request.getParameter("sammary"));
		//dt.setDtMainPhoto(request.getParameter("mainPhoto"));

		int result = dietTipService.registDietTip(dt);		

		response.getWriter().print(result);
		response.getWriter().close();

	}

}
