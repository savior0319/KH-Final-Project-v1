package spring.kh.diet.model.service;

import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.CommunityPageDataVO;

public interface CommunityService {


	int registCommunity(BoardPostVO bpv);
  
	CommunityPageDataVO allCommunityList(int currentPage, String type);

	CommunityPageDataVO recipeBoardList(int currentPage, String type);

	BoardPostVO postedCommunity(int postIndex);

	int deletePost(int postIndex);

	CommunityPageDataVO viewAllList(int currentPage, String type, String postSort);

	CommunityPageDataVO recipeViewList(int currentPage, String type);


}
