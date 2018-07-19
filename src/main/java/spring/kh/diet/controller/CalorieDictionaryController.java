package spring.kh.diet.controller;

import javax.servlet.http.HttpServletRequest;

public interface CalorieDictionaryController {

	String sportsCalorieInfo();

	String sportsCalorieRank();

	String foodCalorieInfo(HttpServletRequest request);

	String foodCalorieRank(HttpServletRequest request);

}
