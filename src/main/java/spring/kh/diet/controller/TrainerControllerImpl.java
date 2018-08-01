package spring.kh.diet.controller;

import static org.hamcrest.CoreMatchers.instanceOf;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.kh.diet.model.service.TrainerService;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.TrainerProgramVO;
import spring.kh.diet.model.vo.TrainingRegVO;

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

	/* 트레이너 프로그램 등록 */
	@ResponseBody
	@RequestMapping(value = "/registTrainerProgram.diet")
	public int registTrainerProgram(TrainerProgramVO tpv,HttpSession session) {
		String tpActiveDay = "";
		MemberVO mv = (MemberVO)session.getAttribute("member");
		
		TrainingRegVO trv = trService.getTrIndex(mv);
		
		tpv.setMbIndex(mv.getMbIndex());
		tpv.setTrIndex(trv.getTrIndex());
		
		for (int i = 0; i < tpv.getTpActiveDays().length; i++) {
			if(i==0) {
				tpActiveDay = tpv.getTpActiveDays()[i];
			}else if(i>0) {
				tpActiveDay += (","+tpv.getTpActiveDays()[i]);
			}
		}
		System.out.println(tpActiveDay);
		tpv.setTpActiveDay(tpActiveDay);

		int result = trService.registTrainerProgram(tpv);
		
		return result;
	}
}
