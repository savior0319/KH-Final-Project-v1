package spring.kh.diet.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.kh.diet.model.service.MyInfoService;
import spring.kh.diet.model.vo.FileDataVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.QuestionVO;

@Controller
public class MyInfoControllerImpl implements MyInfoController {

	@Resource(name = "myInfoService")
	private MyInfoService myInfoService;

	public MyInfoControllerImpl() {
	}

	@Override
	@RequestMapping(value = "/question.diet")
	public void question(@RequestParam String title, @RequestParam String content, HttpServletResponse response)
			throws IOException {
		QuestionVO qv = new QuestionVO(title, content);
		int result = myInfoService.question(qv);
		response.getWriter().print(String.valueOf(result));
		response.getWriter().close();
	}

	@Override
	@RequestMapping(value = "/secessionMember.diet")
	public void secessionMember(HttpSession session,HttpServletResponse response)
			throws IOException {
		if(session.getAttribute("member")!=null) {
			MemberVO mv = (MemberVO) session.getAttribute("member");
			int result = myInfoService.secessionMember(mv);
			if(result>0) {
				session.invalidate(); // 세션파기
			}
			response.getWriter().print(String.valueOf(result));
			response.getWriter().close();
		}else {
			System.out.println("로그인 되어 있지 않습니다.");
		}
	}
	
	
	/* 회원 프로필 사진 변경 */
	@Override
	@RequestMapping(value = "/updateMyPicture.diet")
	public void updateMyPicture(HttpSession session,
			HttpServletResponse response,@RequestParam String formData)
			throws IOException {
			System.out.println("사진 : "+ formData);
			if(session.getAttribute("member")!=null) {
			MemberVO mv = (MemberVO) session.getAttribute("member");

			int result = myInfoService.updateMyPicture(mv);

			response.getWriter().print(String.valueOf(result));
			response.getWriter().close();
		}else {
			System.out.println("로그인 되어 있지 않습니다.");
		}
	}
	
	/* 회원 정보 변경 */ 
	@Override
	@RequestMapping(value = "/updateMyInfo.diet")
	public String updateMyInfo(MemberVO memberVO, HttpSession session, HttpServletResponse response) throws IOException {
		if(session.getAttribute("member")!=null) {
			int result = myInfoService.updateMyInfo(memberVO);
			if (result > 0) {
				MemberVO mv = myInfoService.selectOneMember(memberVO);
				session.setAttribute("member", mv); // 업데이트 된 내용을 담은 객체를 리턴함
				return "myInfo/myInfoUpdate";
			} else {
				return "member/mUpdateFailed";
			}
		}else {
			System.out.println("로그인 후 이용해주세요");
			return "redirect:/";
		}
	}
}
