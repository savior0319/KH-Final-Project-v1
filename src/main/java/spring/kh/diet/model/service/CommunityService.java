package spring.kh.diet.model.service;

import java.util.ArrayList;

import spring.kh.diet.model.vo.BoardBlameVO;
import spring.kh.diet.model.vo.BoardBookMarkVO;
import spring.kh.diet.model.vo.BoardLikeVO;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.CommunityPageDataVO;
import spring.kh.diet.model.vo.NoticeVO;

public interface CommunityService {

	int registCommunity(BoardPostVO bpv);
  
	CommunityPageDataVO allCommunityList(int currentPage, String type);

	CommunityPageDataVO recipeBoardList(int currentPage, String type);

	BoardPostVO postedCommunity(int postIndex);

	int deletePost(int postIndex);

	CommunityPageDataVO recipeViewList(int currentPage, String type, String postSort);

	CommunityPageDataVO searchList(int currentPage, String searchText, String category);

	CommunityPageDataVO viewAllList(int currentPage, String type, String postSort, String category,
			String searchText);

	int postHit(int postIndex);

	BoardLikeVO checkBoardLike(BoardLikeVO checkVO);

	int boardLikeDown(BoardLikeVO blv);

	int boardLikeUp(BoardLikeVO checkVO);

	int postLikeDown(BoardLikeVO blv);

	int postLikeUp(BoardLikeVO checkVO);

	BoardBookMarkVO checkBoardBookMark(BoardBookMarkVO bookMarkCheckVO);

	int boardBookMarkOff(BoardBookMarkVO bbmv);

	int boardBookMarkOn(BoardBookMarkVO checkVO);

	int postReport(BoardBlameVO report);

	BoardBlameVO checkPostBlame(BoardBlameVO checkBlame);

	int modifyRegistCommunity(BoardPostVO bpv);

	BoardLikeVO checkCommnetLike(BoardLikeVO likeCheckVO);

	int commentLikeUp(BoardLikeVO blv);

	int commentTBLikeUp(BoardLikeVO blv);

	ArrayList<NoticeVO> noticeList(String type);


}
