package spring.kh.diet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.kh.diet.model.service.CommonService;
import spring.kh.diet.model.service.DietTipServiceImpl;
import spring.kh.diet.model.vo.BoardCommentPDVO;
import spring.kh.diet.model.vo.DietTipPDVO;
import spring.kh.diet.model.vo.DietTipVO;

@Controller
public class DietTipControllerImpl implements DietTipController{

	@Resource(name="dietTipService")
	private DietTipServiceImpl dietTipService;
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@Override
	@RequestMapping(value="/dietTipList.diet")
	public String getList(HttpServletRequest request) {
		String type = request.getParameter("type");
		
		int currentPage; // 현재 페이지 값을 저장하는 변수
		if(request.getParameter("currentPage")==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//	즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}

		DietTipPDVO dtpd = dietTipService.getDietTipList(currentPage,type);
		
		request.setAttribute("dtpd", dtpd);
		
		
		return "dietTip/dietTipList";
	}

	@Override
	@RequestMapping(value="/dietTipInfo.diet")
	public String getInfo(HttpServletRequest request) {
		int indexNo = Integer.parseInt(request.getParameter("indexNo"));
		// 현재 호출하는 메소드(서블릿)의 이름을 담아서 같이 넘겨쥼 -> 슬래쉬(/)빼야 해요
		String servletName = "dietTipInfo.diet";
		
		DietTipVO dt = dietTipService.getDietTip(indexNo);
		
		request.setAttribute("dt", dt);
		
		int currentPage; // 현재 페이지 값을 저장하는 변수
		if(request.getParameter("currentPage")==null) {
			currentPage = 1;
		}else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			//	즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}
		
		BoardCommentPDVO bcpd = commonService.getComment(currentPage, servletName, indexNo);
		
		request.setAttribute("bcpd", bcpd);
		
		return "dietTip/dietTipInfo";
	}
	
	
}
