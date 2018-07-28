package spring.kh.diet.controller;

import javax.servlet.http.HttpServletRequest;

public interface CalorieDictionaryController {
	String foodCalorieInfo(HttpServletRequest request);

	String foodCalorieList(HttpServletRequest request);

	String sportsCalorieList(HttpServletRequest request);

	String sportsCalorieInfo(HttpServletRequest request);

}
