package spring.kh.diet.model.service;

import java.util.ArrayList;

import spring.kh.diet.model.vo.AllSessionListPDVO;
import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.AnswerVO;
import spring.kh.diet.model.vo.BlackListRegVO;
import spring.kh.diet.model.vo.DelMemberVO;
import spring.kh.diet.model.vo.MemberListPDVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.NoticeVO;
import spring.kh.diet.model.vo.OffSessionVO;
import spring.kh.diet.model.vo.OnSessionVO;
import spring.kh.diet.model.vo.QuestionAnswerPDVO;
import spring.kh.diet.model.vo.QuestionVO;
import spring.kh.diet.model.vo.todayCommentsVO;
import spring.kh.diet.model.vo.todayHitsVO;
import spring.kh.diet.model.vo.todayLikeVO;
import spring.kh.diet.model.vo.todayPostVO;
import spring.kh.diet.model.vo.yesterdayAnalytic;
import spring.kh.diet.model.vo.yesterdayAnalyticsPDVO;

public interface AdminService {

	int noticeRegisterData(NoticeVO nv);

	MemberListPDVO getMemberList(int currentPage);

	MemberListPDVO getDeleteMemberList(int currentPage);

	QuestionAnswerPDVO getAnswerList(int currentPage);

	QuestionVO getQuestionContent(int index);

	AllSessionListPDVO getSessionList(int currentPage);

	int answerReg(AnswerVO avo);

	ArrayList<OffSessionVO> getOfSesssionList();

	todayHitsVO searchHits();

	todayCommentsVO searchComments();

	todayPostVO searchPost();

	todayLikeVO searchLike();

	ArrayList<MemberVO> searchMember();

	ArrayList<DelMemberVO> searchDelMember();

	ArrayList<OnSessionVO> searchOnSession();

	ArrayList<AllSessionVO> searchOffSession();

	void yesterdayInsert(yesterdayAnalyticsPDVO yAPDVO);

	yesterdayAnalytic searchAllBefore();

	int yesterdayAutoInsertBefore();

	MemberListPDVO getBlackList(int currentPage);

	int blackListReg(BlackListRegVO bVo);

}
