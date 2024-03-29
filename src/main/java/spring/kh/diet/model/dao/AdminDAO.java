package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.AdvertiseVO;
import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.AnswerVO;
import spring.kh.diet.model.vo.BlackListContentVO;
import spring.kh.diet.model.vo.BlackListRegVO;
import spring.kh.diet.model.vo.DelMemberVO;
import spring.kh.diet.model.vo.ErrorLogVO;
import spring.kh.diet.model.vo.LoginLogVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.NoticeVO;
import spring.kh.diet.model.vo.OffSessionVO;
import spring.kh.diet.model.vo.OnSessionVO;
import spring.kh.diet.model.vo.QuestionVO;
import spring.kh.diet.model.vo.SevenDaysUserVO;
import spring.kh.diet.model.vo.TodayAnalyticsDetail;
import spring.kh.diet.model.vo.TrainingRegVO;
import spring.kh.diet.model.vo.todayCommentsVO;
import spring.kh.diet.model.vo.todayHitsVO;
import spring.kh.diet.model.vo.todayLikeVO;
import spring.kh.diet.model.vo.todayPostVO;
import spring.kh.diet.model.vo.yesterdayAnalytic;
import spring.kh.diet.model.vo.yesterdayAnalyticsPDVO;

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

	todayHitsVO searchHits(SqlSessionTemplate session);

	todayCommentsVO searchComments(SqlSessionTemplate session);

	todayPostVO searchPost(SqlSessionTemplate session);

	todayLikeVO searchLike(SqlSessionTemplate session);

	ArrayList<MemberVO> searchMember(SqlSessionTemplate session);

	ArrayList<DelMemberVO> searchDelMember(SqlSessionTemplate session);

	ArrayList<OnSessionVO> searchOnSession(SqlSessionTemplate session);

	ArrayList<AllSessionVO> searchOffSession(SqlSessionTemplate session);

	void yesterdayInsert(SqlSessionTemplate session, yesterdayAnalyticsPDVO yAPDVO);

	yesterdayAnalytic searchAllBefore(SqlSessionTemplate session);

	int yesterdayAutoInsertBefore(SqlSessionTemplate session);

	ArrayList<OnSessionVO> getOnSessionList(SqlSessionTemplate session);

	ArrayList<MemberVO> memberList(SqlSessionTemplate session);

	ArrayList<DelMemberVO> delmemberList(SqlSessionTemplate session);

	ArrayList<MemberVO> getBlackList(SqlSessionTemplate session, int currentPage, int recordCountPerPage);

	String getBlackListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage);

	int blackListReg(SqlSessionTemplate session, BlackListRegVO bVo);

	ArrayList<BlackListContentVO> blackListContent(SqlSessionTemplate session, int index);

	int yesterdayUpdate(SqlSessionTemplate session, yesterdayAnalyticsPDVO yAPDVO);

	int searchBeforeDayList(SqlSessionTemplate session);

	ArrayList<TodayAnalyticsDetail> TodayAnalyticsDetailList(SqlSessionTemplate session);

	ArrayList<TrainingRegVO> trainerRegList(SqlSessionTemplate session, int currentPage, int recordCountPerPage);

	String getTrainerRegListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage);

	TrainingRegVO trainerRegContents(SqlSessionTemplate session, int trIndex);

	int denyTrainerReg(SqlSessionTemplate session, int trIndex);

	int acceptTrainerReg(SqlSessionTemplate session, int trIndex);

	int changeTrainerGrade(SqlSessionTemplate session, int trIndex);

	ArrayList<TrainingRegVO> trainerChange(SqlSessionTemplate session, int currentPage, int recordCountPerPage);

	String getTrainerChangeListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage);

	ArrayList<ErrorLogVO> todayErrorLogSearch(SqlSessionTemplate session, ErrorLogVO eLVO);

	int changeGrade(SqlSessionTemplate session, int mbIndex);

	int advertiseImageUpload(SqlSessionTemplate session, AdvertiseVO adVo);
  
	ArrayList<ErrorLogVO> todayErrorLogSearchDetail(SqlSessionTemplate session, ErrorLogVO eLVO);

	ArrayList<SevenDaysUserVO> select7Days(SqlSessionTemplate session);

	ArrayList<MemberVO> memberListExcel(SqlSessionTemplate session);

	ArrayList<LoginLogVO> loginLogManage(SqlSessionTemplate session, LoginLogVO vO);

	ArrayList<LoginLogVO> loginLogManageDetail(SqlSessionTemplate session, LoginLogVO vO);

	void insertErrorLog(SqlSessionTemplate session, ErrorLogVO eLVO);


}
