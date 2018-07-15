package spring.kh.diet.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminControllerImpl implements AdminController {

	@SuppressWarnings("unused")
	private final String redirectMain = "redirect:/";

	public AdminControllerImpl() {
	}

	@Override
	@RequestMapping(value = "/noticeRegisterData.diet")
	public void noticeRegisterData(@RequestParam String title, @RequestParam String content,
			HttpServletResponse response) throws IOException {

		System.out.println("글제목 : " + title);
		System.out.println("글내용 : " + content);

		response.getWriter().print("success");
		response.getWriter().close();

	}

}
