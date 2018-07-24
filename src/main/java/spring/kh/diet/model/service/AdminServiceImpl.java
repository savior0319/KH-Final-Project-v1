package spring.kh.diet.model.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.AdminDAO;
import spring.kh.diet.model.vo.MemberListPDVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.NoticeVO;

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

}
