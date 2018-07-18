package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.HealthCenterPageDataVO;
import spring.kh.diet.model.vo.HealthCenterVO;

@Repository("mainDAO")
public class MainDAOImpl implements MainDAO {

	@Override
	public ArrayList<HealthCenterVO> selectAllHealthCenter(SqlSessionTemplate session, int currentPage,
			int recordCountPerPage) {
		HealthCenterPageDataVO hDataVO = new HealthCenterPageDataVO();

		hDataVO.setStart((currentPage - 1) * recordCountPerPage + 1);
		hDataVO.setEnd(currentPage * recordCountPerPage);

		List<HealthCenterVO> list = session.selectList("main.getList", hDataVO);

		return (ArrayList<HealthCenterVO>) list;
	}

	@Override
	public String getHealthCenterPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage) {

		int recordTotalCount = session.selectOne("main.getNavi");

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

		if (needPrev) // 시작이 1페이지가 아니라면!
		{
			sb.append("<a class='item' href='/healthCenter.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append("<a class='active item' style='background: rgba(250, 40, 40, 0.5);' href='/healthCenter.diet?currentPage=" + i + "'>  " + i + " </a>");
			} else {
				sb.append("<a class='item' href='/healthCenter.diet?currentPage=" + i + "'> " + i + " </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append("<a class='item' href='/healthCenter.diet?currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}

		return sb.toString();
	}

}
