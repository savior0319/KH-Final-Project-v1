package spring.kh.diet.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.kh.diet.model.vo.PostFileVO;

@Controller
public class ImageUploadControllerImpl {


	@Autowired
	ServletContext context; 
	
	@RequestMapping(value = "/imageUpload1.diet")
	@ResponseBody
	public String imageUpload(HttpServletRequest request, MultipartHttpServletRequest multi) throws IllegalStateException,IOException {
		// 이미지 업로드할 경로
		String path = "C:\\Users\\user1\\git\\YamNyaMing\\YamNyaMing\\src\\main\\webapp\\resources\\memberPhoto\\";

	      String remakeName = "";
	      String reviewImgList="";
	      List<MultipartFile> files = multi.getFiles("reviewImgList");
	      File file = new File(path);
	      return null;
/*
	      for (int i = 0; i < files.size(); i++) {
	               remakeName=System.currentTimeMillis()+"_"+files.get(i).getOriginalFilename();
	                file = new File(path+remakeName);
	                files.get(i).transferTo(file);
	                String OriginName=files.get(i).getOriginalFilename();
	                String photoRoute=path+remakeName;
	                String photoViewRoute="\\memberPhoto\\"+remakeName;
	                 PostFileVO pfvo=new PostFileVO();
	               pfvo.setPfiOriginName(OriginName);
	               pfvo.setPfiFileName(remakeName);
	               pfvo.setPfiPath(photoRoute);
	               ymup.setPhotoViewRoute(photoViewRoute);
	               
	               int result=ynmMemberServiceImpl.reviewUploadPhoto(ymup);
	               YNMMemberUploadPhoto ymupIndex=ynmMemberServiceImpl.reviewIndexSelect(remakeName);
	            
	               if(i<files.size()-1) reviewImgList+=ymupIndex.getUploadPhotoNo()+",";
	               else reviewImgList+=ymupIndex.getUploadPhotoNo();
	                
	            } */
	      
	      
	    /*  YNMStoreReview ysr=new YNMStoreReview();
	      
	      ysr.setMemberEntireNo(((YNMMember)session.getAttribute("member")).getMemberEntireNo());
	      ysr.setReviewContent(request.getParameter("reviewContent"));
	      ysr.setReviewTitle(request.getParameter("reviewTitle"));
	      ysr.setOwnerEntireNo(Integer.parseInt(request.getParameter("ownerStoreEntireNo")));
	      ysr.setReviewStar(request.getParameter("reviewStar"));
	      ysr.setReviewImgList(reviewImgList);
	      */
/*	      
	     
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

//	@RequestMapping(value = "/imageUpload1.diet")
//	@ResponseBody
/*	public String imageUpload(HttpServletRequest request) throws IllegalStateException,IOException {
		// 이미지 업로드할 경로
		System.out.println("넘어오냐?");
		Map<String,Object> map = new HashMap<?>();

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
}
