package spring.kh.diet.controller;

public interface MainController {

	Object BMICalResult(String[] gender, String age, String height, String weight);

	Object BMRCalResult(String[] gender, String age, String height, String weight, String period, String[] periodUnit,
			String[] activeMass);

}
