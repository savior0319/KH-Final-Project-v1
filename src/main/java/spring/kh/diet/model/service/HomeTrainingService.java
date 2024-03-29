package spring.kh.diet.model.service;


import java.util.ArrayList;

import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.HomeTrainingLikeVO;
import spring.kh.diet.model.vo.HomeTrainingPageDataVO;
import spring.kh.diet.model.vo.HomeTrainingVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.UpMbSeeVO;

public interface HomeTrainingService {

	HomeTrainingPageDataVO homeTrainingList(int currentPage, HomeTrainingPageDataVO pdvo);

	HomeTrainingVO homeTraining(int index);
	
	BoardLikeVO checkBoardLike(BoardLikeVO checkVO);

	int boardLikeDown(BoardLikeVO blv);

	int boardLikeUp(BoardLikeVO checkVO);

	int postLikeDown(BoardLikeVO blv);

	int postLikeUp(BoardLikeVO checkVO);

	int homeTrainingHits(int hits);

	HomeTrainingPageDataVO homeTrainingAll(int currentPage, HomeTrainingPageDataVO pdvo);

    int registHomeTraining(HomeTrainingVO ht);
   
    int deleteHomeTraining(int indexNo);
    
    HomeTrainingVO loadUpdateHomeTraining(int indexNo);
    
    int updateHomeTraining(HomeTrainingVO ht);

	ArrayList<HomeTrainingVO> getMatchedHtList(String type1);

	MemberVO getHtSeeList(int mbIndex);

	void upMbHtSee(UpMbSeeVO ums);
    
    
}
