package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.BoardBlameVO;
import spring.kh.diet.model.vo.BoardBookMarkVO;
import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.BoardPostVO;

public interface CommunityDAO {

	List<BoardPostVO> allCommunityList(SqlSessionTemplate sqlSessionTemplate);

	int registCommunity(SqlSessionTemplate sqlSessionTemplate, BoardPostVO bpv);

	String getallCommunityListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type, String category, String searchText);

	ArrayList<BoardPostVO> allCommunityList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type);

	String getRecipeListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type);

	ArrayList<BoardPostVO> recipeBoardList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, String type);

	BoardPostVO postedCommunity(SqlSessionTemplate sqlSessionTemplate, int postIndex);

	int deletePost(SqlSessionTemplate sqlSessionTemplate, int postIndex);

	ArrayList<BoardPostVO> viewAllList(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			String type, String postSort, String category, String searchText);

	ArrayList<BoardPostVO> recipeViewList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, int naviCountPerPage, String type, String postSort);

	ArrayList<BoardPostVO> searchList(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			String searchText, String category);

	String getSearchListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String searchText, String category);

	int postHit(SqlSessionTemplate sqlSessionTemplate, int postIndex);

	BoardLikeVO checkBoardLike(SqlSessionTemplate sqlSessionTemplate, BoardLikeVO checkVO);

	int boardLikeDown(SqlSessionTemplate sqlSessionTemplate, BoardLikeVO blv);

	int boardLikeUp(SqlSessionTemplate sqlSessionTemplate, BoardLikeVO checkVO);

	int postLikeDown(SqlSessionTemplate sqlSessionTemplate, BoardLikeVO blv);

	int postLikeUp(SqlSessionTemplate sqlSessionTemplate, BoardLikeVO checkVO);

	BoardBookMarkVO checkBoardBookMark(SqlSessionTemplate sqlSessionTemplate, BoardBookMarkVO bookMarkCheckVO);

	int bookMarkOff(SqlSessionTemplate sqlSessionTemplate, BoardBookMarkVO bbmv);

	int bookMarkOn(SqlSessionTemplate sqlSessionTemplate, BoardBookMarkVO checkVO);

	BoardBlameVO checkPostBlame(SqlSessionTemplate sqlSessionTemplate, BoardBlameVO checkBlame);

	int postReport(SqlSessionTemplate sqlSessionTemplate, BoardBlameVO report);

	int modifyResgistCommunity(SqlSessionTemplate sqlSessionTemplate, BoardPostVO bpv);

	BoardLikeVO checkCommentLike(SqlSessionTemplate sqlSessionTemplate, BoardLikeVO likeCheckVO);

	int commentLikeUp(SqlSessionTemplate sqlSessionTemplate, BoardLikeVO blv);

	int commentTBLikeUp(SqlSessionTemplate sqlSessionTemplate, BoardLikeVO blv);

}
