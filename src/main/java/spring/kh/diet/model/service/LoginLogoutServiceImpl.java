package spring.kh.diet.model.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.LoginLogoutDAOImpl;
import spring.kh.diet.model.vo.MemberVO;

@Service("loginService")
public class LoginLogoutServiceImpl implements LoginLogoutService {
	@Resource(name = "loginDAO")
	private LoginLogoutDAOImpl loginDAO;
	
	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;
	
	@Override
	public MemberVO login(MemberVO mv) {
		MemberVO m = loginDAO.login(SqlSessionTemplate,mv);
		return m;
	}
	@Override
	public MemberVO findId(MemberVO mv) {
		MemberVO mv2 = loginDAO.findId(SqlSessionTemplate,mv);
		System.out.println("ser"+mv2);
		return mv2;
		
	}
	@Override
	public int updatePassword(MemberVO mv) {
		int result = loginDAO.updatePassword(SqlSessionTemplate,mv);
		return result;
	}


}
