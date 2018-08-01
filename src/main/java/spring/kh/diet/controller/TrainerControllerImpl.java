package spring.kh.diet.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.kh.diet.model.service.TrainerService;
import spring.kh.diet.model.vo.TrainerSearchVO;

@Controller
public class TrainerControllerImpl implements TrainerController {

	@Resource(name = "trainerService")
	private TrainerService trService;

	public TrainerControllerImpl() {
	}

	/* 트레이너 찾기 */
	@Override
	@RequestMapping(value = "/trainerSearchResult.diet")
	public Object trainerSearchResult(@RequestParam String city, @RequestParam String[] area) {

		TrainerSearchVO tsv = new TrainerSearchVO();
		tsv.setCity(city);
		
		for (int i = 0; i < area.length; i++) {
			tsv.getArea().add(area[i]);
		}
		
		ModelAndView view = new ModelAndView();
		view.addObject("tsv", tsv);
		view.setViewName("main/trainerFindResult");
		
		return view;
	}

	
}
