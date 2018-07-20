package spring.kh.diet.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;

import spring.kh.diet.common.MyFileRenamePolicy;
import spring.kh.diet.model.vo.MemberVO;


@Controller
public class ImageUploadControllerImpl {

	@Autowired
	ServletContext context; 
	
	@RequestMapping(value = "/imageUpload1.diet")
	@ResponseBody
	public String imageUpload(HttpServletRequest request) throws IllegalStateException,IOException {
		// 이미지 업로드할 경로
/*		System.out.println("넘어오냐?");
		
		HttpSession session = request.getSession(false);
		// 1. 사용자 계정 인덱스
		int mbIndex = ((MemberVO)session.getAttribute("member")).getMbIndex();
		
		// 2. 최대 업로드 파일 사이즈 (설정)
		int pfiFileSize = 1024*1024*5; // Byte 단위 5MB
		
		// 3. 업로드 될 경로

		String pfiPath = context.getRealPath("/")+"uploadfile";
		
		// 4. 인코딩 타입(파일 인코딩 타입)
		String encType="UTF-8";
		
		// 5. MultipartRequest 객체 생성
		MultipartRequest multi = new MultipartRequest(request,pfiPath,pfiFileSize,encType,new MyFileRenamePolicy());
		*/
		/*
		Map<String,Object> map = new HashMap<>();
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
		if(multipartResolver.isMultipart(request))
		{
			MultipartHttpServletRequest mreq = (MultipartHttpServletRequest) request;
			Iterator<String> fileNamesIter = mreq.getFileNames();
			while(fileNamesIter.hasNext()) {
				MultipartFile file = mreq.getFile(fileNamesIter.next());
				if(file != null) {
					String myFileName = file.getOriginalFilename();
					System.out.println("myFileName : " + myFileName);
					if(myFileName.trim() != "") {
						String fileName = file.getOriginalFilename();
						System.out.println("fileName : " + fileName);
						String fileBaseName = fileName.substring(0, fileName.lastIndexOf("."));
						System.out.println("fileBaseName : " + fileBaseName);
						String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
						System.out.println("fileExt : " + fileExt);
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
						
						String newFileName = sdf.format(new Date());
						System.out.println("newFileName : " + newFileName);
						String fileNames = newFileName + new Random().nextInt(1000) + "." + fileExt;
						System.out.println("fileNames : " + fileNames);
						String filePath = "\\resources\\imageUpload\\" + fileNames;
						System.out.println("filePath : " + filePath);
						File localFile = new File(filePath);
						
						if(!localFile.exists()) {
							localFile.mkdirs();
						}
						file.transferTo(localFile);
						fileName="http://localhost/asd/upload"+fileNames;
						map.put("name", fileBaseName);
						map.put("path", filePath);
						System.out.println(fileName);
						JSONObject JSON = new JSONObject();
						System.out.println(JSON.toJSONString(map));
						return JSON.toJSONString(map);
					}
				}
			}
		}*/
		
		return "";
		/*String uploadPath = "F:/image/upload";
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
*/
	}
}
