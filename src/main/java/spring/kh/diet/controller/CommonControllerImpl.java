package spring.kh.diet.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import spring.kh.diet.model.service.CommonService;
import spring.kh.diet.model.vo.AdvertiseVO;
import spring.kh.diet.model.vo.BoardBlameVO;
import spring.kh.diet.model.vo.BoardCommentPDVO;
import spring.kh.diet.model.vo.BoardCommentVO;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.MemberVO;

@Controller
public class CommonControllerImpl implements CommonController {

	@Resource(name = "commonService")
	private CommonService commonService;

	public CommonControllerImpl() {
	}

	/* 댓글 등록 */
	@Override
	@RequestMapping(value = "/addComment.diet")
	public void addComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();

		// 로그인한 사용자인지 확인
		if (session.getAttribute("member") != null) {
			BoardCommentVO bc = new BoardCommentVO();
			bc.setPostIndex(Integer.parseInt(request.getParameter("indexNo")));
			bc.setCmtContent(request.getParameter("commentContent"));
			bc.setMbIndex(((MemberVO) session.getAttribute("member")).getMbIndex());

			int result = commonService.addComment(bc);

			if (result > 0) {
				int cmdCount = commonService.cmdCount(bc);

				BoardPostVO bpv = new BoardPostVO();
				bpv.setPostIndex(Integer.parseInt(request.getParameter("indexNo")));
				bpv.setPostComCount(cmdCount);

				commonService.cmdCountUp(bpv);

				response.getWriter().print(result);
				response.getWriter().close();
			}

		}
	}

	/* 댓글 내비 ajax 처리 */
	@Override
	@RequestMapping(value = "/naviMove.diet")
	public void naviMove(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int indexNo = Integer.parseInt(request.getParameter("indexNo"));
		String servletName = request.getParameter("servletName");

		BoardCommentPDVO bcpd = commonService.getComment(currentPage, servletName, indexNo);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(bcpd, response.getWriter());

	}

	/* 댓글 삭제 */
	@Override
	@RequestMapping(value = "/deleteComment.diet")
	public void deleteComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();

		// 로그인한 사용자인지 확인
		if (session.getAttribute("member") != null) {
			int commentIndex = Integer.parseInt(request.getParameter("commentIndex"));

			int result = commonService.deleteComment(commentIndex);
			if (result > 0) {
				int cmdCount = commonService.cmdDelCount(Integer.parseInt(request.getParameter("indexNo")));

				BoardPostVO bpv = new BoardPostVO();
				bpv.setPostIndex(Integer.parseInt(request.getParameter("indexNo")));
				bpv.setPostComCount(cmdCount);

				commonService.cmdCountUp(bpv);

				response.getWriter().print(result);
				response.getWriter().close();
			}
		}
	}

	/* 댓글 수정 */
	@Override
	@RequestMapping(value = "/modifyComment.diet")
	public void modifyComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();

		// 로그인한 사용자인지 확인
		if (session.getAttribute("member") != null) {
			BoardCommentVO bc = new BoardCommentVO();

			bc.setCmtIndex(Integer.parseInt(request.getParameter("commentIndex")));
			bc.setCmtContent(request.getParameter("comment"));

			int result = commonService.modifyComment(bc);

			response.getWriter().print(result);
			response.getWriter().close();
		}
	}

	/* 댓글 신고 확인 */
	@Override
	@ResponseBody
	@RequestMapping(value = "/checkBlameCmd.diet")
	public String checkBlameCmd(HttpServletRequest request, HttpServletResponse response) throws IOException {
		BoardBlameVO checkBlame = new BoardBlameVO();
		BoardPostVO bpv = new BoardPostVO();

		checkBlame.setTargetIndex(Integer.parseInt(request.getParameter("targetIndex")));
		checkBlame.setMbIndex(Integer.parseInt(request.getParameter("mbIndex")));

		BoardBlameVO cbbv = commonService.checkPostBlame(checkBlame);

		if (cbbv != null) {
			return "used";
		} else {
			return "success";
		}

	}

	/* 댓글 신고 하기 */
	@Override
	@ResponseBody
	@RequestMapping(value = "/blameCmd.diet")
	public String blameCmd(BoardBlameVO report, HttpSession session) throws IOException {
		int sessionIndex = ((MemberVO) session.getAttribute("member")).getMbIndex();

		report.setMbIndex(sessionIndex);

		int result = commonService.blameCmd(report);

		if (result > 0) {
			int result2 = commonService.cmtBlameUp(report);
			if (result2 > 0) {
				return "success";
			}
			return "error";
		} else {
			return "failed";
		}

	}

	/* 광고 사진 불러오기 */
	@Override
	@ResponseBody
	@RequestMapping(value = "/advertiseImageLoad.diet")
	public void advertiseImageLoad(HttpServletResponse response) throws IOException {
		ArrayList<AdvertiseVO> aList = commonService.advertiseImageLoad();
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(aList, response.getWriter());
	}

}
