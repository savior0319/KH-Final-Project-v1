package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.MyInfoDAO;
import spring.kh.diet.model.vo.BoardBookMarkVO;
import spring.kh.diet.model.vo.BoardCommentVO;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.MyActivityVO;
import spring.kh.diet.model.vo.MyCommentPageDataVO;
import spring.kh.diet.model.vo.MyPostPageDataVO;
import spring.kh.diet.model.vo.QuestionVO;

@Service("myInfoService")
public class MyInfoServiceImpl implements MyInfoService {

	@Resource(name = "myInfoDAO")
	private MyInfoDAO myInfoDAO;

	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;

	@Override
	public int question(QuestionVO qv) {
		int result = myInfoDAO.question(SqlSessionTemplate, qv);
		return result;
	}

	@Override
	public int secessionMember(MemberVO mv) {
		int result = myInfoDAO.secessionMember(SqlSessionTemplate, mv);
		return result;
	}

	@Override
	public int updateMyPicture(MemberVO mv) {
		int result = myInfoDAO.updateMyPicture(SqlSessionTemplate, mv);
		return result;
	}

	@Override
	public int updateMyInfo(MemberVO memberVO) {
		int result = myInfoDAO.updateMyInfo(SqlSessionTemplate, memberVO);
		return result;
	}

	@Override
	public MemberVO selectOneMember(MemberVO memberVO) {
		MemberVO mv = myInfoDAO.selectOneMember(SqlSessionTemplate, memberVO);
		return mv;
	}

	@Override
	public ArrayList<QuestionVO> allMyOneToOneQuestion(MemberVO mv) {
		ArrayList<QuestionVO> list = myInfoDAO.allMyOneToOneQuestion(SqlSessionTemplate, mv);
		return list;
	}

	@Override
	public int signupsave(MemberVO mv) {
		int result = myInfoDAO.signupsave(SqlSessionTemplate, mv);
		return result;
	}

	@Override
	public MyActivityVO myActivity(MemberVO m) {
		MyActivityVO ma = myInfoDAO.myActivity(SqlSessionTemplate, m);
		return ma;
	}

	@Override
	public int idCheck(String id) {
		int result = myInfoDAO.idCheck(SqlSessionTemplate, id);
		return result;
	}

	@Override
	public int nickNameCheck(String nickName) {
		int result = myInfoDAO.nickNameCheck(SqlSessionTemplate, nickName);
		return result;
	}

	@Override
	public ArrayList<BoardPostVO> myPost(MemberVO mv) {
		ArrayList<BoardPostVO> list = myInfoDAO.myPost(SqlSessionTemplate, mv);
		return list;
	}

	@Override
	public int deleteMyPicture(MemberVO mv) {
		int result = myInfoDAO.deleteMyPicture(SqlSessionTemplate, mv);
		return result;
	}

	@Override
	public ArrayList<BoardCommentVO> myCommnet(MemberVO mv) {
		ArrayList<BoardCommentVO> list = myInfoDAO.myComment(SqlSessionTemplate, mv);
		return list;
	}

	@Override
	public ArrayList<BoardBookMarkVO> myBookmark(MemberVO mv) {
		ArrayList<BoardBookMarkVO> list = myInfoDAO.myBookmark(SqlSessionTemplate, mv);
		return list;
	}

	@Override
	public QuestionVO questionAnswer(QuestionVO qv) {
		QuestionVO answer = myInfoDAO.questionAnswer(SqlSessionTemplate, qv);
		return answer;
	}

	/* 마이페이지 - 내 게시물 정보 페이징 처리 */
	@Override
	public MyPostPageDataVO myPostList(int currentPage, String type, MyActivityVO ma) {
		int recordCountPerPage = 5;
		int naviCountPerPage = 5;

		MyPostPageDataVO myPost = new MyPostPageDataVO();

		ArrayList<BoardPostVO> list = (ArrayList<BoardPostVO>) myInfoDAO.myPostList(SqlSessionTemplate, currentPage,
				recordCountPerPage, type, ma);
		String pageNavi = myInfoDAO.myPostListPageNavi(SqlSessionTemplate, currentPage, recordCountPerPage,
				naviCountPerPage, type, ma);

		myPost.setComList(list);
		myPost.setPageNavi(pageNavi);
		myPost.setType(type);
		return myPost;
	}

	/* 마이페이지 - 작성한 댓글 페이징 처리 */
	@Override
	public MyCommentPageDataVO myCommentList(int currentPage, String type, MyActivityVO ma) {
		int recordCountPerPage = 5;
		int naviCountPerPage = 5;

		MyCommentPageDataVO myComment = new MyCommentPageDataVO();

		ArrayList<BoardCommentVO> list = (ArrayList<BoardCommentVO>) myInfoDAO.myCommentList(SqlSessionTemplate, currentPage,
				recordCountPerPage, type, ma);
		String pageNavi = myInfoDAO.myCommentListPageNavi(SqlSessionTemplate, currentPage, recordCountPerPage,
				naviCountPerPage, type, ma);
		myComment.setComList(list);
		myComment.setPageNavi(pageNavi);
		myComment.setType(type);
		return myComment;
	}

	/* 마이페이지 - 북마크 페이징 처리 */
	@Override
	public MyPostPageDataVO myBookmarkGetList(int currentPage, String type, MyActivityVO ma) {
		int recordCountPerPage = 5;
		int naviCountPerPage = 5;

		MyPostPageDataVO cpdv = new MyPostPageDataVO();

		ArrayList<BoardPostVO> list = (ArrayList<BoardPostVO>) myInfoDAO.myBookMarkGetList(SqlSessionTemplate,
				currentPage, recordCountPerPage, type, ma);
		String pageNavi = myInfoDAO.getMyBookMarkGetListPageNavi(SqlSessionTemplate, currentPage, recordCountPerPage,
				naviCountPerPage, type, ma);

		cpdv.setComList(list);
		cpdv.setPageNavi(pageNavi);
		cpdv.setType(type);
		return cpdv;
	}

}
