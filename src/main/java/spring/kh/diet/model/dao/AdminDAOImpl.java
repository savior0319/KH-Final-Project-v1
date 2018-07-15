package spring.kh.diet.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
