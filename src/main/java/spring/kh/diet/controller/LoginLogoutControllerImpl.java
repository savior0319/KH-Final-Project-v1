package spring.kh.diet.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
}
