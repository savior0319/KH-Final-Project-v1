package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

@Controller
public interface LoginLogoutController {

	void updatePassword(String mbId, HttpServletResponse response) throws IOException;

	String kakaoLogin(String kakaoId, Object kakaoToken, HttpServletRequest request);

	String logout(HttpServletRequest request, HttpServletResponse response);

	String login(HttpServletRequest request, String memberId, String memberPwd);
}
