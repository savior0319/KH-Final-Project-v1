package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

public interface MyInfoController {

	void question(String title, String content, HttpServletResponse response) throws IOException;

}
