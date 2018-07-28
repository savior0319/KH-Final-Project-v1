package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface ImageUploadController {

	void saveDietTipMainPhotoPath(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest req) throws IOException;

}
