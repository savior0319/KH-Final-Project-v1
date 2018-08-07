package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonIOException;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.MyActivityVO;

public interface MyInfoController {

	void secessionMember(HttpSession session, HttpServletResponse response) throws IOException;

	String updateMyInfo(MemberVO memberVO, HttpSession session, HttpServletResponse response) throws IOException;

	String deleteMyPicture(String mbId, HttpSession session, HttpServletResponse response) throws IOException;

	String signupsave(String mbId, String mbNickName, String mbPwd, String[] gender, String[] interest);

	Object myActivity(HttpServletResponse response, HttpSession session, HttpServletRequest request);

	void idCheck(String id, HttpServletResponse response) throws IOException;

	void nickNameCheck(String nickName, HttpServletResponse response) throws IOException;

	void updateMyPicture(HttpSession session, HttpServletResponse response, HttpServletRequest request,
			MultipartFile uploadFile) throws IOException;

	void question(String title, String content, String mbIndex, HttpServletResponse response) throws IOException;

	String myCommentGetList(HttpSession session, HttpServletRequest request, MyActivityVO ma);

	void questionAnswer(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException;

	String myActivityGetList(HttpSession session, HttpServletResponse response, HttpServletRequest request,
			MyActivityVO ma) throws JsonIOException, IOException;

	String myBookMarkGetList(HttpSession session, HttpServletRequest request, MyActivityVO ma);

	String checkReport(MemberVO mbIndex);

	void deleteMyQuestion(HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws IOException;

	void deleteMyPost(HttpServletResponse response, HttpServletRequest request, HttpSession session) throws IOException;

	void deleteMyComment(HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws IOException;

	void deleteMyBookMark(HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws IOException;

	Object allMyOneToOneQuestion(HttpSession session, HttpServletRequest request, MyActivityVO ma);

	Object requestTrainer(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JsonIOException, IOException;

	void canclePro(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws JsonIOException, IOException;

	Object applyTrainer(HttpSession session, HttpServletRequest request, HttpServletResponse response, String type)
			throws JsonIOException, IOException;

	String trainerUpdate(HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws IOException;

	String redirectSignup(HttpSession session);

}
