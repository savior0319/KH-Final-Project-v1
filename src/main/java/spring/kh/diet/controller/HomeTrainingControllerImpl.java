package spring.kh.diet.controller;

import java.io.IOException;
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
		HomeTrainingPageDataVO pdvo = new HomeTrainingPageDataVO();

		// type에 빈값 넣어줌 이건 안써요
		pdvo.setType("");

		int currentPage;
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		if (request.getParameter("category") != null && request.getParameter("searchText") != null) {
			pdvo.setCategory(request.getParameter("category"));
			pdvo.setSearchText(request.getParameter("searchText"));
		}

		HomeTrainingPageDataVO htpd = homeTrainingService.homeTrainingAll(currentPage, pdvo);
		htpd.setCategory(pdvo.getCategory());
		htpd.setSearchText(pdvo.getSearchText());

		request.setAttribute("htpd", htpd);

		return "homeTraining/homeTrainingAll";
	}

	/* 홈트레이닝 - 목록 */
	@Override
	@RequestMapping(value = "/homeTrainingList.diet")
	public String homeTraining(HttpServletRequest request) {
		HomeTrainingPageDataVO pdvo = new HomeTrainingPageDataVO();
		String type = request.getParameter("type");
		pdvo.setType(type);

		if (request.getParameter("category") != null && request.getParameter("searchText") != null) {
			pdvo.setCategory(request.getParameter("category"));
			pdvo.setSearchText(request.getParameter("searchText"));
		}

		int currentPage;
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		HomeTrainingPageDataVO htpd = homeTrainingService.homeTrainingList(currentPage, pdvo);
		htpd.setType(type);
		htpd.setCategory(pdvo.getCategory());
		htpd.setSearchText(pdvo.getSearchText());

		request.setAttribute("htpd", htpd);
		
		
		// 종류별로 해당 회원이 게시물을 봤던 횟수 불러오기
//		HttpSession session = request.getSession();
//		MemberVO user = (MemberVO)session.getAttribute("member");
//		MemberVO seeList = homeTrainingService.getHtSeeList(user.getMbIndex());
//		
//		ArrayList<Integer> list = new ArrayList<Integer>();
//		list.add(seeList.)
		

		return "homeTraining/homeTrainingList";
	}

	/* 홈트레이닝 - 상세정보 */
	@Override
	@RequestMapping(value = "/homeTrainingInfo.diet")
	public String homeTrainingInfo(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		int indexNo = Integer.parseInt(request.getParameter("indexNo"));
		String type = request.getParameter("type");

		String servletName = "homeTrainingInfo.diet";
		configCookie(session, request, response, indexNo);

		HomeTrainingVO ht = homeTrainingService.homeTraining(indexNo);

		request.setAttribute("ht", ht);

		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}

		BoardCommentPDVO bcpd = commonService.getComment(currentPage, servletName, indexNo);

		request.setAttribute("bcpd", bcpd);

		/* 이전글 다음글 */
		
		  ArrayList<HomeTrainingVO> list = homeTrainingService.pnWriteList(ht.getIndexNo());;
		  request.setAttribute("list", list);
		  request.setAttribute("type", type);
		  
	
	

		int postIndex = Integer.parseInt(request.getParameter("indexNo"));
		// 쿠키 등록

		int sessionIndex = 0;
		if (session.getAttribute("member") != null) {
			sessionIndex = ((MemberVO) session.getAttribute("member")).getMbIndex();
		}
		// 등록된 정보 가져오는 로직
		BoardPostVO bpv = communityService.postedCommunity(postIndex);

		// 좋아요 체크하는 로직

		if (session.getAttribute("member") != null) {
			BoardLikeVO blv = checkLike(indexNo, sessionIndex);
			if (blv != null) {
				ht.setLikeYN(1);
			} else {
				ht.setLikeYN(0);
			}
		}

		return "homeTraining/homeTrainingInfo";
	}

	// 쿠키 저장 메소드
	public int configCookie(HttpSession session, HttpServletRequest request, HttpServletResponse response, int hits) {
		String mbIndex = "";
		int sessionIndex = 0;
		if (session.getAttribute("member") != null) {
			mbIndex = String.valueOf(((MemberVO) session.getAttribute("member")).getMbIndex());
			sessionIndex = ((MemberVO) session.getAttribute("member")).getMbIndex();
		} else {
			mbIndex = request.getRemoteAddr();
			if (mbIndex.equals("0:0:0:0:0:0:0:1")) {
				mbIndex = "localHost";
			}
		}
		boolean isGet = false;

		// 조회수 카운트 시작
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie c : cookies) {
				// 쿠키가 있는 경우
				if (c.getName().equals(String.valueOf(hits))) {
					isGet = true;
				}
			}
			// 쿠키가 없는 경우
			if (!isGet) {
				int result = homeTrainingService.homeTrainingHits(hits); // 조회수 증가
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
		System.out.println("sessionController : " + sessionIndex);
		System.out.println("likecheckVOController : " + likeCheckVO);
		BoardLikeVO blv = communityService.checkBoardLike(likeCheckVO);
		System.out.println("blvController : " + blv);
		return blv;
	}


	// 좋아요 부분
	@Override
	@ResponseBody
	@RequestMapping(value = "/homeTrainingLike.diet")
	public String boardLike(BoardLikeVO checkVO, HttpSession session) {
		int sessionIndex = ((MemberVO) session.getAttribute("member")).getMbIndex();
		int postIndex = checkVO.getTargetIndex();
		checkVO.setMbIndex(sessionIndex);

		BoardLikeVO blv = checkLike(postIndex, sessionIndex);
		int result2 = 0;

		if (blv != null) {
			int result = homeTrainingService.boardLikeDown(blv);
			if (result > 0) {
				result2 = homeTrainingService.postLikeDown(blv);
			}
		} else {
			int result = homeTrainingService.boardLikeUp(checkVO);
			if (result > 0) {
				result2 = homeTrainingService.postLikeUp(checkVO);
			}
		}
		
		if (result2 > 0) {
			return "success";
		} else {
			return "failed";
		}

	}

	// 글을 작성할 수 있는 회원인지 권한 확인
	// 실제로 할려면 DB를 거쳐서 회원 구분(ex.관리자, 트레이너 등)을 확인 해야 함
	@Override
	@RequestMapping(value = "/htWriteAuthorityCheck.diet")
	public void htWriteAuthorityCheck(HttpSession session, HttpServletResponse response) throws IOException {
		int result = 0;
		if (session.getAttribute("member") != null && ((MemberVO) session.getAttribute("member")).getMbIndex() == 1) {
			result = 1;
		}

		response.getWriter().println(result);
		response.getWriter().close();
	}
	
	// 홈트레이닝 글쓰기 불러오기
	@Override
	@RequestMapping(value = "/loadHomeTrainingWrite.diet")
	public String redirectLoadHomeTrainingWrite() {
		return "homeTraining/registHomeTraining";
	}
	
	// 홈트레이닝 글 등록
	@Override
	@RequestMapping(value = "/registHomeTraining.diet")
	public void registHomeTraining(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("member");
		
		HomeTrainingVO ht = new HomeTrainingVO();
		
		ht.setHtWriterNo(m.getMbIndex());
		
		ht.setHtTitle(request.getParameter("title"));
		ht.setHtExplain(request.getParameter("content"));
		ht.setHtStepTime(request.getParameter("time"));
		ht.setHtStepHard(request.getParameter("hard"));
		ht.setHtStepKal(request.getParameter("kal"));

    	ht.setHtType(request.getParameter("category"));
		
    	if(ht.getHtType().equals("1")) {
    		ht.setHtPart("전신");
    		ht.setHtStepType("전신");
    	}
    	else if(ht.getHtType().equals("2")) {
    		ht.setHtPart("복부");
    		ht.setHtStepType("복부");
    	}
    	else if(ht.getHtType().equals("3")) {
    		ht.setHtPart("상체");
    		ht.setHtStepType("상체");
    	}
    	else if(ht.getHtType().equals("4")) {
    		ht.setHtPart("하체");
    		ht.setHtStepType("하체");
    	}
    	else if(ht.getHtType().equals("5")) {
    		ht.setHtPart("스트레칭");
    		ht.setHtStepType("스트레칭");
    	}
    	else if(ht.getHtType().equals("6")) {
    		ht.setHtPart("댄스");
    		ht.setHtStepType("댄스");
    	}		
    	else if(ht.getHtType().equals("7")) {
    		ht.setHtPart("요가");
    		ht.setHtStepType("요가");
    	}
    	else if(ht.getHtType().equals("8")) {
    		ht.setHtPart("4주챌린지");
    		ht.setHtStepType("4주챌린지");
    	}
		
		ht.setHtVideo(request.getParameter("video"));
		
	
		ht.setHtMainPhoto("/imageUpload/" + request.getParameter("mainPhotoPath"));
		
		int result = homeTrainingService.registHomeTraining(ht);
		
		response.getWriter().print(result);
		response.getWriter().close();
	}
	
	// 게시물 삭제
	@Override
	@RequestMapping(value = "/homeTrainingDelete.diet")
	public void homeTrainingDelete(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		int result = homeTrainingService.deleteHomeTraining(Integer.parseInt(request.getParameter("indexNo")));
		
		response.getWriter().println(result);
		response.getWriter().close();
	}
	
	// 홈트레이닝 수정 페이지 불러오기
	@Override
	@RequestMapping(value = "/loadUpdateHomeTraining.diet")
	public String loadUpdateHomeTraining(HttpServletRequest request) {
		HomeTrainingVO ht = homeTrainingService.loadUpdateHomeTraining(Integer.parseInt(request.getParameter("indexNo")));
		
		request.setAttribute("ht", ht);
		
		return "homeTraining/updateHomeTraining";
	}
	
	// 홈트레이닝 수정
	@Override
	@RequestMapping(value = "/updateHomeTraining.diet")
	public void updateHomeTraining(HttpServletRequest request, HttpServletResponse response) throws IOException{
		HomeTrainingVO ht = new HomeTrainingVO();
		
		ht.setHtTitle(request.getParameter("title"));
		ht.setHtExplain(request.getParameter("content"));
		ht.setHtStepTime(request.getParameter("time"));
		ht.setHtStepHard(request.getParameter("hard"));
		ht.setHtStepKal(request.getParameter("kal"));
		ht.setIndexNo(Integer.parseInt(request.getParameter("indexNo")));

    	ht.setHtType(request.getParameter("category"));
		
    	if(ht.getHtType().equals("1")) {
    		ht.setHtPart("전신");
    		ht.setHtStepType("전신");
    	}
    	else if(ht.getHtType().equals("2")) {
    		ht.setHtPart("복부");
    		ht.setHtStepType("복부");
    	}
    	else if(ht.getHtType().equals("3")) {
    		ht.setHtPart("상체");
    		ht.setHtStepType("상체");
    	}
    	else if(ht.getHtType().equals("4")) {
    		ht.setHtPart("하체");
    		ht.setHtStepType("하체");
    	}
    	else if(ht.getHtType().equals("5")) {
    		ht.setHtPart("스트레칭");
    		ht.setHtStepType("스트레칭");
    	}
    	else if(ht.getHtType().equals("6")) {
    		ht.setHtPart("댄스");
    		ht.setHtStepType("댄스");
    	}		
    	else if(ht.getHtType().equals("7")) {
    		ht.setHtPart("요가");
    		ht.setHtStepType("요가");
    	}
    	else if(ht.getHtType().equals("8")) {
    		ht.setHtPart("4주챌린지");
    		ht.setHtStepType("4주챌린지");
    	}
		
		ht.setHtVideo(request.getParameter("video"));
		ht.setHtMainPhoto("/imageUpload/" + request.getParameter("mainPhotoPath"));
		
		int result = homeTrainingService.updateHomeTraining(ht);
		
		response.getWriter().print(result);
		response.getWriter().close();
	}

}
