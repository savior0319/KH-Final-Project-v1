package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface CommunityController {

	Object allCommunityList(HttpSession session);

	void registCommunity(String title, String content, int category, HttpSession session, HttpServletResponse response)
			throws IOException;

	String recipeBoardList(HttpSession session,HttpServletRequest request);

	String getList(HttpSession session, HttpServletRequest request);

	

}
