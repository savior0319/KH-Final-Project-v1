package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.MyActivityVO;
import spring.kh.diet.model.vo.QuestionVO;

public interface MyInfoDAO {

	int question(SqlSessionTemplate sqlSessionTemplate, QuestionVO qv);

	int secessionMember(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	int updateMyPicture(MemberVO mv);

	int updateMyInfo(SqlSessionTemplate sqlSessionTemplate, MemberVO memberVO);

	int deleteMyPicture(SqlSessionTemplate sqlSessionTemplate, String mbId);

	MemberVO selectOneMember(SqlSessionTemplate sqlSessionTemplate, MemberVO memberVO);

	ArrayList<QuestionVO> allMyOneToOneQuestion(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	int signupsave(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);
	
	MyActivityVO myActivity(SqlSessionTemplate sqlSessionTemplate, MemberVO m);

	ArrayList<BoardPostVO> allCommunityList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type, MyActivityVO ma);

	String getallCommunityListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type, MyActivityVO ma);

	}
