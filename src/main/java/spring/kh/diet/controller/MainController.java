package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonIOException;

public interface MainController {

	Object BMICalResult(String[] gender, String age, String height, String weight);

	void createSession(HttpServletRequest request, HttpServletResponse response) throws IOException;

	String redirectHealthCenter(HttpServletRequest request, String location, HttpServletResponse response)
			throws IOException;

	void updateOnsession(HttpServletRequest request);

	void autoDeleteSession();

	void getMainCommunityList(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException;

	void getMainNoticeList(HttpServletRequest request, HttpServletResponse response) throws IOException;

	void getList(HttpServletRequest request, HttpServletResponse response) throws JsonIOException, IOException;

	void getMainHomeTraining(HttpServletRequest request, HttpServletResponse response) throws IOException;

	void getRecipeList(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JsonIOException, IOException;

	Object BMRCalResult(String[] gender, String age, String height, String weight, String period, String goalWeight,
			String[] activeMass);


}
