package spring.kh.diet.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.kh.diet.model.service.CommonService;
import spring.kh.diet.model.service.HomeTrainingService;
import spring.kh.diet.model.service.HomeTrainingServiceImpl;
import spring.kh.diet.model.vo.BoardCommentPDVO;
import spring.kh.diet.model.vo.HomeTrainingPageDataVO;
import spring.kh.diet.model.vo.HomeTrainingVO;
import sun.util.locale.provider.DateFormatSymbolsProviderImpl;

@SuppressWarnings("all")
@Controller
public class HomeTrainingControllerImpl implements HomeTrainingController {

	@Resource(name = "homeTrainingService")
	private HomeTrainingServiceImpl homeTrainingService;
	
	@Resource(name = "commonService")
	private CommonService commonService;

	/* 홈트레이닝 - 전체 */
	@Override
	@RequestMapping(value = "/homeTrainingAll.diet")
	public String homeTrainingAll(HttpServletRequest request) {
		return "homeTraining/homeTrainingAll";
	}

	/* 홈트레이닝 - 목록 */
	@Override
	@RequestMapping(value = "/homeTrainingList.diet")
	public String homeTraining(HttpServletRequest request) {
		String type = request.getParameter("type");
		
		int currentPage;
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		HomeTrainingPageDataVO htpd = homeTrainingService.homeTrainingList(currentPage, type);

		htpd.setType(type);
		request.setAttribute("htpd", htpd);
		
		
		return "homeTraining/homeTrainingList";
	}

	/* 홈트레이닝 - 상세정보 */
	@Override
	@RequestMapping(value = "/homeTrainingInfo.diet")
	public String homeTrainingInfo(HttpServletRequest request) {
		int indexNo = Integer.parseInt(request.getParameter("indexNo"));
		
		String servletName = "homeTrainingInfo.diet";
						
		HomeTrainingVO ht = homeTrainingService.homeTraining(indexNo);
		
		request.setAttribute("ht", ht);
			
		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}
		
		BoardCommentPDVO bcpd = commonService.getComment(currentPage, servletName, indexNo);
		
		request.setAttribute("bcpd", bcpd);
		
		/* 이전글 다음글*/
		ArrayList<HomeTrainingVO> list = new ArrayList<HomeTrainingVO>();
		list = (ArrayList<HomeTrainingVO>) homeTrainingService.pnWriteList(indexNo);
		request.setAttribute("list", list);
		
						
		return "homeTraining/homeTrainingInfo";
	}


}
