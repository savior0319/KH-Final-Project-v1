package spring.kh.diet.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.BoardPostVO;

public interface CommunityDAO {

	List<BoardPostVO> allCommunityList(SqlSessionTemplate sqlSessionTemplate);

	int registCommunity(SqlSessionTemplate sqlSessionTemplate, BoardPostVO bpv);

	List<BoardPostVO> beforeAfterList(SqlSessionTemplate sqlSessionTemplate);

	List<BoardPostVO> bulletinBoardList(SqlSessionTemplate sqlSessionTemplate);

	List<BoardPostVO> tipKnowhowBoardList(SqlSessionTemplate sqlSessionTemplate);

	List<BoardPostVO> worryNQnABoardList(SqlSessionTemplate sqlSessionTemplate);

}
