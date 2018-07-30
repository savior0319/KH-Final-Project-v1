package spring.kh.diet.model.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import spring.kh.diet.model.vo.NoticePDVO;
import spring.kh.diet.model.vo.NoticeVO;

public interface CustomerService {

	NoticePDVO getNoticeList(int currentPage);

	NoticeVO noticeContent(HttpSession sessionCheck, int index,
			HttpServletResponse response, HttpServletRequest request);

	void noticeHit(int index);

}
