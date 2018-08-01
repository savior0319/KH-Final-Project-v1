package spring.kh.diet.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Collections;

import spring.kh.diet.model.service.CommonService;
import spring.kh.diet.model.service.CommunityService;
import spring.kh.diet.model.service.DietTipServiceImpl;
import spring.kh.diet.model.vo.BoardBookMarkVO;
import spring.kh.diet.model.vo.BoardCommentPDVO;
import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.DietTipPDVO;
import spring.kh.diet.model.vo.DietTipVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.UpMbSeeVO;

@Controller
public class DietTipControllerImpl implements DietTipController {

	@Resource(name = "dietTipService")
	private DietTipServiceImpl dietTipService;

	@Resource(name = "commonService")
	private CommonService commonService;

	@Resource(name = "communityService")
	private CommunityService communityService;

	// 다이어트 팁 리스트 불러오기
	@Override
	@RequestMapping(value = "/dietTipList.diet")
	public String getList(HttpServletRequest request) {
		DietTipPDVO pdvo = new DietTipPDVO();
		String type = request.getParameter("type");
		pdvo.setType(type);

		if (request.getParameter("category") != null && request.getParameter("searchText") != null) {
			pdvo.setCategory(request.getParameter("category"));
			pdvo.setSearchText(request.getParameter("searchText"));
		}

		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}

		DietTipPDVO dtpd = dietTipService.getDietTipList(currentPage, pdvo);
		dtpd.setType(pdvo.getType());
		dtpd.setCategory(pdvo.getCategory());
		dtpd.setSearchText(pdvo.getSearchText());

		request.setAttribute("dtpd", dtpd);
		request.setAttribute("type", type);
		
		
		// 종류별로 해당 회원이 게시물을 봤던 횟수 불러오기 
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("member");
		if(user!=null && type.equals("all")) {
			MemberVO seeList = dietTipService.getDtSeeList(user.getMbIndex());
			
			
			ArrayList<Integer> list = new ArrayList<Integer>();
			list.add(seeList.getMbDtColSee());
			list.add(seeList.getMbDtSpoSee());
			list.add(seeList.getMbDtDfSee());
			list.add(seeList.getMbDtSlSee());
			java.util.Collections.sort(list);
			java.util.Collections.reverse(list);
			
			String type1 = ""; 
			if(list.get(0) == seeList.getMbDtColSee()) {
				type1 = "coloumn";
			}else if(list.get(0) == seeList.getMbDtSpoSee()) {
				type1 = "sport";
			}else if(list.get(0) == seeList.getMbDtDfSee()) {
				type1 = "dietFood";
			}else {
				type1 = "successLatter";
			}
			
			ArrayList<DietTipVO> matchedList = dietTipService.getMatchedDtList(type1);
			request.setAttribute("matchedList", matchedList);
		}
		
		

		return "dietTip/dietTipList";
	}

	// 다이어트 팁 정보 페이지 보여주기
	@Override
	@RequestMapping(value = "/dietTipInfo.diet")
	public String getInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		int indexNo = Integer.parseInt(request.getParameter("indexNo"));
		String type = request.getParameter("type");

		// 조회수 증가
		configCookie(session, request, response, indexNo);

		int sessionIndex = 0;
		if (session.getAttribute("member") != null) {
			sessionIndex = ((MemberVO) session.getAttribute("member")).getMbIndex();
		}

		// 현재 호출하는 메소드(서블릿)의 이름을 담아서 같이 넘겨쥼 -> 슬래쉬(/)빼야 해요
		String servletName = "dietTipInfo.diet";

		DietTipVO dt = dietTipService.getDietTip(indexNo);

		// 좋아요 체크하는 로직
		if (session.getAttribute("member") != null) {
			BoardLikeVO blv = checkLike(indexNo, sessionIndex);

			if (blv != null) {
				dt.setLikeYN(1);
			} else {
				dt.setLikeYN(0);
			}
		}

		// 북마크 체크하는 로직
		BoardBookMarkVO bbmv = checkBookMark(indexNo, sessionIndex);
		if (bbmv != null) {
			dt.setBookMarkYN(1);
		} else {
			dt.setBookMarkYN(0);
		}

		request.setAttribute("dt", dt);

		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}

		BoardCommentPDVO bcpd = commonService.getComment(currentPage, servletName, indexNo);

		request.setAttribute("bcpd", bcpd);
		
		// 이전글 다음글 보여주는 거
		ArrayList<DietTipVO> nextPreDt = dietTipService.getNextPreDt(dt.getDtIndex());
		request.setAttribute("nextPreDt", nextPreDt);
		
		request.setAttribute("type", type);
		
		
		// 해당 게시물을 보면 회원 정보의 게시물 본 횟수 늘려 주기
		MemberVO user = (MemberVO)session.getAttribute("member");
		if(user!=null ) {
			UpMbSeeVO ums = new UpMbSeeVO();
			ums.setMbIndex(user.getMbIndex());
			ums.setType(type);
			dietTipService.upMbDtSee(ums);
		}

		return "dietTip/dietTipInfo";
	}

	// 관리자인지 권한 확인
	//실제로 할려면 DB를 거쳐서 회원 구분(ex.관리자, 트레이너 등)을 확인 해야 함
	@Override
	@RequestMapping(value = "/dtWriteAuthorityCheck.diet")
	public void dtWriteAuthorityCheck(HttpSession session, HttpServletResponse response) throws IOException {
		int result = 0;
		if (session.getAttribute("member") != null && ((MemberVO)session.getAttribute("member")).getMbGrade().equals("관리자")) {
			result = 1;
		}

		response.getWriter().println(result);
		response.getWriter().close();
	}

	// 다이어트 팁 글쓰기 불러오기
	@Override
	@RequestMapping(value = "/loadDietTipWrite.diet")
	public String redirectLoadDietTipWrite() {
		return "dietTip/registDietTip";
	}

	// 다이어트 팁 글 등록
	@Override
	@RequestMapping(value = "/registDietTip.diet")
	public void registDietTip(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		MemberVO m = (MemberVO) session.getAttribute("member");
		DietTipVO dt = new DietTipVO();

		dt.setDtWriterNo(m.getMbIndex());

		dt.setDtTitle(request.getParameter("title"));
		dt.setDtExplain(request.getParameter("content"));
		dt.setDtType(Integer.parseInt(request.getParameter("category")));
		dt.setDtSammary(request.getParameter("sammary"));
		dt.setDtMainPhoto("/imageUpload/" + request.getParameter("mainPhotoPath"));

		int result = dietTipService.registDietTip(dt);

		response.getWriter().print(result);
		response.getWriter().close();

	}

	// 경로에 메인 이미지 이름 짓기 및 저장
	@Override
	@RequestMapping(value = "/saveDietTipMainPhotoPath.diet", method = RequestMethod.POST, produces = "text/plain")
	public void saveDietTipMainPhotoPath(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest req) throws IOException {
		String path = request.getSession().getServletContext().getRealPath("imageUpload");

		// 이름 짓기
		UUID randomString = UUID.randomUUID();
		// 게시글 수정에서 save를 호출하는 경우
		if (!req.getFile("uploadFile").getOriginalFilename().equals("")) {

			String getFile = req.getFile("uploadFile").getOriginalFilename();
			int index = getFile.lastIndexOf(".");
			String name = getFile.substring(0, index);
			String ext = getFile.substring(index, getFile.length());
			String reName = name + "_" + randomString + ext;

			// 파일 저장
			File reFile = new File(path, reName);
			req.getFile("uploadFile").transferTo(reFile);

			response.getWriter().print(reName);
			response.getWriter().close();
		} else {
			response.getWriter().print("");
			response.getWriter().close();
		}
	}

	// 게시물 삭제
	@Override
	@RequestMapping(value = "/dietTipDelete.diet")
	public void dietTipDelete(HttpServletRequest request, HttpServletResponse response) throws IOException {

		int result = dietTipService.deleteDietTip(Integer.parseInt(request.getParameter("indexNo")));

		response.getWriter().println(result);
		response.getWriter().close();
	}

	// 다이어트 팁 수정 페이지 불러오기
	@Override
	@RequestMapping(value = "loadUpdateDietTip.diet")
	public String loadUpdateDietTip(HttpServletRequest request) {
		DietTipVO dt = dietTipService.loadUpdateDietTip(Integer.parseInt(request.getParameter("indexNo")));

		request.setAttribute("dt", dt);

		return "dietTip/updateDietTip";
	}

	// 다이어트 팁 수정
	@Override
	@RequestMapping(value = "/updateDietTip.diet")
	public void updateDietTip(HttpServletRequest request, HttpServletResponse response) throws IOException {
		DietTipVO dt = new DietTipVO();

		dt.setDtTitle(request.getParameter("title"));
		dt.setDtExplain(request.getParameter("content"));
		dt.setDtType(Integer.parseInt(request.getParameter("category")));
		dt.setDtSammary(request.getParameter("sammary"));
		String imgPath = request.getParameter("mainPhotoPath");
		if(imgPath.substring(0, 13).equals("/imageUpload/")) {
			imgPath = imgPath.substring(13);
		}
		dt.setDtMainPhoto("/imageUpload/" + imgPath);
		dt.setDtIndex(Integer.parseInt(request.getParameter("indexNo")));

		int result = dietTipService.updateDietTip(dt);

		response.getWriter().print(result);
		response.getWriter().close();

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
				int result = dietTipService.postHit(postIndex);// 조회수증가
				Cookie c1 = new Cookie(String.valueOf(postIndex), String.valueOf(postIndex));
				c1.setMaxAge(1 * 24 * 60 * 60);// 하루저장
				response.addCookie(c1);
			}
		}
		return sessionIndex;
	}

	// 좋아요 버튼 눌렀을 때
	@Override
	@ResponseBody
	@RequestMapping(value = "/dtLike.diet")
	public String dtLike(BoardLikeVO checkVO, HttpSession session) {
		if (session.getAttribute("member") != null) {
			int sessionIndex = ((MemberVO) session.getAttribute("member")).getMbIndex();
			int postIndex = checkVO.getTargetIndex();
			checkVO.setMbIndex(sessionIndex);

			BoardLikeVO blv = checkLike(postIndex, sessionIndex);

			int result2 = 0;
			if (blv != null) {
				int result = dietTipService.boardLikeDown(blv);
				if (result > 0) {
					result2 = dietTipService.postLikeDown(blv);
				}
			} else {
				int result = dietTipService.boardLikeUp(checkVO);
				if (result > 0) {
					result2 = dietTipService.postLikeUp(checkVO);
				}
			}

			if (result2 > 0) {
				return "success";
			} else {
				return "failed";
			}
		} else {
			return "failed";
		}
	}

	// 좋아요 확인 메소드
	@Override
	public BoardLikeVO checkLike(int postIndex, int sessionIndex) {
		BoardLikeVO likeCheckVO = new BoardLikeVO();
		likeCheckVO.setTargetIndex(postIndex);
		likeCheckVO.setMbIndex(sessionIndex);
		BoardLikeVO blv = dietTipService.checkBoardLike(likeCheckVO);
		return blv;
	}

	// 북마크 확인 메소드
	@Override
	public BoardBookMarkVO checkBookMark(int postIndex, int sessionIndex) {
		BoardBookMarkVO bookMarkCheckVO = new BoardBookMarkVO();
		bookMarkCheckVO.setPostIndex(postIndex);
		bookMarkCheckVO.setMbIndex(sessionIndex);
		BoardBookMarkVO bbmv = communityService.checkBoardBookMark(bookMarkCheckVO);
		return bbmv;

	}
	
	

}
