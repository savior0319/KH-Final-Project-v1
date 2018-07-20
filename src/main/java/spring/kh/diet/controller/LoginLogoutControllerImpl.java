package spring.kh.diet.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.kh.diet.model.service.LoginLogoutService;
import spring.kh.diet.model.vo.MemberVO;

@SuppressWarnings("all")
@Controller
public class LoginLogoutControllerImpl implements LoginLogoutController {

	@Resource(name = "loginService")
	private LoginLogoutService loginService;

	public LoginLogoutControllerImpl() {
	}

	@Override
	@RequestMapping(value = "/loginRequest.diet")
	public String login(HttpServletRequest request, @RequestParam String memberId, @RequestParam String memberPwd) {

		MemberVO mv = new MemberVO();
		mv.setMbId(memberId);
		mv.setMbPwd(memberPwd);
	
		MemberVO m = loginService.login(mv);
		HttpSession session;
		if (m != null) {
			session = request.getSession();
			session.setAttribute("member", m);
			return "redirect:/";
		} else {
			System.out.println("로그인 실패");
			return "login/login";
		}
	}
	
	/* 카카오톡 로그인 */
	@Override
	@RequestMapping(value="/kakaoCallback.diet")
	public void kakaoLogin(@RequestParam String kakaoId,@RequestParam Object kakaoToken) {
		System.out.println(kakaoId);
		System.out.println(kakaoToken);
		MemberVO m = new MemberVO();
		m.setMbId(kakaoId);
		int result  = loginService.joinKaKao(m);
	
	}
	
	
	@Override
	@RequestMapping(value = "/logout.diet")
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession();
		if (session.getAttribute("member") != null) {
			session.invalidate();
		}
		return "redirect:/";
	}

	/* 비밀번호 재설정 */
	@Override
	@RequestMapping(value = "/updatePassword.diet")
	public void updatePassword(@RequestParam String mbId, @RequestParam String mbPwd, HttpServletResponse response)
			throws IOException {
		MemberVO mv = new MemberVO();
		mv.setMbId(mbId);
		mv.setMbPwd(mbPwd);
		int result = loginService.updatePassword(mv);
		
		ModelAndView view = new ModelAndView();
		response.getWriter().print(String.valueOf(result));
		response.getWriter().close();
	}



}
