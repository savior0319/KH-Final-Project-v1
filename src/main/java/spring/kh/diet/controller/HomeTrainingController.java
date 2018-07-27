package spring.kh.diet.controller;

import javax.servlet.http.HttpServletRequest;

public interface HomeTrainingController {

	String homeTrainingAll(HttpServletRequest request);

	String homeTraining(HttpServletRequest request);

	String homeTrainingInfo(HttpServletRequest request);
	
	

}
