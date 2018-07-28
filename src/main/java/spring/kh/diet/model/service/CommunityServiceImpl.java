package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.CommunityDAO;
import spring.kh.diet.model.vo.BoardBlameVO;
import spring.kh.diet.model.vo.BoardBookMarkVO;
import spring.kh.diet.model.vo.BoardLikeVO;
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
				naviCountPerPage, type, "","");

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

	// 등록된 글 들어가는 곳
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

	// 최신순 | 조회순 출력 : 전체, 자유, 팁&노하우, 고민&질문, 비포&애프터 게시판 페이징 처리 출력
	@Override
	public CommunityPageDataVO viewAllList(int currentPage, String type, String postSort, String category,
			String searchText) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		CommunityPageDataVO cpdv = new CommunityPageDataVO();

		ArrayList<BoardPostVO> list = (ArrayList<BoardPostVO>) communityDAO.viewAllList(SqlSessionTemplate, currentPage,
				recordCountPerPage, type, postSort, category, searchText);
		String pageNavi = communityDAO.getallCommunityListPageNavi(SqlSessionTemplate, currentPage, recordCountPerPage,
				naviCountPerPage, type, category, searchText);

		cpdv.setComList(list);
		cpdv.setPageNavi(pageNavi);
		cpdv.setType(type);
		return cpdv;
	}

	// 최신순 | 조회순 출력 : 레시피&식단
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

	//검색
	@Override
	public CommunityPageDataVO searchList(int currentPage, String searchText, String category) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 5;

		CommunityPageDataVO cpdv = new CommunityPageDataVO();

		ArrayList<BoardPostVO> list = (ArrayList<BoardPostVO>) communityDAO.searchList(SqlSessionTemplate, currentPage,
				recordCountPerPage, searchText, category);
		String pageNavi = communityDAO.getSearchListPageNavi(SqlSessionTemplate, currentPage, recordCountPerPage,
				naviCountPerPage, searchText, category);

		cpdv.setComList(list);
		cpdv.setPageNavi(pageNavi);
		cpdv.setSearchText(searchText);
		cpdv.setCategory(category);

		return cpdv;
	}

	// 조회수 카운트
	@Override
	public int postHit(int postIndex) {
		int result = communityDAO.postHit(SqlSessionTemplate, postIndex);
		return result;
	}

	// 좋아요를 한 게시물인지 체크
	@Override
	public BoardLikeVO checkBoardLike(BoardLikeVO checkVO) {
		BoardLikeVO blv = communityDAO.checkBoardLike(SqlSessionTemplate, checkVO);
		return blv;
	}
	// 좋아요 테이블 좋아요 delete 로직
	@Override
	public int boardLikeDown(BoardLikeVO blv) {
		int result = communityDAO.boardLikeDown(SqlSessionTemplate, blv);
		return result;
	}
	// 좋아요테이블 좋아요 insert 로직
	@Override
	public int boardLikeUp(BoardLikeVO checkVO) {
		int result = communityDAO.boardLikeUp(SqlSessionTemplate, checkVO);
		return result;
	}
	// 게시글테이블 좋아요 down 업데이트 로직
	@Override
	public int postLikeDown(BoardLikeVO blv) {
		int result = communityDAO.postLikeDown(SqlSessionTemplate, blv);
		return result;
	}
	// 게시글테이블 좋아요 up 업데이트 로직 로직
	@Override
	public int postLikeUp(BoardLikeVO checkVO) {
		int result = communityDAO.postLikeUp(SqlSessionTemplate, checkVO);
		return result;
	}
	// 게시글 북마크 체크 로직
	@Override
	public BoardBookMarkVO checkBoardBookMark(BoardBookMarkVO bookMarkCheckVO) {
		BoardBookMarkVO bbmv = communityDAO.checkBoardBookMark(SqlSessionTemplate,bookMarkCheckVO);
		return bbmv;
	}
	// 북마크테이블 북마크 delete 로직
	@Override
	public int boardBookMarkOff(BoardBookMarkVO bbmv) {
		int result = communityDAO.bookMarkOff(SqlSessionTemplate,bbmv);
		return result;
	}
	// 북마크테이블 북마크 insert 로직
	@Override
	public int boardBookMarkOn(BoardBookMarkVO checkVO) {
		int result = communityDAO.bookMarkOn(SqlSessionTemplate,checkVO);
		return result;
	}

	@Override
	public int postReport(BoardBlameVO report) {
		int result = communityDAO.postReport(SqlSessionTemplate,report);
		return result;
	}

	@Override
	public BoardBlameVO checkPostBlame(BoardBlameVO checkBlame) {
		BoardBlameVO bbv = communityDAO.checkPostBlame(SqlSessionTemplate,checkBlame);
		return bbv;
	}
}
