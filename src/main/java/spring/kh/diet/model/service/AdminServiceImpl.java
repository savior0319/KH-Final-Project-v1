package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.AdminDAO;
import spring.kh.diet.model.vo.AdvertiseVO;
import spring.kh.diet.model.vo.AllSessionListPDVO;
import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.AnswerVO;
import spring.kh.diet.model.vo.BlackListContentVO;
import spring.kh.diet.model.vo.BlackListRegVO;
import spring.kh.diet.model.vo.DelMemberVO;
import spring.kh.diet.model.vo.ErrorLogVO;
import spring.kh.diet.model.vo.MemberListPDVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.NoticeVO;
import spring.kh.diet.model.vo.OffSessionVO;
import spring.kh.diet.model.vo.OnSessionVO;
import spring.kh.diet.model.vo.QuestionAnswerPDVO;
import spring.kh.diet.model.vo.QuestionVO;
import spring.kh.diet.model.vo.TodayAnalyticsDetail;
import spring.kh.diet.model.vo.TrainingRegPageDataVO;
import spring.kh.diet.model.vo.TrainingRegVO;
import spring.kh.diet.model.vo.todayCommentsVO;
import spring.kh.diet.model.vo.todayHitsVO;
import spring.kh.diet.model.vo.todayLikeVO;
import spring.kh.diet.model.vo.todayPostVO;
import spring.kh.diet.model.vo.yesterdayAnalytic;
import spring.kh.diet.model.vo.yesterdayAnalyticsPDVO;

@SuppressWarnings("all")
@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Resource(name = "adminDAO")
	private AdminDAO aDao;

	@Autowired
	private SqlSessionTemplate session;

	public AdminServiceImpl() {
	}

	@Override
	public int noticeRegisterData(NoticeVO nv) {
		int result = aDao.noticeRegisterData(session, nv);
		return result;
	}

	/* 전체 회원 조회 */
	@Override
	public MemberListPDVO getMemberList(int currentPage) {
		int recordCountPerPage = 15;
		int naviCountPerPage = 5;

		MemberListPDVO mbPd = new MemberListPDVO();

		ArrayList<MemberVO> list = aDao.memberList(session, currentPage, recordCountPerPage);

		String pageNavi = aDao.getMemberListPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage);

		mbPd.setMbList(list);
		mbPd.setPageNavi(pageNavi);

		return mbPd;
	}

	/* 탈퇴 회원 조회 */
	@Override
	public MemberListPDVO getDeleteMemberList(int currentPage) {
		int recordCountPerPage = 20;
		int naviCountPerPage = 5;

		MemberListPDVO mbPd = new MemberListPDVO();

		ArrayList<MemberVO> list = aDao.deleteMemberList(session, currentPage, recordCountPerPage);

		String pageNavi = aDao.getDeleteMemberListPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage);

		mbPd.setMbList(list);
		mbPd.setPageNavi(pageNavi);

		return mbPd;
	}

	/* 1:1문의 리스트 */
	@Override
	public QuestionAnswerPDVO getAnswerList(int currentPage) {
		int recordCountPerPage = 20;
		int naviCountPerPage = 5;

		QuestionAnswerPDVO qpd = new QuestionAnswerPDVO();

		ArrayList<QuestionVO> list = aDao.answerList(session, currentPage, recordCountPerPage);

		String pageNavi = aDao.getAnswerListPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage);

		qpd.setQList(list);
		qpd.setPageNavi(pageNavi);

		return qpd;
	}

	/* 1:1문의 내용 가져오기 */
	@Override
	public QuestionVO getQuestionContent(int index) {
		QuestionVO qData = aDao.getQuestionContent(session, index);
		return qData;
	}

	@Override
	public AllSessionListPDVO getSessionList(int currentPage) {
		int recordCountPerPage = 5;
		int naviCountPerPage = 5;

		AllSessionListPDVO ASLPDVO = new AllSessionListPDVO();

		ArrayList<AllSessionVO> list = aDao.getSessionList(session, currentPage, recordCountPerPage);

		String pageNavi = aDao.getSessionListPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage);

		ASLPDVO.setSsList(list);
		ASLPDVO.setPageNavi(pageNavi);
		return ASLPDVO;
	}

	/* 1:1문의 답변하기 */
	@Override
	public int answerReg(AnswerVO avo) {
		int result = aDao.answerReg(session, avo);
		return result;
	}

	@Override
	public ArrayList<OffSessionVO> getOfSesssionList() {

		ArrayList<OffSessionVO> list = aDao.getOfSessionList(session);

		return list;
	}

	@Override
	public todayHitsVO searchHits() {

		todayHitsVO tHVO = aDao.searchHits(session);

		return tHVO;
	}

	@Override
	public todayCommentsVO searchComments() {

		todayCommentsVO tCVO = aDao.searchComments(session);
		return tCVO;
	}

	@Override
	public todayPostVO searchPost() {
		todayPostVO tPVO = aDao.searchPost(session);
		return tPVO;
	}

	@Override
	public todayLikeVO searchLike() {
		todayLikeVO tLVO = aDao.searchLike(session);
		return tLVO;
	}

	@Override
	public ArrayList<MemberVO> searchMember() {
		ArrayList<MemberVO> list = aDao.searchMember(session);
		return list;
	}

	@Override
	public ArrayList<DelMemberVO> searchDelMember() {
		ArrayList<DelMemberVO> list = aDao.searchDelMember(session);
		return list;
	}

	@Override
	public ArrayList<OnSessionVO> searchOnSession() {
		ArrayList<OnSessionVO> list = aDao.searchOnSession(session);
		return list;
	}

	@Override
	public ArrayList<AllSessionVO> searchOffSession() {
		ArrayList<AllSessionVO> list = aDao.searchOffSession(session);
		return list;
	}

	@Override
	public void yesterdayInsert(yesterdayAnalyticsPDVO yAPDVO) {
		aDao.yesterdayInsert(session, yAPDVO);

	}

	@Override
	public yesterdayAnalytic searchAllBefore() {
		yesterdayAnalytic yAPDVO = aDao.searchAllBefore(session);
		return yAPDVO;
	}

	@Override
	public int yesterdayAutoInsertBefore() {
		int result = aDao.yesterdayAutoInsertBefore(session);
		return result;
	}

	@Override
	public ArrayList<OnSessionVO> getOnSessionList() {
		ArrayList<OnSessionVO> list = aDao.getOnSessionList(session);
		return list;
	}

	@Override
	public ArrayList<MemberVO> memberList() {
		ArrayList<MemberVO> list = aDao.memberList(session);
		return list;
	}

	@Override
	public ArrayList<DelMemberVO> delmemberList() {
		ArrayList<DelMemberVO> list = aDao.delmemberList(session);
		return list;
	}

	/* 블랙 리스트 페이징 */
	@Override
	public MemberListPDVO getBlackList(int currentPage) {
		int recordCountPerPage = 20;
		int naviCountPerPage = 5;

		MemberListPDVO mbPd = new MemberListPDVO();

		ArrayList<MemberVO> list = aDao.getBlackList(session, currentPage, recordCountPerPage);

		String pageNavi = aDao.getBlackListPageNavi(session, currentPage, recordCountPerPage, naviCountPerPage);

		mbPd.setMbList(list);
		mbPd.setPageNavi(pageNavi);

		return mbPd;
	}

	/* 블랙리스트 변경 */
	@Override
	public int blackListReg(BlackListRegVO bVo) {
		int result = aDao.blackListReg(session, bVo);
		return result;
	}

	/* 블랙리스트 신고 내역 */
	@Override
	public ArrayList<BlackListContentVO> blackListContent(int index) {
		ArrayList<BlackListContentVO> list = aDao.blackListContent(session, index);
		return list;
	}

	@Override
	public void yesterdayUpdate(yesterdayAnalyticsPDVO yAPDVO) {
		int result = aDao.yesterdayUpdate(session,yAPDVO);
		
	}

	@Override
	public int searchBeforeDayList() {
		int result = aDao.searchBeforeDayList(session);
		
		return result;
	}


	@Override
	public ArrayList<TodayAnalyticsDetail> TodayAnalyticsDetailList() {
		ArrayList<TodayAnalyticsDetail> list = aDao.TodayAnalyticsDetailList(session);
		return list;
	}

	//트레이너 등급으로 전환 신청
	@Override
	public TrainingRegPageDataVO trainerRegList(int currentPage) {
		int recordCountPerPage = 15;
		int naviCountPerPage = 5;

		TrainingRegPageDataVO trpdv =  new TrainingRegPageDataVO();

		ArrayList<TrainingRegVO> list = (ArrayList<TrainingRegVO>) aDao.trainerRegList(session,
				currentPage, recordCountPerPage);
		String pageNavi = aDao.getTrainerRegListPageNavi(session, currentPage, recordCountPerPage,
				naviCountPerPage);
		
		trpdv.setTrList(list);
		trpdv.setPageNavi(pageNavi);

		return trpdv;
	}

	// 트레이너 등급 신청 회원 등록된 글 들어가는 곳
	@Override
	public TrainingRegVO trainerRegContents(int trIndex) {
		TrainingRegVO trv = aDao.trainerRegContents(session, trIndex);
		return trv;
	}

	// 트레이너 등급 신청 회원 거절
	@Override
	public int denyTrainerReg(int trIndex) {
		
		return aDao.denyTrainerReg(session, trIndex);
	}

	// 트레이너 등급 신청 승인
	@Override
	public int acceptTrainerReg(int trIndex) {
		return aDao.acceptTrainerReg(session, trIndex);
	}

	//트레이너로 등급 변경
	@Override
	public int changeTrainerGrade(int trIndex) {
		return aDao.changeTrainerGrade(session, trIndex);
	}

	//트레이너 회원 관리
	@Override
	public TrainingRegPageDataVO trainerChange(int currentPage) {
		int recordCountPerPage = 15;
		int naviCountPerPage = 5;

		TrainingRegPageDataVO trpdv =  new TrainingRegPageDataVO();

		ArrayList<TrainingRegVO> list = (ArrayList<TrainingRegVO>) aDao.trainerChange(session,
				currentPage, recordCountPerPage);
		String pageNavi = aDao.getTrainerChangeListPageNavi(session, currentPage, recordCountPerPage,
				naviCountPerPage);

		
		trpdv.setTrList(list);
		trpdv.setPageNavi(pageNavi);

		return trpdv;
	}

	// 에러로그 페이지 - 일반
	@Override
	public ArrayList<ErrorLogVO> todayErrorLogSearch(ErrorLogVO eLVO) {
		ArrayList<ErrorLogVO> list = aDao.todayErrorLogSearch(session,eLVO);
		return list;
  }

	//트레이넝회원에서 일반회원으로 전환
	@Override
	public int changeGrade(int mbIndex) {
		return aDao.changeGrade(session, mbIndex);

	}
	//에러로그 페이지 - 상세
	@Override
	public ArrayList<ErrorLogVO> todayErrorLogSearchDetail(ErrorLogVO eLVO) {
		ArrayList<ErrorLogVO> list = aDao.todayErrorLogSearchDetail(session,eLVO);
		return list;
	}
  
	/* 광고 DB 업로드 */ 
	@Override
	public void advertiseImageUpload(AdvertiseVO adVo) {
		aDao.advertiseImageUpload(session, adVo);
	}

}

