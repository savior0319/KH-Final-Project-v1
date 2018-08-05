package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.CommonDAO;
import spring.kh.diet.model.vo.AdvertiseVO;
import spring.kh.diet.model.vo.BoardBlameVO;
import spring.kh.diet.model.vo.BoardCommentPDVO;
import spring.kh.diet.model.vo.BoardCommentVO;
import spring.kh.diet.model.vo.BoardPostVO;

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

	//댓글 삭제
	@Override
	public int deleteComment(int commentIndex) {
		return commonDAO.deleteComment(session, commentIndex);
	}


	//댓글 수정
	@Override
	public int modifyComment(BoardCommentVO bc) {
		
		return commonDAO.modifyComment(session, bc);
	}

	//댓글 갯수
	@Override
	public int cmdCount(BoardCommentVO bc) {
		return commonDAO.cmdCount(session, bc);
	}

	//댓글 카운트 높이기
	@Override
	public int cmdCountUp(BoardPostVO bpv) {
		int result = commonDAO.cmdCountUp(session, bpv);

		return result;
	}

	@Override
	public int cmdDelCount(int parseInt) {
		return commonDAO.cmdDelCount(session, parseInt);
	}

	@Override
	public BoardBlameVO checkPostBlame(BoardBlameVO checkBlame) {
		return commonDAO.checkPostBlame(session, checkBlame);
	}

	@Override
	public int blameCmd(BoardBlameVO report) {
		return commonDAO.blameCmd(session, report);
	}

	@Override
	public int cmtBlameUp(BoardBlameVO report) {
		return commonDAO.cmtBlameUp(session, report);
	}

	
	/* 광고 가져오기 */
	@Override
	public ArrayList<AdvertiseVO> advertiseImageLoad() {
		return commonDAO.advertiseImageLoad(session);
	}
	
}
