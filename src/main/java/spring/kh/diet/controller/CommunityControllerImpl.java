package spring.kh.diet.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.kh.diet.model.service.CommonService;
import spring.kh.diet.model.service.CommunityService;
import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.BoardBookMarkVO;
import spring.kh.diet.model.vo.BoardCommentPDVO;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.CommunityPageDataVO;
import spring.kh.diet.model.vo.DietTipVO;
import spring.kh.diet.model.vo.MemberVO;

@Controller
public class CommunityControllerImpl implements CommunityController {

	@Resource(name = "communityService")
	private CommunityService communityService;

	@Resource(name = "commonService")
	private CommonService commonService;

	public CommunityControllerImpl() {

	}

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

	// 레시피&식단 + 최신순
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

	// 등록된 글 들어가는 곳
	@Override
	@RequestMapping(value = "/postedCommunity.diet")
	public Object postedCommunity(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		int postIndex = Integer.parseInt(request.getParameter("postIndex"));
		// 쿠키 등록
		int sIndex = configCookie(session, request, response, postIndex);
		int sessionIndex = 0;
		if(session.getAttribute("member")!=null) {
			sessionIndex = ((MemberVO)session.getAttribute("member")).getMbIndex();
		}
		// 등록된 정보 가져오는 로직
		BoardPostVO bpv = communityService.postedCommunity(postIndex);

		// 좋아요 체크하는 로직
		if (session.getAttribute("member") != null) {
			BoardLikeVO blv = checkLike(postIndex, sessionIndex);

			if (blv != null) {
				bpv.setLikeYN(1);
			} else {
				bpv.setLikeYN(0);
			}
		}
		// 북마크 체크하는 로직
		BoardBookMarkVO bbmv = checkBookMark(postIndex, sessionIndex);
		if (bbmv != null) {
			bpv.setBookMarkYN(1);
		} else {
			bpv.setBookMarkYN(0);
		}

		request.setAttribute("bpv", bpv);

		// 현재 호출하는 메소드(서블릿)의 이름을 담아서 같이 넘겨쥼 -> 슬래쉬(/)빼야 해요
		String servletName = "postedCommunity.diet";

		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}

		BoardCommentPDVO bcpd = commonService.getComment(currentPage, servletName, postIndex);

		request.setAttribute("bcpd", bcpd);

		return "community/postedCommunity";

		// 쿠키변수를 만들어서 값을 저장. 쿠키변수에 값이 있으면 조회수 증가 실행 하지 않음

	}

	// 쿠키저장 메소드
	public int configCookie(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			int postIndex) {
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
			for (Cookie c : cookies) {//
				// 쿠키가 있는 경우
				if (c.getName().equals(String.valueOf(postIndex))) {
					isGet = true;
				}
			}
			// 쿠키가 없는 경우
			if (!isGet) {
				int result = communityService.postHit(postIndex);// 조회수증가
				Cookie c1 = new Cookie(String.valueOf(postIndex), String.valueOf(postIndex));
				c1.setMaxAge(1 * 24 * 60 * 60);// 하루저장
				response.addCookie(c1);
			}
		}
		return sessionIndex;
	}

	// 좋아요 확인 메소드
	public BoardLikeVO checkLike(int postIndex, int sessionIndex) {
		BoardLikeVO likeCheckVO = new BoardLikeVO();
		likeCheckVO.setTargetIndex(postIndex);
		System.out.println("postIndexController : " + postIndex);
		likeCheckVO.setMbIndex(sessionIndex);
		System.out.println("sessionController : "+sessionIndex);
		System.out.println("likecheckVOController : " + likeCheckVO);
		BoardLikeVO blv = communityService.checkBoardLike(likeCheckVO);
		System.out.println("blvController : " + blv);
		return blv;
	}

	// 북마크 확인 메소드
	public BoardBookMarkVO checkBookMark(int postIndex, int sessionIndex) {
		BoardBookMarkVO bookMarkCheckVO = new BoardBookMarkVO();
		bookMarkCheckVO.setPostIndex(postIndex);
		System.out.println("CCpostIndex : " + postIndex);
		bookMarkCheckVO.setMbIndex(sessionIndex);
		System.out.println("CCsessionIndex : " + sessionIndex);
		BoardBookMarkVO bbmv = communityService.checkBoardBookMark(bookMarkCheckVO);
		return bbmv;

	}

	// 삭제하기
	@Override
	@RequestMapping(value = "/deletePost.diet")
	public Object deletePost(HttpServletRequest request) {
		int postIndex = Integer.parseInt(request.getParameter("postIndex"));

		int result = communityService.deletePost(postIndex);

		if (result > 0) {
			return "community/postedCommunity";
		} else {
			return null;
		}

	}

	// 최신순 | 조회순 출력 : 전체, 자유, 팁&노하우, 고민&질문, 비포&애프터 게시판 페이징 처리 출력
	// 검색 했을 때 최신순, 조회순 정렬 기능 추가
	@Override
	@RequestMapping(value = "/communityViewBoard.diet")
	public String getViewList(HttpSession session, HttpServletRequest request, @RequestParam String postSort) {
		String type = request.getParameter("type");

		String category = request.getParameter("category");
		String searchText = request.getParameter("searchText");

		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}

		CommunityPageDataVO cpdv = communityService.viewAllList(currentPage, type, postSort, category, searchText);
		cpdv.setCategory(category);
		cpdv.setSearchText(searchText);
		cpdv.setType(type);
		request.setAttribute("cpdv", cpdv);

		return "community/communityWholeBoard";
	}

	// 최신순 | 조회순 출력 : 레시피&식단
	@Override
	@RequestMapping(value = "/recipeView.diet")
	public String recipeViewList(HttpSession session, HttpServletRequest request, @RequestParam String postSort) {
		String type = request.getParameter("type");

		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}

		CommunityPageDataVO cpdv = communityService.recipeViewList(currentPage, type, postSort);

		request.setAttribute("cpdv", cpdv);

		return "community/recipeBoard";
	}

	// 검색 게시판 페이징 처리 출력
	@Override
	@RequestMapping(value = "/communitySearch.diet")
	public String searchList(HttpSession session, HttpServletRequest request) {
		String searchText = request.getParameter("searchText");
		String category = request.getParameter("category");
		String type = request.getParameter("type");

		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}

		CommunityPageDataVO cpdv = communityService.searchList(currentPage, searchText, category);
		cpdv.setType(type);
		// System.out.println(type);
		System.out.println("검색어 : " + cpdv.getSearchText());
		System.out.println("카테고리 : " + category);

		request.setAttribute("cpdv", cpdv);

		return "community/communityWholeBoard";
	}

	// 좋아요 버튼
	@Override
	@ResponseBody
	@RequestMapping(value = "/postLike.diet")
	public String boardLike(BoardLikeVO checkVO, HttpSession session) {
		int sessionIndex = ((MemberVO) session.getAttribute("member")).getMbIndex();
		int postIndex = checkVO.getTargetIndex();
		checkVO.setMbIndex(sessionIndex);

		BoardLikeVO blv = checkLike(postIndex, sessionIndex);

		int result2 = 0;
		if (blv != null) {
			int result = communityService.boardLikeDown(blv);
			if (result > 0) {
				result2 = communityService.postLikeDown(blv);
			}
		} else {
			int result = communityService.boardLikeUp(checkVO);
			if (result > 0) {
				result2 = communityService.postLikeUp(checkVO);
			}
		}

		if (result2 > 0) {
			return "success";
		} else {
			return "failed";
		}
	}

	// 북마크 버튼
	@Override
	@ResponseBody
	@RequestMapping(value = "/postBookMark.diet")
	public String boardBookMark(BoardBookMarkVO checkVO, HttpSession session) {
		int sessionIndex = ((MemberVO) session.getAttribute("member")).getMbIndex();
		int postIndex = checkVO.getPostIndex();
		System.out.println("C sessionIndex : " + sessionIndex);
		System.out.println("C postIndex : " + postIndex);
		checkVO.setMbIndex(sessionIndex);
		BoardBookMarkVO bbmv = checkBookMark(postIndex, sessionIndex);
		System.out.println("C bbmv : " + bbmv);
		int result = 0;
		if (bbmv != null) {
			result = communityService.boardBookMarkOff(bbmv);
		} else {
			result = communityService.boardBookMarkOn(checkVO);
		}

		if (result > 0) {
			return "success";
		} else {
			return "failed";
		}
	}

}
