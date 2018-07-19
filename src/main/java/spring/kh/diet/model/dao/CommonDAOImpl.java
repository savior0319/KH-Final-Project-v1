package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.BoardCommentPDVO;
import spring.kh.diet.model.vo.BoardCommentVO;

@Repository(value ="commonDAO")
public class CommonDAOImpl implements CommonDAO{

	@Override
	public ArrayList<BoardCommentVO> selectAllComment(SqlSessionTemplate session, int currentPage,
			int recordCountPerPage, int indexNo) {
		BoardCommentPDVO bcpd = new BoardCommentPDVO();
		
		bcpd.setStart((currentPage-1)*recordCountPerPage+1);
		bcpd.setEnd(currentPage*recordCountPerPage);
		bcpd.setIndexNo(indexNo);
		
		List<BoardCommentVO> list = session.selectList("common.getList",bcpd); 
		
		return (ArrayList<BoardCommentVO>)list;
	}

	@Override
	public String getCommentPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String servletName, int indexNo) {
		int recordTotalCount = session.selectOne("common.getNavi",indexNo);

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
			//sb.append("<a class='item' href='/" + servletName + "?indexNo=" + indexNo + "&currentPage=" + (startNavi - 1) + "'> &lt; </a>");
			sb.append("<a class='item' onclick='naviMove(" + (startNavi -1) + "," + indexNo + "," + servletName + ");'> &lt; </a>");
		}
    
		for(int i=startNavi;i<=endNavi;i++)
		{
			if(i==currentPage)
			{
				//sb.append("<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/" + servletName + "?indexNo=" + indexNo + "&currentPage="+i+"'><strong>"+i+"</strong></a>");
				sb.append("<a class='active item' style='background: rgba(250, 40, 40); color:white;' onclick='naviMove(" + i + "," + indexNo + "," + servletName + ");'><strong>"+i+"</strong></a>");
			}
			else
			{
				//sb.append("<a class='item' href='/" + servletName + "?indexNo=" + indexNo + "&currentPage="+i+"'> "+i+" </a>");
				sb.append("<a class='item' onclick='naviMove(" + i + "," + indexNo + "," + servletName + ");'> "+i+" </a>");
			}
		}
		if (needNext) // 끝 페이지가 아니라면!
		{
			//sb.append("<a class='item' href='/" + servletName +"?indexNo=" + indexNo + "&currentPage=" + (endNavi + 1) + "'> &gt; </a>");
			sb.append("<a class='item' onclick='naviMove(" + (endNavi + 1) + "," + indexNo + "," + servletName + ");'> &gt; </a>");
		}

		return sb.toString();
	}

	// 총 댓글수 가져옴
	@Override
	public int getTotalCommentNo(SqlSessionTemplate session, int indexNo) {
		return session.selectOne("common.getNavi",indexNo);
	}

	@Override
	public int addComment(SqlSessionTemplate session, BoardCommentVO bc) {
		
		return session.insert("common.addComment", bc);
	}
	
}
