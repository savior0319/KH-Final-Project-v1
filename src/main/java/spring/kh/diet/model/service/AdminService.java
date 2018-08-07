package spring.kh.diet.model.service;

import java.util.ArrayList;

import spring.kh.diet.model.vo.AdvertiseVO;
import spring.kh.diet.model.vo.AllSessionListPDVO;
import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.AnswerVO;
import spring.kh.diet.model.vo.BlackListContentVO;
import spring.kh.diet.model.vo.BlackListRegVO;
import spring.kh.diet.model.vo.DelMemberVO;
import spring.kh.diet.model.vo.ErrorLogVO;
import spring.kh.diet.model.vo.LoginLogVO;
import spring.kh.diet.model.vo.MemberListPDVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.NoticeVO;
import spring.kh.diet.model.vo.OffSessionVO;
import spring.kh.diet.model.vo.OnSessionVO;
import spring.kh.diet.model.vo.QuestionAnswerPDVO;
import spring.kh.diet.model.vo.QuestionVO;
import spring.kh.diet.model.vo.SevenDaysUserVO;
import spring.kh.diet.model.vo.TodayAnalyticsDetail;
import spring.kh.diet.model.vo.TrainingRegPageDataVO;
import spring.kh.diet.model.vo.TrainingRegVO;
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

	ArrayList<OnSessionVO> getOnSessionList();

	ArrayList<MemberVO> memberList();

	ArrayList<DelMemberVO> delmemberList();

	MemberListPDVO getBlackList(int currentPage);

	int blackListReg(BlackListRegVO bVo);

	ArrayList<BlackListContentVO> blackListContent(int index);

	void yesterdayUpdate(yesterdayAnalyticsPDVO yAPDVO);

	int searchBeforeDayList();

	ArrayList<TodayAnalyticsDetail> TodayAnalyticsDetailList();

	TrainingRegPageDataVO trainerRegList(int currentPage);

	TrainingRegVO trainerRegContents(int trIndex);

	int denyTrainerReg(int trIndex);

	int acceptTrainerReg(int trIndex);

	int changeTrainerGrade(int trIndex);

	TrainingRegPageDataVO trainerChange(int currentPage);

	ArrayList<ErrorLogVO> todayErrorLogSearch(ErrorLogVO eLVO);

	int changeGrade(int mbIndex);

	void advertiseImageUpload(AdvertiseVO adVo);

	ArrayList<SevenDaysUserVO> select7Days();
  
	ArrayList<ErrorLogVO> todayErrorLogSearchDetail(ErrorLogVO eLVO);

	ArrayList<MemberVO> memberListExcel();

	ArrayList<LoginLogVO> loginLogManage(LoginLogVO lLVO);

	ArrayList<LoginLogVO> loginLogManageDetail(LoginLogVO lLVO);
  
}
