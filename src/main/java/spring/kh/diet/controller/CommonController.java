package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommonController {

	void imageUpload();

	void addComment(HttpServletRequest request, HttpServletResponse response) throws IOException;

	void naviMove(HttpServletRequest request, HttpServletResponse response) throws IOException;

}
