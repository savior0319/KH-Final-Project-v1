package spring.kh.diet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.kh.diet.model.service.CalorieDictionaryServiceImpl;

@Controller
public class CalorieDictionaryControllerImpl implements CalorieDictionaryController{
	
//	@Resource(name="CalorieDictionaryService")
//	private CalorieDictionaryServiceImpl CalorieDictionaryService;
	
	/* 음식칼로리 - 세부정보 */
	@Override
	@RequestMapping(value = "/foodCalorieInfo.diet")
	public String foodCalorieInfo(HttpServletRequest request) {
		return "calorieDic/foodCalorieInfo";
	}
	
	/* 음식칼로리 - 랭킹정보 */
	@Override
	@RequestMapping(value = "/foodCalorieRank.diet")
	public String foodCalorieRank(HttpServletRequest request) {
				
		return "calorieDic/foodCalorieRank";
	}
	
	/* 운동칼로리 - 세부정보 */
	@Override
	@RequestMapping(value = "/sportsCalorieInfo.diet")
	public String sportsCalorieInfo() {
		return "calorieDic/sportsCalorieInfo";
	}
	
	/* 운동칼로리 - 랭킹정보 */
	@Override
	@RequestMapping(value = "/sportsCalorieRank.diet")
	public String sportsCalorieRank() {
		return "calorieDic/sportsCalorieRank";
	}

}
