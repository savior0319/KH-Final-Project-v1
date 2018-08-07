package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.kh.diet.model.vo.BoardBookMarkVO;
import spring.kh.diet.model.vo.BoardLikeVO;

public interface DietTipController {
	String getList(HttpServletRequest request);

	String getInfo(HttpSession session, HttpServletRequest request, HttpServletResponse response);

	void registDietTip(HttpServletRequest request, HttpServletResponse response) throws IOException;

	void saveDietTipMainPhotoPath(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest req) throws IOException;

	void dtWriteAuthorityCheck(HttpSession session, HttpServletResponse response) throws IOException;

	void dietTipDelete(HttpServletRequest request, HttpServletResponse response) throws IOException;

	String loadUpdateDietTip(HttpServletRequest request);

	void updateDietTip(HttpServletRequest request, HttpServletResponse response) throws IOException;

	String dtLike(BoardLikeVO checkVO, HttpSession session);

	BoardLikeVO checkLike(int postIndex, int sessionIndex);

	BoardBookMarkVO checkBookMark(int postIndex, int sessionIndex);

	String redirectLoadDietTipWrite(HttpSession session);
}
