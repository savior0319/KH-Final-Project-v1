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

	void getDietTipMainPhotoPath(HttpSession session, HttpServletRequest request, HttpServletResponse response,
			MultipartFile file) throws IOException;
}
