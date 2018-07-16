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
public class LoginControllerImpl implements LoginController {

	@Resource(name = "loginService")
	private LoginService loginService;

	public LoginControllerImpl() {
	}

	@Override
	@RequestMapping(value = "/loginRequest.diet")
	public String login(HttpServletRequest request,@RequestParam String memberId, @RequestParam String memberPwd) {

		System.out.println(memberId);
		System.out.println(memberPwd);

		MemberVO mv = new MemberVO();
		mv.setMemberId(memberId);
		mv.setMemberPwd(memberPwd);

		MemberVO m = loginService.login(mv);
		
		HttpSession session = request.getSession();

		
		if (m != null) {
			session.setAttribute("member", m);
			return "redirect:/index.jsp";
		}else {
			System.out.println("로그인 실패");
			return "login/login";
		}
	}
}
