package spring.kh.diet.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.NoticeVO;

public interface AdminDAO {

	int noticeRegisterData(SqlSession session, NoticeVO nv);

	ArrayList<MemberVO> memberList(SqlSessionTemplate session, int currentPage, int recordCountPerPage);

	String getMemberListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage);

	String getDeleteMemberListPageNavi(SqlSessionTemplate session, int currentPage, int recordCountPerPage,
			int naviCountPerPage);

	ArrayList<MemberVO> deleteMemberList(SqlSessionTemplate session, int currentPage, int recordCountPerPage);

}
