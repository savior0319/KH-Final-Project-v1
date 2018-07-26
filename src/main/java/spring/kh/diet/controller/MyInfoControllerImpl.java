package spring.kh.diet.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.kh.diet.model.service.MyInfoService;
import spring.kh.diet.model.vo.BMIVO;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.MyActivityPageDataVO;
import spring.kh.diet.model.vo.MyActivityVO;
import spring.kh.diet.model.vo.QuestionVO;

@SuppressWarnings("all")
@Controller
public class MyInfoControllerImpl implements MyInfoController {
  
	@Resource(name = "myInfoService")
	private MyInfoService myInfoService;

	public MyInfoControllerImpl() {
	}
	
	/* 나의 게시물  */
	@Override
	@RequestMapping(value="/myPost.diet")
	public Object myPost(HttpSession session) {
		MemberVO mv = (MemberVO) session.getAttribute("member"); 
		ArrayList<BoardPostVO> list= myInfoService.myPost(mv);
		ModelAndView view = new ModelAndView();

		if (!list.isEmpty()) {
			view.addObject("list", list);
			view.addObject("test","Test");
			view.setViewName("myInfo/myActivityInfo");
			return view;
		} else {
			System.out.println("list값이 없음");
			view.addObject("list", list);
			view.setViewName("myInfo/myActivityInfo");			
			return view;
		}
	}
	/* 1:1질문 */
	@Override
	@RequestMapping(value = "/question.diet")
	public void question(@RequestParam String title, @RequestParam String content, @RequestParam String mbIndex ,HttpServletResponse response)
			throws IOException {
		QuestionVO qv = new QuestionVO();
		qv.setQsContent(content);
		qv.setQsTitle(title);
		qv.setQsAnswerCheck("n");
		qv.setMbIndex(Integer.parseInt(mbIndex));

		int result = myInfoService.question(qv);
		response.getWriter().print(String.valueOf(result));
		response.getWriter().close();
	}

	/* 회원탈퇴 */
	@Override
	@RequestMapping(value = "/secessionMember.diet")
	public void secessionMember(HttpSession session, HttpServletResponse response) throws IOException {
		if (session.getAttribute("member") != null) {
			MemberVO mv = (MemberVO) session.getAttribute("member");
			int result = myInfoService.secessionMember(mv);
			if (result > 0) {
				session.invalidate(); // 세션파기
			}
			response.getWriter().print(String.valueOf(result));
			response.getWriter().close();
		} else {
			System.out.println("로그인 되어 있지 않습니다.");
		}
	}

	/* 회원 프로필 사진 변경 */
	@Override
	@RequestMapping(value = "/updateMyPicture.diet", method = RequestMethod.POST)

	public void updateMyPicture(HttpSession session, HttpServletResponse response,HttpServletRequest request, @RequestParam MultipartFile uploadFile)
			throws IOException {
		String path = request.getSession().getServletContext().getRealPath("imageUpload");
		// 이름 짓기
		UUID randomString = UUID.randomUUID();			
		String getFile = uploadFile.getOriginalFilename();
		int index = getFile.lastIndexOf(".");
		String name = getFile.substring(0, index);
		String ext = getFile.substring(index, getFile.length());
		String reName = name + "_" + randomString + ext;
		
		System.out.println(uploadFile);
		
		// 실제 폴더에 저장 
		File reFile = new File(path, reName);
		uploadFile.transferTo(reFile);
		
		// imageUpload폴더 이름 붙여서 경로 이름 짓기
		String reName2 = "/imageUpload/"+reName;
		System.out.println(reName2);
		MemberVO mv = (MemberVO) session.getAttribute("member");
		mv.setMbImage(reName2);
		
		int result = myInfoService.updateMyPicture(mv);
		if(result>0) {
			response.sendRedirect("/myInfo.diet");
		}else {
			System.out.println("이미지 업로드 실패");
			response.sendRedirect("/myInfo.diet");
		}
		
	}


	/* 회원 정보 변경 */
	@Override
	@RequestMapping(value = "/updateMyInfo.diet")
	public String updateMyInfo(MemberVO memberVO, HttpSession session, HttpServletResponse response)
			throws IOException {
		if (session.getAttribute("member") != null) {

			int heightD = memberVO.getMbHeight();
			int weightD = memberVO.getMbWeight();

			double weightConvertDouble = (double) weightD;
			double heightConvertMeter = (double) heightD / (double) 100;

			double resultBMI = weightConvertDouble / (heightConvertMeter * heightConvertMeter);
			
			String bmiStrRs = String.valueOf(Math.round(resultBMI * 10) / 10.0);
			
			memberVO.setMbBmi(bmiStrRs);
			System.out.println(memberVO.getMbBmi());
			int result = myInfoService.updateMyInfo(memberVO);
			
			if (result > 0) {
				MemberVO member = myInfoService.selectOneMember(memberVO);
				session.setAttribute("member", member); // 업데이트 된 내용을 담은 객체를 리턴함
				return "myInfo/myInfoUpdate";
			} else {
				return "redirect:/";
			}
		} else {
			System.out.println("로그인 후 이용해주세요");
			return "redirect:/";
		}

	}

	/* 회원 프로필 사진 삭제 */
	@Override
	@RequestMapping(value = "/deleteMyPicture.diet")
	public String deleteMyPicture(@RequestParam String mbId, HttpSession session, HttpServletResponse response)
			throws IOException {
		if (session.getAttribute("member") != null) {
			int result = myInfoService.deleteMyPicture(mbId);
			MemberVO mv = (MemberVO) session.getAttribute("member");
			mv.setMbId(mbId);
			if (result > 0) {
				MemberVO member = myInfoService.selectOneMember(mv);
				session.setAttribute("member", member); // 업데이트 된 내용을 담은 객체를 리턴함
				return "myInfo/myInfoUpdate";
			} else {
				return "redirect:/";
			}
		} else {
			System.out.println("로그인 되어 있지 않습니다.");
			return "redirect:/";
		}
	}

	/* 일대일 문의 */
	@Override
	@RequestMapping(value = "/allMyOneToOneQuestion.diet")
	public Object allMyOneToOneQuestion(HttpSession session) {
		MemberVO mv = (MemberVO) session.getAttribute("member");
		ArrayList<QuestionVO> list = myInfoService.allMyOneToOneQuestion(mv);
		ModelAndView view = new ModelAndView();

		if (!list.isEmpty()) {
			view.addObject("list", list);
			view.setViewName("myInfo/myOneToOneQuestion");
			return view;
		} else {
			System.out.println("list값이 없음");
			return view;
		}

	}

	/* 회원 가입 */
	@Override
	@RequestMapping(value = "/signupsave.diet")
	public String signupsave(@RequestParam String mbId, @RequestParam String mbNickName, @RequestParam String mbPwd,
			@RequestParam String[] gender, @RequestParam String[] interest) {

		String interestStr = "";

		MemberVO mv = new MemberVO();
		mv.setMbId(mbId);
		mv.setMbPwd(mbPwd);
		mv.setMbNickName(mbNickName);
		mv.setMbGender(gender[0]);

		for (int i = 0; i < interest.length; i++) {
			interestStr = interestStr + interest[i] + ",";
		}

		StringBuilder sb = new StringBuilder(interestStr);
		interestStr = sb.substring(0, sb.length() - 1);

		mv.setMbInterest(interestStr);

		int result = myInfoService.signupsave(mv);

		return "redirect:/";
	}

	/* 아이디 중복 체크 */
	@Override
	@RequestMapping(value = "/idCheck.diet")
	public void idCheck(@RequestParam String id, HttpServletResponse response) throws IOException {
		int result = myInfoService.idCheck(id);
		response.getWriter().print(String.valueOf(result));
		response.getWriter().close();
	}

	/* 닉네임 중복 체크 */
	@Override
	@RequestMapping(value = "/nickNameCheck.diet")
	public void nickNameCheck(@RequestParam String nickName, HttpServletResponse response) throws IOException {
		int result = myInfoService.nickNameCheck(nickName);
		response.getWriter().print(String.valueOf(result));
		response.getWriter().close();
	}

	/* 내 활동 정보 */
	@Override
	@RequestMapping(value = "/myActivityInfo.diet")
	public Object myActivity(HttpServletResponse response, HttpSession session, HttpServletRequest request) {
		MemberVO m = (MemberVO) session.getAttribute("member");
		MyActivityVO ma = myInfoService.myActivity(m);
		ModelAndView view = new ModelAndView();

		if (ma != null) {
			view.addObject("ma", ma);
			MyActivityPageDataVO cpdv = this.myActivityGetList(session, request, ma);
			view.setViewName("myInfo/myActivityInfo");
			return view;
		} else {
			System.out.println("ma값이 없음");
			view.addObject("ma", ma);
			MyActivityPageDataVO cpdv = this.myActivityGetList(session, request, ma);
			view.setViewName("myInfo/myActivityInfo");
			return view;
		}
	}

	/* 내 활동 정보 게시판 */
	@Override
	public MyActivityPageDataVO myActivityGetList(HttpSession session, HttpServletRequest request, MyActivityVO ma) {
		String type = request.getParameter("type");

		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			// 즉, 첫 페이만 1로 세팅하고 그외 페이지라면 해당 페이지 값을 가져옴
		}
		MyActivityPageDataVO cpdv = myInfoService.allCommunityList(currentPage, type, ma);
		System.out.println(cpdv.getComList().get(0).getPostTitle());
		request.setAttribute("cpdv", cpdv);

		return cpdv;
	}
}
