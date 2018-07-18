package spring.kh.diet.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.kh.diet.model.service.CommunityService;


@Controller
public class CommunityControllerImpl  implements CommunityController{

	@Resource(name = "communityService")
	private CommunityService communityService;

	public CommunityControllerImpl() {
		
	}
	
	
	@Override
	@RequestMapping(value="/communityWholeBoard.diet")
	public Object allCommunityList(HttpSession session) {
		List list = communityService.allCommunityList();
		ModelAndView view = new ModelAndView();
		if(!list.isEmpty()) {
			view.addObject("list",list);
			view.setViewName("community/communityWholeBoard");
			return view;
		}else {
		return null;
		}
		
	}
	

	@Override
	@RequestMapping(value="/beforeAfterBoard.diet")
	public Object beforeAfterList(HttpSession session) {
		List list = communityService.beforeAfterList();
		ModelAndView view = new ModelAndView();
		if(!list.isEmpty()) {
			view.addObject("list",list);
			view.setViewName("community/beforeAfterBoard");
			return view;
		}else {
		return null;
		}
		
	}
	
	
	
	
	
	
	@Override
	@RequestMapping(value="/postedCommunity.diet")
	public Object postedCommunity(HttpSession session) {
		List list = communityService.allCommunityList();
		ModelAndView view = new ModelAndView();
		if(!list.isEmpty()) {
			view.addObject("list",list);
			view.setViewName("community/postedCommunity");
			return view;
		}else {
		return null;
		}
		
	}
	
}
