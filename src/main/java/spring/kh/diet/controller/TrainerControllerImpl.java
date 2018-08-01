package spring.kh.diet.controller;

import java.io.IOException;
import java.sql.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.kh.diet.model.service.TrainerService;
import spring.kh.diet.model.vo.BoardBlameVO;
import spring.kh.diet.model.vo.MemberVO;
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

	// 일반회원에서 트레이너로 회원 전환 신청
	@Override
	@RequestMapping(value = "/trainerRegister.diet")
	public void trainerReg(@RequestParam String trName, @RequestParam String[] trGender, @RequestParam String trPhone,
			@RequestParam String trAddress, @RequestParam Date trBirth, @RequestParam int trHeight,
			@RequestParam int trWeight, @RequestParam String[] trCity, @RequestParam String[] trAreas,
			@RequestParam String trContent, @RequestParam String trImagePath, HttpSession session, HttpServletResponse response) throws IOException{
		int sessionIndex = ((MemberVO) session.getAttribute("member")).getMbIndex();
		String trArea = "";

		System.out.println("login user : " + sessionIndex);
		TrainingRegVO trv = new TrainingRegVO();

		trv.setTrName(trName);
		trv.setTrPhone(trPhone);
		trv.setTrAddress(trAddress);
		trv.setTrBirth(trBirth);
		trv.setTrHeight(trHeight);
		trv.setTrWeight(trWeight);
		trv.setTrGender(trGender[0]);
		trv.setTrCity(trCity[0]);

		for (int i = 0; i < trAreas.length; i++) {
			if (i == 0) {
				trArea = trAreas[i];
			} else if (i > 0) {
				trArea += "," + trAreas[i];
			}
		}
		trv.setTrArea(trArea);
		trv.setTrContent(trContent);
		trv.setTrImagePath("/imageUpload/" + trImagePath);
		trv.setMbIndex(sessionIndex);

		int result = trService.trainerReg(trv);

		System.out.println("결과를 보여줘! : " + result);

		if (result > 0) {
			response.getWriter().print("1");
			response.getWriter().close();
			
		} else {
			response.getWriter().print("0");
			response.getWriter().close();
		}
	}

}
