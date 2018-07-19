package spring.kh.diet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.kh.diet.model.service.HomeTrainingServiceImpl;
import spring.kh.diet.model.vo.HomeTrainingPageDataVO;

@SuppressWarnings("all")
@Controller
public class HomeTrainingControllerImpl implements HomeTrainingController {

	@Resource(name = "homeTrainingService")
	private HomeTrainingServiceImpl homeTrainingService;

	/* 홈트레이닝 - 전체 */
	@Override
	@RequestMapping(value = "/homeTrainingAll.diet")
	public String homeTrainingAll(HttpServletRequest request) {
		return "homeTraining/homeTrainingAll";
	}

	/* 홈트레이닝 - 목록 */
	@Override
	@RequestMapping(value = "/homeTrainingList.diet")
	public String homeTraining(HttpServletRequest request) {
		String type = request.getParameter("type");

		int currentPage;
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		HomeTrainingPageDataVO htpd = homeTrainingService.homeTrainingList(currentPage, type);

		return "homeTraining/homeTrainingList";
	}

	/* 홈트레이닝 - 상세정보 */
	@Override
	@RequestMapping(value = "/homeTrainingInfo.diet")
	public String homeTrainingInfo(HttpServletRequest request) {
		return "homeTraining/homeTrainingInfo";
	}
}
