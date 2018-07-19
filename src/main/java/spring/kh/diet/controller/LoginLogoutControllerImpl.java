package spring.kh.diet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.kh.diet.model.service.LoginService;
import spring.kh.diet.model.vo.MemberVO;

@Controller
public class LoginLogoutControllerImpl implements LoginLogoutController {

	@Resource(name = "loginService")
	private LoginService loginService;

	public LoginLogoutControllerImpl() {
	}

	@Override
	@RequestMapping(value = "/loginRequest.diet")
	public String login(HttpServletRequest request,@RequestParam String memberId, @RequestParam String memberPwd) {

		MemberVO mv = new MemberVO();
		mv.setMbId(memberId);
		mv.setMbPwd(memberPwd);

		MemberVO m = loginService.login(mv);
		
		HttpSession session ;
		
		if (m != null) {
			session = request.getSession();
			session.setAttribute("member", m);
			return "redirect:/";
		}else {
			System.out.println("로그인 실패");
			return "login/login";
		}
	}
	
	@Override
	@RequestMapping(value = "/logout.diet")
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession();
		if(session.getAttribute("member") != null)
		{
			session.invalidate();
		}
		return "redirect:/";
	}
	
	/* 비밀번호 재설정 */ 
	@Override
	@RequestMapping(value="/updatePassword.diet")
	public Object updatePassword(@RequestParam String mbId, @RequestParam String mbPwd) {
		MemberVO mv = new MemberVO();
		mv.setMbId(mbId);
		mv.setMbPwd(mbPwd);
		int result = loginService.updatePassword(mv);
		if (result>0) {
		
		}else {
		
		}
		return mv;
	}
	
	/* 아이디 찾기   - 할지 안할지 몰라요 */
	@Override
	@RequestMapping(value="/findId.diet")
	public Object findId(HttpSession session,@RequestParam String mbName, @RequestParam String mbPhone) {
		MemberVO mv = new MemberVO();
		mv.setMbPhone(mbPhone);
		mv.setMbName(mbName);
		MemberVO mv2 = loginService.findId(mv);
		String mbId = mv2.getMbId();
		ModelAndView view = new ModelAndView();
		if (mbId!=null) {
			view.addObject("mbId",mbId);
			view.setViewName("login/login");
			return view;
		}else {
			System.out.println("일치하는 ID값이 없음");
			return null;
		}
	}
	
}
