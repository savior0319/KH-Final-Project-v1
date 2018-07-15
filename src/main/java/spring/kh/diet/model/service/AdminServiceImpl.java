package spring.kh.diet.model.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.AdminDAO;
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

}
