package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spring.kh.diet.model.vo.BoardBlameVO;

public interface CommonController {

	void addComment(HttpServletRequest request, HttpServletResponse response) throws IOException;

	void naviMove(HttpServletRequest request, HttpServletResponse response) throws IOException;

	void deleteComment(HttpServletRequest request, HttpServletResponse response) throws IOException;

	void modifyComment(HttpServletRequest request, HttpServletResponse response) throws IOException;

	String checkBlameCmd(HttpServletRequest request, HttpServletResponse response) throws IOException;

	String blameCmd(BoardBlameVO report, HttpSession session) throws IOException;

	void advertiseImageLoad(HttpServletResponse response) throws IOException;

}
