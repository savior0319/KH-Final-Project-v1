package spring.kh.diet.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.kh.diet.model.vo.BMIVO;

@Controller
public class MainControllerImpl implements MainController {

	public MainControllerImpl() {
	}

	/* 메인페이지 - BMI 계산결과 */
	@Override
	@RequestMapping(value = "/bmiCalResult.diet")
	public Object RedirectBMICalResult(@RequestParam String[] gender, @RequestParam String age,
			@RequestParam String height, @RequestParam String weight) {

		String genderRs = "";

		for (int i = 0; i < gender.length; i++) {
			genderRs = gender[i];
		}

		if (genderRs.equals("f")) {
			genderRs = "여자";
		} else {
			genderRs = "남자";
		}

		int heightD = Integer.parseInt(height);
		int weightD = Integer.parseInt(weight);

		double weightConvertDouble = (double) weightD;
		double heightConvertMeter = (double) heightD / (double) 100;

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String ageStr = sdf.format(date);

		int ageInt = Integer.parseInt(ageStr);
		int ageRs = ageInt - Integer.parseInt(age);
		double resultBMI = weightConvertDouble / (heightConvertMeter * heightConvertMeter);

		String ageStrRs = String.valueOf(ageRs);
		String weightStrRs = String.valueOf((int) weightConvertDouble);
		String heightStrRs = String.valueOf((int) (heightConvertMeter * 100));
		String bmiStrRs = String.valueOf(Math.round(resultBMI * 10) / 10.0);

		// 성별, 나이, 키, 몸무게, BMI
		ModelAndView view = new ModelAndView();

		BMIVO bvo = new BMIVO(ageStrRs, genderRs, heightStrRs, weightStrRs, bmiStrRs);

		view.addObject("bmi", bvo);
		view.setViewName("main/bmiCalResult");

		return view;
	}

}
