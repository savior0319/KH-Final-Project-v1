package spring.kh.diet.model.dao;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.HomeTrainingLikeVO;
import spring.kh.diet.model.vo.HomeTrainingVO;

public interface HomeTrainingDAO {
	
	ArrayList<HomeTrainingVO> selectAllHomeTraining(SqlSessionTemplate session,int currentPage, int recordCountPerPage,String type);

	String homeTrainingPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage, int naviCountPerPage,String type);

	HomeTrainingVO homeTraining(SqlSessionTemplate session, int indexNo);

	ArrayList<HomeTrainingVO> pnWriteList(SqlSessionTemplate session, int indexNo);

	HomeTrainingLikeVO checkBoardLike(SqlSessionTemplate session, HomeTrainingLikeVO checkVO);

	int boardLikeDown(SqlSessionTemplate session, HomeTrainingLikeVO blv);

	int boardLikeUp(SqlSessionTemplate session, HomeTrainingLikeVO checkVO);

	int postLikeDown(SqlSessionTemplate session, HomeTrainingLikeVO blv);

	int postLikeUp(SqlSessionTemplate session, HomeTrainingLikeVO checkVO);

	int homeTrainingHits(SqlSessionTemplate session, int hits);
}
