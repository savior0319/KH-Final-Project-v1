package spring.kh.diet.controller;

import javax.servlet.http.HttpServletRequest;

public interface CommonController {

	void imageUpload();

	String getComment(HttpServletRequest request);

}
