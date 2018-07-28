package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.DietTipPDVO;
import spring.kh.diet.model.vo.DietTipVO;

@Repository("dietTipDAO")
public class DietTipDAOImpl implements DietTipDAO {

	@Override
	public ArrayList<DietTipVO> selectAllDietTip(SqlSessionTemplate session, int currentPage, int recordCountPerPage, DietTipPDVO pdvo) {
		pdvo.setStart((currentPage-1)*recordCountPerPage+1);
		pdvo.setEnd(currentPage*recordCountPerPage);
		
		List<DietTipVO> list = session.selectList("dietTip.getList", pdvo);
		
		return (ArrayList<DietTipVO>)list;
	}

	@Override
	public String getDietTipPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage, DietTipPDVO pdvo) {
		
		int recordTotalCount = session.selectOne("dietTip.getNavi",pdvo);

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

		if(pdvo.getCategory()!=null && pdvo.getSearchText()!=null) {	// 검색했을 때의 내비
			
			if (needPrev) // 시작이 1페이지가 아니라면!
			{
				sb.append("<a class='item' href='/dietTipList.diet?type=" + pdvo.getType() + "&currentPage=" + (startNavi - 1) + "&category=" + pdvo.getCategory() + "&searchText=" + pdvo.getSearchText() + "'> &lt; </a>");
			}
	    
			for(int i=startNavi;i<=endNavi;i++)
			{
				if(i==currentPage)
				{
					sb.append("<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/dietTipList.diet?type=" + pdvo.getType() + "&currentPage="+i+"&category=" + pdvo.getCategory() + "&searchText=" + pdvo.getSearchText() + "'><strong>"+i+"</strong></a>");
				}
				else
				{
					sb.append("<a class='item' href='/dietTipList.diet?type=" + pdvo.getType() + "&currentPage="+i+"&category=" + pdvo.getCategory() + "&searchText=" + pdvo.getSearchText() + "'> "+i+" </a>");
				}
			}
			if (needNext) // 끝 페이지가 아니라면!
			{
				sb.append("<a class='item' href='/dietTipList.diet?type=" + pdvo.getType() + "&currentPage=" + (endNavi + 1) + "&category=" + pdvo.getCategory() + "&searchText=" + pdvo.getSearchText() + "'> &gt; </a>");
			}
			
		}else {		// 검색하지 않았을 때의 내비
			
			if (needPrev) // 시작이 1페이지가 아니라면!
			{
				sb.append("<a class='item' href='/dietTipList.diet?type=" + pdvo.getType() + "&currentPage=" + (startNavi - 1) + "'> &lt; </a>");
			}
	    
			for(int i=startNavi;i<=endNavi;i++)
			{
				if(i==currentPage)
				{
					sb.append("<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/dietTipList.diet?type=" + pdvo.getType() + "&currentPage="+i+"'><strong>"+i+"</strong></a>");
				}
				else
				{
					sb.append("<a class='item' href='/dietTipList.diet?type=" + pdvo.getType() + "&currentPage="+i+"'> "+i+" </a>");
				}
			}
			if (needNext) // 끝 페이지가 아니라면!
			{
				sb.append("<a class='item' href='/dietTipList.diet?type=" + pdvo.getType() + "&currentPage=" + (endNavi + 1) + "'> &gt; </a>");
			}
			
		}
		
		

		return sb.toString();
	}

	@Override
	public DietTipVO getDietTip(SqlSessionTemplate session, int indexNo) {
		DietTipVO dt = session.selectOne("dietTip.getOne", indexNo);
		return dt;
	}

	/*다이어트 팁 게시글 등록*/
	@Override
	public int registDietTip(SqlSessionTemplate session, DietTipVO dt) {
		return session.insert("dietTip.registDietTip", dt);
	}

	@Override
	public int deleteDietTip(SqlSessionTemplate session, int indexNo) {
		return session.delete("dietTip.deleteDietTip", indexNo);
	}

	@Override
	public DietTipVO loadUpdateDietTip(SqlSessionTemplate session, int indexNo) {
		return session.selectOne("dietTip.loadUpdateDietTip", indexNo);
	}

	@Override
	public int updateDietTip(SqlSessionTemplate session, DietTipVO dt) {
		return session.update("dietTip.updateDietTip", dt);
	}

	public int postHit(SqlSessionTemplate session, int indexNo) {
		return session.update("dietTip.postHit", indexNo);
	}

	public int boardLikeDown(SqlSessionTemplate session, BoardLikeVO blv) {
		return session.delete("dietTip.likeDown", blv);
	}

	public int boardLikeUp(SqlSessionTemplate session, BoardLikeVO checkVO) {
		return session.insert("dietTip.likeUp", checkVO);
	}

	public int postLikeDown(SqlSessionTemplate session, BoardLikeVO blv) {
		return session.update("dietTip.postDown", blv);
	}

	public int postLikeUp(SqlSessionTemplate session, BoardLikeVO checkVO) {
		System.out.println(checkVO.getTargetIndex());
		return session.update("dietTip.postUp", checkVO);
	}

	public BoardLikeVO checkBoardLike(SqlSessionTemplate session, BoardLikeVO checkVO) {
		return session.selectOne("dietTip.checkLike", checkVO);
	}

}
