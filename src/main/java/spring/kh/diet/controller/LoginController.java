package spring.kh.diet.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

@Controller
public interface LoginController {
	
	String login(HttpServletRequest request, String memberId, String memberPwd);



}
