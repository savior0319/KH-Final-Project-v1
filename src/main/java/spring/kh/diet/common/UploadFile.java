package spring.kh.diet.common;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class UploadFile {
	public UploadFile store(MultipartFile file) throws Exception {
		try {
			if (file.isEmpty()) {
				throw new Exception("파일업로드 :  " + file.getOriginalFilename());
			}

			/*
			 * String saveFileName = UploadFileUtils.fileSave(rootLocation.toString(),
			 * file);
			 * 
			 * if (saveFileName.toCharArray()[0] == '/') { saveFileName =
			 * saveFileName.substring(1); }
			 * 
			 * Resource resource = loadAsResource(saveFileName);
			 * 
			 * UploadFile saveFile = new UploadFile();
			 * saveFile.setSaveFileName(saveFileName);
			 * saveFile.setFileName(file.getOriginalFilename());
			 * saveFile.setContentType(file.getContentType());
			 * saveFile.setFilePath(rootLocation.toString() + File.separator +
			 * saveFileName); saveFile.setSize(resource.contentLength());
			 * saveFile.setRegDate(new Date()); saveFile = fileRepository.save(saveFile);
			 */
			return null;
		} catch (IOException e) {
			throw new Exception("파일업로드 :  " + file.getOriginalFilename(), e);
		}
	}

}
