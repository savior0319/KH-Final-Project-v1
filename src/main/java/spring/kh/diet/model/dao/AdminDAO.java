package spring.kh.diet.model.dao;

import org.apache.ibatis.session.SqlSession;

import spring.kh.diet.model.vo.NoticeVO;

public interface AdminDAO {

	int noticeRegisterData(SqlSession session, NoticeVO nv);

}
