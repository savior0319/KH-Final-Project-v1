package spring.kh.diet.controller;

import javax.servlet.http.HttpServletRequest;

public interface MainController {

	Object BMICalResult(String[] gender, String age, String height, String weight);

	Object BMRCalResult(String[] gender, String age, String height, String weight, String period, String[] periodUnit,
			String[] activeMass);

	String RedirectHealthCenter(HttpServletRequest request);

	void createSession();

}
