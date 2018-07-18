package spring.kh.diet.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.kh.diet.model.service.CommunityService;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.MemberVO;


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
	@RequestMapping(value = "/communityPostRegist.diet")
	public void registCommunity(@RequestParam String title, @RequestParam String content,@RequestParam String category,
								HttpSession session,HttpServletResponse response) throws IOException {

		MemberVO mv = (MemberVO)session.getAttribute("member");
		BoardPostVO bpv = new BoardPostVO();
		
		bpv.setPostMbNickName(mv.getMbNickName());
		bpv.setMbIndex(0);

		bpv.setPostTitle(title);
		bpv.setPostContent(content);
		bpv.setBcaName(category);
		
		int result = communityService.registCommunity(bpv);
		
		if(result>0) {
			System.out.println("글등록 완료");
		}else {
			System.out.println("글등록 실패");
		}
		
		response.getWriter().print("success");
		response.getWriter().close();
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
