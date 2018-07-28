package spring.kh.diet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CustomerController {

	String notice(HttpServletRequest request, HttpServletResponse response);

	void noticeContent(int index);

}
