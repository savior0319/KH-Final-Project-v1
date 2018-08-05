package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.AllSessionListPDVO;
import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.AnswerVO;
import spring.kh.diet.model.vo.BlackListContentVO;
import spring.kh.diet.model.vo.BlackListRegVO;
import spring.kh.diet.model.vo.BoardPostVO;
import spring.kh.diet.model.vo.CommunityPageDataVO;
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
@Repository(value = "adminDAO")
public class AdminDAOImpl implements AdminDAO {

	public AdminDAOImpl() {
	}

	@Override
	public int noticeRegisterData(SqlSession session, NoticeVO nv) {
		int result = session.insert("admin.noticeRegisterData", nv);
		return result;
	}

	/* 관리자 전체 회원 리스트 */
	@Override
	public ArrayList<MemberVO> memberList(SqlSessionTemplate session, int currentPage, int recordCountPerPage) {

		MemberListPDVO mDataVo = new MemberListPDVO();

		mDataVo.setStart((currentPage - 1) * recordCountPerPage + 1);
		mDataVo.setEnd(currentPage * recordCountPerPage);

		List<MemberVO> list = session.selectList("admin.getMemberList", mDataVo);

		return (ArrayList<MemberVO>) list;

	}

	/* 관리자 전체 회원 리스트 - 네비게이션 */
	@Override
	public String getMemberListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage) {

		MemberListPDVO mDataVo = new MemberListPDVO();

		int recordTotalCount = session.selectOne("admin.getMemberNavi", mDataVo);

		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1);

		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if (needPrev) {
			sb.append("<a class='item' href='/memberList.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/memberList.diet?currentPage="
								+ i + "'>  " + i + " </a>");
			} else {
				sb.append("<a class='item' href='/memberList.diet?currentPage=" + i + "'> " + i + " </a>");
			}
		}
		if (needNext) {
			sb.append("<a class='item' href='/healthCenter.diet?currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}

		return sb.toString();
	}

	/* 관리자 탈퇴 회원 조회 리스트 */
	@Override
	public ArrayList<MemberVO> deleteMemberList(SqlSessionTemplate session, int currentPage, int recordCountPerPage) {

		MemberListPDVO mDataVo = new MemberListPDVO();

		mDataVo.setStart((currentPage - 1) * recordCountPerPage + 1);
		mDataVo.setEnd(currentPage * recordCountPerPage);

		List<MemberVO> list = session.selectList("admin.getDeleteMemberList", mDataVo);

		return (ArrayList<MemberVO>) list;

	}

	/* 관리자 탈퇴 회원 리스트 - 네비게이션 */
	@Override
	public String getDeleteMemberListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage) {

		MemberListPDVO mDataVo = new MemberListPDVO();

		int recordTotalCount = session.selectOne("admin.getDeleteMemberNavi", mDataVo);

		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1);

		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if (needPrev) {
			sb.append("<a class='item' href='/deleteMemberList.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/deleteMemberList.diet?currentPage="
								+ i + "'>  " + i + " </a>");
			} else {
				sb.append("<a class='item' href='/deleteMemberList.diet?currentPage=" + i + "'> " + i + " </a>");
			}
		}
		if (needNext) {
			sb.append("<a class='item' href='/deleteMemberList.diet?currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}

		return sb.toString();
	}

	/* 1:1문의 리스트 */
	@Override
	public ArrayList<QuestionVO> answerList(SqlSessionTemplate session, int currentPage, int recordCountPerPage) {
		QuestionAnswerPDVO qDataVo = new QuestionAnswerPDVO();

		qDataVo.setStart((currentPage - 1) * recordCountPerPage + 1);
		qDataVo.setEnd(currentPage * recordCountPerPage);

		List<QuestionVO> list = session.selectList("admin.getAnswerList", qDataVo);

		return (ArrayList<QuestionVO>) list;
	}

	/* 1:1문의 네비게이션 */
	@Override
	public String getAnswerListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage) {

		QuestionAnswerPDVO qPdvo = new QuestionAnswerPDVO();

		int recordTotalCount = session.selectOne("admin.getAnserListNavi", qPdvo);

		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1);

		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if (needPrev) {
			sb.append("<a class='item' href='/answer.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/answer.diet?currentPage="
								+ i + "'>  " + i + " </a>");
			} else {
				sb.append("<a class='item' href='/answer.diet?currentPage=" + i + "'> " + i + " </a>");
			}
		}
		if (needNext) {
			sb.append("<a class='item' href='/answer.diet?currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}

		return sb.toString();
	}

	/* 관리자 - 1:1 문의 내용 가져오기 */
	@Override
	public QuestionVO getQuestionContent(SqlSessionTemplate session, int index) {
		QuestionVO qData = session.selectOne("admin.getQuestionContent", index);
		return qData;
	}

	@Override
	public ArrayList<AllSessionVO> getSessionList(SqlSessionTemplate session, int currentPage, int recordCountPerPage) {
		AllSessionListPDVO ASVPD = new AllSessionListPDVO();

		ASVPD.setStart((currentPage - 1) * recordCountPerPage + 1);
		ASVPD.setEnd(currentPage * recordCountPerPage);

		List<AllSessionVO> list = session.selectList("admin.getSessionList", ASVPD);
		return (ArrayList<AllSessionVO>) list;
	}

	@Override
	public String getSessionListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage) {
		AllSessionListPDVO ASLPDVO = new AllSessionListPDVO();

		int recordTotalCount = session.selectOne("admin.getSessionListPageNavi", ASLPDVO);

		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1);

		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if (needPrev) {
			sb.append("<a class='item' href='/currentLoginUser.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/currentLoginUser.diet?currentPage="
								+ i + "'>  " + i + " </a>");
			} else {
				sb.append("<a class='item' href='/currentLoginUser.diet?currentPage=" + i + "'> " + i + " </a>");
			}
		}
		if (needNext) {
			sb.append("<a class='item' href='/currentLoginUser.diet?currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}
		return sb.toString();
	}

	/* 관리자 - 1:1 문의 답변 */
	@Override
	public int answerReg(SqlSessionTemplate session, AnswerVO avo) {
		int check = session.update("admin.anserRegCheck", avo);
		int result = session.insert("admin.answerReg", avo);
		if (check == 1 && result == 1) {
			return result;
		} else {
			return 0;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<OffSessionVO> getOfSessionList(SqlSessionTemplate session) {

		List<?> list = session.selectList("admin.selectOffSessionList");

		return (ArrayList<OffSessionVO>) list;
	}

	@Override
	public todayHitsVO searchHits(SqlSessionTemplate session) {
		todayHitsVO tHVO = session.selectOne("admin.searchHits");
		return tHVO;
	}

	@Override
	public todayCommentsVO searchComments(SqlSessionTemplate session) {
		todayCommentsVO tCVO = session.selectOne("admin.searchComments");
		return tCVO;
	}

	@Override
	public todayPostVO searchPost(SqlSessionTemplate session) {
		todayPostVO tPVO = session.selectOne("admin.searchPost");
		return tPVO;
	}

	@Override
	public todayLikeVO searchLike(SqlSessionTemplate session) {
		todayLikeVO tLVO = session.selectOne("admin.searchLike");
		return tLVO;
	}

	@Override
	public ArrayList<MemberVO> searchMember(SqlSessionTemplate session) {
		List<?> list = session.selectList("admin.searchMember");
		return (ArrayList<MemberVO>) list;
	}

	@Override
	public ArrayList<DelMemberVO> searchDelMember(SqlSessionTemplate session) {
		List<?> list = session.selectList("admin.searchDelMember");
		return (ArrayList<DelMemberVO>) list;
	}

	@Override
	public ArrayList<OnSessionVO> searchOnSession(SqlSessionTemplate session) {
		List<?> list = session.selectList("admin.searchOnSession");
		return (ArrayList<OnSessionVO>) list;
	}

	@Override
	public ArrayList<AllSessionVO> searchOffSession(SqlSessionTemplate session) {
		List<?> list = session.selectList("admin.searchOffSession");
		return (ArrayList<AllSessionVO>) list;
	}

	@Override
	public void yesterdayInsert(SqlSessionTemplate session, yesterdayAnalyticsPDVO yAPDVO) {

		int result = session.insert("admin.yesterdayInsert", yAPDVO);

	}

	@Override
	public yesterdayAnalytic searchAllBefore(SqlSessionTemplate session) {
		yesterdayAnalytic yAPDVO = session.selectOne("admin.searchAllBefore");
		return yAPDVO;
	}

	@Override
	public int yesterdayAutoInsertBefore(SqlSessionTemplate session) {
		int result = 0;
		if (session.selectOne("admin.yesterdayAutoInsertBefore") != null) {
			result = 1;
		}
		return result;
	}

	@Override
	public ArrayList<OnSessionVO> getOnSessionList(SqlSessionTemplate session) {
		List<?> list = session.selectList("admin.getOnSessionList");
		return (ArrayList<OnSessionVO>) list;
	}

	@Override
	public ArrayList<MemberVO> memberList(SqlSessionTemplate session) {
		List<?> list = session.selectList("admin.memberList");
		return (ArrayList<MemberVO>) list;
	}

	@Override
	public ArrayList<DelMemberVO> delmemberList(SqlSessionTemplate session) {
		List<?> list = session.selectList("admin.delmemberList");
		return (ArrayList<DelMemberVO>) list;
	}

	/* 블랙리스트 맴버 */
	@Override
	public ArrayList<MemberVO> getBlackList(SqlSessionTemplate session, int currentPage, int recordCountPerPage) {
		MemberListPDVO mDataVo = new MemberListPDVO();

		mDataVo.setStart((currentPage - 1) * recordCountPerPage + 1);
		mDataVo.setEnd(currentPage * recordCountPerPage);

		List<MemberVO> list = session.selectList("admin.getBlackList", mDataVo);

		return (ArrayList<MemberVO>) list;
	}

	/* 블랙리스트 페이징 */
	@Override
	public String getBlackListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage) {
		QuestionAnswerPDVO qPdvo = new QuestionAnswerPDVO();

		int recordTotalCount = session.selectOne("admin.getBlackListNavi", qPdvo);

		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1);

		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if (needPrev) {
			sb.append("<a class='item' href='/blackList.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/blackList.diet?currentPage="
								+ i + "'>  " + i + " </a>");
			} else {
				sb.append("<a class='item' href='/blackList.diet?currentPage=" + i + "'> " + i + " </a>");
			}
		}
		if (needNext) {
			sb.append("<a class='item' href='/blackList.diet?currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}

		return sb.toString();
	}

	/* 블랙리스트 회원 등록 */
	@Override
	public int blackListReg(SqlSessionTemplate session, BlackListRegVO bVo) {
		int result = 0;
		if (bVo.getStatus().equals("x")) {
			result = session.update("admin.blackListReg", bVo);
		} else {
			result = session.update("admin.blackListDel", bVo);
		}
		return result;

	}

	/* 블랙리스트 신고 내역 */
	@Override
	public ArrayList<BlackListContentVO> blackListContent(SqlSessionTemplate session, int index) {
		List<BlackListContentVO> list = session.selectList("admin.blackListContent", index);
		return (ArrayList<BlackListContentVO>) list;
	}

	@Override
	public int yesterdayUpdate(SqlSessionTemplate session, yesterdayAnalyticsPDVO yAPDVO) {
		int result =  session.update("admin.yesterdayUpdate",yAPDVO);
		return result;
	}

	@Override
	public int searchBeforeDayList(SqlSessionTemplate session) {
		int result = 0;
		if (session.selectOne("admin.searchBeforeDayList") != null) {
			result = 1;
		}
		return result;
	}

	@Override
	public ArrayList<TodayAnalyticsDetail> TodayAnalyticsDetailList(SqlSessionTemplate session) {
		List<?> list = session.selectList("admin.TodayAnalyticsDetailList");
		return (ArrayList<TodayAnalyticsDetail>)list;
	}

	//트레이너 회원 신청
	@Override
	public ArrayList<TrainingRegVO> trainerRegList(SqlSessionTemplate session, int currentPage,
			int recordCountPerPage) {
		TrainingRegPageDataVO trpdv =  new TrainingRegPageDataVO();

		trpdv.setStart((currentPage - 1) * recordCountPerPage + 1);
		trpdv.setEnd(currentPage * recordCountPerPage);

		List<TrainingRegVO> list = session.selectList("admin.trainerRegList", trpdv);

		return (ArrayList<TrainingRegVO>) list;
	}

	//트레이너 회원 신청 네비
	@Override
	public String getTrainerRegListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage) {
		TrainingRegPageDataVO trpdv =  new TrainingRegPageDataVO();

		int recordTotalCount = session.selectOne("admin.getTrainerRegNavi", trpdv);

		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1);

		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if (needPrev) {
			sb.append("<a class='item' href='/trainer.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/trainer.diet?currentPage="
								+ i + "'>  " + i + " </a>");
			} else {
				sb.append("<a class='item' href='/trainer.diet?currentPage=" + i + "'> " + i + " </a>");
			}
		}
		if (needNext) {
			sb.append("<a class='item' href='/trainer.diet?currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}

		return sb.toString();
	}

	// 트레이너 등급 신청 회원 등록된 글 들어가는 곳
	@Override
	public TrainingRegVO trainerRegContents(SqlSessionTemplate session, int trIndex) {
		TrainingRegVO trv = session.selectOne("admin.trRegContent",trIndex);
		return trv;
	}

	@Override
	public int denyTrainerReg(SqlSessionTemplate session, int trIndex) {
		return session.update("admin.denyTrainerReg",trIndex);
	}

	@Override
	public int acceptTrainerReg(SqlSessionTemplate session, int trIndex) {
		return session.update("admin.acceptTrainerReg",trIndex);
	}

	@Override
	public int changeTrainerGrade(SqlSessionTemplate session, int trIndex) {
		return session.update("admin.changeTrainerGrade",trIndex);
	}

	
	//트레이너 회원 관리
	@Override
	public ArrayList<TrainingRegVO> trainerChange(SqlSessionTemplate session, int currentPage, int recordCountPerPage) {
		TrainingRegPageDataVO trpdv =  new TrainingRegPageDataVO();

		trpdv.setStart((currentPage - 1) * recordCountPerPage + 1);
		trpdv.setEnd(currentPage * recordCountPerPage);
		
		List<TrainingRegVO> list = session.selectList("admin.trainerList", trpdv);
		
		return (ArrayList<TrainingRegVO>) list;
	}

	//트레이너 회원 관리 네비
	@Override
	public String getTrainerChangeListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage) {
		TrainingRegPageDataVO trpdv =  new TrainingRegPageDataVO();

		int recordTotalCount = session.selectOne("admin.getTrainerListNavi", trpdv);

		
		int pageTotalCount = 0;
		if (recordTotalCount % recordCountPerPage != 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1;
		} else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1);

		int endNavi = startNavi + naviCountPerPage - 1;

		if (endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCount) {
			needNext = false;
		}

		StringBuilder sb = new StringBuilder();

		if (needPrev) {
			sb.append("<a class='item' href='/trainerChange.diet?currentPage=" + (startNavi - 1) + "'> &lt; </a>");
		}

		for (int i = startNavi; i <= endNavi; i++) {
			if (i == currentPage) {
				sb.append(
						"<a class='active item' style='background: rgba(250, 40, 40); color:white;' href='/trainerChange.diet?currentPage="
								+ i + "'>  " + i + " </a>");
			} else {
				sb.append("<a class='item' href='/trainerChange.diet?currentPage=" + i + "'> " + i + " </a>");
			}
		}
		if (needNext) {
			sb.append("<a class='item' href='/trainerChange.diet?currentPage=" + (endNavi + 1) + "'> &gt; </a>");
		}

		return sb.toString();
	}


	@Override
	public ArrayList<ErrorLogVO> todayErrorLogSearch(SqlSessionTemplate session, ErrorLogVO ELVO) {
		List<?> list = session.selectList("admin.todayErrorLogSearch",ELVO);
	
		return (ArrayList<ErrorLogVO>) list;
 }

	//트레이너 회원에서 일반 회원으로 전환
	@Override
	public int changeGrade(SqlSessionTemplate session, int mbIndex) {
		return session.update("admin.changeGrade",mbIndex);
	}

	

}
