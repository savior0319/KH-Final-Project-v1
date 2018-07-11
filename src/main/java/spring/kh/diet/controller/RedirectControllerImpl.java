package spring.kh.diet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedirectControllerImpl implements RedirectController {

	public RedirectControllerImpl() {
	}

	@Override
	@RequestMapping(value = "/admin.diet")
	public String RedirectAdminPage() {
		return "admin/admin";
	}

}
