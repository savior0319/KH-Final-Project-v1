package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.NoticePDVO;
import spring.kh.diet.model.vo.NoticeVO;

@Repository("customerDAO")
public class CustomerDAOImpl implements CustomerDAO {

	public CustomerDAOImpl() {
	}

	/* 공지사항 리스트 */
	@Override
	public ArrayList<NoticeVO> getNoticeList(SqlSessionTemplate session, int currentPage, int recordCountPerPage) {
		NoticePDVO nPdvo = new NoticePDVO();

		nPdvo.setStart((currentPage - 1) * recordCountPerPage + 1);
		nPdvo.setEnd(currentPage * recordCountPerPage);

		List<NoticeVO> list = session.selectList("customer.getNoticeList", nPdvo);

		return (ArrayList<NoticeVO>) list;
	}

	/* 공지사항 네비게이션 */
	@Override
	public String getNoticePageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage) {

		NoticePDVO nPdvo = new NoticePDVO();

		int recordTotalCount = session.selectOne("customer.getNoticeNavi", nPdvo);

		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1);

		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if (needPrev) {
			sb.append("<a class='item' href='/notice.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/notice.diet?currentPage="
								+ i + "'>  " + i + " </a>");
			} else {
				sb.append("<a class='item' href='/notice.diet?currentPage=" + i + "'> " + i + " </a>");
			}
		}
		if (needNext) {
			sb.append("<a class='item' href='/notice.diet?currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}

		return sb.toString();
	}

	@Override
	public NoticeVO noticeContent(HttpSession sessionCheck, SqlSessionTemplate session, int index,
			HttpServletResponse response, HttpServletRequest request) {

		session.update("customer.viewCount", index);
		NoticeVO nVo = session.selectOne("customer.noticeContent", index);

		return nVo;

	}

}
