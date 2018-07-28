package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AdminController {

	void noticeRegisterData(String title, String content, HttpServletResponse response) throws IOException;

	String currentLoginUser(HttpServletRequest request, HttpServletResponse response);

	String memberList(HttpServletRequest request, HttpServletResponse response);

	String deleteMemberList(HttpServletRequest request, HttpServletResponse response);

	String blackList();

	String trainer();

	String answer(HttpServletRequest request, HttpServletResponse response);

	void answerReg(String content, int index, HttpServletResponse response) throws IOException;

	String qaContent(int index, HttpServletRequest request);

}
