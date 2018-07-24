package spring.kh.diet.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.MemberListPDVO;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.NoticeVO;

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

}
