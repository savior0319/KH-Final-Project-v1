package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;

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

}
