package spring.kh.diet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.MemberVO;

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

}
