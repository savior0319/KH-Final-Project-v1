package spring.kh.diet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.kh.diet.model.service.CalorieDictionaryService;
import spring.kh.diet.model.vo.FoodCalPageDataVO;
import spring.kh.diet.model.vo.FoodCalVO;

@Controller
public class CalorieDictionaryControllerImpl implements CalorieDictionaryController {

	@Resource(name="calorieDictionaryService")
	private CalorieDictionaryService calorieDictionaryService;
	
	public CalorieDictionaryControllerImpl() {}

	/* 음식칼로리 - 세부정보 */
	@Override
	@RequestMapping(value = "/foodCalorieInfo.diet")
	public String foodCalorieInfo(HttpServletRequest request) {
		int fcIndex = Integer.parseInt(request.getParameter("fcIndex"));
		
		FoodCalVO fc = calorieDictionaryService.getFoodCalInfo(fcIndex);
		
		request.setAttribute("fc", fc);
		
		return "calorieDic/foodCalorieInfo";
	}

	/* 음식칼로리 - 리스트 */
	@Override
	@RequestMapping(value = "/foodCalorieList.diet")
	public String foodCalorieList(HttpServletRequest request) {
		
		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}
		
		FoodCalPageDataVO fcpd = calorieDictionaryService.getFoodCalList(currentPage);
		
		request.setAttribute("fcpd", fcpd);
		
		return "calorieDic/foodCalorieList";
	}

	/* 운동칼로리 - 세부정보 */
	@Override
	@RequestMapping(value = "/sportsCalorieInfo.diet")
	public String sportsCalorieInfo() {
		return "calorieDic/sportsCalorieInfo";
	}

	/* 운동칼로리 - 리스트 */
	@Override
	@RequestMapping(value = "/sportsCalorieList.diet")
	public String sportsCalorieList(HttpServletRequest request) {
		return "calorieDic/sportsCalorieList";
	}

}
