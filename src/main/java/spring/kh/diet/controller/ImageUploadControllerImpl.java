package spring.kh.diet.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ImageUploadControllerImpl implements ImageUploadController {

	// 경로에 메인 이미지 이름 짓기 및 저장
	@Override
	@RequestMapping(value = "/imageUpload.diet", method = RequestMethod.POST, produces = "text/plain")
	public void saveDietTipMainPhotoPath(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest req) throws IOException {
		req.setCharacterEncoding("utf-8");
		String path = request.getSession().getServletContext().getRealPath("imageUpload");
		// 이름 짓기
		UUID randomString = UUID.randomUUID();
		// 게시글 수정에서 save를 호출하는 경우
		String getFile = req.getFile("file").getOriginalFilename();
		int index = getFile.lastIndexOf(".");
		String name = getFile.substring(0, index);
		String ext = getFile.substring(index, getFile.length());
		String reName = name + "_" + randomString + ext;
		// 파일 저장
		File reFile = new File(path, reName);
		req.getFile("file").transferTo(reFile);
		response.setCharacterEncoding("utf-8");
		response.getWriter().print("/imageUpload" + "/" + reName);
		response.getWriter().close();
	}
}
