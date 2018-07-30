package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.DietTipPDVO;
import spring.kh.diet.model.vo.DietTipVO;

public interface DietTipDAO {

	ArrayList<DietTipVO> selectAllDietTip(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			DietTipPDVO pdvo);

	String getDietTipPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage, int naviCountPerPage,
			DietTipPDVO pdvo);

	DietTipVO getDietTip(SqlSessionTemplate session, int index);

	int registDietTip(SqlSessionTemplate session, DietTipVO dt);

	int deleteDietTip(SqlSessionTemplate session, int indexNo);

	DietTipVO loadUpdateDietTip(SqlSessionTemplate session, int indexNo);

	int updateDietTip(SqlSessionTemplate session, DietTipVO dt);

	int postHit(SqlSessionTemplate session, int indexNo);

	int boardLikeDown(SqlSessionTemplate session, BoardLikeVO blv);

	int boardLikeUp(SqlSessionTemplate session, BoardLikeVO checkVO);

	int postLikeDown(SqlSessionTemplate session, BoardLikeVO blv);

	int postLikeUp(SqlSessionTemplate session, BoardLikeVO checkVO);

	BoardLikeVO checkBoardLike(SqlSessionTemplate session, BoardLikeVO checkVO);
	
}
