package spring.kh.diet.controller;


import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import spring.kh.diet.model.service.MyInfoService;
import spring.kh.diet.model.vo.QuestionVO;

@Controller
public class MyInfoControllerImpl implements MyInfoController {

	@Resource(name = "myInfoService")
	private MyInfoService myInfoService;

	public MyInfoControllerImpl() {
	}

	public void question(@RequestParam String title, @RequestParam String content, HttpServletResponse response)
			throws IOException {
		QuestionVO qv = new QuestionVO(title, content);
		int result = myInfoService.question(qv);
		response.getWriter().print(String.valueOf(result));
		response.getWriter().close();
	}
}
