package spring.kh.diet.model.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.DietTipPDVO;
import spring.kh.diet.model.vo.DietTipVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.UpMbSeeVO;

public interface DietTipService {

	DietTipPDVO getDietTipList(int currentPage, DietTipPDVO pdvo);

	DietTipVO getDietTip(int index);

	int registDietTip(DietTipVO dt);

	int deleteDietTip(int indexNo);

	DietTipVO loadUpdateDietTip(int indexNo);

	int updateDietTip(DietTipVO dt);

	int postHit(int indexNo);

	int boardLikeDown(BoardLikeVO blv);

	int postLikeDown(BoardLikeVO blv);

	int boardLikeUp(BoardLikeVO checkVO);

	int postLikeUp(BoardLikeVO checkVO);

	BoardLikeVO checkBoardLike(BoardLikeVO checkVO);

	ArrayList<DietTipVO> getNextPreDt(int indexNo);

	void upMbDtSee(UpMbSeeVO ums);

	MemberVO getDtSeeList(int mbIndex);

	ArrayList<DietTipVO> getMatchedDtList(String type1);
	
}
