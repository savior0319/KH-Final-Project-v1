package spring.kh.diet.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import spring.kh.diet.model.vo.MemberVO;

@Repository("loginDAO")
public class LoginDAOImpl implements LoginDAO {

	public MemberVO login(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		MemberVO m = sqlSessionTemplate.selectOne("login.login1", mv);
		return m;
	}

	@Override
	public MemberVO findId(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		MemberVO mv2 = sqlSessionTemplate.selectOne("login.findId", mv);
		return mv2;
	}

	public int updatePassword(SqlSessionTemplate sqlSessionTemplate, MemberVO mv) {
		int result = sqlSessionTemplate.selectOne("login.updatePassword", mv);
		return result;
	}

}
