package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.MyActivityVO;

public interface MyInfoController {

	void secessionMember(HttpSession session, HttpServletResponse response) throws IOException;

	String updateMyInfo(MemberVO memberVO, HttpSession session, HttpServletResponse response) throws IOException;

	String deleteMyPicture(String mbId, HttpSession session, HttpServletResponse response) throws IOException;

	Object allMyOneToOneQuestion(HttpSession session);

	String signupsave(String mbId, String mbNickName, String mbPwd, String[] gender, String[] interest);

	Object myActivity(HttpServletResponse response, HttpSession session, HttpServletRequest request);

	void idCheck(String id, HttpServletResponse response) throws IOException;

	void nickNameCheck(String nickName, HttpServletResponse response) throws IOException;

	void updateMyPicture(HttpSession session, HttpServletResponse response, HttpServletRequest request,
			MultipartFile uploadFile) throws IOException;

	void question(String title, String content, String mbIndex, HttpServletResponse response) throws IOException;

	String myActivityGetList(HttpSession session, HttpServletRequest request, MyActivityVO ma);

	String myCommentGetList(HttpSession session, HttpServletRequest request, MyActivityVO ma);

	void questionAnswer(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException;

}
