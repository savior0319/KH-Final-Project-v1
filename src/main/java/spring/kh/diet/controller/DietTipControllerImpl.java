package spring.kh.diet.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.kh.diet.model.service.CommonService;
import spring.kh.diet.model.service.DietTipServiceImpl;
import spring.kh.diet.model.vo.BoardCommentPDVO;
import spring.kh.diet.model.vo.DietTipPDVO;
import spring.kh.diet.model.vo.DietTipVO;
import spring.kh.diet.model.vo.MemberVO;

@Controller
public class DietTipControllerImpl implements DietTipController {

	@Resource(name = "dietTipService")
	private DietTipServiceImpl dietTipService;

	@Resource(name = "commonService")
	private CommonService commonService;

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

		return "dietTip/dietTipList";
	}

	// 다이어트 팁 정보 페이지 보여주기
	@Override
	@RequestMapping(value = "/dietTipInfo.diet")
	public String getInfo(HttpServletRequest request) {
		int indexNo = Integer.parseInt(request.getParameter("indexNo"));
		// 현재 호출하는 메소드(서블릿)의 이름을 담아서 같이 넘겨쥼 -> 슬래쉬(/)빼야 해요
		String servletName = "dietTipInfo.diet";

		DietTipVO dt = dietTipService.getDietTip(indexNo);

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

		return "dietTip/dietTipInfo";
	}

	// 로그인 되어있는지 확인
	@Override
	@RequestMapping(value = "/sessionCheck.diet")
	public void sessionCheck(HttpSession session, HttpServletResponse response) throws IOException {
		int result = 0;
		if (session.getAttribute("member") != null) {
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
		System.out.println(request.getParameter("sammary"));
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
		dt.setDtMainPhoto("/imageUpload/" + request.getParameter("mainPhotoPath"));
		dt.setDtIndex(Integer.parseInt(request.getParameter("indexNo")));

		int result = dietTipService.updateDietTip(dt);

		response.getWriter().print(result);
		response.getWriter().close();

	}
}
