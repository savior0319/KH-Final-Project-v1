package spring.kh.diet.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import spring.kh.diet.model.service.TrainerService;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.ProgramPageDataVO;
import spring.kh.diet.model.vo.TrainerProgramVO;
import spring.kh.diet.model.vo.TrainerSearchVO;
import spring.kh.diet.model.vo.TrainingRegVO;


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

		String areaList = "";

		TrainerSearchVO tsv = new TrainerSearchVO();
		tsv.setCity(city);

		for (int i = 0; i < area.length; i++) {
			areaList += area[i] + "/";
		}

		areaList = areaList.substring(0, areaList.length() - 1);
		tsv.setArea(areaList);

		ArrayList<TrainingRegVO> aList = trService.trainerSearch(tsv);
		
		System.out.println(aList.toString());
		
		ModelAndView view = new ModelAndView();
		view.addObject("tList", aList);
		view.setViewName("main/trainerFindResult");
		return view;
	}

	/* 트레이너 프로그램 등록 */
	@Override
	@ResponseBody
	@RequestMapping(value = "/registTrainerProgram.diet")
	public int registTrainerProgram(TrainerProgramVO tpv, HttpSession session) {
		String tpActiveDay = "";
		MemberVO mv = (MemberVO) session.getAttribute("member");

		TrainingRegVO trv = trService.getTrIndex(mv);

		tpv.setMbIndex(mv.getMbIndex());
		tpv.setTrIndex(trv.getTrIndex());

		for (int i = 0; i < tpv.getTpActiveDays().length; i++) {
			if (i == 0) {
				tpActiveDay = tpv.getTpActiveDays()[i];
			} else if (i > 0) {
				tpActiveDay += ("," + tpv.getTpActiveDays()[i]);
			}
		}
		tpv.setTpActiveDay(tpActiveDay);

		int result = trService.registTrainerProgram(tpv);

		return result;
	}

	// 일반회원에서 트레이너로 회원 전환 신청
	@Override
	@RequestMapping(value = "/trainerRegister.diet")
	public void trainerReg(@RequestParam String trName, @RequestParam String[] trGender, @RequestParam String trPhone,
			@RequestParam String trAddress, @RequestParam Date trBirth, @RequestParam int trHeight,
			@RequestParam int trWeight, @RequestParam String[] trCity, @RequestParam String[] trAreas,
			@RequestParam String trContent, @RequestParam String trImagePath, HttpSession session,
			HttpServletResponse response) throws IOException {
		int sessionIndex = ((MemberVO) session.getAttribute("member")).getMbIndex();
		String trArea = "";

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
		trv.setTrStatus("심사중");

		int result = trService.trainerReg(trv);

		if (result > 0) {
			response.getWriter().print("1");
			response.getWriter().close();

		} else {
			response.getWriter().print("0");
			response.getWriter().close();
		}
	}
	
	/* 프로그램 리스트 */
	@Override
	@RequestMapping(value = "/getProgramList.diet")
	public Object getProgramList(@RequestParam int trIndex,HttpServletRequest request) {
		
		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}
		ProgramPageDataVO ppdv = trService.getProgramList(currentPage,trIndex);

		ModelAndView view = new ModelAndView();
		view.addObject("ppdv", ppdv);
		view.setViewName("main/trainerFindResult");
		
		return view;
	}
}
