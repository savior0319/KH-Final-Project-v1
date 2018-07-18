package spring.kh.diet.model.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.DietTipPageDataVO;
import spring.kh.diet.model.vo.DietTipVO;

@Repository("dietTipDAO")
public class DietTipDAOImpl implements DietTipDAO {

	@Override
	public ArrayList<DietTipVO> selectAllDietTip(SqlSessionTemplate session, int currentPage, int recordCountPerPage) {
		DietTipPageDataVO dtpd = new DietTipPageDataVO();

		//System.out.println(dt);
		dtpd.setStart((currentPage-1)*recordCountPerPage+1);
		dtpd.setEnd(currentPage*recordCountPerPage);
		
		List<DietTipVO> list = session.selectList("dietTip.getList", dtpd);
		
		//System.out.println(new SimpleDateFormat("yyyy-MM-dd").format(list.get(0).getDtDate()));
		
		return (ArrayList<DietTipVO>)list;
	}

	@Override
	public String getDietTipPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage) {

		int recordTotalCount = session.selectOne("dietTip.getNavi");

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
			sb.append("<a class='item' href='/dietTipList.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}
    
		for(int i=startNavi;i<=endNavi;i++)
		{
			if(i==currentPage)
			{
				sb.append("<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/dietTipList.diet?currentPage="+i+"'><strong>"+i+"</strong></a>");
			}
			else
			{
				sb.append("<a class='item' href='/dietTipList.diet?currentPage="+i+"'> "+i+" </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			sb.append("<a class='item' href='/dietTipList.diet?currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}

		return sb.toString();
	}

}
