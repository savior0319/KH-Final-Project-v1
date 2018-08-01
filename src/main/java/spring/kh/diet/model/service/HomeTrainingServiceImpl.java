package spring.kh.diet.model.service;

import java.sql.Timestamp;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.HomeTrainingDAOImpl;
import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.HomeTrainingLikeVO;
import spring.kh.diet.model.vo.HomeTrainingPageDataVO;
import spring.kh.diet.model.vo.HomeTrainingVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.UpMbSeeVO;

@Service("homeTrainingService")
public class HomeTrainingServiceImpl implements HomeTrainingService{

	@Resource(name="homeTrainingDAO")
	private HomeTrainingDAOImpl homeTrainingDAO;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public HomeTrainingPageDataVO homeTrainingList(int currentPage, HomeTrainingPageDataVO pdvo) {
		int recordCountPerPage = 12;
		int naviCountPerPage = 5;
		
		HomeTrainingPageDataVO htpd = new HomeTrainingPageDataVO();
		
		ArrayList<HomeTrainingVO> list = homeTrainingDAO.selectAllHomeTraining(session, currentPage, recordCountPerPage, pdvo);
		
		String pageNavi = homeTrainingDAO.homeTrainingPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage, pdvo);
		
		htpd.setHtList(list);
		htpd.setPageNavi(pageNavi);
		
		return htpd;
	}

	@Override
	public HomeTrainingVO homeTraining(int indexNo) {
		HomeTrainingVO ht = homeTrainingDAO.homeTraining(session, indexNo);
		return ht;
	}
	
	
	// 이전글 다음글
	public ArrayList<HomeTrainingVO> pnWriteList(int indexNo) {
		return homeTrainingDAO.pnWriteList(session, indexNo);
		
	}
	
	@Override
	public int boardLikeDown(BoardLikeVO blv) {
		int result = homeTrainingDAO.boardLikeDown(session, blv);
		return result;
	}

	@Override	
	public int postLikeDown(BoardLikeVO blv) {
		int result = homeTrainingDAO.postLikeDown(session, blv);
		return result;
	}
	
	@Override
	public int boardLikeUp(BoardLikeVO checkVO) {
		int result = homeTrainingDAO.boardLikeUp(session, checkVO);
		return result;
	}
	
	@Override
	public int postLikeUp(BoardLikeVO checkVO) {
		int result = homeTrainingDAO.postLikeUp(session, checkVO);
		return result;
	}
	
	@Override
	public BoardLikeVO checkBoardLike(BoardLikeVO checkVO) {
		BoardLikeVO blv = homeTrainingDAO.checkBoardLike(session, checkVO);
		return blv;
	}

	@Override
	public int homeTrainingHits(int hits) {
		int result = homeTrainingDAO.homeTrainingHits(session, hits);
		return result;
	}
	
	@Override
	public HomeTrainingPageDataVO homeTrainingAll(int currentPage, HomeTrainingPageDataVO pdvo) {
		int recordCountPerPage = 9;
		int naviCountPerPage = 5;
		
		HomeTrainingPageDataVO htpd = new HomeTrainingPageDataVO();
		
		ArrayList<HomeTrainingVO> list = homeTrainingDAO.selectAllHomeTraining(session, currentPage, recordCountPerPage, pdvo);
		
		String pageNavi = homeTrainingDAO.homeTrainingAllPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage, pdvo);
		
		htpd.setHtList(list);
		htpd.setPageNavi(pageNavi);
		
		return htpd;
	}

	@Override
	public int registHomeTraining(HomeTrainingVO ht) {
		return homeTrainingDAO.registHomeTraining(session, ht);
	}

	@Override
	public int deleteHomeTraining(int indexNo) {
		return homeTrainingDAO.deleteHomeTraining(session, indexNo);
	}

	@Override
	public HomeTrainingVO loadUpdateHomeTraining(int indexNo) {
		return homeTrainingDAO.loadUpdateHomeTraining(session, indexNo);
	}

	@Override
	public int updateHomeTraining(HomeTrainingVO ht) {
		return homeTrainingDAO.updateHomeTraining(session, ht);
	}

	@Override
	public MemberVO getHtSeeList(int mbIndex) {
		return homeTrainingDAO.getHtSeeList(session, mbIndex);
	}

	@Override
	public ArrayList<HomeTrainingVO> getMatchedHtList(String type1) {
		return homeTrainingDAO.getMatchedHtList(session, type1);
	}

	@Override
	public void upMbHtSee(UpMbSeeVO ums) {
		homeTrainingDAO.upMbHtSee(session, ums);
	}


}
