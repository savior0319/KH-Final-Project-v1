package spring.kh.diet.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.CommunityDAO;
import spring.kh.diet.model.vo.BoardPostVO;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService {

	@Resource(name = "communityDAO")
	private CommunityDAO communityDAO;

	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;

	// 커뮤니티 전체 게시판
	@Override
	public List<BoardPostVO> allCommunityList() {
		List<BoardPostVO> list = communityDAO.allCommunityList(SqlSessionTemplate);
		return list;
	}

	// 비포&애프터 게시판
	@Override
	public List<BoardPostVO> beforeAfterList() {
		List<BoardPostVO> list = communityDAO.beforeAfterList(SqlSessionTemplate);
		return list;
	}

	// 자유게시판
	@Override
	public List<BoardPostVO> bulletinBoardList() {
		List<BoardPostVO> list = communityDAO.bulletinBoardList(SqlSessionTemplate);
		return list;
	}

	@Override
	public int registCommunity(BoardPostVO bpv) {
		int result = communityDAO.registCommunity(SqlSessionTemplate, bpv);
		return result;
	}

	// 팁& 노하우
	@Override
	public List<BoardPostVO> tipKnowhowBoardList() {
		List<BoardPostVO> list = communityDAO.tipKnowhowBoardList(SqlSessionTemplate);
		return list;
	}

	// 고민& 질문
	@Override
	public List<BoardPostVO> worryNQnABoardList() {
		List<BoardPostVO> list = communityDAO.worryNQnABoardList(SqlSessionTemplate);
		return list;
	}

}
