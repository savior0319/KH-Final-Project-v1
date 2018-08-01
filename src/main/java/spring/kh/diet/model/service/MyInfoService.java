package spring.kh.diet.model.service;

import java.util.ArrayList;

import spring.kh.diet.model.vo.BoardBookMarkVO;
import spring.kh.diet.model.vo.BoardCommentVO;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.MyActivityVO;
import spring.kh.diet.model.vo.MyBookMarkPageDataVO;
import spring.kh.diet.model.vo.MyCommentPageDataVO;
import spring.kh.diet.model.vo.MyPostPageDataVO;
import spring.kh.diet.model.vo.MyQuestionPageDataVO;
import spring.kh.diet.model.vo.MyRequestTrainerPDVO;
import spring.kh.diet.model.vo.QuestionVO;
import spring.kh.diet.model.vo.TrainerProgram;


public interface MyInfoService {

	int question(QuestionVO qv);

	int secessionMember(MemberVO mv);

	int updateMyPicture(MemberVO mv);

	int updateMyInfo(MemberVO memberVO);

	MemberVO selectOneMember(MemberVO memberVO);

	int deleteMyPicture(MemberVO mv);

	MyQuestionPageDataVO allMyOneToOneQuestion(int currentPage, MyActivityVO ma);

	int signupsave(MemberVO mv);

	MyActivityVO myActivity(MemberVO m);

	int idCheck(String id);

	int nickNameCheck(String nickName);

	ArrayList<BoardPostVO> myPost(MemberVO mv);

	ArrayList<BoardCommentVO> myCommnet(MemberVO mv);

	ArrayList<BoardBookMarkVO> myBookmark(MemberVO mv);

	QuestionVO questionAnswer(QuestionVO qv);

	MyPostPageDataVO myPostList(int currentPage, String type, MyActivityVO ma);

	MyCommentPageDataVO myCommentList(int currentPage, String type, MyActivityVO ma);

	MyBookMarkPageDataVO myBookMarkList(int currentPage, String type, MyActivityVO ma);

	int myLoginCount(MemberVO m);

	int deleteMyQuestion(QuestionVO pv);

	int deleteMyPost(BoardPostVO pv);

	int deleteMyComment(BoardCommentVO pv);

	int deleteMyBookMark(BoardBookMarkVO pv);

	MyRequestTrainerPDVO requestTrainer(int currentPage, TrainerProgram tv);

}
