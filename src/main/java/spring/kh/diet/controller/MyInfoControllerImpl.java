package spring.kh.diet.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.lookup.MemberTypeBinding;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.kh.diet.model.service.MyInfoService;
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
	
	/* 회원탈퇴 */
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
	public String updateMyPicture(HttpSession session,
			HttpServletResponse response,@RequestParam String formData)
			throws IOException {
			if(session.getAttribute("member")!=null) {
			MemberVO mv = (MemberVO) session.getAttribute("member");

			int result = myInfoService.updateMyPicture(mv);
			if (result > 0) {
				MemberVO member = myInfoService.selectOneMember(mv);
				System.out.println(member.getMbImage());
				session.setAttribute("member", member); // 업데이트 된 내용을 담은 객체를 리턴함
				return "myInfo/myInfoUpdate";
			} else {
				return "redirect:/";
			}
		}else {
			System.out.println("로그인 되어 있지 않습니다.");
			return "redirect:/";
		}
		
		
	}
	
	/* 회원 정보 변경 */ 
	@Override
	@RequestMapping(value = "/updateMyInfo.diet")
	public String updateMyInfo(MemberVO memberVO, HttpSession session, HttpServletResponse response) throws IOException {
		if(session.getAttribute("member")!=null) {
			int result = myInfoService.updateMyInfo(memberVO);
			if (result > 0) {
				MemberVO member = myInfoService.selectOneMember(memberVO);
				session.setAttribute("member", member); // 업데이트 된 내용을 담은 객체를 리턴함
				return "myInfo/myInfoUpdate";
			} else {
				return "redirect:/";
			}
		}else {
			System.out.println("로그인 후 이용해주세요");
			return "redirect:/";
		}
		
	}
	
	/* 회원 프로필 사진 삭제 */
	@Override
	@RequestMapping(value="/deleteMyPicture.diet")
	public String deleteMyPicture(@RequestParam String mbId,HttpSession session, HttpServletResponse response) throws IOException{
		if(session.getAttribute("member")!=null) {
			int result = myInfoService.deleteMyPicture(mbId);
			MemberVO mv = (MemberVO) session.getAttribute("member");
			mv.setMbId(mbId);
			if (result > 0) {
				MemberVO member = myInfoService.selectOneMember(mv);
				System.out.println(member.getMbImage());
				session.setAttribute("member", member); // 업데이트 된 내용을 담은 객체를 리턴함
				return "myInfo/myInfoUpdate";
			} else {
				return "redirect:/";
			}
		}else {
			System.out.println("로그인 되어 있지 않습니다.");
			return "redirect:/";
		}		
	}
	
	/* 일대일 문의  */
	@Override
	@RequestMapping(value="/allMyOneToOneQuestion.diet")
	public Object allMyOneToOneQuestion(HttpSession session) {
		MemberVO mv = (MemberVO) session.getAttribute("member");
		ArrayList<QuestionVO> list = myInfoService.allMyOneToOneQuestion(mv);
/*		ModelAndView view = new ModelAndView();*/
		if (!list.isEmpty()) {
			// 정보를 넘겨주기 위해?! 세션이용 또는 모델이라는 객체를 이용
			// 세션이랑 비슷하다고 생각하면 돼 , 세션은 계속적으로 유지되는 것. Model은 일회용이라고 생각!
			/*view.addObject("list", list);
			view.setViewName("member/allMemberList");
			return view;*/
		}else {
			System.out.println("list값이 없음");
		/*	return view;*/
		}
		return list;
		 
	
	}
}
