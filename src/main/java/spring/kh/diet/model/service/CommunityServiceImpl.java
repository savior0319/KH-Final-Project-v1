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
	/*
	 * @Override public List<BoardPostVO> allCommunityList() { List<BoardPostVO>
	 * list = communityDAO.allCommunityList(SqlSessionTemplate); return list; }
	 */

	// 전체, 자유, 팁&노하우, 고민&질문, 비포&애프터 게시판 페이징 처리 출력
	@Override
	public CommunityPageDataVO allCommunityList(int currentPage, String type) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		CommunityPageDataVO cpdv = new CommunityPageDataVO();

		ArrayList<BoardPostVO> list = (ArrayList<BoardPostVO>) communityDAO.allCommunityList(SqlSessionTemplate,
				currentPage, recordCountPerPage, type);
		String pageNavi = communityDAO.getallCommunityListPageNavi(SqlSessionTemplate, currentPage, recordCountPerPage,
				naviCountPerPage, type);

		cpdv.setComList(list);
		cpdv.setPageNavi(pageNavi);
		cpdv.setType(type);

		return cpdv;
	}

	// 레시피&식단
	@Override
	public CommunityPageDataVO recipeBoardList(int currentPage, String type) {
		int recordCountPerPage = 9;
		int naviCountPerPage = 5;

		CommunityPageDataVO cpdv = new CommunityPageDataVO();

		ArrayList<BoardPostVO> list = (ArrayList<BoardPostVO>) communityDAO.recipeBoardList(SqlSessionTemplate,
				currentPage, recordCountPerPage, naviCountPerPage, type);
		String pageNavi = communityDAO.getRecipeListPageNavi(SqlSessionTemplate, currentPage, recordCountPerPage,
				naviCountPerPage, type);

		cpdv.setComList(list);
		cpdv.setPageNavi(pageNavi);
		cpdv.setType(type);

		return cpdv;
	}

	// 글등록하러 가는 중!!!
	@Override
	public int registCommunity(BoardPostVO bpv) {
		int result = communityDAO.registCommunity(SqlSessionTemplate, bpv);
		return result;
	}

	
	//등록된 글 들어가는 곳
	@Override
	public BoardPostVO postedCommunity(int postIndex) {

		BoardPostVO bpv = communityDAO.postedCommunity(SqlSessionTemplate, postIndex);

		return bpv;
	}

	// 글삭제
	@Override
	public int deletePost(int postIndex) {
		int result = communityDAO.deletePost(SqlSessionTemplate, postIndex);
		return result;
	}

	
	// 최신순 | 조회순 출력 :  전체, 자유, 팁&노하우, 고민&질문, 비포&애프터 게시판 페이징 처리 출력 
	@Override
	public CommunityPageDataVO viewAllList(int currentPage, String type, String postSort, String category, String searchText) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		CommunityPageDataVO cpdv = new CommunityPageDataVO();

		ArrayList<BoardPostVO> list = (ArrayList<BoardPostVO>) communityDAO.viewAllList(SqlSessionTemplate,
				currentPage, recordCountPerPage, type, postSort, category, searchText);
		String pageNavi = communityDAO.getallCommunityListPageNavi(SqlSessionTemplate, currentPage, recordCountPerPage,
				naviCountPerPage, type);

		cpdv.setComList(list);
		cpdv.setPageNavi(pageNavi);
		cpdv.setType(type);

		return cpdv;
	}
	
	
	//  최신순 | 조회순 출력 :  레시피&식단
	@Override
	public CommunityPageDataVO recipeViewList(int currentPage, String type, String postSort) {
		int recordCountPerPage = 9;
		int naviCountPerPage = 5;

		CommunityPageDataVO cpdv = new CommunityPageDataVO();

		ArrayList<BoardPostVO> list = (ArrayList<BoardPostVO>) communityDAO.recipeViewList(SqlSessionTemplate,
				currentPage, recordCountPerPage, naviCountPerPage, type, postSort);
		String pageNavi = communityDAO.getRecipeListPageNavi(SqlSessionTemplate, currentPage, recordCountPerPage,
				naviCountPerPage, type);

		cpdv.setComList(list);
		cpdv.setPageNavi(pageNavi);
		cpdv.setType(type);

		return cpdv;
	}

	@Override
	public CommunityPageDataVO searchList(int currentPage, String searchText, String category) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		System.out.println("서비스 이동중 : "+searchText);
		System.out.println("서비스이동중 : " + category);
		
		CommunityPageDataVO cpdv = new CommunityPageDataVO();

		ArrayList<BoardPostVO> list = (ArrayList<BoardPostVO>) communityDAO.searchList(SqlSessionTemplate,
				currentPage, recordCountPerPage, searchText, category);
		String pageNavi = communityDAO.getSearchListPageNavi(SqlSessionTemplate, currentPage, recordCountPerPage,
				naviCountPerPage, searchText, category);
		

		
		cpdv.setComList(list);
		cpdv.setPageNavi(pageNavi);
		cpdv.setSearchText(searchText);
		cpdv.setCategory(category);
		
		System.out.println("서비스 : 검색어 : "+cpdv.getSearchText());
		System.out.println("서비스 : 카테고리 : " + cpdv.getCategory());
		System.out.println("서비스 : 콘텐츠 리슽으 : "+list.get(0).getPostContent());
		
		return cpdv;

	// 조회수 카운트
	@Override
	public int postHit(int postIndex) {
		int result = communityDAO.postHit(SqlSessionTemplate,postIndex);
		return result;
	}

}
