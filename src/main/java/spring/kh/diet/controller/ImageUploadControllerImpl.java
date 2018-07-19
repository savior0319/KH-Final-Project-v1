package spring.kh.diet.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@SuppressWarnings("all")
@Controller
public class ImageUploadControllerImpl {

	@RequestMapping(value = "/imageUpload.diet")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response) {
		// 이미지 업로드할 경로
		System.out.println("넘어오냐?");
		String uploadPath = "F:/image/upload";
		int size = 10 * 1024 * 1024; // 업로드 사이즈 제한 10M 이하

		String fileName = ""; // 파일명

		try {
			// 파일업로드 및 업로드 후 파일명 가져옴
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8",
					new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			String file = (String) files.nextElement();
			fileName = multi.getFilesystemName(file);

		} catch (Exception e) {
			e.printStackTrace();
		}

		// 업로드된 경로와 파일명을 통해 이미지의 경로를 생성
		uploadPath = "/upload/" + fileName;

		// 생성된 경로를 JSON 형식으로 보내주기 위한 설정
		JSONObject jobj = new JSONObject();
		jobj.put("url", uploadPath);

		response.setContentType("application/json"); // 데이터 타입을 json으로 설정하기 위한 세팅
		try {
			response.getWriter().print(jobj.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}
