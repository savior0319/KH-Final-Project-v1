package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;

@Controller
public interface LoginLogoutController {

	String logout(HttpServletRequest request);

	String login(HttpServletRequest request, String memberId, String memberPwd);

	void updatePassword(String mbId, String mbPwd, HttpServletResponse response) throws IOException;
}
