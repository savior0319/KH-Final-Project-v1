package spring.kh.diet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TrainerControllerImpl implements TrainerController {

	public TrainerControllerImpl() {
	}

	@Override
	@RequestMapping(value = "/trainerSearchResult.diet")
	public String trainerSearchResult(@RequestParam String city, @RequestParam String[] area) {

		System.out.println(city);

		for (int i = 0; i < area.length; i++) {
			System.out.println(area[i]);
		}

		return null;
	}

}
