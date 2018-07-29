package spring.kh.diet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public interface CustomerController {

	String notice(HttpServletRequest request, HttpServletResponse response);

	Object noticeContent(HttpSession sessionCheck, int index, HttpServletResponse response, HttpServletRequest request);

}
