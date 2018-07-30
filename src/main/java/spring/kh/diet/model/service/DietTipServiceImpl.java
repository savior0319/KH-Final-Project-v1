package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.DietTipDAOImpl;
import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.DietTipPDVO;
import spring.kh.diet.model.vo.DietTipVO;

@Service("dietTipService")
public class DietTipServiceImpl implements DietTipService {

	@Resource(name = "dietTipDAO")
	private DietTipDAOImpl dietTipDAO;

	@Autowired
	private SqlSessionTemplate session;

	@Override
	public DietTipPDVO getDietTipList(int currentPage, DietTipPDVO pdvo) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		DietTipPDVO dtpd = new DietTipPDVO();

		ArrayList<DietTipVO> list = dietTipDAO.selectAllDietTip(session, currentPage, recordCountPerPage, pdvo);

		String pageNavi = dietTipDAO.getDietTipPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage,
				pdvo);

		dtpd.setDtList(list);
		dtpd.setPageNavi(pageNavi);

		return dtpd;
	}

	@Override
	public DietTipVO getDietTip(int indexNo) {

		DietTipVO dt = dietTipDAO.getDietTip(session, indexNo);

		return dt;
	}

	@Override
	public int registDietTip(DietTipVO dt) {
		return dietTipDAO.registDietTip(session, dt);
	}

	@Override
	public int deleteDietTip(int indexNo) {
		return dietTipDAO.deleteDietTip(session, indexNo);
	}

	@Override
	public DietTipVO loadUpdateDietTip(int indexNo) {
		return dietTipDAO.loadUpdateDietTip(session, indexNo);
	}

	@Override
	public int updateDietTip(DietTipVO dt) {
		return dietTipDAO.updateDietTip(session, dt);
	}

	// 조회수 카운트
	@Override
	public int postHit(int indexNo) {
		int result = dietTipDAO.postHit(session, indexNo);
		return result;
	}

	// 좋아요 테이블에서 행 삭제
	@Override
	public int boardLikeDown(BoardLikeVO blv) {
		return dietTipDAO.boardLikeDown(session, blv);
	}

	// 좋아요 -1
	@Override
	public int postLikeDown(BoardLikeVO blv) {
		return dietTipDAO.postLikeDown(session, blv);
	}

	// 좋아요 테이블에서 행 추가
	@Override
	public int boardLikeUp(BoardLikeVO checkVO) {
		return dietTipDAO.boardLikeUp(session, checkVO);
	}

	// 좋아요 +1
	@Override
	public int postLikeUp(BoardLikeVO checkVO) {
		return dietTipDAO.postLikeUp(session, checkVO);
	}

	// 해당 회원이 좋아요 했는지 확인
	@Override
	public BoardLikeVO checkBoardLike(BoardLikeVO checkVO) {
		return dietTipDAO.checkBoardLike(session, checkVO);
	}

}
