package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.kh.diet.model.vo.todayAnalyticPDVO;
import spring.kh.diet.model.vo.yesterdayAnalytic;

public interface AdminController {

	String currentLoginUser(HttpServletRequest request, HttpServletResponse response);

	String memberList(HttpServletRequest request, HttpServletResponse response);

	String deleteMemberList(HttpServletRequest request, HttpServletResponse response);

	String answer(HttpServletRequest request, HttpServletResponse response);

	void answerReg(String content, int index, HttpServletResponse response) throws IOException;

	String qaContent(int index, HttpServletRequest request);

	Object todayAnalytics(HttpServletRequest request);

	yesterdayAnalytic yesterdayAnalytics();

	String blackList(HttpServletRequest request, HttpServletResponse response);

	void yesterdayAutoInsertAnalytics();

	todayAnalyticPDVO todayAutoAnalytics();

	String blackListContent(int index, HttpServletResponse response, HttpServletRequest request);

	String trainer(HttpServletRequest request, HttpServletResponse response);

	Object trainerRegContents(HttpServletRequest request, HttpServletResponse response, HttpSession session);

	String denyTrainerReg(HttpServletRequest request, HttpSession session);

	String acceptTrainerReg(HttpServletRequest request, HttpSession session);

	Object errorLogManageDetail(HttpServletRequest request);

	Object errorLogManage(HttpServletRequest request) throws Throwable;

	String trainerChange(HttpServletRequest request, HttpServletResponse response, HttpSession session);

	String changeGrade(HttpServletRequest request, HttpSession session);

	void noticeRegisterData(String title, String content, String noticeType, HttpServletResponse response)
			throws IOException;

	void advertiseImageUpload(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest req)
			throws IOException;

	void excelOut(HttpServletRequest request, HttpServletResponse response) throws IOException;

	Object loginLogManage();

	Object loginLogManageDetail(HttpServletRequest request);

	String blackListReg(int index, String status, HttpServletResponse response, HttpServletRequest request)
			throws IOException;

	void insertErrorLog() throws Throwable;

	void insertWarnLog(String currentWord) throws Throwable;

	void insertErrorLog(String currentWord) throws Throwable;

	void insertFatalLog(String currentWord) throws Throwable;

}
