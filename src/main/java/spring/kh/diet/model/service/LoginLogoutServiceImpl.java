package spring.kh.diet.model.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.kh.diet.model.dao.LoginLogoutDAOImpl;
import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.OneSessionVO;

@Service("loginService")
public class LoginLogoutServiceImpl implements LoginLogoutService {
	@Resource(name = "loginDAO")
	private LoginLogoutDAOImpl loginDAO;

	@Autowired
	private SqlSessionTemplate SqlSessionTemplate;

	@Override
	public MemberVO login(MemberVO mv) {
		MemberVO m = loginDAO.login(SqlSessionTemplate, mv);
		return m;
	}

	@Override
	public MemberVO findId(MemberVO mv) {
		MemberVO mv2 = loginDAO.findId(SqlSessionTemplate, mv);
		return mv2;
	}

	@Override
	public int updatePassword(MemberVO mv) {
		int result = loginDAO.updatePassword(SqlSessionTemplate, mv);
		return result;
	}

	@Override
	public int joinKaKao(MemberVO m) {
		int result = loginDAO.joinKaKao(SqlSessionTemplate, m);
		return result;
	}

	@Override
	public int existUserFindingId(MemberVO mv) {
		int result = loginDAO.existUserFindingId(SqlSessionTemplate, mv);
		return result;
	}

	@Override
	public int updateMypass(MemberVO mv) {
		int result = loginDAO.updateMypass(SqlSessionTemplate, mv);
		return result;
	}

	@Override
	public MemberVO kakaoLoginService(MemberVO mv) {
		MemberVO m = loginDAO.kakaoLoginService(SqlSessionTemplate, mv);
		return m;
	}

	@Override
	public int existUserNickNum(MemberVO mv) {
		int result = loginDAO.existUserNickNum(SqlSessionTemplate, mv);
		return result;
	}

	@Override
	public void transSession(String sessionId) {
		loginDAO.tranSession(SqlSessionTemplate,sessionId);	
	}

	

	@Override
	public OneSessionVO selectOneSession(String sessionId) {
		OneSessionVO OSV = loginDAO.selectOneSession(SqlSessionTemplate,sessionId);
		return OSV;
	}

	@Override
	public int insertSession(OneSessionVO oSV) {
		int result = loginDAO.insertSession(SqlSessionTemplate, oSV);
		return result;
	}




}
