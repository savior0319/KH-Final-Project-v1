package spring.kh.diet.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class CommonControllerImpl {

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

}
