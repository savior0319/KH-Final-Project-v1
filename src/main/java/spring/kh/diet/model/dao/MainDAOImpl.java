package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.HealthCenterPDVO;
import spring.kh.diet.model.vo.HealthCenterVO;
import spring.kh.diet.model.vo.OnSessionVO;
import spring.kh.diet.model.vo.UpdateSSVO;

@SuppressWarnings("all")
@Repository("mainDAO")
public class MainDAOImpl implements MainDAO {

	@Override
	public ArrayList<HealthCenterVO> selectAllHealthCenter(SqlSessionTemplate session, int currentPage,
			int recordCountPerPage, String location) {
		HealthCenterPDVO hDataVO = new HealthCenterPDVO();

		hDataVO.setType(location);
		hDataVO.setStart((currentPage - 1) * recordCountPerPage + 1);
		hDataVO.setEnd(currentPage * recordCountPerPage);

		List<HealthCenterVO> list = session.selectList("main.getList", hDataVO);

		return (ArrayList<HealthCenterVO>) list;
	}

	@Override
	public String getHealthCenterPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String location) {

		HealthCenterPDVO hDataVO = new HealthCenterPDVO();
		hDataVO.setType(location);

		int recordTotalCount = session.selectOne("main.getNavi", hDataVO);

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
			sb.append("<a class='item' href='/healthCenter.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/healthCenter.diet?location="
								+ location + "&currentPage=" + i + "'>  " + i + " </a>");
			} else {
				sb.append("<a class='item' href='/healthCenter.diet?location=" + location + "&currentPage=" + i + "'> "
						+ i + " </a>");
			}
		}
		if (needNext) {
			sb.append("<a class='item' href='/healthCenter.diet?location=" + location + "&currentPage=" + (endNavi + 1)
					+ "'> &gt; </a>");
		}

		return sb.toString();
	}

	@Override
	public int insertSessionToList(SqlSessionTemplate session, HttpSession session2, HttpServletRequest request) {

		OnSessionVO OSV = new OnSessionVO("SESSION_SEQ.nextval", session2.getId(), request.getRemoteAddr(), "ON",
				"NULL", "NULL");

		return session.insert("main.insertOnSesssion", OSV);
	}

	@Override
	public ArrayList<OnSessionVO> selectAllSesssionList(SqlSessionTemplate session) {
		List<?> list = session.selectList("main.selectAllSessionList");

		return (ArrayList<OnSessionVO>) list;
	}

	@Override
	public int updateOnsession(SqlSessionTemplate session, UpdateSSVO uSSVO) {
		int result = session.update("main.updateOnSesssion", uSSVO);
		
		return result;
	}

}
