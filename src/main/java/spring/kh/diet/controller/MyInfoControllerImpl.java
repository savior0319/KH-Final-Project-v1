package spring.kh.diet.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.kh.diet.model.service.MyInfoService;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.ProductVO;
import spring.kh.diet.model.vo.QuestionVO;

@Controller
public class MyInfoControllerImpl implements MyInfoController {

	@Resource(name = "myInfoService")
	private MyInfoService myInfoService;

	public MyInfoControllerImpl() {
	}

	@Override
	@RequestMapping(value = "/question.diet")
	public void question(@RequestParam String title, @RequestParam String content, HttpServletResponse response)
			throws IOException {
		QuestionVO qv = new QuestionVO();

		qv.setContent(content);
		qv.setTitle(title);
		int result = myInfoService.question(qv);
		response.getWriter().print(String.valueOf(result));
		response.getWriter().close();
	}

	/* 회원탈퇴 */
	@Override
	@RequestMapping(value = "/secessionMember.diet")
	public void secessionMember(HttpSession session, HttpServletResponse response) throws IOException {
		if (session.getAttribute("member") != null) {
			MemberVO mv = (MemberVO) session.getAttribute("member");
			int result = myInfoService.secessionMember(mv);
			if (result > 0) {
				session.invalidate(); // 세션파기
			}
			response.getWriter().print(String.valueOf(result));
			response.getWriter().close();
		} else {
			System.out.println("로그인 되어 있지 않습니다.");
		}
	}

	/* 회원 프로필 사진 변경 */
	@Override
	@RequestMapping(value = "/updateMyPicture.diet")
	public String updateMyPicture(HttpSession session, HttpServletResponse response, @RequestParam String formData)
			throws IOException {
		if (session.getAttribute("member") != null) {
			MemberVO mv = (MemberVO) session.getAttribute("member");

			int result = myInfoService.updateMyPicture(mv);
			if (result > 0) {
				MemberVO member = myInfoService.selectOneMember(mv);
				session.setAttribute("member", member); // 업데이트 된 내용을 담은 객체를 리턴함
				return "myInfo/myInfoUpdate";
			} else {
				return "redirect:/";
			}
		} else {
			System.out.println("로그인 되어 있지 않습니다.");
			return "redirect:/";
		}

	}

	/* 회원 정보 변경 */
	@Override
	@RequestMapping(value = "/updateMyInfo.diet")
	public String updateMyInfo(MemberVO memberVO, HttpSession session, HttpServletResponse response)
			throws IOException {
		if (session.getAttribute("member") != null) {
			int result = myInfoService.updateMyInfo(memberVO);
			if (result > 0) {
				MemberVO member = myInfoService.selectOneMember(memberVO);
				session.setAttribute("member", member); // 업데이트 된 내용을 담은 객체를 리턴함
				return "myInfo/myInfoUpdate";
			} else {
				return "redirect:/";
			}
		} else {
			System.out.println("로그인 후 이용해주세요");
			return "redirect:/";
		}

	}

	/* 회원 프로필 사진 삭제 */
	@Override
	@RequestMapping(value = "/deleteMyPicture.diet")
	public String deleteMyPicture(@RequestParam String mbId, HttpSession session, HttpServletResponse response)
			throws IOException {
		if (session.getAttribute("member") != null) {
			int result = myInfoService.deleteMyPicture(mbId);
			MemberVO mv = (MemberVO) session.getAttribute("member");
			mv.setMbId(mbId);
			if (result > 0) {
				MemberVO member = myInfoService.selectOneMember(mv);
				session.setAttribute("member", member); // 업데이트 된 내용을 담은 객체를 리턴함
				return "myInfo/myInfoUpdate";
			} else {
				return "redirect:/";
			}
		} else {
			System.out.println("로그인 되어 있지 않습니다.");
			return "redirect:/";
		}
	}

	/* 일대일 문의 */
	@Override
	@RequestMapping(value = "/allMyOneToOneQuestion.diet")
	public Object allMyOneToOneQuestion(HttpSession session) {
		MemberVO mv = (MemberVO) session.getAttribute("member");
		ArrayList<QuestionVO> list = myInfoService.allMyOneToOneQuestion(mv);
		ModelAndView view = new ModelAndView();

		if (!list.isEmpty()) {
			view.addObject("list", list);
			view.setViewName("myInfo/myOneToOneQuestion");
			return view;
		} else {
			System.out.println("list값이 없음");
			return view;
		}

	}

	/* 찜한 상품 */
/*	@Override
	@RequestMapping(value = "/myWishList.diet")
	public Object myWishList(HttpSession session) {
		MemberVO mv = (MemberVO) session.getAttribute("member");
		ArrayList<ProductVO> list = myInfoService.myWishList(mv);
		ModelAndView view = new ModelAndView();

		if (!list.isEmpty()) {
			
			view.addObject("list", list);
			view.setViewName("myInfo/myWishList");
			return view;
		} else {
			System.out.println("list값이 없음");
			return view;
		}
	}*/

	/* 회원 가입 */
	@Override
	@RequestMapping(value = "/signupsave.diet")
	public String signupsave(@RequestParam String mbId, @RequestParam String mbNickName, @RequestParam String mbPwd,
			@RequestParam String[] gender, @RequestParam String[] interest) {

		String interestStr = "";

		MemberVO mv = new MemberVO();
		mv.setMbId(mbId);
		mv.setMbPwd(mbPwd);
		mv.setMbNickName(mbNickName);
		mv.setMbGender(gender[0]);

		for (int i = 0; i < interest.length; i++) {
			interestStr = interestStr + interest[i] + ",";
		}

		StringBuilder sb = new StringBuilder(interestStr);
		interestStr = sb.substring(0, sb.length() - 1);

		mv.setMbInterest(interestStr);

		int result = myInfoService.signupsave(mv);

		return "redirect:/";
	}
}
