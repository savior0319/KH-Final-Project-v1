package spring.kh.diet.model.dao;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.MemberVO;
import spring.kh.diet.model.vo.OnSessionVO;
import spring.kh.diet.model.vo.OneSessionVO;

@Repository("loginDAO")
public class LoginLogoutDAOImpl implements LoginLogoutDAO {

	@Override
	public MemberVO login(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		MemberVO m = sqlSessionTemplate.selectOne("login.login1", mv);
		return m;
	}

	@Override
	public MemberVO findId(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		MemberVO mv2 = sqlSessionTemplate.selectOne("login.findId", mv);
		return mv2;
	}

	@Override
	public int updatePassword(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		int result = sqlSessionTemplate.update("login.updatePassword", mv);
		return result;
	}

	@Override
	public int joinKaKao(SqlSessionTemplate sqlSessionTemplate, MemberVO m) {
		System.out.println(m.getMbNickName());
		int result = sqlSessionTemplate.insert("login.joinKaKao", m);
		return result;
	}

	public int existUserFindingId(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		MemberVO m = sqlSessionTemplate.selectOne("login.existUserFindingId", mv);
		int result = 0;
		if (m != null) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}

	public int updateMypass(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		int result = sqlSessionTemplate.update("login.updatePassword", mv);
		return result;
	}

	public MemberVO kakaoLoginService(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		MemberVO m = sqlSessionTemplate.selectOne("login.kakaoLoginService", mv);
		System.out.println(m.getMbGender());
		return m;
	}

	public int existUserNickNum(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		MemberVO m = sqlSessionTemplate.selectOne("login.existUserNickNum", mv);
		int result = 0;
		if (m != null) {
			result = 1;
		} else {
			result = 0;
		}
		return result;
	}

	public int updateOnsession(SqlSessionTemplate sqlSessionTemplate, MemberVO m, HttpServletRequest request) {
		
		int result =  sqlSessionTemplate.update("login.updateOnSession",m);
		return result;
	}

	public void tranSession(SqlSessionTemplate sqlSessionTemplate, HttpServletRequest request) {
		int result = sqlSessionTemplate.delete("login.transSession",request.getRemoteAddr());
		System.out.println(result);
	}
 
	@Override
	public OneSessionVO selectOneSession(SqlSessionTemplate sqlSessionTemplate, String remoteAddr) {
		
		OneSessionVO OSV= sqlSessionTemplate.selectOne("login.selectOneSession",remoteAddr);
		return OSV;
	}

	public int insertSession(SqlSessionTemplate sqlSessionTemplate, OneSessionVO oSV) {
		System.out.println(oSV.toString());
		int result = sqlSessionTemplate.insert("login.insertSession",oSV);
		return result;
	}

}
