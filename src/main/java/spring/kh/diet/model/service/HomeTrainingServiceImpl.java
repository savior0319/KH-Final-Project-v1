package spring.kh.diet.model.service;

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

@Service("homeTrainingService")
public class HomeTrainingServiceImpl implements HomeTrainingService{

	@Resource(name="homeTrainingDAO")
	private HomeTrainingDAOImpl homeTrainingDAO;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public HomeTrainingPageDataVO homeTrainingList(int currentPage, String type) {
		int recordCountPerPage = 12;
		int naviCountPerPage = 5;
		
		HomeTrainingPageDataVO htpd = new HomeTrainingPageDataVO();
		
		ArrayList<HomeTrainingVO> list = homeTrainingDAO.selectAllHomeTraining(session, currentPage, recordCountPerPage, type);
		
		String pageNavi = homeTrainingDAO.homeTrainingPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage, type);
		
		htpd.setHtList(list);
		htpd.setPageNavi(pageNavi);
		
		return htpd;
	}

	@Override
	public HomeTrainingVO homeTraining(int indexNo) {
		HomeTrainingVO ht = homeTrainingDAO.homeTraining(session, indexNo);
		return ht;
	}

	@Override
	public ArrayList<HomeTrainingVO> pnWriteList(int indexNo) {
		ArrayList<HomeTrainingVO> list = homeTrainingDAO.pnWriteList(session, indexNo);
		return list;
	}
	
	@Override
	public int boardLikeDown(HomeTrainingLikeVO htlv) {
		int result = homeTrainingDAO.boardLikeDown(session, htlv);
		return result;
	}

	@Override	
	public int postLikeDown(HomeTrainingLikeVO htlv) {
		int result = homeTrainingDAO.postLikeDown(session, htlv);
		return result;
	}
	
	@Override
	public int boardLikeUp(HomeTrainingLikeVO checkVO) {
		int result = homeTrainingDAO.boardLikeUp(session, checkVO);
		return result;
	}
	
	@Override
	public int postLikeUp(HomeTrainingLikeVO checkVO) {
		int result = homeTrainingDAO.postLikeUp(session, checkVO);
		return result;
	}
	
	@Override
	public HomeTrainingLikeVO checkBoardLike(HomeTrainingLikeVO checkVO) {
		HomeTrainingLikeVO htlv = homeTrainingDAO.checkBoardLike(session, checkVO);
		return htlv;
	}

	@Override
	public int homeTrainingHits(int hits) {
		int result = homeTrainingDAO.homeTrainingHits(session, hits);
		return result;
	}


}
