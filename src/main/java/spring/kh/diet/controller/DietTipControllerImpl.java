package spring.kh.diet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.kh.diet.model.service.DietTipServiceImpl;
import spring.kh.diet.model.vo.DietTipPageDataVO;
import spring.kh.diet.model.vo.DietTipVO;

@Controller
public class DietTipControllerImpl implements DietTipController{

	@Resource(name="dietTipService")
	private DietTipServiceImpl dietTipService;
	
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

		DietTipPageDataVO dtpd = dietTipService.getDietTipList(currentPage,type);
		
		request.setAttribute("dtpd", dtpd);
		
		
		return "dietTip/dietTipList";
	}

	@Override
	@RequestMapping(value="/dietTipInfo.diet")
	public String getInfo(HttpServletRequest request) {
		int indexNo = Integer.parseInt(request.getParameter("indexNo"));
		
		DietTipVO dt = dietTipService.getDietTip(indexNo);
		
		request.setAttribute("dt", dt);
		
		return "dietTip/dietTipInfo";
	}
	
}
