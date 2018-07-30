package spring.kh.diet.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import spring.kh.diet.model.service.CommonService;
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

}
