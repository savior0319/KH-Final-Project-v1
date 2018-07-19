package spring.kh.diet.model.service;

import java.util.List;

import spring.kh.diet.model.vo.BoardPostVO;

public interface CommunityService {

	List<BoardPostVO> allCommunityList();

	int registCommunity(BoardPostVO bpv);
  
	List<BoardPostVO> beforeAfterList();

	List<BoardPostVO> bulletinBoardList();

	List<BoardPostVO> tipKnowhowBoardList();

	List<BoardPostVO> worryNQnABoardList();
}
