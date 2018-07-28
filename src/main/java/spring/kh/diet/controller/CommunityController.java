package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spring.kh.diet.model.vo.BoardBlameVO;
import spring.kh.diet.model.vo.BoardBookMarkVO;
import spring.kh.diet.model.vo.BoardLikeVO;

public interface CommunityController {

	void registCommunity(String title, String content, int category, HttpSession session, HttpServletResponse response)
			throws IOException;

	String recipeBoardList(HttpSession session, HttpServletRequest request);

	String getList(HttpSession session, HttpServletRequest request);

	Object deletePost(HttpServletRequest request);

	String getViewList(HttpSession session, HttpServletRequest request, String postSort);

	String recipeViewList(HttpSession session, HttpServletRequest request, String postSort);

	String searchList(HttpSession session, HttpServletRequest request);

	Object postedCommunity(HttpServletRequest request, HttpServletResponse response, HttpSession session);

	String boardLike(BoardLikeVO checkVO, HttpSession session);

	String boardBookMark(BoardBookMarkVO checkVO, HttpSession session);

	String postReport(BoardBlameVO report, HttpSession session);

	void getMainCommunityList(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException;

}
