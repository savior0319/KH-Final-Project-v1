package spring.kh.diet.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import spring.kh.diet.model.service.CommonService;
import spring.kh.diet.model.vo.BoardCommentVO;
import spring.kh.diet.model.vo.MemberVO;

@Controller
public class CommonControllerImpl implements CommonController {

	@Resource(name = "commonService")
	private CommonService commonService;

	public CommonControllerImpl() {
	}

	@ResponseBody
	@PostMapping("/imageUpload.diet")
	public ResponseEntity<?> handleFileUpload(@RequestParam("file") MultipartFile file) {

		try {
			System.out.println("호출ddddd");
			System.out.println(file.getOriginalFilename());
			/* UploadFile uploadedFile = imageService.store(file); */

			return null;
			/* return ResponseEntity.ok().body("/image/" + uploadedFile.getId()); */
		} catch (Exception e) {
			System.out.println("호출");
			e.printStackTrace();
			return ResponseEntity.badRequest().build();
		}
	}

	@Override
	public void imageUpload() {
		// TODO Auto-generated method stub

	}

	@Override
	@RequestMapping(value = "/addComment.diet")
	public void addComment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();

		// 로그인한 사용자인지 확인
		if (session.getAttribute("member") != null) {
			BoardCommentVO bc = new BoardCommentVO();
			bc.setPostIndex(Integer.parseInt(request.getParameter("indexNo")));
			bc.setCmtContent(request.getParameter("commentContent"));
			bc.setMbIndex(((MemberVO) session.getAttribute("member")).getMbIndex());

			int result = commonService.addComment(bc);

			response.getWriter().print(result);
			response.getWriter().close();
		}
	}

}
