package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spring.kh.diet.model.vo.todayAnalyticPDVO;
import spring.kh.diet.model.vo.yesterdayAnalytic;

public interface AdminController {

	void noticeRegisterData(String title, String content, HttpServletResponse response) throws IOException;

	String currentLoginUser(HttpServletRequest request, HttpServletResponse response);

	String memberList(HttpServletRequest request, HttpServletResponse response);

	String deleteMemberList(HttpServletRequest request, HttpServletResponse response);

	String trainer();

	String answer(HttpServletRequest request, HttpServletResponse response);

	void answerReg(String content, int index, HttpServletResponse response) throws IOException;

	String qaContent(int index, HttpServletRequest request);

	String todayAnalytics(HttpServletRequest request);

	yesterdayAnalytic yesterdayAnalytics();

	String blackList(HttpServletRequest request, HttpServletResponse response);

	void blackListReg(int index, String status, HttpServletResponse response) throws IOException;
  
	String blackListContent(int index);

	void yesterdayAutoInsertAnalytics();

	todayAnalyticPDVO todayAutoAnalytics();

}
