package spring.kh.diet.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.kh.diet.model.service.CommonService;
import spring.kh.diet.model.service.CommunityService;
import spring.kh.diet.model.service.HomeTrainingServiceImpl;
import spring.kh.diet.model.vo.BoardCommentPDVO;
import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.BoardPostVO;
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

	@Resource(name = "communityService")
	private CommunityService communityService;
		
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
	public String homeTrainingInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		int indexNo = Integer.parseInt(request.getParameter("indexNo"));
		
		String servletName = "homeTrainingInfo.diet";
		configCookie(session, request, response, indexNo);
						
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
		
		int postIndex = Integer.parseInt(request.getParameter("indexNo"));
		// 쿠키 등록
		
		int sessionIndex = 0;
		if(session.getAttribute("member")!=null) {
			sessionIndex = ((MemberVO)session.getAttribute("member")).getMbIndex();
		}
		// 등록된 정보 가져오는 로직
		BoardPostVO bpv = communityService.postedCommunity(postIndex);
		
		// 좋아요 체크하는 로직
		if (session.getAttribute("member")!=null) {
			BoardLikeVO blv = checkLike(postIndex, sessionIndex);
			
			if (blv != null) {
				bpv.setLikeYN(1);
			} else {
				bpv.setLikeYN(0);
			}
		}
		
						
		return "homeTraining/homeTrainingInfo";
	}

	// 쿠키 저장 메소드
	public int configCookie(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			int hits) {
		String mbIndex = "";
		int sessionIndex = 0;
		if(session.getAttribute("member") != null) {
			mbIndex = String.valueOf(((MemberVO) session.getAttribute("member")).getMbIndex());
			sessionIndex = ((MemberVO) session.getAttribute("member")).getMbIndex();
		} else {
			mbIndex = request.getRemoteAddr();
			if(mbIndex.equals("0:0:0:0:0:0:0:1")) {
				mbIndex = "localHost";
			}
		}
		boolean isGet = false;
		
		// 조회수 카운트 시작
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for (Cookie c : cookies) {
				// 쿠키가 있는 경우
				if(c.getName().equals(String.valueOf(hits))) {
					isGet = true;
				}
			}
			// 쿠키가 없는 경우
			if(!isGet) {
				int result = homeTrainingService.homeTrainingHits(hits); //조회수 증가
				Cookie c1 = new Cookie(String.valueOf(hits), String.valueOf(hits));
				c1.setMaxAge(1 * 24 * 60 * 60); // 하루저장
				response.addCookie(c1);
			}
		}
		return sessionIndex;
	}
	
	
	private BoardLikeVO checkLike(int hits, int sessionIndex) {
		BoardLikeVO likeCheckVO = new BoardLikeVO();
		likeCheckVO.setTargetIndex(hits);
		System.out.println("postIndexController : " + hits);
		likeCheckVO.setMbIndex(sessionIndex);
		System.out.println("sessionController : "+sessionIndex);
		System.out.println("likecheckVOController : " + likeCheckVO);
		BoardLikeVO blv = communityService.checkBoardLike(likeCheckVO);
		System.out.println("blvController : " + blv);
		return blv;
	}
	

	public HomeTrainingLikeVO checkBoardLike(HomeTrainingLikeVO checkVO, HttpSession session) {
		HomeTrainingLikeVO htlv = null;
		if(session.getAttribute("member")!=null) {
			int mbIndex = ((MemberVO)session.getAttribute("member")).getMbIndex();
			checkVO.setMbIndex(mbIndex);
			htlv = homeTrainingService.checkBoardLike(checkVO);
		}
		return htlv;
	}
	
	// 좋아요 부분
		@Override
		@ResponseBody
		@RequestMapping(value = "/homeTrainingLike.diet")
		public String boardLike(HomeTrainingLikeVO checkVO, HttpSession session) {
			int sessionIndex = ((MemberVO) session.getAttribute("member")).getMbIndex();
			int postIndex = checkVO.getTargetIndex();
			checkVO.setMbIndex(sessionIndex);
			
			
			HomeTrainingLikeVO htlv = checkBoardLike(checkVO,session);
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

}
