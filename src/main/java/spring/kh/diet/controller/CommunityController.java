package spring.kh.diet.controller;

import javax.servlet.http.HttpSession;

public interface CommunityController {

	Object allCommunityList(HttpSession session);

	Object postedCommunity(HttpSession session);

	Object beforeAfterList(HttpSession session);

	
	
}
