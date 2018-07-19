package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.CommunityDAO;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.CommunityPageDataVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {

	@Resource(name = "communityDAO")
	private CommunityDAO communityDAO;

	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;

	// 커뮤니티 전체 게시판
/*	@Override
	public List<BoardPostVO> allCommunityList() {
		List<BoardPostVO> list = communityDAO.allCommunityList(SqlSessionTemplate);
		return list;
	}*/

	// 전체, 자유, 팁&노하우, 고민&질문, 비포&애프터 게시판 페이징 처리 출력
	@Override
	public CommunityPageDataVO allCommunityList(int currentPage, String type) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		CommunityPageDataVO cpdv = new CommunityPageDataVO();
		
		ArrayList<BoardPostVO> list = (ArrayList<BoardPostVO>) communityDAO.allCommunityList(SqlSessionTemplate, currentPage, recordCountPerPage, type);
		String pageNavi = communityDAO.getallCommunityListPageNavi(SqlSessionTemplate, currentPage, recordCountPerPage, naviCountPerPage, type);

		cpdv.setComList(list);
		cpdv.setPageNavi(pageNavi);
		cpdv.setType(type);
		
		return cpdv;
	}


	//레시피&식단
	@Override
	public CommunityPageDataVO recipeBoardList(int currentPage, String type) {
		int recordCountPerPage = 9;
		int naviCountPerPage = 5;

		CommunityPageDataVO cpdv = new CommunityPageDataVO();
				
		ArrayList<BoardPostVO> list = (ArrayList<BoardPostVO>) communityDAO.recipeBoardList(SqlSessionTemplate, currentPage, recordCountPerPage, naviCountPerPage, type);
		String pageNavi = communityDAO.getRecipeListPageNavi(SqlSessionTemplate, currentPage, recordCountPerPage, naviCountPerPage, type);
		
		cpdv.setComList(list);
		cpdv.setPageNavi(pageNavi);
		cpdv.setType(type);
		
		return cpdv;
	}
	
	
	
	//글등록하러 가는 중!!!
	@Override
	public int registCommunity(BoardPostVO bpv) {
		int result = communityDAO.registCommunity(SqlSessionTemplate, bpv);
		return result;
	}


	@Override
	public BoardPostVO postedCommunity(int postIndex) {
		BoardPostVO bpv = communityDAO.postedCommunity(SqlSessionTemplate,postIndex);
		return bpv;
	}

}
