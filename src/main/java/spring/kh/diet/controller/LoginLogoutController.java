package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

@Controller
public interface LoginLogoutController {

	String logout(HttpServletRequest request);

	String login(HttpServletRequest request, String memberId, String memberPwd);

	void kakaoLogin(String kakaoId, Object kakaoToken);

	void updatePassword(String mbId, HttpServletResponse response) throws IOException;

	void kakaoLogin(String kakaoId, Object kakaoToken, HttpSession session);

	String kakaoLogin(String kakaoId, Object kakaoToken, HttpServletRequest request);
}
