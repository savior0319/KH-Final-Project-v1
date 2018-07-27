package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.CommonDAO;
import spring.kh.diet.model.vo.BoardCommentPDVO;
import spring.kh.diet.model.vo.BoardCommentVO;

@Service("commonService")
public class CommonServiceImpl implements CommonService {

	@Resource(name="commonDAO")
	private CommonDAO commonDAO;

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public BoardCommentPDVO getComment(int currentPage,String servletName, int indexNo) {
		int recordCountPerPage = 8;
		int naviCountPerPage = 5;
		
		BoardCommentPDVO bcpd = new BoardCommentPDVO();
		
		ArrayList<BoardCommentVO> list = commonDAO.selectAllComment(session, currentPage, recordCountPerPage, indexNo);
		
		String pageNavi = commonDAO.getCommentPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage, servletName, indexNo);
		
		bcpd.setBcList(list);
		bcpd.setPageNavi(pageNavi);
		
		//총 댓글수 가져옴
		bcpd.setTotalCommentNo(commonDAO.getTotalCommentNo(session,indexNo));
		
		return bcpd;
	}

	@Override
	public int addComment(BoardCommentVO bc) {
		
		return commonDAO.addComment(session, bc);
	}

	@Override
	public int deleteComment(int commentIndex) {
		return commonDAO.deleteComment(session, commentIndex);
	}


	@Override
	public int modifyComment(BoardCommentVO bc) {
		
		return commonDAO.modifyComment(session, bc);
	}
	
	
	
}
