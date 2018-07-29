package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.FoodCalPageDataVO;
import spring.kh.diet.model.vo.FoodCalVO;
import spring.kh.diet.model.vo.HealthCalPageDataVO;
import spring.kh.diet.model.vo.HealthCalVO;

@Repository(value="calorieDictionaryDAO")
public class CalorieDictionaryDAOImpl implements CalorieDictionaryDAO {

	@Override
	public ArrayList<FoodCalVO> getFoodCalList(SqlSessionTemplate session, int currentPage, int recordCountPerPage, String searchText) {
		FoodCalPageDataVO fcpd = new FoodCalPageDataVO();
		fcpd.setStart((currentPage-1)*recordCountPerPage+1);
		fcpd.setEnd(currentPage*recordCountPerPage);
		fcpd.setSearchText(searchText);
		
		List<FoodCalVO> list = session.selectList("calorieDic.getFoodCalList", fcpd);
		
		return (ArrayList<FoodCalVO>)list;
	}

	@Override
	public String getFoodCalPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String searchText) {
		int recordTotalCount = session.selectOne("calorieDic.getFoodCalNavi", searchText);
		
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

		/*if(pdvo.getCategory()!=null && pdvo.getSearchText()!=null) {	// 검색했을 때의 내비
*/			
			if (needPrev) // 시작이 1페이지가 아니라면!
			{
				sb.append("<a class='item' href='/foodCalorieList.diet?currentPage=" + (startNavi - 1) + "&searchText=" + searchText + "'> &lt; </a>");
			}
	    
			for(int i=startNavi;i<=endNavi;i++)
			{
				if(i==currentPage)
				{
					sb.append("<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/foodCalorieList.diet?currentPage=" + i + "&searchText=" + searchText + "'><strong>"+i+"</strong></a>");
				}
				else
				{
					sb.append("<a class='item' href='/foodCalorieList.diet?currentPage=" + i + "&searchText=" + searchText + "'> "+i+" </a>");
				}
			}
			if (needNext) // 끝 페이지가 아니라면!
			{
				sb.append("<a class='item' href='/foodCalorieList.diet?currentPage=" + (endNavi + 1) + "&searchText=" + searchText + "'> &gt; </a>");
			}
			
		/*}else {		// 검색하지 않았을 때의 내비
			
			if (needPrev) // 시작이 1페이지가 아니라면!
			{
				sb.append("<a class='item' href='/foodCalorieList.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
			}
	    
			for(int i=startNavi;i<=endNavi;i++)
			{
				if(i==currentPage)
				{
					sb.append("<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/foodCalorieList.diet?currentPage="+i+"'><strong>"+i+"</strong></a>");
				}
				else
				{
					sb.append("<a class='item' href='/foodCalorieList.diet?currentPage="+i+"'> "+i+" </a>");
				}
			}
			if (needNext) // 끝 페이지가 아니라면!
			{
				sb.append("<a class='item' href='/foodCalorieList.diet?currentPage=" + (endNavi + 1) + "'> &gt; </a>");
			}
			
		}*/
		
		

		return sb.toString();
	}

	@Override
	public FoodCalVO getFoodCalInfo(SqlSessionTemplate session, int fcIndex) {
		return session.selectOne("calorieDic.getFoodCalInfo", fcIndex);
	}

	@Override
	public ArrayList<HealthCalVO> getHealthCalList(SqlSessionTemplate session, int currentPage,
			int recordCountPerPage, String searchText) {
		HealthCalPageDataVO hcpd = new HealthCalPageDataVO();
		hcpd.setStart((currentPage-1)*recordCountPerPage+1);
		hcpd.setEnd(currentPage*recordCountPerPage);
		hcpd.setSearchText(searchText);
		
		List<HealthCalVO> list = session.selectList("calorieDic.getHealthCalList", hcpd);
		
		return (ArrayList<HealthCalVO>)list;
	}

	@Override
	public String getHealthCalPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String searchText) {
		int recordTotalCount = session.selectOne("calorieDic.getHealthCalNavi", searchText);
		
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

		/*if(pdvo.getCategory()!=null && pdvo.getSearchText()!=null) {	// 검색했을 때의 내비
*/			
			if (needPrev) // 시작이 1페이지가 아니라면!
			{
				sb.append("<a class='item' href='/healthCalorieList.diet?currentPage=" + (startNavi - 1) + "&searchText=" + searchText + "'> &lt; </a>");
			}
	    
			for(int i=startNavi;i<=endNavi;i++)
			{
				if(i==currentPage)
				{
					sb.append("<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/healthCalorieList.diet?currentPage=" + i + "&searchText=" + searchText + "'><strong>"+i+"</strong></a>");
				}
				else
				{
					sb.append("<a class='item' href='/healthCalorieList.diet?currentPage=" + i + "&searchText=" + searchText + "'> "+i+" </a>");
				}
			}
			if (needNext) // 끝 페이지가 아니라면!
			{
				sb.append("<a class='item' href='/healthCalorieList.diet?currentPage=" + (endNavi + 1) + "&searchText=" + searchText + "'> &gt; </a>");
			}
			
		/*}else {		// 검색하지 않았을 때의 내비
			
			if (needPrev) // 시작이 1페이지가 아니라면!
			{
				sb.append("<a class='item' href='/foodCalorieList.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
			}
	    
			for(int i=startNavi;i<=endNavi;i++)
			{
				if(i==currentPage)
				{
					sb.append("<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/foodCalorieList.diet?currentPage="+i+"'><strong>"+i+"</strong></a>");
				}
				else
				{
					sb.append("<a class='item' href='/foodCalorieList.diet?currentPage="+i+"'> "+i+" </a>");
				}
			}
			if (needNext) // 끝 페이지가 아니라면!
			{
				sb.append("<a class='item' href='/foodCalorieList.diet?currentPage=" + (endNavi + 1) + "'> &gt; </a>");
			}
			
		}*/
		
		

		return sb.toString();
	}

	@Override
	public HealthCalVO getHealthCalInfo(SqlSessionTemplate session, int hcIndex) {
		return session.selectOne("calorieDic.getHealthCalInfo", hcIndex);
	}

}
