package spring.kh.diet.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface TrainerController {

	String trainerSearchResult(String city, String[] area);

	void trainerReg(String trName, String[] trGender, String trPhone, String trAddress, Date trBirth, int trHeight,
			int trWeight, String[] trCity, String[] trAreas, String trContent, String trImagePath, HttpSession session,
			HttpServletResponse response) throws IOException;


}
