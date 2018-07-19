package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spring.kh.diet.model.vo.MemberVO;

public interface MyInfoController {

	void secessionMember(HttpSession session, HttpServletResponse response) throws IOException;

	void question(String title, String content, HttpServletResponse response) throws IOException;

	String updateMyPicture(HttpSession session, HttpServletResponse response, String formData) throws IOException;

	String updateMyInfo(MemberVO memberVO, HttpSession session, HttpServletResponse response) throws IOException;

	String deleteMyPicture(String mbId, HttpSession session, HttpServletResponse response) throws IOException;

	Object allMyOneToOneQuestion(HttpSession session);

/*	Object myWishList(HttpSession session);
*/
	String signupsave(String mbId, String mbNickName, String mbPwd, String[] gender, String[] interest);

}
