package spring.kh.diet.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;

import spring.kh.diet.model.service.MyInfoService;
import spring.kh.diet.model.vo.BoardBookMarkVO;
import spring.kh.diet.model.vo.BoardCommentVO;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.MyActivityVO;
import spring.kh.diet.model.vo.MyBookMarkPageDataVO;
import spring.kh.diet.model.vo.MyCommentPageDataVO;
import spring.kh.diet.model.vo.MyPostPageDataVO;
import spring.kh.diet.model.vo.MyQuestionPageDataVO;
import spring.kh.diet.model.vo.QuestionVO;

@SuppressWarnings("all")
@Controller
public class MyInfoControllerImpl implements MyInfoController {

	@Resource(name = "myInfoService")
	private MyInfoService myInfoService;

	public MyInfoControllerImpl() {
	}

	/* 나의 북마크 삭제 */
	@Override
	@RequestMapping(value = "deleteMyBookMark.diet")
	public void deleteMyBookMark(HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws IOException {
		MemberVO mv = (MemberVO) session.getAttribute("member");
		BoardBookMarkVO pv = new BoardBookMarkVO();

		String[] arr = request.getParameterValues("bmkIndex");
		int[] arr2 = new int[arr.length];

		pv.setMbIndex(mv.getMbIndex());

		int result = 0;
		for (int i = 0; i < arr.length; i++) {
			arr2[i] = Integer.parseInt(arr[i]);
			pv.setBmkIndex(arr2[i]);
			result = myInfoService.deleteMyBookMark(pv);

		}

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(arr2, response.getWriter());

	}

	/* 나의 게시물 삭제 */
	@Override
	@RequestMapping(value = "deleteMyPost.diet")
	public void deleteMyPost(HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws IOException {
		MemberVO mv = (MemberVO) session.getAttribute("member");
		BoardPostVO pv = new BoardPostVO();

		String[] arr = request.getParameterValues("postIndex");
		int[] arr2 = new int[arr.length];

		pv.setMbIndex(mv.getMbIndex());

		int result = 0;
		for (int i = 0; i < arr.length; i++) {
			arr2[i] = Integer.parseInt(arr[i]);
			pv.setPostIndex(arr2[i]);
			result = myInfoService.deleteMyPost(pv);

		}
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(arr2, response.getWriter());
		;
	}

	/* 나의 댓글 삭제 */
	@Override
	@RequestMapping(value = "deleteMyComment.diet")
	public void deleteMyComment(HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws IOException {
		MemberVO mv = (MemberVO) session.getAttribute("member");
		BoardCommentVO pv = new BoardCommentVO();

		String[] arr = request.getParameterValues("cmtIndex");
		int[] arr2 = new int[arr.length];

		pv.setMbIndex(mv.getMbIndex());

		int result = 0;
		for (int i = 0; i < arr.length; i++) {
			arr2[i] = Integer.parseInt(arr[i]);
			pv.setCmtIndex(arr2[i]);
			result = myInfoService.deleteMyComment(pv);

		}
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(arr2, response.getWriter());
		;
	}

	/* 1:1 질문 삭제 */
	@Override
	@RequestMapping(value = "/deleteMyQuestion.diet")
	public void deleteMyQuestion(HttpServletResponse response, HttpServletRequest request, HttpSession session)
			throws IOException {
		MemberVO mv = (MemberVO) session.getAttribute("member");
		QuestionVO pv = new QuestionVO();

		String[] arr = request.getParameterValues("qsIndex");
		int[] arr2 = new int[arr.length];

		pv.setMbIndex(mv.getMbIndex());

		int result = 0;
		for (int i = 0; i < arr.length; i++) {
			arr2[i] = Integer.parseInt(arr[i]);
			pv.setQsIndex(arr2[i]);
			result = myInfoService.deleteMyQuestion(pv);

		}
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(arr2, response.getWriter());
		;
	}

	/* 1:1질문 */

	@Override
	@RequestMapping(value = "/question.diet")
	public void question(@RequestParam String title, @RequestParam String content, @RequestParam String mbIndex,
			HttpServletResponse response) throws IOException {
		QuestionVO qv = new QuestionVO();
		qv.setQsContent(content);
		qv.setQsTitle(title);
		qv.setQsAnswerCheck("n");
		qv.setMbIndex(Integer.parseInt(mbIndex));

		int result = myInfoService.question(qv);
		response.getWriter().print(String.valueOf(result));
		response.getWriter().close();
	}

	/* 1:1 문의 관리자 답변 */
	@Override
	@RequestMapping(value = "/questionAnswer.diet")
	public void questionAnswer(HttpSession session, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		MemberVO mv = (MemberVO) session.getAttribute("member");
		int qsIndex = Integer.parseInt(request.getParameter("qsIndex"));

		QuestionVO qv = new QuestionVO();
		qv.setMbIndex(mv.getMbIndex());
		qv.setQsIndex(qsIndex);
		QuestionVO answer = myInfoService.questionAnswer(qv);

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(answer, response.getWriter());

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

	public void updateMyPicture(HttpSession session, HttpServletResponse response, HttpServletRequest request,
			@RequestParam MultipartFile uploadFile) throws IOException {
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
		String reName2 = "/imageUpload/" + reName;
		MemberVO mv = (MemberVO) session.getAttribute("member");
		mv.setMbImage(reName2);

		int result = myInfoService.updateMyPicture(mv);
		if (result > 0) {
			response.sendRedirect("/myInfo.diet");
		} else {
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
			MemberVO mv = (MemberVO) session.getAttribute("member");
			int result = myInfoService.deleteMyPicture(mv);
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
		int loginCount = myInfoService.myLoginCount(m);
		ModelAndView view = new ModelAndView();
		if (ma != null) {
			view.addObject("ma", ma);
			view.addObject("loginCount", loginCount);
			view.setViewName("myInfo/myActivityInfo");
			return view;
		} else {
			view.addObject("ma", ma);
			view.addObject("loginCount", loginCount);
			view.setViewName("myInfo/myActivityInfo");
			return view;
		}
	}

	/* 마이페이지 - 내가 작성한 게시물 */
	@Override
	@RequestMapping(value = "/myPost.diet")
	public String myActivityGetList(HttpSession session, HttpServletResponse response, HttpServletRequest request,
			MyActivityVO ma) throws JsonIOException, IOException {
		String type = request.getParameter("type");

		int currentPage; // 현재 페이지 값을 저장하는 변수
		MemberVO m = (MemberVO) session.getAttribute("member");
		ma.setMbIndex(m.getMbIndex());
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		MyPostPageDataVO myPost = myInfoService.myPostList(currentPage, type, ma);
		request.setAttribute("myPost", myPost);

		return "myInfo/myPost";

	}

	/* 마이페이지 - 내가 작성한 댓글 */

	@Override
	@RequestMapping(value = "/myComment.diet")
	public String myCommentGetList(HttpSession session, HttpServletRequest request, MyActivityVO ma) {
		String type = request.getParameter("type");
		int currentPage; // 현재 페이지 값을 저장하는 변수
		MemberVO m = (MemberVO) session.getAttribute("member");
		ma.setMbIndex(m.getMbIndex());

		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		MyCommentPageDataVO myComment = myInfoService.myCommentList(currentPage, type, ma);
		request.setAttribute("myComment", myComment);
		return "myInfo/myComment";

	}

	/* 마이페이지 - 내 북마크 */

	@Override
	@RequestMapping(value = "/myBookMark.diet")
	public String myBookMarkGetList(HttpSession session, HttpServletRequest request, MyActivityVO ma) {
		String type = request.getParameter("type");
		int currentPage; // 현재 페이지 값을 저장하는 변수
		MemberVO m = (MemberVO) session.getAttribute("member");
		ma.setMbIndex(m.getMbIndex());

		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		MyBookMarkPageDataVO myBookMark = myInfoService.myBookMarkList(currentPage, type, ma);
		for (int i = 0; i < myBookMark.getComList().size(); i++) {
			System.out.println(myBookMark.getComList().get(i));
		}

		request.setAttribute("myBookMark", myBookMark);
		return "myInfo/myBookMark";

	}

	/* 마이페이지 - 일대일 문의 */
	@Override
	@RequestMapping(value = "/allMyOneToOneQuestion.diet")
	public Object allMyOneToOneQuestion(HttpSession session, HttpServletRequest request) {
		MemberVO mv = (MemberVO) session.getAttribute("member");
		int currentPage; // 현재 페이지 값을 저장하는 변수
		if (request.getParameter("currentPage") == null) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		MyQuestionPageDataVO myQuestion = myInfoService.allMyOneToOneQuestion(currentPage, mv);
		request.setAttribute("myQuestion", myQuestion);
		return "myInfo/myOneToOneQuestion";

	}

	/* 블랙리스트 확인 */
	@Override
	@ResponseBody
	@RequestMapping(value = "/checkReport.diet")
	public String checkReport(MemberVO mbId) {
		MemberVO mv = myInfoService.selectOneMember(mbId);

		if (mv != null) {
			String result = mv.getMbReport();
			return result;
		} else {
			return "error";
		}
	}
}
