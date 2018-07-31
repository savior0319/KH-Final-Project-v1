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

	int signupsave(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	MyActivityVO myActivity(SqlSessionTemplate sqlSessionTemplate, MemberVO m);

	int idCheck(SqlSessionTemplate sqlSessionTemplate, String id);

	int nickNameCheck(SqlSessionTemplate sqlSessionTemplate, String nickName);

	ArrayList<BoardPostVO> myPost(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	ArrayList<BoardCommentVO> myComment(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	ArrayList<BoardBookMarkVO> myBookmark(SqlSessionTemplate sqlSessionTemplate, MemberVO mv);

	QuestionVO questionAnswer(SqlSessionTemplate sqlSessionTemplate, QuestionVO qv);

	ArrayList<BoardPostVO> myPostList(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			String type, MyActivityVO ma);

	String myPostListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type, MyActivityVO ma);

	ArrayList<BoardCommentVO> myCommentList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type, MyActivityVO ma);

	String myCommentListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type, MyActivityVO ma);

	ArrayList<BoardBookMarkVO> myBookMarkList(SqlSessionTemplate sqlSessionTemplate, int currentPage,
			int recordCountPerPage, String type, MyActivityVO ma);

	String myBookMarkListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, String type, MyActivityVO ma);

	ArrayList<QuestionVO> myQuestionList(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			MemberVO mv);

	String myQuestionListPageNavi(SqlSessionTemplate sqlSessionTemplate, int currentPage, int recordCountPerPage,
			int naviCountPerPage, MemberVO mv);

	int myLoginCount(SqlSessionTemplate sqlSessionTemplate, MemberVO m);

	int deleteMyQuestion(SqlSessionTemplate sqlSessionTemplate, QuestionVO pv);

	int deleteMyPost(SqlSessionTemplate sqlSessionTemplate, BoardPostVO pv);

	int deleteMyComment(SqlSessionTemplate sqlSessionTemplate, BoardCommentVO pv);

	int deleteMyBookMark(SqlSessionTemplate sqlSessionTemplate, BoardBookMarkVO pv);

}
