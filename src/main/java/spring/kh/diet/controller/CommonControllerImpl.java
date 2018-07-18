package spring.kh.diet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import spring.kh.diet.model.service.CommonService;

@Controller
public class CommonControllerImpl implements CommonController{
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	public CommonControllerImpl() {}
	

	@ResponseBody
	@PostMapping("/imageUpload.diet")
	public ResponseEntity<?> handleFileUpload(@RequestParam("file") MultipartFile file) {

		try {
			System.out.println("호출");
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
	@RequestMapping(value="/getComment.diet")
	public String getComment(HttpServletRequest request) {
		
		return null;
	}



}
