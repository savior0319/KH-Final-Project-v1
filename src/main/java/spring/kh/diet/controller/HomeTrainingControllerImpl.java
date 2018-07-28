package spring.kh.diet.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.kh.diet.model.service.CommonService;
import spring.kh.diet.model.service.HomeTrainingServiceImpl;
import spring.kh.diet.model.vo.BoardCommentPDVO;
import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.HomeTrainingLikeVO;
import spring.kh.diet.model.vo.HomeTrainingPageDataVO;
import spring.kh.diet.model.vo.HomeTrainingVO;
import spring.kh.diet.model.vo.MemberVO;

@SuppressWarnings("all")
@Controller
public class HomeTrainingControllerImpl implements HomeTrainingController {

	@Resource(name = "homeTrainingService")
	private HomeTrainingServiceImpl homeTrainingService;
	
	@Resource(name = "commonService")
	private CommonService commonService;

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

		htpd.setType(type);
		request.setAttribute("htpd", htpd);
		
		
		return "homeTraining/homeTrainingList";
	}

	/* 홈트레이닝 - 상세정보 */
	@Override
	@RequestMapping(value = "/homeTrainingInfo.diet")
	public String homeTrainingInfo(HttpServletRequest request) {
		int indexNo = Integer.parseInt(request.getParameter("indexNo"));
		
		String servletName = "homeTrainingInfo.diet";
						
		HomeTrainingVO ht = homeTrainingService.homeTraining(indexNo);
		
		request.setAttribute("ht", ht);
		System.out.println(ht);
		
		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}
		
		BoardCommentPDVO bcpd = commonService.getComment(currentPage, servletName, indexNo);
		
		request.setAttribute("bcpd", bcpd);
		
		/* 이전글 다음글*/
		/*ArrayList<HomeTrainingVO> list = new ArrayList<HomeTrainingVO>();
		list = (ArrayList<HomeTrainingVO>) homeTrainingService.pnWriteList(indexNo);
		request.setAttribute("list", list);*/
		
						
		return "homeTraining/homeTrainingInfo";
	}
	
	
	/* 좋아요 누르기 */
	
	@Override
	@ResponseBody
	@RequestMapping(value = "/postLike1.diet")
	public String boardLike(BoardLikeVO checkVO, HttpSession session) {
		
		BoardLikeVO htlv = checkBoardLike(checkVO,session);
		int result2 = 0;
		
		if(htlv != null) {
			int result = homeTrainingService.boardLikeDown(htlv);
			if(result>0) {
				result2 = homeTrainingService.postLikeDown(htlv);
			}
		} else {
			int result = homeTrainingService.boardLikeUp(checkVO);
			if(result>0) {
				result2 = homeTrainingService.postLikeUp(checkVO);
			}
		}
		
		if(result2>0) {
			return "success";
		} else {
			return "failed";
		}
		
	}

	public BoardLikeVO checkBoardLike(BoardLikeVO checkVO, HttpSession session) {
		BoardLikeVO htlv = null;
		if(session.getAttribute("member")!=null) {
			int mbIndex = ((MemberVO)session.getAttribute("member")).getMbIndex();
			checkVO.setMbIndex(mbIndex);
			htlv = homeTrainingService.checkBoardLike(checkVO);
		}
		return htlv;
	}

}
