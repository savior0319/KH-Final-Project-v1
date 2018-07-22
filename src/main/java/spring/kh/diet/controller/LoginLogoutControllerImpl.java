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
import spring.kh.diet.model.vo.EmailConfirm;
import spring.kh.diet.model.vo.MemberVO;
import sun.net.www.http.HttpCaptureOutputStream;

@SuppressWarnings("all")
@Controller
public class LoginLogoutControllerImpl implements LoginLogoutController {
	private static String authReturn = "";
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
	
	/* 카카오톡으로 로그인시 임의로 닉네임 부여 */
	int kakaoNickNum = 0;
	public String kakaoNickNum() {
		
		String kakaoNickNameNum = null;
		for (int i = 1; i <= 999999; i++) {
			if (kakaoNickNum < 1000000) {
				kakaoNickNameNum = ""+ kakaoNickNum;
			}
			kakaoNickNum++;
		}	
			MemberVO mv = new MemberVO();
			mv.setMbNickName(kakaoNickNameNum);
			int checkNickNum = loginService.existUserNickNum(mv); // id
			if(checkNickNum>0) {
				return kakaoNickNum();
			}else {
				return "카카오"+kakaoNickNameNum;
			}
		
		}

	/* 카카오톡 로그인 */
	@Override
	@RequestMapping(value = "/kakaoCallback.diet")
	public String kakaoLogin(@RequestParam String kakaoId, @RequestParam Object kakaoToken,
			HttpServletRequest request) {

		MemberVO mv = new MemberVO(); 
		mv.setMbId(kakaoId);
	
		
		HttpSession session;
		
		int checkId = loginService.existUserFindingId(mv); // id
		if (checkId > 0) { // id가 있을 경우
			MemberVO mv2 = loginService.kakaoLoginService(mv);
			if (mv2 != null) {
				session = request.getSession();
				session.setAttribute("member", mv2);
				return "redirect:/index.jsp";
			} else {
				System.out.println("kakao로그인 실패");
				return "login/login";
			}
		} else { // id가 없을 경우
			String setNick =  kakaoNickNum();
			mv.setMbNickName(setNick);
			int result = loginService.joinKaKao(mv);// 카카오톡 처음 로그인시 자동으로 가입처리됨.
			if (result > 0) {// 가입성공하면
				
				MemberVO mv2 = loginService.kakaoLoginService(mv);
				if (mv2 != null) {
					session = request.getSession();
					session.setAttribute("member", mv2);
					return "redirect:/index.jsp";
				} else {
					System.out.println("kakao로그인 실패");
					return "login/login";
				}
			} else {
				System.out.println("카카오톡으로 가입 실패 ");
				return "login/login";
			}
		}

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

	/* 비밀번호 재설정 - 이메일로 임시비밀번호 보내기 */
	@Override
	@RequestMapping(value = "/updatePassword.diet")
	public void updatePassword(@RequestParam String mbId, HttpServletResponse response) throws IOException {
		int result = 0;
		int result2 = 0;
		if (authReturn.length() == 0) {
			authReturn = "";
			MemberVO mv = new MemberVO();
			mv.setMbId(mbId);
			result = loginService.existUserFindingId(mv); // 등록된 이메일이 있는지 확인
			System.out.println("result:" + result);
			if (result > 0) {
				authReturn = new EmailConfirm().connectEmail(mbId);
				result2 = this.updateMypass(authReturn, mbId);
			} else {
				System.out.println("미등록 이메일 주소입니다.");
			}

		}

		ModelAndView view = new ModelAndView();
		response.getWriter().print(String.valueOf(result));
		response.getWriter().close();
	}

	public int updateMypass(String authReturn, String mbId) {
		MemberVO mv = new MemberVO();
		mv.setMbPwd(authReturn);
		mv.setMbId(mbId);
		int result = loginService.updateMypass(mv);
		return result;

	}

	@Override
	public void kakaoLogin(String kakaoId, Object kakaoToken, HttpSession session) {
		// TODO Auto-generated method stub

	}

	@Override
	public void kakaoLogin(String kakaoId, Object kakaoToken) {
		// TODO Auto-generated method stub

	}

}
