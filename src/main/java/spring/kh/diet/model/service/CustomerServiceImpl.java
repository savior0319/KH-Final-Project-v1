package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.CustomerDAO;
import spring.kh.diet.model.vo.NoticePDVO;
import spring.kh.diet.model.vo.NoticeVO;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private SqlSessionTemplate session;

	@Resource(name = "customerDAO")
	private CustomerDAO cDao;

	public CustomerServiceImpl() {
	}

	/* 공지사항 페이징 */
	@Override
	public NoticePDVO getNoticeList(int currentPage) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		NoticePDVO nPd = new NoticePDVO();

		ArrayList<NoticeVO> list = cDao.getNoticeList(session, currentPage, recordCountPerPage);

		String pageNavi = cDao.getNoticePageNavi(session, currentPage, recordCountPerPage, naviCountPerPage);

		nPd.setNoList(list);
		nPd.setPageNavi(pageNavi);

		return nPd;
	}

	/* 공지사항 선택된 글 가져오기 */
	@Override
	public NoticeVO noticeContent(HttpSession sessionCheck, int index, HttpServletResponse response,
			HttpServletRequest request) {
		NoticeVO nVo = cDao.noticeContent(sessionCheck, session, index, response, request);
		return nVo;
	}

}
