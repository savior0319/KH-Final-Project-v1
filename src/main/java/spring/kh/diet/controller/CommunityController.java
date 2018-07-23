package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface CommunityController {

	void registCommunity(String title, String content, int category, HttpSession session, HttpServletResponse response)
			throws IOException;

	String recipeBoardList(HttpSession session, HttpServletRequest request);

	String getList(HttpSession session, HttpServletRequest request);

	Object postedCommunity(HttpServletRequest request);

	Object deletePost(HttpServletRequest request);

	String getViewList(HttpSession session, HttpServletRequest request, String postSort);

	String recipeViewList(HttpSession session, HttpServletRequest request, String postSort);

	String searchList(HttpSession session, HttpServletRequest request);


}
