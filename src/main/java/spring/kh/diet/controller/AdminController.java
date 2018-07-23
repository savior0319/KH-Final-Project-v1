package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AdminController {

	void noticeRegisterData(String title, String content, HttpServletResponse response) throws IOException;

	void currentLoginUser(ServletContext session) throws IOException;

	String memberList(HttpServletRequest request, HttpServletResponse response);

}
