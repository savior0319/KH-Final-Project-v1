package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.AnswerVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.NoticeVO;
import spring.kh.diet.model.vo.OffSessionVO;
import spring.kh.diet.model.vo.QuestionVO;

public interface AdminDAO {

	int noticeRegisterData(SqlSession session, NoticeVO nv);

	ArrayList<MemberVO> memberList(SqlSessionTemplate session, int currentPage, int recordCountPerPage);

	String getMemberListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage);

	String getDeleteMemberListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage);

	ArrayList<MemberVO> deleteMemberList(SqlSessionTemplate session, int currentPage, int recordCountPerPage);

	ArrayList<QuestionVO> answerList(SqlSessionTemplate session, int currentPage, int recordCountPerPage);

	String getAnswerListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage);

	QuestionVO getQuestionContent(SqlSessionTemplate session, int index);

	ArrayList<AllSessionVO> getSessionList(SqlSessionTemplate session, int currentPage, int recordCountPerPage);

	String getSessionListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage);

	int answerReg(SqlSessionTemplate session, AnswerVO avo);

	ArrayList<OffSessionVO> getOfSessionList(SqlSessionTemplate session);

}
