package spring.kh.diet.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.kh.diet.model.service.CommunityService;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.CommunityPageDataVO;
import spring.kh.diet.model.vo.MemberVO;

@Controller
public class CommunityControllerImpl implements CommunityController {

	@Resource(name = "communityService")
	private CommunityService communityService;

	public CommunityControllerImpl() {

	}

	// 전체 게시판
	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/communityWholeBoard.diet") public Object
	 * allCommunityList(HttpSession session, HttpServletRequest request) {
	 * List<BoardPostVO> list = communityService.allCommunityList(); ModelAndView
	 * view = new ModelAndView(); if (!list.isEmpty()) { view.addObject("list",
	 * list); view.setViewName("community/communityWholeBoard"); return view; } else
	 * { return null; } }
	 */

	
	// 게시글 등록 메소드	
	@Override
	@RequestMapping(value = "/communityPostRegist.diet")
	public void registCommunity(@RequestParam String title, @RequestParam String content, @RequestParam int category,
			HttpSession session, HttpServletResponse response) throws IOException {

		MemberVO mv = (MemberVO) session.getAttribute("member");
		BoardPostVO bpv = new BoardPostVO();

		bpv.setMbIndex(mv.getMbIndex());
		

		bpv.setPostTitle(title);
		bpv.setPostContent(content);
		bpv.setBcaIndex(category);

		int result = communityService.registCommunity(bpv);

		if (result > 0) {
			System.out.println("글등록 완료");
		} else {
			System.out.println("글등록 실패");
		}

		response.getWriter().print("success");
		response.getWriter().close();
	}

	// 전체, 자유, 팁&노하우, 고민&질문, 비포&애프터 게시판 페이징 처리 출력
	@Override
	@RequestMapping(value = "/communityWholeBoard.diet")
	public String getList(HttpSession session, HttpServletRequest request) {
		String type = request.getParameter("type");

		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}

		CommunityPageDataVO cpdv = communityService.allCommunityList(currentPage, type);

		request.setAttribute("cpdv", cpdv);

		return "community/communityWholeBoard";
	}


	// 레시피&식단
	@Override
	@RequestMapping(value = "/recipeBoard.diet")
	public String recipeBoardList(HttpSession session, HttpServletRequest request) {
		String type = request.getParameter("type");

		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}

		CommunityPageDataVO cpdv = communityService.recipeBoardList(currentPage, type);

		request.setAttribute("cpdv", cpdv);
		
		return "community/recipeBoard";
	}



	
	//등록된 글 들어가는 곳
/*	@Override
	@RequestMapping(value = "/postedCommunity.diet")
	public Object postedCommunity(HttpSession session) {
		List<BoardPostVO> list = communityService.allCommunityList();
		ModelAndView view = new ModelAndView();
		if (!list.isEmpty()) {
			view.addObject("list", list);
			view.setViewName("community/postedCommunity");
			return view;
		} else {
			return null;
		}

	}*/

}
