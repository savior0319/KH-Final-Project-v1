package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface CommunityController {

	Object allCommunityList(HttpSession session);

	void registCommunity(String title, String content, int category, HttpSession session, HttpServletResponse response)
			throws IOException;

	Object postedCommunity(HttpSession session);

	Object beforeAfterList(HttpSession session);

	Object bulletinBoardList(HttpSession session);

	Object tipKnowhowBoardList(HttpSession session);

	Object worryNQnABoardList(HttpSession session);

	

}
