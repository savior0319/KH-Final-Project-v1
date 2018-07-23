package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.web.multipart.MultipartFile;

import spring.kh.diet.model.vo.MemberVO;

public interface MyInfoController {

	void secessionMember(HttpSession session, HttpServletResponse response) throws IOException;

	String updateMyInfo(MemberVO memberVO, HttpSession session, HttpServletResponse response) throws IOException;

	String deleteMyPicture(String mbId, HttpSession session, HttpServletResponse response) throws IOException;

	Object allMyOneToOneQuestion(HttpSession session);

	String signupsave(String mbId, String mbNickName, String mbPwd, String[] gender, String[] interest);

	Object myActivity(HttpServletResponse response, HttpSession session, HttpServletRequest request);

	void idCheck(String id, HttpServletResponse response) throws IOException;

	void nickNameCheck(String nickName, HttpServletResponse response) throws IOException;

<<<<<<< HEAD
<<<<<<< HEAD
	String updateMyPicture(HttpServletRequest request,HttpSession session, HttpServletResponse response, MultipartFile uploadFile)
			throws IOException;
=======
=======
>>>>>>> branch 'master' of https://github.com/savior0319/KH-Final-Project-v1
	String updateMyPicture(HttpSession session, HttpServletResponse response, HttpServletRequest request,
			MultipartFile uploadFile) throws IOException;

	void question(String title, String content, String mbIndex, HttpServletResponse response) throws IOException;
<<<<<<< HEAD
>>>>>>> branch 'master' of https://github.com/savior0319/KH-Final-Project-v1
=======
>>>>>>> branch 'master' of https://github.com/savior0319/KH-Final-Project-v1

}
