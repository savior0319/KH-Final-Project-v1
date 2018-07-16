package spring.kh.diet.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class LogoutControllerImpe implements LogoutController {

	public LogoutControllerImpe() {
	}

	@Override
	@RequestMapping(value = "/logout.diet")
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession();
		if(session.getAttribute("member") != null)
		{
			session.invalidate();
		}
		return "redirect:/index.jsp";
	}
}
