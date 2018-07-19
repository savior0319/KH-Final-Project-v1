package spring.kh.diet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import spring.kh.diet.model.vo.MemberVO;

@Controller
public interface LoginLogoutController {
	
	String logout(HttpServletRequest request);
	String login(HttpServletRequest request, String memberId, String memberPwd);
	Object findId(HttpSession session, String mbName, String mbPhone);
	Object updatePassword(String mbId, String mbPwd);
}
