package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.BoardBookMarkVO;
import spring.kh.diet.model.vo.BoardCommentVO;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.MyActivityVO;
import spring.kh.diet.model.vo.QuestionVO;

public interface MyInfoDAO {

	int question(SqlSessionTemplate sqlSessionTemplate, QuestionVO qv);

	int secessionMember(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	int updateMyPicture(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	int updateMyInfo(SqlSessionTemplate sqlSessionTemplate, MemberVO memberVO);

	int deleteMyPicture(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	MemberVO selectOneMember(SqlSessionTemplate sqlSessionTemplate, MemberVO memberVO);

	ArrayList<QuestionVO> allMyOneToOneQuestion(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	int signupsave(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);
	
	MyActivityVO myActivity(SqlSessionTemplate sqlSessionTemplate, MemberVO m);

	ArrayList<BoardPostVO> allCommunityList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type, MyActivityVO ma);

	String getallCommunityListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type, MyActivityVO ma);

	int idCheck(SqlSessionTemplate sqlSessionTemplate, String id);

	int nickNameCheck(SqlSessionTemplate sqlSessionTemplate, String nickName);

	ArrayList<BoardPostVO> myPost(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	ArrayList<BoardCommentVO> myComment(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	ArrayList<BoardBookMarkVO> myBookmark(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	ArrayList<BoardPostVO> myBookMarkGetList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type, MyActivityVO ma);

	ArrayList<BoardPostVO> getCurrentPage(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, MyActivityVO ma);

	String getMyBookMarkGetListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type, MyActivityVO ma);

	ArrayList<BoardPostVO> myCommentGetList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type, MyActivityVO ma);

	String getMyCommentListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type, MyActivityVO ma);


}

