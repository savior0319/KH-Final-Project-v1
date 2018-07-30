package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.HomeTrainingLikeVO;
import spring.kh.diet.model.vo.HomeTrainingPageDataVO;
import spring.kh.diet.model.vo.HomeTrainingVO;

public interface HomeTrainingDAO {

	ArrayList<HomeTrainingVO> selectAllHomeTraining(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			HomeTrainingPageDataVO pdvo);

	String homeTrainingPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage, HomeTrainingPageDataVO pdvo);

	HomeTrainingVO homeTraining(SqlSessionTemplate session, int indexNo);

	ArrayList<HomeTrainingVO> pnWriteList(SqlSessionTemplate session, int indexNo);

	BoardLikeVO checkBoardLike(SqlSessionTemplate session, BoardLikeVO checkVO);

	int boardLikeDown(SqlSessionTemplate session, BoardLikeVO blv);

	int boardLikeUp(SqlSessionTemplate session, BoardLikeVO checkVO);

	int postLikeDown(SqlSessionTemplate session, BoardLikeVO blv);

	int postLikeUp(SqlSessionTemplate session, BoardLikeVO checkVO);

	int homeTrainingHits(SqlSessionTemplate session, int hits);
	
	int registHomeTraining(SqlSessionTemplate session, HomeTrainingVO ht);
	
	int deleteHomeTraining(SqlSessionTemplate session, int indexNo);
	
	HomeTrainingVO loadUpdateHomeTraining(SqlSessionTemplate session, int indexNo);
	
	int updateHomeTraining(SqlSessionTemplate session, HomeTrainingVO ht);


}
