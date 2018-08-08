package spring.kh.diet.controller;

import javax.servlet.http.HttpSession;

import com.google.gson.JsonIOException;

import spring.kh.diet.model.vo.TrainerProgramVO;
import spring.kh.diet.model.vo.TrainingRegVO;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface TrainerController {

	void trainerReg(String trName, String[] trGender, String trPhone, String trAddress, Date trBirth, int trHeight,
			int trWeight, String[] trCity, String[] trAreas, String trContent, String trImagePath, HttpSession session,
			HttpServletResponse response) throws IOException;

	int registTrainerProgram(TrainerProgramVO tpv, HttpSession session);

	Object trainerSearchResult(String city, String[] area);

	void getProgramList(int trIndex, HttpServletRequest request, HttpServletResponse response) throws JsonIOException, IOException;

	String programDetail(int tpIndex, HttpServletRequest request);

	String paymentSuccess(String mbtptr, int price);

	String redirectSangpoom(HttpSession session);

	String redirectTrainerReg(HttpSession session);

	String checkReg(String mbIndex);




}
