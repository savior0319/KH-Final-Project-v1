package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface DietTipController {
	String getList(HttpServletRequest request);

	String getInfo(HttpServletRequest request);

	void registDietTip(HttpServletRequest request, HttpServletResponse response) throws IOException;

	void saveDietTipMainPhotoPath(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest req) throws IOException;

	void sessionCheck(HttpSession session, HttpServletResponse response) throws IOException;

	String redirectLoadDietTipWrite();

	void dietTipDelete(HttpServletRequest request, HttpServletResponse response) throws IOException;

	String loadUpdateDietTip(HttpServletRequest request);

	void updateDietTip(HttpServletRequest request, HttpServletResponse response) throws IOException;
}
