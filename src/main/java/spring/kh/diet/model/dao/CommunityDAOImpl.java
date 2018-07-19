package spring.kh.diet.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.BoardPostVO;

@Repository(value = "communityDAO")
public class CommunityDAOImpl implements CommunityDAO {

	public CommunityDAOImpl() {

	}

	// 커뮤니티 전체 게시판
	@Override
	public List<BoardPostVO> allCommunityList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("community.allCommunityList");
	}

	@Override
	public int registCommunity(SqlSessionTemplate sqlSessionTemplate, BoardPostVO bpv) {
		int result = sqlSessionTemplate.insert("community.registCommunity", bpv);
		return result;
	}

	// 비포&애프터 게시판
	@Override
	public List<BoardPostVO> beforeAfterList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("community.beforeAfterList");
	}

	// 자유게시판
	@Override
	public List<BoardPostVO> bulletinBoardList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("community.bulletinBoardList");
	}

	@Override
	public List<BoardPostVO> tipKnowhowBoardList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("community.tipKnowhowBoardList");
	}

	// 고민&질문
	@Override
	public List<BoardPostVO> worryNQnABoardList(SqlSessionTemplate sqlSessionTemplate) {
		return sqlSessionTemplate.selectList("community.worryNQnABoardList");
	}
}
