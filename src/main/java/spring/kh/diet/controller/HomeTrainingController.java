package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spring.kh.diet.model.vo.BoardLikeVO;


public interface HomeTrainingController {

	String homeTrainingAll(HttpServletRequest request);

	String homeTraining(HttpServletRequest request);

	String homeTrainingInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session);

	String boardLike(BoardLikeVO checkVO, HttpSession session);

	void htWriteAuthorityCheck(HttpSession session, HttpServletResponse response) throws IOException;

	String redirectLoadHomeTrainingWrite();
	
	
	

}
