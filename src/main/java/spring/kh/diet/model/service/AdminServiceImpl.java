package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.AdminDAO;
import spring.kh.diet.model.vo.AllSessionListPDVO;
import spring.kh.diet.model.vo.AllSessionVO;
import spring.kh.diet.model.vo.AnswerVO;
import spring.kh.diet.model.vo.MemberListPDVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.NoticeVO;
import spring.kh.diet.model.vo.OffSessionVO;
import spring.kh.diet.model.vo.QuestionAnswerPDVO;
import spring.kh.diet.model.vo.QuestionVO;

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
		int recordCountPerPage = 20;
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

}
