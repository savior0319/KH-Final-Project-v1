package spring.kh.diet.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.kh.diet.model.service.TrainerService;

@Controller
public class TrainerControllerImpl implements TrainerController {
	
	@Resource(name = "trainerService")
	private TrainerService trService;

	public TrainerControllerImpl() {
	}

	// Controller 만 있음 Service랑 DAO만들어야 함 //

	/* 트레이너 찾기 */
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
