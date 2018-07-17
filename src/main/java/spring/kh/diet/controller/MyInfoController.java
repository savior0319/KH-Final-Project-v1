package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;

public interface MyInfoController {

	void secessionMember(HttpSession session, HttpServletResponse response) throws IOException;

	void question(String title, String content, HttpServletResponse response) throws IOException;

}
