package spring.kh.diet.controller;

import javax.servlet.http.HttpSession;

import spring.kh.diet.model.vo.TrainerProgramVO;

public interface TrainerController {

	String trainerSearchResult(String city, String[] area);

}
